<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>





  <script>
    $( document ).ready(function() {
        
      $('#bg1').on( "click", function() {
        console.log( "click1" );
        location.replace('register');
    });
      $('#bg2').on( "click", function() {
        console.log( "click2" );
        location.replace('register_gosu');
    });


    });
  </script>






  <div class="container">
    <div class="row">
     <div id="bg1" class="col-sm-6" style="background-image: url(${pageContext.request.contextPath}/res/img/nomal1.png)"> </div><!---->
     <div id="bg2" class="col-sm-6" style="background-image: url(${pageContext.request.contextPath}/res/img/master.png)"> </div><!---->
   </div>
 </div>




<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>