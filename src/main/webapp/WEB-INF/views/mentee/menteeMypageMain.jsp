<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="../public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row">
                
                <div class="col-2">
                	<%@ include file="sidebar.jsp" %>
                </div>
                
                
                <div class="col-8">
                	<div class="container-fluid">
                        <div class="row" style="height: 100px;"></div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-3">
                                <div class="mino-profileImg">
                                    <img src="/public/img/profile_img.png" alt="멘티 기본 프로필 사진">
                                </div>
                                <div class="mino-profileName">${menteeInfo.name}</div>
                            </div>
                            <div class="col-7">
                                <table class="mino-mypageSubTable">
                                    <tr>
                                        <th>즐겨찾기한 멘토</th>
                                        <th>작성한 후기</th>
                                    </tr>
                                    <tr>
                                        <td><br>${likedMentorCnt}&nbsp;</td>
                                        <td><br>${reviewCnt}&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row" style="height: 100px;"></div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <table class="mino-mypageMentoringTable">
                                    <tr>
                                        <th colspan="2">내 멘토링 내역</th>
                                    </tr>
                                    <tr>
                                        <td class="mino-mypageMentoringTable">20분 전화상담</td>
                                        <td>${mentoringCnt[0]==null? 0:mentoringCnt[0]}</td>
                                    </tr>
                                    <tr>
                                        <td>30분 대면상담</td>
                                        <td>${mentoringCnt[1]==null? 0:mentoringCnt[1]}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-2"></div>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-8"> END -->
                
                
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        
<%@ include file="../public/footer.jsp" %>        

        