<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <title>request</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mypage.css">
        <style>
            div {
/*                 border: 1px dotted #000; */
            }
            #jumbo {
                    margin-bottom: 0px;
                }
                
                #icon {
                    width: 200px;
                }
                
                #pop_list {
                    padding-top: 9px;
                }
                
                #home_icon {
                    width: 100px;
                }
                
                #gosu {
                    margin: auto;
                }
                
                #people {
                    padding: 15px;
                }
        </style>
        <!-- bootstrap js -->
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/res/js/mypage.js"></script>
    </head>

    <body>
        <!--     <header class="container-fluid"> -->
        <!--         <div class="row text-center"> -->
        <!--             <h2>Mypage</h2> -->
        <!--         </div> -->
        <!--     </header> -->
        <header id="top" style="background-image: url(${pageContext.request.contextPath}/res/img/header_bg.jpg); background-size: 100% 100%; ">
            <div class="container">
                <nav class="collapse navbar-collapse bs-navbar-collapse" style="padding-bottom: 200px">
                    <ul class="nav navbar-nav">
                        <img id="home_icon" src="${pageContext.request.contextPath}/res/img/Icon.png" alt="icon">
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <button type="button" class="btn btn-info">Info</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-primary">로그인</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-success">회원가입</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-primary" onclick="location.href='mypage'">마이페이지</button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-success">로그아웃</button>
                        </li>
                    </ul>
                </nav>
                <nav style="padding-bottom: 100px ;padding-left: 340px; padding-right: 340px;">
                    <!--  <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark" id="jumbo"> -->
                    <!-- <img id="icon" src="./zzalicon.png" alt="icon"> -->
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
                        <span class="input-group-btn">
                                <button class="btn btn-secondary" type="button">찾기</button>
                            </span>
                    </div>
                    <!-- </div> -->
                </nav>
            </div>
        </header>
        <div class="container-fluid">
            <div class="row text-center menu">
                <div class="col-sm-2"><a href="request">요청</a></div>
                <div class="col-sm-2"><a href="estimate">견적서</a></div>
                <div class="col-sm-2"><a href="profile">프로필</a></div>
                <div class="col-sm-2"><a href="notification">알림</a></div>
                <div class="col-sm-2"><a href="information">개인정보</a></div>
                <div class="col-sm-2"><a href="approval">고수인증</a></div>
            </div>
            <div class="row text-center mypage-bg">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <div id="est-write">
                    <h3>견적서작성</h3>
                    <div class="write-wrap">
                        <div class="col-lg-6">
                            <h4>요청자 프로필/요청서</h4>
                            <div class="left-box">
                                <div class="map">
                                   	 지도
                                    <div class="profile"></div>
                                </div>
                                <div class="content">내용</div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h4>견적서보내기</h4>
                            <div class="right-box">
                                <div class="col-sm-12">
                                    <input type="number" value="0">
                                    <span>원</span>
                                </div>
                                <div>
                                    <select name="" id="">
                                        <option value="">1시간당</option>
                                        <option value="">총비용</option>
                                    </select>
                                </div>
                                <div>
                                    <textarea name="" id="" placeholder="메세지를 입력하세요."></textarea>
                                </div>
                                <input type="submit" value="견적서 보내기">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-1"></div>
        </div>
        </div>
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
                                        <span class="wrc0 wrc_icon wrc_injected"></span>
                                    </div>
                                    <div class="app-download-btn">
                                        <a href="https://soomgo.app.link/SZeaREjJcE" wrc_done="true">
                                            <img src="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/home/footer_appstore_btn.png" class="footer-app-btn">
                                        </a>
                                        <span class="wrc0 wrc_icon wrc_injected"></span>
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
                                <h4>모서리<div class="switch"></div></h4>
                                <ul class="menu hide">
                                    <li>
                                        <a href="/about">프로젝트 소개</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="col-sm-4 col-md-4 footer-list">
                                <h4>요청자<div class="switch"></div></h4>
                                <ul class="menu hide">
                                    <li><a href="/how-it-works">1.</a></li>
                                    <li><a href="/safety">2.</a></li>
                                    <li><a href="/prices">3.</a></li>
                                    <li><a href="/search/pro">4.</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-4 col-md-4 footer-list">
                                <h4>고수<div class="switch"></div></h4>
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
                                    <span class="wrc0 wrc_icon wrc_injected"></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

    </html>