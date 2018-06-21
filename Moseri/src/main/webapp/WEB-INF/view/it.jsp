<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>
    <div class="">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="container">

                   <ul class="nav navbar-nav ul">
                        <li class="li"><a href="lesson">레슨</a></li>
                        <li class="li"><a href="living">생활서비스</a></li>
                        <li class="li"><a href="construction">시공/수리</a></li>
                        <li class="li"><a href="it">IT/디자인</a></li>
                        <li class="li"><a href="health">건강/미용</a></li>
                        <li class="li"><a href="event">행사</a></li>
                   
                    </ul>


                </div>

            </div>
        </nav>
    </div>
    <div class="empty-row"></div>
    <div class=" text-center empty-row categoryfont">
        중분류
    </div>

    <div class="container">

        <div class="text-center">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/makeup.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">디자인</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card ">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/sport.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">개발</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card ">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/dance.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/bocal.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/guitar.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/lesson.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>

                </div>

            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/programming.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>
               
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/design.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="imgrounded">
                            <a href="#"><img src="/img/ad.jpg" alt=""></a>
                        </div>
                        <div class="font">
                            <a href="#">default</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="empty-row"></div>
    <jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>