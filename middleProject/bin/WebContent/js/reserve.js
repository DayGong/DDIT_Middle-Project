/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

// 경로 path 설정
const pathName = "/" + window.location.pathname.split("/")[1];
const origin = window.location.origin;
const path = origin + pathName;

// mem_id = (String)session.getAttribute("mem_id");
mem_id = "a001"; // 회원 아이디 임시 데이터(세션 회원 아이디)
	
$(function() 
{
	// 호텔 모달창을 띄우는 이벤트
	$(document).on('click', '.hotelModalBtn', function()
	{
		hotel_no = $(this).attr('id');
		moveToHotelDetail(hotel_no);
	})
	
	// 식당 모델창을 띄우는 이벤트
	$(document).on('click', '.restaurantModalBtn', function()
	{
		rest_no = $(this).attr('id');
		moveToRestaurantDetail(rest_no);
	})
	
	// 시작일을 입력하면 종료일 달력에 시작일 이전이 선택되지않게하는 이벤트
	$(document).on('input', '#select_start_date', function()
	{
		let startdate = $('#select_start_date').val();
		$('#select_end_date').attr('min', startdate);
		$('#select_end_date').attr('value', startdate);
	})
	
	// 인원 수가 바뀔 때마다 객실이 바뀌는 이벤트
	$(document).on('input', '#rsv_count', function()
	{
		changeRoomState();
	})
	
	// 빈 객실 수를 구해 표시하는 이벤트
	$(document).on('input', '#select_end_date', function()
	{
		let start = $('#select_start_date').val();
		let end = $('#select_end_date').val();
		
		// 예약이 끝나면 객실 수를 되돌려야하는데 어떻게 할 지 생각해보기
		// 관리자페이지에서 일괄 체크아웃
		checkRoom(start, end);
	})
	
	// 카카오페이API를 호출하는 메서드
	$(document).on('click', '#payBtn', function()
	{
		requestPay();
	})
	
	$(document).on('input', '#reserveTime', function()
	{
		// alert($('#reserveTime option:selected').val());
	})
	
	$(document).on('click', '#restaurant_rsv_btn', function()
	{
		reserveRestaurant();
	})
})

