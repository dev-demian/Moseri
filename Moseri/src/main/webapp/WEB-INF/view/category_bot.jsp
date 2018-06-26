<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세부 카테고리</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap stylesheet -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script>
	<c:set var="m" value="${sessionScope.modal}"/>
	<c:if test="${m eq 'true'}">
	$(document).ready(function() {
		$("#myModal").modal('show');
	});
	<c:set var="modal" value="false" scope="session"/>
	</c:if>
</script>

</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 100px; margin-bottom: 100px;">
			<c:forEach items="${categoryBotDto}" var="categoryBotDto">
				<div class="col-md-3">
					<h3>
						<a href="writeRequest?categoryno=${categoryBotDto.no}">${categoryBotDto.name}</a>
					</h3>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="row" style="text-align: center; margin: 10px">
		<form action="requestInsert" method="get">
			<!-- 모달 팝업 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h1 class="modal-title" id="myModalLabel">요청서 작성</h1>
						</div>
						<div class="modal-body">
							<label style="font-size: 35px">${sessionScope.q0}</label> <br>
							<label>원하는 고수 성별 선택&nbsp&nbsp</label> <label>남</label><input
								type="radio" name="sex" value="남자"> <label>/</label> <label>여</label><input
								type="radio" name="sex" value="여자"> <label>/</label> <label>무관</label><input
								type="radio" name="sex" value="무관" checked="checked">
							<br> <label>${sessionScope.q1}</label> <br>
							<textarea name="a1"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q2}</label> <br>
							<textarea name="a2"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q3}</label> <br>
							<textarea name="a3"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q4}</label> <br>
							<textarea name="a4"
								style="height: 100px; width: 500px; resize: none;"></textarea>
							<br> <label>${sessionScope.q5}</label> <br>
							<textarea name="a5"
								style="height: 100px; width: 500px; resize: none;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">작성 완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>

</html>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>