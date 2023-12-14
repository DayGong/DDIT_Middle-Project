/**
 *
 */

$(() => 
{ 
 	// 마우스 올리면 메뉴 나오는 스크립트
    $('.menu').hover(function() 
	{
		$('#menu ul ul a').css('opacity', '0');
		$('a',this).css('opacity', '1');
 
        $('#menu ul ul').css('display', 'block');
       
    }, function() 
	{
        $('#menu ul ul').css('display', 'none');
    }); // $(.menu).hover이벤트 끝

});

var didScroll;
//스크롤시에 사용자가 스크롤했다는 것을 알림 
$(window).scroll(function()
{
	didScroll = true;
});

//hasScrolled()를 실행하고 didScroll 상태를 재설정
setInterval(function() 
{
	if (didScroll) 
	{
    	hasScrolled();
    	didScroll = false;
 	}
}, 250);

// 동작을 구현
function hasScrolled() 
{
	// 접근하기 쉽게 현재 스크롤의 위치를 저장한다.
	var st = $(this).scrollTop();
	
	var lastScrollTop = 0;
	var delta = 4;  // 동작의 구현이 시작되는 위치 
	var navbarHeight = $('header').outerHeight();  // 영향을 받을 요소를 선택

	// 헤더의 높이보다 더 스크롤되었는지 확인하고 스크롤의 방향이 위인지 아래인지를 확인한다.
	if (st > lastScrollTop && st > navbarHeight)
	{
	    // Scroll 내릴 때
	    $('header').removeClass('nav-down').addClass('nav-up');
	} else 
	{
	    // Scroll 올릴 때
	    if(st + $(window).height() < $(document).height()) 
		{ 
			$('header').removeClass('nav-up').addClass('nav-down');
	    }
	}

	// lastScrollTop에 현재 스크롤위치를 지정한다.
	lastScrollTop = st;
}

/* 추가로 웹페이지의 스크롤을 내렸을때를 감지해 코드를 실행시키는 함수입니다.
$(window).scroll(function(){ 
   if($(window).scrollTop() == $(document).height() - $(window).height()){ 
      // 실행할 함수
   } 
});
*/