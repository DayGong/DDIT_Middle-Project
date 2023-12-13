/**
 * 식당 예약에 사용하는 js
 */

// mem_id = (String)session.getAttribute("mem_id");

// 식당 상세보기 모달창 설정
moveToRestaurantDetail = function(rest_no)
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
				
			// 식당의 상세 정보를 띄우는 메소드
			showRestaurantDetailInfo(res);
			
			// 식당 예약폼을 띄우는 메소드
			openRestaurantReserveForm(res);
			
			// 시간 리스트를 띄우는 메소드
			getTimeSelectList(res);
			
			// select에 예약 시간 disable을 당일 날짜로 처음 보여주기위해 사용
			restaurantReservedTime(res.rest_no, `${year}-${month}-${dayZero}`);
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
		<input type="button" id="restaurant_rsv_btn" value="예약하기" onclick="reserveRestaurant()">
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
						oninput="restaurantReservedTime(${res.rest_no}, this.value)"
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

// 식당 예약 시 시간 select 메서드
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
			strHours += `<option value="${openTime}:00">${openTime}:00</option>`;
		} else
		{
			let time = i.toString().padStart(2, "0");
    	    strHours += `<option value="${time}:00">${time}:00</option>`;
		}
	}
	
	strHours += `</select>`;
 
	 $("#selectTimeDiv").html(strHours);
}

// 예약된 시간을 disabled하는 메서드
restaurantReservedTime = function(rest_no, selectedDate)
{
	$.ajax
	({
		url: `${path}/reserve/restaurantGetTime.do`,
		type: 'POST',
		data:
		{
			'rest_no' : rest_no,
			'selectedDate' : selectedDate
		},
		success: function(res)
		{
			if (res == null || res.size <= 0)
			{
			} else {
				$.each(res, function(i, v)
				{
					$(`#rest_rsv_time option[value="${v}"]`).attr('disabled', true);
					$(`#rest_rsv_time option[value="${v}"]`).css("background-color", "lightgray");
				});
			}
		}, error: function(xhr)
		{
			console.log(xhr.status);
		},
		dataType: 'json'
	})
}

// 식당 예약하는 메서드
reserveRestaurant = function()
{
	let rest_rsv_date = $('#rest_rsv_date').val();
	let rest_rsv_time = $('#rest_rsv_time').val();
	let rest_rsv_count = $('#rest_rsv_count').val();
	
	if ( rest_rsv_time == null )
	{
		alert('시간을 입력해주세요');
		return;
	}
	
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
		success: function()
		{
			alert(`${rest_rsv_date} / ${rest_rsv_time} 예약 완료되었습니다.`);
			$('#restaurantDetailModal').modal('hide');
		},
		error: function(xhr)
		{
			console.log(xhr);
		}
	})
}