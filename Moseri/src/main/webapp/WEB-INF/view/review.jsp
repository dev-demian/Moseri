<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>review</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <!-- css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/review.css">
    <style>
        div {
            /*            border:1px dotted #000;*/
        }
    </style>
    <!-- js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body style="background-color:#f9f9f9">
    <div id="review" class="container-fluid">
    	<div class="row text-center" style="margin-bottom:80px;"><a href="home"><img src="${pageContext.request.contextPath}/res/img/Icon.png" alt="logo"></a></div>
        <div class="row">
            <form action="review" method="post">
            	<input type="hidden" name="nickname" value="${nickname}">
            	<input type="hidden" name="pno" value="${pno}">
            	
                <div class="inner">
                    <div class="col-sm-12 text-center">
                        <h2>Review</h2>
                       	<!-- 		/////////////////////////////////20180625추가///////////////////////////////////// -->
                        <p><span>${getNickname}</span>님과 매칭이 완료되었습니다. 댓글을 달아주세요.</p>
                        <div class="row text-left">
                            <div class="col-sm-3">별점주기 : </div>
                            <div class="col-sm-6">
                                <select name="star">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 text-left">댓글입력 : </div>
                            <div class="col-sm-9">
                                <textarea name="text" required></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <input type="submit" value="등록">
                            </div>
                            <div class="col-sm-6">
                                <button onclick="location.href='home'">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>