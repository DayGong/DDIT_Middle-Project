/**
 * 숙소 예약, 식당 예약에 사용하는 js
 */

moveToHotelDetail = function()
{
	$.ajax
	({
		url: `${path}/reserve/returnToHotelVo.do`,
		type: 'GET',
		data: {
			"comp_no" : compNo
		},
		success: function(res)
		{
			$('#hotelDetailModal').modal('show');
				
			console.log(res);
			
			headerCode = `
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
					</table>
				</div>
			</div>`;

			$('#hotelModalHeader').html(headerCode);
			
			openReserveForm();
		},
		error: function(xhr)
		{
			alert('오류 상태: ' + xhr.status);
		},
		dataType: 'json'
	})
}

openReserveForm = function() 
{
	
	$('#hotelDetailModal .modal-body').load("form/reserve/HotelReserveForm.jsp");
}