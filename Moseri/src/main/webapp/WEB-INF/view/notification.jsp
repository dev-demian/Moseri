<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/template/pheader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/template/mypageHeader.jsp"></jsp:include>        
        <div class="container-fluid">
            
            <div class="row text-center mypage-bg">
            <div class="inner">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div id="noti">
                        <h3>알림</h3>
                        <div class="noti-wrap">
                            <div>
                                <span>알림받기</span>
                                <div>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>
                            <div>
                                <span>문자,카카오톡알림</span>
                                <div>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>
                            <div>
                                <span>거리설정</span>
                                <div>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>
                            <div>
                                <span>방해금지시간</span>
                                <div>
                                    <label class="switch">
                                        <input type="checkbox" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
        </div>
<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>