/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

moveToHotelDetail = function()
{
	$.ajax
	({
		url: `${path}/reserve/returnToHotelReserveVo.do`,
		type: 'post',
		data: {
			"comp_no" : 1	// DB 내용을 가져오기 위한 임시 데이터
		},
		success: function(res)
		{
			$('#hotelDetailModal').modal('show');
				
			console.log(res);
				
			// $('#hotelModalBody').html('출력test');
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}