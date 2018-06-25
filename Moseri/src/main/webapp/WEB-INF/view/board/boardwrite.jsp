<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<html>

<head>
    <title>게시글 쓰기</title>
    <!-- 디자인 코드 작성 공간-->
    <style>
    .fileDrop{
    	width: 100%;
    	height: 100px;
    	border: 1px dotted gray;
    	background-color: gray;
    }
    </style>
    <!-- 스크립트 작성 공간 -->
    <link rel="stylesheet" type="text/css" href="${root}/res/css/boardwrite.css">
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${root}/res/js/common.js"></script>
    <script>
        $(document).ready(function() {});
        
        $(function(){
        	$("#btnSave").click(function(){
        		var str="";
        		// uploadedList 내부의 .file 태그 각각 반복
        		$("#uploadedList .file").each(function(i){
        			console.log(i);
        			//hidden 태그 구성
        			str += 
        "<input type='hidden' name='files["+i+"]'	value='"
        	+ $(this).val()+"'>";
        		});
        		//폼에 hidden 태그들을 붙임
        		$("#form1").append(str);
        		document.form1.submit();
        	});
        	$(".fileDrop").on("dragenter dragover",function(e){
        		//기본 효과 막음
        		e.preventDefault();
        	});
        	$(".fileDrop").on("drop",function(e){
        		e.preventDefault();
        		//첫번째 첨부파일
        		var files=e.originalEvent.dataTransfer.files;
        		var file=files[0];
        		//폼 데이터에 첨부파일 추가
        		var formData=new FormData();
        		formData.append("file",file);
        		$.ajax({
        			url: "${root}/upload/uploadAjax",
        			data: formData,
        			dataType: "text",
        			processData: false,
        			contentType: false,
        			type: "post",
        			success: function(data){
        				//console.log(data);
        				//data : 업로드한 파일 정보와 Http 상태 코드
        				var fileInfo=getFileInfo(data);
        				//console.log(fileInfo);
        				var html="<a href='"+fileInfo.getLink+"'>"+
        					fileInfo.fileName+"</a><br>";
        				html += "<input type='hidden' class='file' value='"
        					+fileInfo.fullName+"'>";
        				$("#uploadedList").append(html);
        			}
        		});
        	});
        });
        
    </script>
</head>

<body>

    <div class="empty-row"></div>
    <div id="write" class="container-fluid">
        <div class="row">
            <form id="form1" name="form1" action="boardwrite" method="post">
                <div class="inner">
                    <div class="col-sm-12 text-center margin">
                        <div style="font-size: 30px">
                            게시글 쓰기
                        </div>
                        <div class="row"></div>
                        <div class="row text-left">

                            <div class="col-sm-2">

                                <div class="text-center" style="background-color: lightgray; width: 100%;">
                                    제목
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" style="width: 100%;" name="title">
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="row text-left">
                            <div class="col-sm-2">
                                <div class="text-center" style="width:100%; background-color: lightgray;">
                                    작성자
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" style="width: 100%;" name="writer">
                            </div>

                            <div class="col-sm-2 text-left">
                            </div>
                            <div class="col-sm-2 text-right">
                            
                            	<input type="button" value="취소 " style="background-color: #FF7373; border-color: #FF7373; color: white; width:55px;" onclick="location.href='${root}/boardhome'">
                            	<button type="button" id="btnSave" style="background-color:#79ABFF; border-color: #79ABFF; color: white; width:55px;" >작성</button>
                                <!-- <input type="submit" value="작성" style="background-color: #6798FD; border-color: #6798FD; color: white;width:55px; margin-left: 5" > -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <textarea name="content" id="content" cols="30" rows="15" style="width: 100%; resize: none;"></textarea>
                            </div>
                            
                        </div>
                        <div class="row text-left">
                        	&nbsp;&nbsp;&nbsp; 첨부파일 등록
                        <div class="fileDrop"></div>
                        <div id="uploadedList"></div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>