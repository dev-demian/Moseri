<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
  			  <%
  			  		//로그인 시 저장되는 이메일 아이디
					String userID = (String)session.getAttribute("email");
					
					//채팅방 입장하면 저장되는 메일주소 지운 아이디
					String ID = (String)session.getAttribute("ID");
					
					out.println(userID);
					out.println(ID);
					
				%>
    
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/chat.css">
		<title>chat</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
		   $(document).ready(function() {
				chatListFunction('ten');
		      	 getInfiniteChat(); 
			 			
	   	 });
		   
		   function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(lastNo);
					},	1000);
		  } 
		   
			var lastNo = 0;
			
			function chatListFunction(type){
				var email = '<%=userID%>';
				var loginID =  '<%= ID %>';	
				  console.log(type);
				  $.ajax({
						type:"POST",
						url:"getlist",
						dataType:"json",
						data:{
							fromID : email,
							listType : type
						},
					 success: function(data){
							var result = data;
							for(var i = 0; i<result.getchat.length; i++){
								if(loginID == result.getchat[i].fromID){
									addChat1(result.getchat[i].fromID,result.getchat[i].chatContent, result.getchat[i].chatTime);
									$("#scroll").scrollTop($("#scroll").prop("scrollHeight"));
								}else{
									addChat2(result.getchat[i].fromID, result.getchat[i].chatContent, result.getchat[i].chatTime);
									$("#scroll").scrollTop($("#scroll").prop("scrollHeight"));
								}
							 } 
							lastNo = result.lastNo;
							console.log(lastNo);
					},
					error:function(err){
							console.log(err);
							console.log("정보받기 실패");
					} 
				}); 
			}	
		   
		
		    	
		    	
		function submitFunction(){
				var fromID = '<%=userID%>';
				/* console.log(fromID); */
		
				$("#submit_btn").on("click",function(){
					var chatContent = $("#chatContent").val();
						/* console.log(chatContent); */
							
						$.ajax({
							type:"POST",
							url:"chatwrite",
							dataType: "json",
							data: {
								'fromID':  fromID,
								'chatContent' : $('#chatContent').val()
							},
							success : function(result){
								if(result == 1)	console.log("입력성공");
								
								else	console.log("입력 데이터가 부족")
								/* console.log(result); */
							},
							error:function(err){
								console.log(err);
								console.log("입력실패");
							}
						});	
						$('#chatContent').val(" ");
					});
			}
		
	 	function addChat1(fromID, chatContent, chatTime){
	 				 $('#chatlist').append(
	 						 '<li class="mar-btm">'
	 		 				+'<div class="media-right">'		
	 		 				+'<img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="img-circle img-sm" alt="Profile Picture">'		
	 		 				+'</div>'		
	 		 				+'<div class="media-body pad-hor speech-right">'		
	 		 				+'<div class="speech">'		
	 		 				+'<a href="#" class="media-heading">'
	 		 				+ fromID
	 		 				+'</a>'		
	 		 				+'<p>'
	 		 				+ chatContent
	 		 				+'</p>'		
	 		 				+'<p class="speech-time">'		
	 		 				+'<i class="fa fa-clock-o fa-fw"></i>'
	 		 				+ chatTime
	 		 				+'</p>'		
	 		 				+'</div>'		
	 		 				+'</div>');
			}
	 	
	 	function addChat2(fromID, chatContent, chatTime){
	 		console.log("fromID="+fromID)
			 $('#chatlist').append('<li class="mar-btm">'
					+ '<div class="media-left">'  
					+ '<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="img-circle img-sm" alt="Profile Picture">'
					+'</div>'
					+'<div class="media-body pad-hor">'
					+'<div class="speech">'
					+'<a href="#" class="media-heading">'
					+ fromID
					+ '</a>'
					+'<p>'
					+ chatContent 
					+ '</p>'
					+ '<p class="speech-time">'
					+ ' <i class="fa fa-clock-o fa-fw"></i>'
					+ chatTime
					+ '</p>'
					+ '</div>'
					+'</div>'
					+' </li>'); 
		}
		
		</script>
    </head>
<body>
	
        <div class="container">
            <div class="col-md-12">
                <div class="panel">
                    <!--Heading-->
                    <div class="panel-heading">
                        <div class="panel-control">
                            <div class="btn-group">
                                <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#demo-chat-body"><i class="fa fa-chevron-down"></i></button>
                                <button type="button" class="btn btn-default" data-toggle="dropdown"><i class="fa fa-gear"></i></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="#">Available</a></li>
                                    <li><a href="#">Busy</a></li>
                                    <li><a href="#">Away</a></li>
                                    <li class="divider"></li>
                                    <li><a id="demo-connect-chat" href="#" class="disabled-link" data-target="#demo-chat-body">Connect</a></li>
                                    <li><a id="demo-disconnect-chat" href="#" data-target="#demo-chat-body">Disconect</a></li>
                                </ul>
                            </div>
                        </div>
                        <h3 class="panel-title">채팅</h3>
                    </div>

                    <!--Widget body-->
                    <div id="demo-chat-body" class="collapse in">
                        <div class="nano has-scrollbar" style="height:80%">
                            <div class="nano-content pad-all" tabindex="0" style="right: -17px;" id="scroll">
                                <ul class="list-unstyled media-block" id="chatlist">
                                    <!-- <li class="mar-btm">
                                        <div class="media-left">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="img-circle img-sm" alt="Profile Picture">
                                        </div>
                                        <div class="media-body pad-hor">
                                            <div class="speech">
                                                <a href="#" class="media-heading"> fromID </a>
                                                <p> 대화내용 </p>
                                                <p class="speech-time">
                                                <i class="fa fa-clock-o fa-fw"></i>보낸시각
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="mar-btm">
                                        <div class="media-right">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="img-circle img-sm" alt="Profile Picture">
                                        </div>
                                        <div class="media-body pad-hor speech-right">
                                            <div class="speech">
                                                <a href="#" class="media-heading">toID</a>
                                                <p>네! 차차차를 배우고 싶어요.</p>
                                                <p class="speech-time">
                                                    <i class="fa fa-clock-o fa-fw"></i> 09:23AM
                                                </p>
                                            </div>
                                        </div>
                                    </li> -->
                                   
                                </ul>
                            </div>
                        <div class="nano-pane"><div class="nano-slider" style="height: 141px; transform: translate(0px, 0px);"></div></div></div>
                        <!--Widget footer-->
	                        <div class="panel-footer">
	                            <div class="row">
	                                <div class="col-xs-9">
	                                    <input type="text" name="content" id="chatContent" placeholder="Enter your text" class="form-control chat-input">
	                                </div>
	                                <div class="col-xs-3">
	                                    <button id="submit_btn" class="btn btn-primary btn-block" type="submit" onclick=" submitFunction();" >전송</button>
	                                </div>
	                            </div>
	                        </div>
							<div>
	                        	<c:set var="participant" value="${participant}"/>
	        					<c:if test="${participant eq 'requester'}"><input id="requester" style="font-size: 30px" type="button" onclick="location.href='chatEnd?participant=requester&matchingno=${matchingDto.no}'" value="요청자 채팅 종료"></c:if>
	        					<c:if test="${participant eq 'gosu'}"><input style="font-size: 30px" type="button" onclick="location.href='chatEnd?participant=gosu&matchingno=${matchingDto.no}'" value="고수 채팅 종료"></c:if>
	                        
	                        </div>

                   </div>
                </div>
            </div>
        </div>
        
    </body>
</html>