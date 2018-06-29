<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <html>
    <head>
        <title>로그인</title>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
               body {
                      padding-top: 70px;
                      padding-bottom: 40px;
                      background-color: #eee;
                    }

                .form-signin {
                      max-width: 400px;
                      padding: 15px;
                      margin: 0 auto;
                    }
                .form-signin .form-signin-heading,
                .form-signin .checkbox {
                      margin-bottom: 10px;
                    }
                .form-signin .checkbox {
                      font-weight: lighter;
                }
                .form-signin .form-control {
                  position: relative;
                  box-sizing: border-box;
                  height: auto;
                  padding: 10px;
                  font-size: 16px;
                }
                .form-signin .form-control:focus {
                  z-index: 2;
                }
                .form-signin input[type="email"] {
                  margin-bottom: -1px;
                  border-bottom-right-radius: 0;
                  border-bottom-left-radius: 0;
                }
                .form-signin input[type="password"] {
                  margin-bottom: 10px;
                  border-top-left-radius: 0;
                  border-top-right-radius: 0;
                }
           
                .form-signin-heading{
                    padding:10px;
                }
               
                .form-controll{
                    display: block;
                    width:100%;
                    height: 55px;
                    padding: .375rem;
                    line-height: 1.5;
                    color:#495057;
                    background-image: none;
                    background-clip: padding-box;
                    border: 1px solid #ced4da;
                    border-radius: 1rem;
                }
            
        </style>
        
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       <script type="text/javascript">
           $(document).ready(function(){
              //저장된 쿠키값을  ID칸에 넣어준다. 없으면 공백
                 var userInput = getCookie("userInput");
                 $("#inputID").val(userInput);
                 
                 if($("#inputID").val() != " "){
                    $("#emailsave").attr("checked",true);
                 }
                 
                 $("#emailsave").change(function(){
                    if($("#emailsave").is(":checked")){
                       var userInput =    $("#inputID").val();
                       setCookie("userInput",userInput, 7);
                    }else{
                       deleteCookie("userInput");
                    }
                 });
                 
                 $("#inputID").keyup(function(){
                    if($("#emailsave").is(":checked")){
                       var userInput = $("#inputID").val();
                       setCookie("userInput",userInput, 7);
                    }
                 });
           });
              
              
              function setCookie(cookieName, value, exdays){
                   var exdate = new Date();
                   exdate.setDate(exdate.getDate() + exdays);
                   var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
                   document.cookie = cookieName + "=" + cookieValue;
               }
                
               function deleteCookie(cookieName){
                   var expireDate = new Date();
                   expireDate.setDate(expireDate.getDate() - 1);
                   document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
               }
                
               function getCookie(cookieName) {
                   cookieName = cookieName + '=';
                   var cookieData = document.cookie;
                   var start = cookieData.indexOf(cookieName);
                   var cookieValue = '';
                   if(start != -1){
                       start += cookieName.length;
                       var end = cookieData.indexOf(';', start);
                       if(end == -1)end = cookieData.length;
                       cookieValue = cookieData.substring(start, end);
                   }
                   return unescape(cookieValue);
               }
           </script>
        
    </head>
    <body>
    <script type="text/javascript">
	var message = '${msg}';
	var returnUrl = '${url}';
	alert(mag);
	document.location.href = returnUrl;
	</script>
    
       <div class="container">
           <div class="row">
            <a href="home"><img class="img-circle center-block" src="http://www.cinema4d.co.kr/files/attach/images/119/040/894/001/fb466ee7c233a3fc00eedbe4df84cc6a.jpg" width="150" height="150"></a>
           </div>
            <form action="login" method="post" class="form-signin">
                <h2 class="form-signin-heading text-center">로그인</h2>
                <div class="inputid">
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input id="inputID" type="text" name="email" class="form-controll" placeholder="아이디(이메일)">
                </div>
                <div class="inputpw">
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="pwd" class="form-controll" placeholder="비밀번호" required>
                </div>
                <div class="checkbox">
                    <label>
                        <input id="emailsave" type="checkbox" value="remeber-me">
                        아이디 기억하기
                    </label>
                    <a  href="#" class="pull-right">비밀번호 찾기</a>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
           </form>
        </div> 
       
        
    </body>
</html> 
    