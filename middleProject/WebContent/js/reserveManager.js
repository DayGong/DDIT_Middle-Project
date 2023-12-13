/**
 * 매니저가 누르는 일괄 처리 버튼용 임시 js
 * 나중에 매니저로 넣을지 reserveHotel.js에 넣을지 생각해봐야합니다
 */

$(function() {
	memberHotelReserveForm(mem_id);
})

// 일괄 체크 아웃
 managerAllCheckout = function()
 {
	 $.ajax
	 ({
		url: `${path}/reserve/hotelCheckout.do`,
		type: 'GET',
		success: function(res)
		{
			alert(res);
		},
		error: function(xhr)
		{
			console.log('체크아웃 오류: ' + xhr);
		}
	 })
 }
 
 // 숙소 예약 리스트 폼
 memberHotelReserveForm = function(mem_id)
 {
	 reserveForm = `
	 <table>
	 	<tr>
	 		<td>예약번호</td>
	 		<td>숙소명</td>
	 		<td>예약시작일</td>
	 		<td>예약종료일</td>
	 		<td>인원수</td>
	 		<td>객실정보</td>
	 		<td>결제금액</td>
	 		<td></td>
	 	</tr>`;
	 
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
			if (res == null)
			{
				reserveForm += `
				<tr>
					<td colspan="7">예약 목록이 없습니다.</td>
				</tr>
				`;
			} else 
			{				 
				console.log(res);
				$.each(res, function(i, v)
				{
					console.log(v);
					reserveForm += `
					<tr>
						<td>${v.hotel_rsv_no}</td>
					 	<td>${v.hotel_name}</td>
					 	<td>${v.hotel_rsv_startdate}</td>
					 	<td>${v.hotel_rsv_enddate}</td>
					 	<td>${v.hotel_rsv_count}</td>
					 	<td>${v.hotel_rsv_room}</td>
					 	<td>${v.hotel_totalamt}</td>
					 </tr>
					 `;
				 })
			 }
		 },
		 error: function(xhr)
		 {
			 console.log('숙소 예약 리스트 불러오기 오류 ==> ' + xhr);
		 },
		 dataType: 'json'
	 })
	 
	 reserveForm += `</table>`;
	 
	 $('#memberHotelReserveList').html(reserveForm);
 }
 
 // 식당 예약 폼
 memberRestaurantReserveForm = function()
 {
	 
 }