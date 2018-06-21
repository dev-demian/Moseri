<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
    <div class="empty-row"></div>
    

    <div class="container">

        <div class="text-center">
            <div class="row">
         <c:forEach items="${categoryMidDto}" var="categoryMidDto">
                   <div class="col-md-4">
                       <div class="card">
                           <div class="imgrounded">
                               <a href="category_bot?midNo=${categoryMidDto.no}"><img src="res/img/${categoryMidDto.no}.jpg"></a>
                           </div>
                           <div class="font">
                               <a href="category_bot?midNo=${categoryMidDto.no}">${categoryMidDto.name}</a>
                        </div>
                      </div>
                 </div>
         </c:forEach>
            </div>

        </div>
        
    </div>
    <div class="empty-row"></div>
    
   <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>