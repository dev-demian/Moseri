//$(document).ready(function () {
//var swiper = new Swiper(".swiper-container", {
////방향 옵션
//direction: "horizontal",
////direction:"vertical",

////속도 옵션(밀리초)
//speed: 300,

////이미지 간격(px)
//spaceBetween: 10,

////끝과 끝을 연결(반복)
//loop: true,
////loop:false,

////커서 모양을 변경
//grabCursor: true,
////grabCursor:false,

////이미지 전환 효과를 변경
//effect:"slide",//돌아가며 한장씩
////effect:"fade",//fade in/out
////effect: "cube", //큐브 형태
////effect:"coverflow",//파노라마
////effect:"flip",//뒤집힘

////자동재생
//autoplay: false,
////autoplay:true,//기본값으로 자동재생 시작
////autoplay:{
////delay:5000,//전환 간격(밀리초)
////},
////이동 버튼 등록
//navigation: {
//nextEl: ".swiper-button-next", //다음 버튼
//prevEl: ".swiper-button-prev", //이전 버튼
//},

////페이징 버튼 등록
//pagination: {
//el: ".swiper-pagination", //버튼 영역

////모양
//type: "bullets", //총알모양
////type:"fraction", //숫자
////type:"progressbar",//로딩바
////type:"custom",//사용자정의
//},

////스크롤바 등록
//scrollbar: {
//el: ".swiper-scrollbar", //대상
////스크롤바 드래그 설정
//draggable: true,
////draggable:false,
//}

//});

//});
$(document).ready(function(){
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		slidesPerView: 3,
		spaceBetween: 30,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		//자동재생
		autoplay: {
			delay: 5000,
		},
		//이동 버튼 등록
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	/////////////////////////////////20180625추가/////////////////////////////////////
	$(".review .star,.star").each(function(){
		if($(this).text() === "1"){
			$(this).text("★☆☆☆☆");
		}
		else if($(this).text() === "2"){
			$(this).text("★★☆☆☆");
		}
		else if($(this).text() === "3"){
			$(this).text("★★★☆☆");
		}
		else if($(this).text() === "4"){
			$(this).text("★★★★☆");
		}
		else if($(this).text() === "5"){
			$(this).text("★★★★★");
		}
		else{
			$(this).text("☆☆☆☆☆");
		}
	});
});