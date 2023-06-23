<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row">
                
                <div class="col-2">
                	<%@ include file="sidebar.jsp" %>
                </div>
                <div class="col-8">
                	<div class="js-mentorlistwrapper">
	                    <div class="js-allcontentbox" >
	                        <div class="js-profileCard">
	                            <table class="js-profileCardtable">
	                                <tr>
	                                    <td class="js-profileimgtd">
	                                        <img alt="profile" src="나비스.jpg" class="js-circular-image">
	                                    </td>
	                                    <td>
	                                        <span class="js-profileCardFont">
	                                            <span class="js-profileCardName">육지수</span>
	                                            <span class="js-profileCardIntro">알았으면 끄덕여 개새끼야</span>
	                                            <span class="js-profileCardIntro js-company-mini">네이버</span>
	                                            <span class="js-profileCardIntro js-career-mini">3년차  &nbsp;백엔드</span>
	                                        </span>	
	                                    </td>
	                                </tr>
	                            </table>                                                                                                      
	                        </div>			   
	                    </div>
                    </div>
                </div>
                <!-- <div class="col-8"> END -->
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        
<%@ include file="public/footer.jsp" %>        

        