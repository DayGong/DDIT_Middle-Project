/**
 * 매니저가 누르는 일괄 처리 버튼용 임시 js
 * 나중에 매니저로 넣을지 reserveHotel.js에 넣을지 생각해봐야합니다
 */

// 매니저 일괄 체크 아웃


// 회원 페이지 시작
$(function() {
	
	/*
	// 숙소 예약 테이블 폼
	memberHotelReserveForm();
	
	// 숙소 예약 List를 테이블 <tbody>에 넣기
	addMemberHotelReserve();

	// 숙소 예약 취소 테이블 폼
	memberHotelReserveCancelForm();
		
	// 숙소 예약 취소 List를 테이블 <tbody>에 넣기
	addMemberHotelReserveCancel();
	*/
	// --------------------------------------------------------------
	
	// 식당 날짜가 지나면 예약이 지난 것으로 되는 것
	changeDateReserveState();
		
	// 식당 예약 테이블 폼
	memberRestaurantReserveForm();
		
	// 식당 예약 List를 테이블 <tbody>에 넣기
	addMemberRestaurantReserve();
		
	// 식당 예약 취소 테이블 폼
	memberRestaurantReserveCancelForm();
		
	// 식당 예약 취소 List를 테이블 <tbody>에 넣기
	addMemberRestaurantReserveCancel();
	
})

// 숙소 예약 테이블 폼
memberHotelReserveForm = function()
{
	hotelReserveForm = `
		<table border='1'>
	 		<tr>
	 			<td>예약번호</td><td>숙소명</td><td>예약시작일</td><td>예약종료일</td>
	 			<td>인원수</td><td>객실정보</td><td>결제금액</td><td></td>
	 		</tr>
	 		<tbody id="addMemberHotelReserve"></tbody>
		 </table>
	`;
	
	$('#memberHotelReserveList').html(hotelReserveForm);
}

// 숙소 예약 List를 테이블 <tbody>에 넣기
addMemberHotelReserve = function()
{
	$.ajax
	 ({
		 url: `${path}/reserve/hotelMemberReserveList.do`,
		 type: 'POST',
		 data: 
		 {
			 "mem_id" : mem_id
		 },
		 success: function(res)
		 {
			var hotelReserveList = null;
			if (res == null)
			{
				hotelReserveList += `
				<tr>
					<td colspan="8">예약 목록이 없습니다.</td>
				</tr>
				`;
			} else 
			{				 
				console.log(res);
				$.each(res, function(i, v)
				{
					hotelReserveList += `
					<tr>
						<td>${v.HOTEL_RSV_NO}</td>
					 	<td>${v.HOTEL_NAME}</td>
					 	<td>${v.HOTEL_RSV_STARTDATE}</td>
					 	<td>${v.HOTEL_RSV_ENDDATE}</td>
					 	<td>${v.HOTEL_RSV_COUNT}</td>
					 	<td>${v.HOTEL_RSV_ROOM}</td>
					 	<td>${v.HOTEL_TOTALAMT}</td>
						<td><input type="button" value="예약 취소" id="${v.HOTEL_RSV_NO}" 
									onclick="hotelReserveCancel(this.id)"></td>
					 </tr>
					 `;
				 })
			 }
		
			$('#addMemberHotelReserve').html(hotelReserveList);
		 },
		 error: function(xhr)
		 {
			 console.log('숙소 예약 리스트 불러오기 오류 ==> ' + xhr);
		 },
		 dataType: 'json'
	 })

}

// 숙소 예약 취소
hotelReserveCancel = function(hotel_rsv_no)
{
	$.ajax
	({
		url: `${path}/reserve/hotelReserveCancel.do`,
		type: 'POST',
		data:
		{
			"hotel_rsv_no" : hotel_rsv_no
		},
		success: function()
		{
			swal("숙소 예약이 취소되었습니다.", "", "success");
			// location.href=`${path}/reserveBtnTemp.jsp`; // 이동할 회원 관리 페이지
		},
		error: function(xhr)
		{
			console.log('숙소 예약 취소 실패 ==> ' + xhr);
		}
	})
}
 
// -----------------------------------------------------------------------------------------------------

// 숙소 예약 취소 테이블 폼
memberHotelReserveCancelForm = function()
{
	hotelReserveCancelForm = `
		<table border='1'>
	 		<tr>
	 			<td>예약번호</td><td>숙소명</td><td>예약시작일</td><td>예약종료일</td>
	 			<td>인원수</td><td>객실정보</td><td>결제금액</td><td></td>
	 		</tr>
	 		<tbody id="addMemberHotelReserveCancel"></tbody>
		 </table>
	`;
	
	$('#memberHotelCancelList').html(hotelReserveCancelForm);
}

// 숙소 예약 취소 List를 테이블 <tbody>에 넣기
addMemberHotelReserveCancel = function()
{
	$.ajax
	 ({
		 url: `${path}/reserve/hotelMemberReserveCancelList.do`,
		 type: 'POST',
		 data: 
		 {
			 "mem_id" : mem_id
		 },
		 success: function(res)
		 {
			var hotelReserveList = null;
			if (res == null)
			{
				hotelReserveList += `
				<tr>
					<td colspan="8">예약 목록이 없습니다.</td>
				</tr>
				`;
			} else 
			{				 
				console.log(res);
				$.each(res, function(i, v)
				{
					hotelReserveList += `
					<tr>
						<td>${v.HOTEL_RSV_NO}</td>
					 	<td>${v.HOTEL_NAME}</td>
					 	<td>${v.HOTEL_RSV_STARTDATE}</td>
					 	<td>${v.HOTEL_RSV_ENDDATE}</td>
					 	<td>${v.HOTEL_RSV_COUNT}</td>
					 	<td>${v.HOTEL_RSV_ROOM}</td>
					 	<td>${v.HOTEL_TOTALAMT}</td>
						<td><input type="button" value="취소 완료" disabled></td>
					 </tr>
					 `;
				 })
			 }
		
			$('#addMemberHotelReserveCancel').html(hotelReserveList);
		 },
		 error: function(xhr)
		 {
			 console.log('숙소 예약 리스트 불러오기 오류 ==> ' + xhr);
		 },
		 dataType: 'json'
	 })

}
 

