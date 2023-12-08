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
				
			// console.log(res);
			
			headerCode = `
				<h4 class="modal-title">${res.comp_name}</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>`;
			$('#hotelModalHeader').html(headerCode);
			
			bodyCode = `
				<span id="hotelImg">
					<img src="${path}/images/hotel/${res.comp_img}" alt="res.comp_name">
				</span>
			`;
			$('#hotelModalBody').html(bodyCode);
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}