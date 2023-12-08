/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

$(function() 
{
	$('#hotelModalBtn').on('click', function() 
	{
		$.ajax
		({
			url: `${path}/reserve/returnToHotelReserveVo.do`,
			type: 'post',
			success: function(res)
			{
				$('#hotelDetailModal').modal('show');
				
				console.log(res);
				
				$('#hotelModalBody').html('출력test');
			},
			error: function(xhr)
			{
				alert('오류 상태: ' + xhr.status);
			}
		})
	})
})

moveToHotelDetail = function() 
{
	$('#hotelDetailModal').modal('show');
}