// ----------------------------------------------------------------------------------------------------------
 // 식당 예약 테이블 폼
 memberRestaurantReserveForm = function()
 {
	 restaurantForm = `
	<table border="1">
		<tr>
			<td>식당예약번호</td><td>식당명</td><td>예약날짜</td>
			<td>예약시간</td><td>인원수</td><td></td>
		</tr>
		<tbody id="addMemberRestaurantReserve"></tbody>
	</table>`;

	$('#memberRestaurantReserveList').html(restaurantForm);
 }

// 식당 예약 List를 테이블 <tbody>에 넣기
addMemberRestaurantReserve = function()
{
	$.ajax
	 ({
		 url: `${path}/reserve/restaurantMemberReserveList.do`,
		 type: 'POST',
		 data: 
		 {
			 "mem_id" : mem_id
		 },
		 success: function(res)
		 {
			var restaurantReserveList = null;
			if (res == null)
			{
				restaurantReserveList += `
				<tr>
					<td colspan="6">예약 목록이 없습니다.</td>
				</tr>
				`;
			} else 
			{				 
				console.log(res);
				$.each(res, function(i, v)
				{
					restaurantReserveList += `
					<tr>
						<td>${v.REST_RSV_NO}</td>
					 	<td>${v.REST_NAME}</td>
					 	<td>${v.REST_RSV_DATE}</td>
					 	<td>${v.REST_RSV_TIME}</td>
					 	<td>${v.REST_RSV_COUNT}</td>
						<td><input type="button" value="예약 취소" id="${v.REST_RSV_NO}" 
									onclick="restaurantReserveCancel(this.id)"></td>
					 </tr>
					 `;
				 })
			 }
		
			$('#addMemberRestaurantReserve').html(restaurantReserveList);
		 },
		 error: function(xhr)
		 {
			 console.log('숙소 예약 리스트 불러오기 오류 ==> ' + xhr);
		 },
		 dataType: 'json'
	 })

}

// 식당 예약 취소
restaurantReserveCancel = function(rest_rsv_no)
{
	$.ajax
	({
		url: `${path}/reserve/restaurantReserveCancel.do`,
		type: 'POST',
		data:
		{
			"rest_rsv_no" : rest_rsv_no
		},
		success: function()
		{
			swal("식당 예약이 취소되었습니다.", "", "success");
			// location.href=`${path}/reserveBtnTemp.jsp`; // 이동할 회원 관리 페이지
		},
		error: function(xhr)
		{
			console.log('식당 예약 취소 실패 ==> ' + xhr);
		}
	})
}

// --------------------------------------------------------------------------------------

// 식당 날짜가 지나면(당일 전) 예약이 지난 것으로 되는 것
changeDateReserveState = function()
{
	$.ajax
	({
		url: `${path}/reserve/restaurantMemberReserveList.do`,
		type: 'GET',
		success: function() 
		{
			console.log('당일 이전 예약 상태 0으로 변경');
		},
		error: function(xhr)
		{
			console.log('식당 날짜가 지나면 예약이 0으로 되는 것 실패 ==> ' + xhr);
		}
	})
}

// 식당 예약 취소 테이블 폼
 memberRestaurantReserveCancelForm = function()
 {
	restaurantCancelForm = `
	<table border="1">
		<tr>
			<td>식당예약번호</td><td>식당명</td><td>예약날짜</td>
			<td>예약시간</td><td>인원수</td><td></td>
		</tr>
		<tbody id="addMemberRestaurantReserveCancel"></tbody>
	</table>`;

	$('#memberRestaurantCancelReserveList').html(restaurantCancelForm);
 }

// 식당 예약 취소 List를 테이블 <tbody>에 넣기
addMemberRestaurantReserveCancel = function()
{
	$.ajax
	 ({
		 url: `${path}/reserve/restaurantMemberReserveCancelList.do`,
		 type: 'POST',
		 data: 
		 {
			 "mem_id" : mem_id
		 },
		 success: function(res)
		 {
			var restaurantReserveCancelList = null;
			if (res == null)
			{
				restaurantReserveCancelList += `
				<tr>
					<td colspan="6">예약 목록이 없습니다.</td>
				</tr>
				`;
			} else 
			{				 
				console.log(res);
				$.each(res, function(i, v)
				{
					restaurantReserveCancelList += `
					<tr>
						<td>${v.REST_RSV_NO}</td>
					 	<td>${v.REST_NAME}</td>
					 	<td>${v.REST_RSV_DATE}</td>
					 	<td>${v.REST_RSV_TIME}</td>
					 	<td>${v.REST_RSV_COUNT}</td>
						<td><input type="button" value="취소 완료" disabled></td>
					 </tr>
					 `;
				 })
			 }
		
			$('#addMemberRestaurantReserveCancel').html(restaurantReserveCancelList);
		 },
		 error: function(xhr)
		 {
			 console.log('숙소 예약 리스트 불러오기 오류 ==> ' + xhr);
		 },
		 dataType: 'json'
	 })

}