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
					<form action="modifyProfile" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="mentee_no" value="${mentee.mentee_no}">
                        <table class="mino-profileModifyTable">
                            <caption>회원정보 수정</caption>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">이름</label>
                                        <input type="text" name="name" class="form-control" id="exampleFormControlInput1" value="${mentee.name}" disabled>
                                    </div>
                                </td>
                            </tr>
                            <%-- <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">연락처</label>
                                        <input type="text" name="phone" class="form-control" id="exampleFormControlInput1" value="${mentee}" disabled>
                                    </div>
                                </td>
                            </tr> --%>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">이메일</label>
                                        <input type="text" name="email" class="form-control" id="email" value="${mentee.email}" disabled>
                                    </div>
                                </td>
                            </tr>
                            <!-- <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">상담 가능 지역</label>
                                        <input type="text" name="mentoring_location" class="form-control" id="exampleFormControlInput1" value="서울시 전체" disabled>
                                    </div>
                                </td>
                            </tr> -->
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">희망 직무</label>
                                        <input type="text" name="desired_job" class="form-control" id="desired_job" value="${mentee.desired_job}" disabled>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">기술 스택</label>
                                        <input type="text" name="technology_stack" class="form-control" id="technology_stack" value="${mentee.technology_stack}" disabled>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">깃주소</label>
                                        <input type="text" name="git" class="form-control" id="git" value="${mentee.git}" disabled>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div>
                                        <label for="exampleFormControlInput1" class="form-label">블로그</label>
                                        <input type="text" name="blog" class="form-control" id="blog" value="${mentee.blog}" disabled>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="mino-buttonBox">
                            <div class="mino-realButtonBox" hidden>
                                <button type="submit" class="btn btn-outline-dark" id="modifyBtn">저장</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-dark" onclick="location.href='getMenteeProfile'">취소</button>
                            </div>
                            <button type="button" class="btn btn-outline-dark" id="modifyFormBtn">수정</button>
                        </div>
                    </form>                	
                </div>
                <!-- <div class="col-8"> END -->
                <!-- 여백 -->
                <div class="col-2"></div>
            </div>
        </div>
        
        <br><br><br><br><br><br><br>
    <script>
        $("#modifyFormBtn").on("click", function(){
            $("#email").removeAttr("disabled");
            $("#desired_job").removeAttr("disabled");
            $("#technology_stack").removeAttr("disabled");
            $("#git").removeAttr("disabled");
            $("#blog").removeAttr("disabled");
            $(".mino-realButtonBox").removeAttr("hidden");
            $(this).hide();
        });
    </script>
<%@ include file="../public/footer.jsp" %>        

        