/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

const pathName = "/" + window.location.pathname.split("/")[1];
const origin = window.location.origin;

const path = origin + pathName;

compNo = 1; // DB 내용을 가져오기 위한 임시 데이터(업체번호)
	
$(function() 
{
	// 호텔 모달창을 띄우는 이벤트
	$(document).on('click', '.hotelModalBtn', function()
	{
		moveToHotelDetail();
	})
})

// 호텔 상세보기 모달창 설정
moveToHotelDetail = function()
{
	$.ajax
	({
		url: `${path}/reserve/hotelReserve.do`,
		type: 'GET',
		data: 
		{
			"comp_no" : compNo
		},
		success: function(res)
		{
			$('#hotelDetailModal').modal('show');
				
			console.log(res);
			
			// 모달창 헤더에 숙박 업체의 상세 정보를 띄우는 메소드
			showHotelDetailInfo(res);
			
			// 모달창 바디에 숙박 예약폼을 띄우는 메소드
			openReserveForm(res);
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}

// 모달창 헤더에 숙박 업체의 상세 정보를 띄우는 메소드
showHotelDetailInfo = function(res) 
{
	let headerCode = `
	<div class="headerImg" style="background-image: url('${path}/images/hotel/${res.comp_img}');">
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		<h4 class="modal-title fix-text">${res.comp_name}</h4>
		<div>
			<table>
				<tr>
					<td>주소</td>
					<td>| ${res.comp_addr}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>| ${res.comp_tel}</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>| ${res.comp_time}</td>
				</tr>
				<tr>
					<td>잔여객실 수</td>
					<td>| ${res.comp_room}</td>
				</tr>
			</table>
		</div>
	</div>`;

	$('#hotelModalHeader').html(headerCode);
}

// 오늘 이전의 날짜는 입력 불가하게 설정하기위해 오늘 날짜를 변수로 설정
const date = new Date();
const year = date.getFullYear()
const month = date.getMonth() + 1;
const day= String(date.getDate());

// 일자가 한 자리 수인 경우 앞에 0을 붙여 두자리 숫자로 만들어준다. ex) 2023-12-09
const dayZero = day.padStart(2, "0");
	
var dayCnt = 0; // 날짜 폼 추가,삭제 Count
	
// 모달창 바디에 숙박 예약폼을 띄운다.
openReserveForm = function(res) 
{
	let peopleMin = 1;	// 인원수 최소값
	let peopleMax = 4;	// 인원수 최대값
	let bodyCode = `
	<form action="${path}/reserve/hotelReserve.do" method="POST">
		<div>
			<h2>인원 선택</h2>
			<input type="number" name="rsv_count" min="${peopleMin}" max="${peopleMax}" value="${peopleMin}">
		</div>
		<div>
			<h2>숙박 날짜 선택</h2>
			<div id="addDateDiv">
				<div id="dateForm${dayCnt}">
					<input type="date" id="selectDate${dayCnt}" name="rsv_date${dayCnt}" min="${year}-${month}-${dayZero}">
					<input type="button" value="날짜 추가" onclick="addDateForm()">
				</div>
			</div>
			<div id="addRoomDiv">
				<div id="roomForm${dayCnt}">
					<label>
						<input type="radio" name="rsv_room${dayCnt}" value="2인실">
						<span>2인실</span>
					</label>
					<label>
						<input type="radio" name="rsv_room${dayCnt}" value="4인실">
						<span>4인실</span>
					</label>
				</div>
			</div>
		</div>
	</form>
	`;
	
	$('#hotelModalBody').html(bodyCode);
}

// id가 addDateDiv인 <div>폼에 날짜 폼을 추가하는 메서드
addDateForm = function()
{
	dayCnt++;
	
	let addForm = `
	<input type="date" id="selectDate${dayCnt}" name="rsv_date${dayCnt}" min="${year}-${month}-${dayZero}">
	<input type="button" value="날짜 삭제" onclick="deleteDateForm()">
	<br>
	`;
	
	if (dayCnt < 5) 
	{
		let addedDiv = document.createElement("div"); 		// 폼 생성
		addedDiv.setAttribute("id", "dateForm" + dayCnt);
		addedDiv.innerHTML = addForm; 						// 폼 div에 html 삽입
		addDateDiv.appendChild(addedDiv); 					// 삽입할 div에 생성한 폼 삽입
		
		// 날짜 선택이 추가되면 객실 선택 폼을 추가
		addRoomForm(); 							
	} else 
	{
		alert('날짜 추가는 최대 5번까지 가능합니다.');
		dayCnt--;
	}
}

// 추가한 날짜 폼을 삭제하는 메서드
deleteDateForm = function()
{
	// 마지막으로 생성된 폼의 ID를 통해 div객체를 가져옴
	let dateDiv = document.getElementById("dateForm" + dayCnt);
	
	if ( dayCnt > 0 ) 
	{
		dateDiv.remove();	// 폼 삭제
	} else 
	{
		dateDiv.empty();	// 폼 내용 삭제
	}
	
	// 날짜 선택이 삭제되면 객실 선택 폼을 삭제
	deleteRoomForm();
	
	dayCnt--;
}

// 객실 선택을 id가 addRoomDiv인 <div>에 띄우는 메소드
addRoomForm = function()
{
	let addForm = `
	<label>
		<input type="radio" name="rsv_room${dayCnt}" value="2인실">
		<span>2인실</span>
	</label>
	<label>
		<input type="radio" name="rsv_room${dayCnt}" value="4인실">
		<span>4인실</span>
	</label>
	<br>
	`;
	
	let addedDiv = document.createElement("div"); // 폼 생성
	addedDiv.setAttribute("id", "roomForm" + dayCnt);
	addedDiv.innerHTML = addForm; // 폼 div에 html 삽입
	addRoomDiv.appendChild(addedDiv); // 삽입할 div에 생성한 폼 삽입
}

// 카카오 페이 API를 통해 결제 진행 후 숙소 예약 정보를 저장하는 메서드
hotelReserve = function() 
{
	// alert('test')
}