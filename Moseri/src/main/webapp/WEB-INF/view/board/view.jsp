<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<c:set var="path" value="${pageContext.request.contextPath}"></c:set> 
<html>

<head>
    <title>게시물 보기</title>
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
    <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${root}/res/js/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${root}/res/js/common.js"></script>
    <script>
 	
        $(function(){ // 자동으로 실행되는 코드
        	//댓글 목록 출력
        	 listReply();
        	
        	listAttach();
        	
        	function listReply(){
        		$.ajax({
        			type: "get",
        			url: "${root}/list?bno=${bdto.bno}",
        			success: function(result){
        				//result : responseText 응답텍스트(html)
        				$("#listReply").html(result);
        			}
        		});
        	}
        	
        	//댓글 쓰기
        	$("#btnReply").click(function(){
        		var replytext=$("#replytext").val(); //댓글 내용
        		var bno="${bdto.bno}"; //게시물 번호
        		/* var param={ "replytext": replytext, "bno": bno}; */
        		var param="replytext="+replytext+"&bno="+bno;
        		$.ajax({
        			type: "post",
        			url: "${root}/replyinsert",
        			data: param,
        			success: function(){
        				alert("댓글이 등록되었습니다.");
        			 listReply(); //댓글 목록 출력 
        			}
        		});
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
        	
        	//목록 버튼
        	$("#btnList").click(function(){
        		location.href="${root}/boardhome";
        	});
        	//수정 버튼
        	$("#btnUpdate").click(function(){
        		//첨부파일 이름들을 폼에 추가
        		var str="";
        		$("#uploadedList .file").each(function(i){
        			str+=
        				"<input type='hidden' name='files["+i+"]' value='"
        				+$(this).val()+"'>";
        		});
        		$("#form1").append(str);
        		document.form1.action="${root}/update";
        		document.form1.submit();
        	});
        	
        	//삭제 버튼
        	$("#btnDelete").click(function(){
        		if(confirm("삭제하시겠습니까?")){
        			document.form1.action="${path}/delete";
        			document.form1.submit();
        		}
        	});
        	
        	
        	//첨부파일 삭제
        	//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
        	$("#uploadedList").on("click",".file_del",function(e){
        		var that=$(this); //클릭한 태그
        //data: {fileName: $(this).attr("data-src") },		
        		$.ajax({
        			type: "post",
        			url: "${root}/deleteFile",
        			data: "fileName="+	$(this).attr("data-src"),		
        			dataType: "text",
        			success: function(result){
        				if(result=="deleted"){
        					//화면에서 태그 제거
        					that.parent("div").remove();
        				}
        			}
        		});
        	});
        	
        	
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
      //첨부파일 리스트를 출력하는 함수
        function listAttach(){
        	$.ajax({
        		type: "post",
        		url: "${root}/getAttach/${bdto.bno}",
        		success: function(list){
        			// list : json
        			//console.log(list);
        			$(list).each(function(){
        				var fileInfo=getFileInfo(this);
        				//console.log(fileInfo);
        				var html="<div><a href='"+fileInfo.getLink+"'>"
        					+fileInfo.fileName+"</a>&nbsp;&nbsp;";
        				<c:if test="${sessionScope.userid == bdto.writer}">	
        					html+="<a href='#' class='file_del' data-src='"
        						+this+"'>[삭제]</a></div>";
        				</c:if>
        				$("#uploadedList").append(html);
        			});
        		}
        	});
        }
      
   
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
                            게시물 보기
                        </div>
                        <div class="row"></div>
                        <div class="row text-left">

                            <div class="col-sm-2">

                                <div class="text-center" style="background-color: lightgray; width: 100%;">
                                    제목
                                </div>
                            </div>
                            <div class="col-sm-6">
                    
                                <input type="text" style="width: 100%;" name="title" value="${bdto.title}">
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
                                <input type="text" style="width: 100%;" name="writer" value="${bdto.writer}">
                            </div>

                            <div class="col-sm-1 text-left">
                            </div>
                            <div class="col-sm-3 text-right">
                            <!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
                            		<input type="hidden" name="bno" value="${bdto.bno}">
                            		<button type="button" id="btnUpdate" style="background-color:#FF7373; border-color: #FF7373; color: white; width:55px;">수정</button>
                            	<button type="button" id="btnDelete" style="background-color:#79ABFF; border-color: #79ABFF; color: white; width:55px;">삭제</button>
                            	<button type="button" id="btnList" style="background-color:#86E57F; border-color: #86E57F; color: white; width:55px;">목록</button>
                            	
                                <!-- <input type="submit" value="작성" style="background-color: #6798FD; border-color: #6798FD; color: white;width:55px; margin-left: 5" > -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <textarea name="content" id="content" cols="30" rows="15" style="width: 100%; resize: none;">${bdto.content}</textarea>
                            </div>
                            
                        </div>
                        <div class="row text-left">
                        	&nbsp;&nbsp;&nbsp; 첨부파일 등록
                        <div class="fileDrop"></div>
                        
                        <div id="uploadedList"></div>
                        </div>
                    </div>
                     </form>
                    <!-- 댓글 작성 -->
			<div style="width:700px; text-align:center;">
		  <%-- <c:if test="${sessionScope.userid != null }"> </c:if> --%> <!-- 세션 생기면 추가 -->
	 		<textarea rows="5" cols="80" id="replytext"
	 		placeholder="댓글을 작성하세요"></textarea>
	 		<br>
	 		<button type="button" id="btnReply" style="border-color: #7A7A7A; background-color: #7A7A7A;color: white; width:55px;">댓글</button>
			</div>
				<!-- 댓글 목록 -->
			<div id="listReply"></div>
			
              </div>
            
        </div>
    </div>
</body>

</html>