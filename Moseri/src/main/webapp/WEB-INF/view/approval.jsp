
   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/template/pheader.jsp"></jsp:include>

<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/res/js/register.js"></script>        
        <!-- <div class="container-fluid">
            <div class="row text-center menu">
            	
                <div class="col-sm-2"><a href="request">요청</a></div>
                <div class="col-sm-2"><a href="estimate">견적서</a></div>
                <div class="col-sm-2"><a href="myprofile">프로필</a></div>
                <div class="col-sm-2"><a href="notification">알림</a></div>
                <div class="col-sm-2"><a href="information">개인정보</a></div>
                <div class="col-sm-2"><a href="approval">고수인증</a></div>
            </div> -->
            <div class="row text-center mypage-bg">
                <div class="inner">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div id="req">
                  			<h3>고수 요청</h3>
                  			<form name ="fr" class="form-horizontal commonForm" method="post" action="approval" enctype="multipart/form-data"  onsubmit="return check()">
                  			
<%--                   			<input type = "hidden" id ="gosu_email" name ="email"value= "${sessionScpoe.email}" >
 --%>        					<!-- input type="file" 이라고 꼭 저어줘야 함 -->
        					<input type="file" id="uploadFile" name="uploadFile" accept=".jpg,.jpeg,.png,.gif,.bmp" style="border:0px solid black;" title="파일을 넣어주세요"/>
        					<input type="text" id ="uploadtext" name="text" maxlength="500" style="width:800px; height:100px;" title="설명글을 입력해주세요">
        					<button id="btn" type="submit" class="btn btn-default">요청</button>
        					
    						</form>
						</div>
                    </div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
        </div>
        
		<script>
		function check() {
 		 if(${sessionScpoe.granted} == "3") {
		    alert("이미 인증이 완료된 고수입니다.");
		    
		    return false;
		  }
		  
		  return true;
		}
		</script>
        
       <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>