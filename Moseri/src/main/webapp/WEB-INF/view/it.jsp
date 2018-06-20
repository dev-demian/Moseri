<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
    <title>카테고리</title>
    <!-- 디자인 코드 작성 공간-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .card {
            /*border: 1px solid gray;*/
            width: 350px;
            height: 230px;
            /*border-radius: 8px;
            overflow: hidden;*/
        }

        .empty-row {
            margin-top: 10px;
            margin-bottom: 40px;
        }

        .font {
            font-weight: bold;
            font-size: 18px;
            padding-top: 13px;
        }

        .imgrounded {
            border: 1.5px solid grey;
            border-radius: 8px;
            overflow: hidden;
        }

        .categoryfont {
            font-weight: bold;
            font-size: 30px;
        }

        a {
            color: #2c2c2c;
        }

        .li {
            padding-left: 15px;
            padding-right: 15px;
            font-size: 18px;
        }

        .ul {
            padding-top: 9px;
            padding-left: 220px;
        }
    </style>
    <!-- 스크립트 작성 공간 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script>
        $(document).ready(function() {});
    </script>
</head>

<body>
    <header id="top" style="background-image: url(/img/home.jpg); background-size: 100% 100%; ">
        <div class="container">


            <nav class="collapse navbar-collapse bs-navbar-collapse" style="padding-bottom: 200px">
                <ul class="nav navbar-nav">
                    <img id="home_icon" src="./Icon.png " alt="icon">
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><button type="button" class="btn btn-info">Info</button></li>
                    <li><button type="button" class="btn btn-primary">로그인</button></li>
                    <li><button type="button" class="btn btn-success">회원가입</button></li>
                    <li><button type="button" class="btn btn-primary">마이페이지</button></li>
                    <li><button type="button" class="btn btn-success">로그아웃</button></li>


                </ul>
            </nav>
            <nav style="padding-bottom: 100px ;padding-left: 340px; padding-right: 340px;">
                <!--  <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark" id="jumbo"> -->
                <!-- <img id="icon" src="./zzalicon.png" alt="icon"> -->

                <!-- </div> -->
            </nav>

        </div>

    </header>
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
    <footer class="footer" style="background-color: #F2F2F2;">
        <div class="container">
            <div class="row">
                <div class="row">
                    <div class="col-sm-5 col-md-5 about">
                        <div>
                            <a href="https://www.facebook.com/" target="_blank" wrc_done="true">
                  <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_facebook1.png" class="social-ico">
                </a>
                            <span class="wrc1 wrc_icon wrc_injected"></span>
                            <a href="http://www.naver.com/" target="_blank" wrc_done="true">
                  <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_blog1.png" class="social-ico">
                </a>
                            <span class="wrc1 wrc_icon wrc_injected"></span>
                            <a href="http://post.soomgo.com" target="_blank" wrc_done="true">
                  <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_post.png" class="social-ico">
                </a>
                            <span class="wrc1 wrc_icon wrc_injected"></span>
                            <a href="http://news.soomgo.com" target="_blank" wrc_done="true">
                  <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/ico_footer_tistory.png" class="social-ico">
                </a>
                            <span class="wrc1 wrc_icon wrc_injected"></span>
                        </div>
                        <p>(개발1팀)모서리컴퍼니</p>
                        <p>사업자등록번호: 000-00-00000 홈페이지 UI관리자: 곽재훈, 장준혁</p>
                        <p>서울시 구로구 구일로 8길 79, 영화아파트 1303호</p>

                        <p><a href="/terms/privacy">개인정보 처리방침</a> · <a href="/terms/usage">이용약관</a> · <a href="/terms/membership">멤버십 약관</a> · 고객센터: 0000-0000</p>
                        <p class="copy">© Moseri</p>
                    </div>
                    <div class="col-sm-3 col-md-2">
                        <h4 class="app-download">앱 다운로드</h4>
                        <ul class="menu">
                            <div class="app-download-wrap">
                                <div class="app-download-btn">
                                    <a href="https://soomgo.app.link/SZeaREjJcE" target="_blank" wrc_done="true">
                      <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_googleplay_btn.png" class="footer-app-btn">
                    </a>
                                    <span class="wrc0 wrc_icon wrc_injected">

                    </span>
                                </div>
                                <div class="app-download-btn">
                                    <a href="https://soomgo.app.link/SZeaREjJcE" wrc_done="true">
                      <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_appstore_btn.png" class="footer-app-btn">
                    </a>
                                    <span class="wrc0 wrc_icon wrc_injected">

                    </span>
                                </div>
                            </div>
                            <li>
                                <a href="/" target="_blank">
                   <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_mobile_ico.png">모바일 앱 안내
                 </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="col-sm-4 col-md-4 footer-list">
                            <h4>모서리
                                <div class="switch"></div>
                            </h4>
                            <ul class="menu hide">
                                <li>
                                    <a href="/about">프로젝트 소개</a>
                                </li>

                            </ul>
                        </div>
                        <div class="col-sm-4 col-md-4 footer-list">
                            <h4>요청자
                                <div class="switch"></div>
                            </h4>
                            <ul class="menu hide">
                                <li><a href="/how-it-works">1.</a></li>
                                <li><a href="/safety">2.</a></li>
                                <li><a href="/prices">3.</a></li>
                                <li><a href="/search/pro">4.</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-4 col-md-4 footer-list">
                            <h4>고수
                                <div class="switch"></div>
                            </h4>
                            <ul class="menu hide">
                                <li>
                                    <a href="/how-soomgo-works">1.</a></li>
                                <li><a href="/subscriptions/info">2.</a></li>
                                <li><a href="/pro">3.</a></li>
                                <li><a href="/pro-center">4.</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 footer-list-help">
                        <h4 class="app-download">도움이 필요하신가요?</h4>
                        <ul class="menu">
                            <li>
                                <a href="https://soomgohelp.zendesk.com/hc/ko" target="_blank" wrc_done="true">
                    <button class="btn footer-list-help-btn">
                      <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_help_ico.png"> 
                      <span>도움요청하기</span>
                    </button>
                  </a>
                                <span class="wrc0 wrc_icon wrc_injected">

                  </span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </footer>






</body>

</html>