// 숙소 상세보기 모달창 설정
moveToHotelDetail = function(hotel_no)
{
	$.ajax
	({
		url: `${path}/reserve/hotelReserve.do`,
		type: 'GET',
		data: 
		{
			"hotel_no" : hotel_no
		},
		success: function(res)
		{
			$('#hotelDetailModal').modal('show');
				
			hotelInfo = res;	// 카카오페이 API에 판매자 정보를 보내기 위해 전역 변수에 저장
			
			// 숙박 업체의 상세 정보를 띄우는 메소드
			showHotelDetailInfo(res);
			
			// 숙박 예약폼을 띄우는 메소드
			openHotelReserveForm();
			
			// 남은 객실 체크
			checkRoom(`${year}-${month}-${dayZero}`, `${year}-${month}-${dayZero}`);
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}

// 숙박 업체의 상세 정보를 띄우는 메소드
showHotelDetailInfo = function(res) 
{
	let infoCode = `
	<div class="headerImg" style="background-image: url('${path}/images/hotel/${res.hotel_img}');">
		<h4 class="modal-title fix-text">${res.hotel_name}</h4>
		<div>
			<table>
				<tr>
					<td>주소</td>
					<td>| ${res.hotel_addr}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>| ${res.hotel_tel}</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>| ${res.hotel_time}</td>
				</tr>
				<tr>
					<td>객실 수</td>
					<td>| ${res.hotel_room_count}</td>
				</tr>
			</table>
		</div>
	</div>
	<div> <!-- 카카오페이API 버튼 -->
		<img src="${path}/images/icon/payment_icon_yellow_medium.png" id="payBtn">
	</div>
	`;

	$('#right-modal-body').html(infoCode);
}

// 오늘 이전의 날짜는 입력 불가하게 설정하기위해 오늘 날짜를 변수로 설정
const date = new Date();
const year = date.getFullYear()
const month = date.getMonth() + 1;
const day= String(date.getDate());

// 일자가 한 자리 수인 경우 앞에 0을 붙여 두자리 숫자로 만들어준다. ex) 2023-12-09
const dayZero = day.padStart(2, "0");
	
// 모달창 바디에 숙박 예약폼을 띄우는 메소드
openHotelReserveForm = function() 
{
	let peopleMin = 1;	// 인원수 최소값
	let peopleMax = 4;	// 인원수 최대값
	
	let bodyCode = `
	<div>
		<h2>인원 선택</h2>
		<input type="number" id="rsv_count" name="rsv_count" min="${peopleMin}" max="${peopleMax}" value="${peopleMin}">
	</div>
	<div>
		<h2>숙박 날짜 선택</h2>
		<div id="addDateDiv">
			<div id="dateStartForm">
				<h5>시작일</h5>
				<input type="date" id="select_start_date" name="hotel_rsv_startdate" 
						min="${year}-${month}-${dayZero}" value="${year}-${month}-${dayZero}">
			</div>
			<div id="dateEndForm">
				<h5>종료일</h5>
				<input type="date" id="select_end_date" name="hotel_rsv_enddate" value="${year}-${month}-${dayZero}">
			</div>
		</div>
	</div>
	<div>
		<div id="addRoomDiv">
			<label for="hotel_rsv_room" class="form-label">
				객실 선택
			</label>
			<div class="empty_room">
				잔여 객실 수: <div id="checkRoomDiv"></div>
			</div>
			<div class="form_radio_btn">
				<input type="radio" id="room_two" name="hotel_rsv_room" value="2인실" checked disabled>
				<label for="room_two">2인실</label>
			</div>
			<div class="form_radio_btn">
				<input type="radio" id="room_four" name="hotel_rsv_room" value="4인실" disabled>
				<label for="room_four">4인실</label>
			</div>
		</div>
	</div>
	`;
	
	$('#left-modal-body').html(bodyCode);
}

// 2인 이하면 2인실, 3인 이상이면 4인실
changeRoomState = function() 
{
	let peopleCnt = $('#rsv_count').val();
		
	if(peopleCnt <= 2) 
	{
		$('#room_two').prop('checked', true);
	} else 
	{
		$('#room_four').prop('checked', true);
	}	
}

// 해당하는 날짜에 남은 객실 수를 확인하는 메서드
checkRoom = function(start, end)
{
	$.ajax
	({
		url: `${path}/reserve/hotelRoomCheck.do`,
		type: 'GET',
		data:
		{
			"startDate" : start,
			"endDate" : end
		},
		success: function(res)
		{
			let emptyRoom = hotelInfo.hotel_room_count - res;
			
			if ( emptyRoom <= 0 ) 
			{
				alert('남은 방이 없습니다.');
				$('#hotelDetailModal').modal('hide');
			}
			
			$('#checkRoomDiv').html(emptyRoom);
		},
		error: function(xhr)
		{
			console.log(xhr)
		}
	})
	
}

// 두 날짜 사이의 일수를 구하는 메서드
getDateDiff = (startDate, endDate) => 
{
  let start = new Date(startDate);
  let end = new Date(endDate);
  
  let diffDate = start.getTime() - end.getTime();
  
  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
}

// 카카오페이를 요청하는 메서드
requestPay = function() 
{
	var IMP = window.IMP; 
	IMP.init("imp67011510");	// 테스트용 가맹점ID(변경 X)

	/* 
		주문번호 = 같은 값은 사용 불가(결제 할 때마다 새로운 값 필요)
		주문번호 만들 때 "코드" + 현재 시간 등으로 만들기 위한 makemerchantUid
	*/
	var today = new Date();   
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	var seconds = today.getSeconds();  // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	
	let startDate = $('#select_start_date').val();
	let endDate = $('#select_end_date').val();
	let peopleCnt = $('#rsv_count').val();
	let room = $('input[name=hotel_rsv_room]:checked').val();
	
	let betweenDate = getDateDiff(startDate, endDate);
	if (betweenDate == 0) 
	{
		betweenDate = 1;	// 당일 숙박은 1일과 같은 것으로 처리
	}
	
	let totalAmt = hotelInfo.hotel_amount * peopleCnt * betweenDate;

	IMP.request_pay
	({
		pg : 'kakaopay', 							// kcp: 미리 등록한 카드로 결제, kakaopay
		pay_method : 'card',
		merchant_uid: hotel_no +makeMerchantUid,  	// 주문번호
		name : "[" + hotelInfo.hotel_name + "]" + room + startDate + "~" + endDate,		// 상품명
		amount : totalAmt,							// 가격(결제 금액)
		buyer_name : hotelInfo.hotel_name,
		buyer_tel : hotelInfo.hotel_tel,
		buyer_addr : hotelInfo.hotel_addr,
	}, function (rsp) 
	{
		if (rsp.success) 
		{
 			// 서버 결제 API 성공시 로직
 			let reserveInfo = 
 			{
				"imp_uid" : rsp.imp_uid,
				"startDate" : `${startDate}`,
				"endDate" : `${endDate}`,
				"peopleCnt" : `${peopleCnt}`,
				"room" : `${room}`,
				"mem_id" : `${mem_id}`,
				"hotel_no" : `${hotel_no}`,
				"hotel_totalamt" : `${totalAmt}`
			} ;
			
			payAfterReserveHotel(reserveInfo);
		} else 
		{
			alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
		}
	});
}

// 카카오 페이 API를 통해 결제 진행 후 숙소 예약 정보를 저장하는 메서드
payAfterReserveHotel = function(reserveInfo) 
{
	$.ajax
	({
		url: `${path}/reserve/hotelReserve.do`,
		type: 'POST',
		data: 
		{
			"hotel_rsv_no" : reserveInfo.imp_uid,
			"hotel_rsv_startdate" : reserveInfo.startDate,
			"hotel_rsv_enddate" : reserveInfo.endDate,
			"hotel_rsv_count" : reserveInfo.peopleCnt,
			"hotel_rsv_room" : reserveInfo.room,
			"hotel_rsv_state" : "1",
			"mem_id" : reserveInfo.mem_id,
			"hotel_no" : reserveInfo.hotel_no,
			"hotel_totalamt" : reserveInfo.hotel_totalamt
		},
		success: function(res) 
		{
			// 예약 완료 후 객실 수가 1 차감되도록 작성
			subtractHotelRoom(reserveInfo.hotel_no);
		},
		error: function(xhr) 
		{
			alert(`예약에 실패하였습니다. 에러 내용: ${xhr.status}`);
		},
		dataType: 'json'
	})
}

// 예약 완료 후 객실의 수를 -1하는 메서드 
subtractHotelRoom = function(hotel_no)
{
	$.ajax
	({
		url: `${path}/reserve/hotelRoomCheck.do`,
		type: 'POST',
		data: 
		{
			"hotel_no" : hotel_no
		},
		success: function(res)
		{
			alert('예약이 완료되었습니다.');
			$('#hotelDetailModal').modal('hide');
		},
		error: function(xhr)
		{
			console.log(xhr);
		}
	})
}

// 식당 상세보기 모달창 설정
moveToRestaurantDetail = function()
{
	$.ajax
	({
		url: `${path}/reserve/restaurantReserve.do`,
		type: 'GET',
		data: 
		{
			"rest_no" : rest_no
		},
		success: function(res)
		{
			$('#restaurantDetailModal').modal('show');
			console.log(res);
				
			// 식당의 상세 정보를 띄우는 메소드
			showRestaurantDetailInfo(res);
			
			// 식당 예약폼을 띄우는 메소드
			openRestaurantReserveForm(res);
			
			// 시간 리스트를 띄우는 메소드
			getTimeSelectList(res);
			
			// 남은 예약 체크
			checkReservation(`${year}-${month}-${dayZero}`, `${시간}`);
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}

// 식당 상세 정보를 띄우는 메소드
showRestaurantDetailInfo = function(res)
{
	
	let infoCode = `
	<div class="headerImg" style="background-image: url('${path}/images/restaurant/${res.rest_img}');">
		<h4 class="modal-title fix-text">${res.rest_name}</h4>
		<div>
			<table>
				<tr>
					<td>주소</td>
					<td>| ${res.rest_addr}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>| ${res.rest_tel}</td>
				</tr>
				<tr>
					<td>운영시간</td>
					<td>| ${res.rest_time}</td>
				</tr>
			</table>
		</div>
	</div>
	<div>
		<input type="button" id="restaurant_rsv_btn" value="예약하기">
	</div>
	`;

	$('#rest-right-modal-body').html(infoCode);
}

// 식당 예약폼을 띄우는 메소드
openRestaurantReserveForm = function(res)
{
	let peopleMin = 1;	// 인원수 최소값
	let peopleMax = 4;	// 인원수 최대값
	
	let bodyCode = `
	<div>
		<h2>인원 선택</h2>
		<input type="number" id="rest_rsv_count" name="rest_rsv_count" min="${peopleMin}" max="${peopleMax}" value="${peopleMin}">
	</div>
	<div>
		<h2>예약 날짜 선택</h2>
		<div id="restDateDiv">
			<div id="restRsvDate">
				<input type="date" id="rest_rsv_date" name="rest_rsv_date" 
						min="${year}-${month}-${dayZero}" value="${year}-${month}-${dayZero}">
			</div>
		</div>
	</div>
	<div>
		<div id="selectTimeDiv"></div>
	</div>
	`;
	
	$('#rest-left-modal-body').html(bodyCode);
}

getTimeSelectList = function(res)
{
	// 시간이 한 자리 수인 경우 앞에 0을 붙여 두자리 숫자로 만들어준다.
	let openTime = res.rest_time.trim().substring(0, 2).padStart(2, "0");
	let endTime = res.rest_time.trim().slice(-5,-3);
	
	var strHours = `
	<label for="rest_rsv_time">예약 시간 선택</label><br>
	<select name="rest_rsv_time" id="rest_rsv_time" size="10">`;
	
	for(var i = openTime ; i <= endTime; i++)
	{
		if(i == openTime)
		{
			strHours += `<option value="${openTime}:00" selected>${openTime}:00</option>`;
		} else
		{
			let time = i.toString().padStart(2, "0");
    	    strHours += `<option value="${time}:00">${time}:00</option>`;
		}
	}
	
	strHours += 
	`</select>`;
 
	 $("#selectTimeDiv").html(strHours);
}

reserveRestaurant = function()
{
	let rest_rsv_date = $('#rest_rsv_date').val();
	let rest_rsv_time = $('#rest_rsv_time').val();
	let rest_rsv_count = $('#rest_rsv_count').val();
	
	$.ajax
	({
		url: `${path}/reserve/restaurantReserve.do`,
		type: 'POST',
		data: 
		{
			'rest_rsv_date' : rest_rsv_date,
			'rest_rsv_time' : rest_rsv_time,
			'rest_rsv_count' : rest_rsv_count,
			'mem_id' : mem_id,
			'rest_no' : rest_no
		},
		success: function(res)
		{
			alert(`${rest_rsv_date} / ${rest_rsv_time} 예약 완료되었습니다.`);
			$('#hotelDetailModal').modal('hide');
		},
		error: function(xhr)
		{
			console.log(xhr);
		}
	})
	
}