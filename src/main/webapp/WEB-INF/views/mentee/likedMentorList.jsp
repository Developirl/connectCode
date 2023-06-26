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
                
                	<c:if test="${ empty likedMentorList }">
					<br><br>
						<div align=center style="font-family:'Noto Sans KR', sans-serif!important;font-weight: bold;">즐겨찾기한 멘토가 존재하지 않습니다 .</div>
					</c:if>
                	
                	<div class="js-mentorlistwrapper">
                		<c:forEach var="mentor" items="${likedMentorList}" varStatus="st">
		                    <div class="js-allcontentbox" onclick="location.href='/findMentor/MentorProfileDetailPage?mentor_no=${mentor.mentor_no}'">
		                        <div class="js-profileCard">
		                            <table class="js-profileCardtable">
		                                <tr>
		                                    <td class="js-profileimgtd">
		                                        <c:if test="${ ! empty mentor.file_url}">
													<img alt="profile" src="${mentor.file_url}" class="js-circular-image">
												</c:if>
												<c:if test="${ empty mentor.file_url}">
													<img alt="profile" src="/public/img/profile_img.png" class="js-circular-image">
												</c:if>
		                                    </td>
		                                    <td>
		                                        <span class="js-profileCardFont">
		                                            <span class="js-profileCardName">${mentor.name}</span>
		                                            <span class="js-profileCardIntro js-mino">${mentor.intro}</span>
		                                            <span class="js-profileCardIntro js-company-mini">${mentor.company}</span>
		                                            <span class="js-profileCardIntro js-career-mini">${mentor.years}년차  &nbsp;${mentor.task}</span>
		                                        </span>	
		                                    </td>
		                                </tr>
		                            </table>                                                                                                      
		                        </div>			   
		                    </div>
	                    </c:forEach>
                    </div>
                </div>
                <!-- <div class="col-8"> END -->
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
        
<%@ include file="../public/footer.jsp" %>        

        