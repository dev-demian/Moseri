<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
small {
	margin-left:3px;
	font-weight: bold;
	color: gray;
}
</style>
           <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			
			<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/swiper.min.css">
        	

            <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/slider.css">

            <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
            <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
            <!--    <script type="text/javascript" src="slick/slick.min.js"></script>-->
            <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
$(function(){
	//드래그 기본 효과를 막음
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	$(".fileDrop").on("drop",function(event){
		//drop이 될 때 기본 효과를 막음
		event.preventDefault();
		//첨부파일 배열
		var files=event.originalEvent.dataTransfer.files;
		var file=files[0]; //첫번째 첨부파일
		var formData=new FormData(); //폼 객체
		formData.append("file",file); //폼에 file 변수 추가
		//서버에 파일 업로드(백그라운드에서 실행됨)
		// contentType: false => multipart/form-data로 처리됨
		$.ajax({
			type: "post",
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(data,status,req){
				console.log("data:"+data); //업로드된 파일 이름
				console.log("status:"+status); //성공,실패 여부
				console.log("req:"+req.status);//요청코드값
				var str="";
				if(checkImageType(data)){ //이미지 파일
str="<div><a href='${path}/upload/displayFile?fileName="
		+getImageLink(data)+"'>";
str+="<img src='${path}/upload/displayFile?fileName="
		+data+"'></a>"; 
				}else{ //이미지가 아닌 경우
					str="<div>";
str+="<a href='${path}/upload/displayFile?fileName="
		+data+"'>"+getOriginalName(data)+"</a>";
				}
				str+="<span data-src="+data+">[삭제]</span></div>";
				$(".uploadedList").append(str);
			}
		});
	}); //fileDrop 함수
	//첨부파일 삭제 함수
	$(".uploadedList").on("click","span",function(event){
		//현재 클릭한 태그
		var that=$(this);
//data: "fileName="+$(this).attr("data-src"),		
		$.ajax({
			url: "${path}/upload/deleteFile",
			type: "post",
			data: {
				fileName: $(this).attr("data-src")
			},
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					that.parent("div").remove();
				}
			}
		});
	});
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)){ //이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
			return;
		}
		var front=fileName.substr(0,12);//연월일 경로
		var end=fileName.substr(14);// s_ 제거
		return front+end;
	}
	function checkImageType(fileName){
		var pattern=/jpg|png|jpeg/i; //정규표현식(대소문자 무시)
		return fileName.match(pattern); //규칙에 맞으면 true
	}
});
</script>

</head>
<body>
 <h2>Ajax File Upload</h2>	

	<div class="fileDrop"></div>
	
	<div class="uploadedList"></div>

</body>
</html>