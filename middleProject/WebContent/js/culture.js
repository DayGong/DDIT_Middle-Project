var cate=$(this).attr('name');
currentPage=1;
const cateToVword = {
	resList: "",
	fesList: 1,
    concertList: 3,
    museumList: 2
};

function ListPageServer(page,vword){	   //DB로 가져온 문화 리스트를 보여주는 메서드
	gpage=page;
    vtype ='cul_tp_cd';
    
 
	$.ajax({                    // ajax로 DB에 있는 데이터를 가져옴
		url : `${mypath}/cultureList.do`,
		data : {
			"page" : page,
			"stype": vtype,
			"sword": vword
		},
		type: "post",
		dataType: "json",
		success :function (res){		  
			code="";
			code+=`<div class="cul_container">`;
			$.each(res.datas,function(i,v){
				code+=
					`<div class="cul" data-cul_no="${v.cul_no}">                   
						<div class="cul_img_div"><img src="${mypath}/images/culture/${v.cul_img}" class="cul_img" style="height:500px;"></div>
						<div class="hidden-text" style="opacity:0;">
							<div class "cul_no_div" style="display :none;">${v.cul_no} </div>
							<h5 class="cul_title">${v.cul_name}</h5>
							<p class="cul_des"> ${v.cul_perfomer}</p>
							<p class="cul_des"> ${v.cul_place}</p>
							<p class="cul_des"> ${v.cul_date}</p>
							<div class="cul_mon"> ${v.cul_host}</div> 
						</div>            
					</div>`;
      		})  
			code+='</div>';
			$('#result1').html(code);
        
			vpage = pagelist(res.sp,res.ep,res.tp);
			//vpage출력
			$('#pagelist').html(vpage);
		},
		error : function (xhr){
			alert("오류상태 : "+xhr.status);			 
		}		 
	}) 
}   //ListPageServer 메서드 끝

pagelist= function(s,e,t){
	//pagelist 모양 만들기 
	pager= "";
	pager +=`<ul class="pagination">`;
	
	//이전페이지
 	if(s>1) {
		pager +=`<li class="page-item"><a id="prev" class="page-link" href="#">Previous</a></li>`;
	}

	//페이지번호
	if (gpage >t) currentPage=t;

	for(i=s; i<=e; i++){ //1,2동안 
		if(i== currentPage){
			pager +=`<li class="page-item active"><a class="page-link pageno" href="#">${i}</a></li>`;
		} else{
			pager +=`<li class="page-item"><a class="page-link pageno" href="#">${i}</a></li>`;
		}
	}
	
	//다음페이지
	if(e<t){
		pager += `<li class="page-item"><a class="page-link" id="next" href="#">Next</a></li>`;
	}
	pager += `</ul>`;
	return pager ;
}
         
//페이지 버튼을 눌렀을때 리스트가 바뀌게 하는 메서드들
$(document).on("click","#next",function(){ 
	currentPage=parseInt($('.pageno').last().text().trim( ))+1;	
	cate = $('.cateBtn.active').attr('name');
	vword = cateToVword[cate];  
	ListPageServer(currentPage,vword);
})

//이전 prev클릭 이벤트
$(document).on("click","#prev",function(){
	currentPage=parseInt($('.pageno').first().text().trim())-1;
       
	cate = $('.cateBtn.active').attr('name');
	vword = cateToVword[cate]; // 
	ListPageServer(currentPage,vword);
})

//페이지번호 클릭 이벤트
$(document).on('click', '.pageno', function() {
	currentPage = parseInt($(this).text().trim());
    cate = $('.cateBtn.active').attr('name');
    vword = cateToVword[cate]; 
	if(cate=="resList") {
		ListServer(currentPage);
	} else{
		ListPageServer(currentPage, vword);
	}
})
//페이지 버튼을 눌렀을때 리스트가 바뀌게 하는 메서드들 끝

//마우스를 올렸을 시 글씨가 나오게 하는 메서드
$(document).on('mouseenter', '.cul', function() {
	$(this).find('.hidden-text').css('opacity', '1');
});

$(document).on('mouseleave', '.cul', function() {   //마우스를 딴곳으로 놓으면 글씨가 사라지게 하는 메서드
	$(this).find('.hidden-text').css('opacity', '0');
})
	
$(()=>{
	$('.cateBtn').on('click',function(){
		var	cate=$(this).attr('name');
		gthis=$(this);
		
        // 모든 카테고리 버튼에서 active 클래스 제거
        $('.cateBtn').removeClass('active');
        
        // 클릭된 버튼에 active 클래스 추가
        $(this).addClass('active');
       
		if (cate in cateToVword) {
			const vword = cateToVword[cate];
			if(cate=="resList") {
				ListServer(currentPage);
			}else{
				ListPageServer(1, vword);
			}
		}	
	}) //btn클릭시 함수 끝
});	//$(()=>{ 끝

function ListServer(page){	   //DB로 가져온 문화 리스트를 보여주는 메서드
	gpage=page;
	vword="";
	vtype='cul_tp_cd';
	$.ajax({            // ajax로 DB에 있는 데이터를 가져옴
		url : `${mypath}/cultureOneList.do`,
		data : {
			"page" : page,
			"stype": vtype,
			"sword": vword
		},
		type: "post",
		dataType: "json",
		success :function (res){		  
			code="";
			code+=`<div class="cul_container">`;
			$.each(res.datas,function(i,v){
				code+=
					`<div class="cul" data-cul_no="${v.cul_no}">                
						<div class="cul_img_div"><img src="${mypath}/images/culture/${v.cul_img}" class="cul_img"></div>
						<div class="hidden-text" style="opacity:0;">
							<div class "cul_no_div" style="display :none;">${v.cul_no} </div>
							<h5 class="cul_title">${v.cul_name}</h5>
							<p class="cul_des"> ${v.cul_perfomer}</p>
							<p class="cul_des"> ${v.cul_place}</p>
							<p class="cul_des"> ${v.cul_date}</p>
							<div class="cul_mon"> ${v.cul_host}</div> 
						</div>            
					</div>`;
			})
			code+='</div>';
			$('#result1').html(code);
	
			vpage = pagelist(res.sp,res.ep,res.tp);
			//vpage출력
			$('#pagelist').html(vpage);
		},
		error : function (xhr){
			alert("오류상태 : "+xhr.status);			 
		}	 
	})
}   //ListPageServer 메서드 끝

function getQueryStringValue(key) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(key);
}




