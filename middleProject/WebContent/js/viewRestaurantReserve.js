/**
 * 
 */

// 경로 path 설정
const pathName = "/" + window.location.pathname.split("/")[1];
const origin = window.location.origin;
const path = origin + pathName;



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
addMemberRestaurantReserve = function(memId)
{
	mem_id = memId;
	
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
			swal("식당 예약이 취소되었습니다.", "success");
			// location.href=`${path}/reserveBtnTemp.jsp`; // 이동할 회원 관리 페이지
		},
		error: function(xhr)
		{
			console.log('식당 예약 취소 실패 ==> ' + xhr);
		}
	})
}

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
addMemberRestaurantReserveCancel = function(memId)
{
	mem_id = memId;
	
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