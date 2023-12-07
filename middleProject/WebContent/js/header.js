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