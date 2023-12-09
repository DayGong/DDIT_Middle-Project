/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

// 호텔 상세보기 모달창 설정
moveToHotelDetail = function()
{
	$.ajax
	({
		url: `${path}/reserve/hotelReserve.do`,
		type: 'GET',
		data: {
			"comp_no" : compNo
		},
		success: function(res)
		{
			$('#hotelDetailModal').modal('show');
				
			console.log(res);
			
			// 모달창 헤더에 숙박 업체의 상세 정보를 띄우는 함수
			showHotelDetailInfo(res);
			
			// 모달창 바디에 숙박 예약폼을 띄우는 함수
			openReserveForm(res);
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}

// 모달창 헤더에 숙박 업체의 상세 정보를 띄우는 함수
showHotelDetailInfo = function(res) {
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

// 오늘 이전의 날짜는 입력 불가하게 설정
let date = new Date();
let year = date.getFullYear()
let month = date.getMonth()+1;
let day= String(date.getDate());

// 일자가 한 자리 수인 경우 앞에 0을 붙여 두자리 숫자로 만들어준다. ex) 2023-12-09
let dayZero = day.padStart(2, "0");
	
dayCnt = 0; // 날짜 폼 추가/삭제 Count
	
// 모달창 바디에 숙박 예약폼을 띄우는 함수
openReserveForm = function(res) 
{
	
	let bodyCode = `
	<form action="${path}/reserve/hotelReserve.do" method="POST">
		<div>
			<h2>인원 선택</h2>
			<input type="number" name="rsv_count" min="1" max="4" value="1">
		</div>
		<div>
			<h2>숙박 날짜 선택</h2>
			<mbsc-datepicker
   				[controls]="['calendar']"
    			[selectMultiple]="true">
			</mbsc-datepicker>
			<div id="addDateDiv">
				<div id="dateAddForm${dayCnt}">
					<input type="date" name="rsv_date${dayCnt}" min="${year}-${month}-${dayZero}">
					<input type="button" value="날짜 추가" onclick="addDateForm()">
				</div>
			</div>
		</div>
		<div>
		</div>
	</form>
	`;
	
	$('#hotelModalBody').html(bodyCode);
}

addDateForm = function()
{
	dayCnt++;
	
	let addForm = `
	<input type="date" name="rsv_date${dayCnt}" min="${year}-${month}-${dayZero}">
	<input type="button" value="날짜 삭제" onclick="deleteDateForm(${dayCnt})">
	<br>
	`;
	
	if (dayCnt < 5) {
		var addedDiv = document.createElement("div"); // 폼 생성
		addedDiv.setAttribute("id", "dateAddForm"+dayCnt);
		addedDiv.innerHTML = addForm; // 폼 div에 html 삽입
		addDateDiv.appendChild(addedDiv); // 삽입할 div에 생성한 폼 삽입
	} else {
		alert('날짜 추가는 최대 5번까지 가능합니다.');
	}
}

deleteDateForm = function()
{
	// 마지막으로 생성된 폼의 ID를 통해 div객체를 가져옴
	let thisDiv = document.getElementById("dateAddForm" + dayCnt);
	
	if ( dayCnt > 1 ) {
		thisDiv.remove();	// 폼 삭제
	} else {
		thisDiv.empty();	// 폼 내용 삭제
	}
	
	console.log(dayCnt);
	dayCnt--;
}

hotelReserve = function() 
{
	alert('test')
}