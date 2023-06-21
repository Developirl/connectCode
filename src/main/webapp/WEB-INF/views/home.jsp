<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="public/header.jsp" %>

        <!-- 실제 콘텐츠 들어가는 부분 -->
        <div class="container-fluid main-content">
            <div class="row mino-mainImg"></div>
            <div class="row">
                <div class="col-2"></div>
                
                
                
                <div class="col-8">
                    <div class="container-fluid">
                        <br /><br />
                        <h3 style="font-weight: bold">이달의 인기 멘토</h3>
                        <br />
                        <div class="row">
                        	<c:forEach var="mentor" items="${pMentorList}" begin="0" end="3">
                        		<div class="col-3">
	                                <div class="mino-card" style="width: 18rem">
	                                    <img src="/public/img/navis.jpg" class="card-img-top" alt="..." />
	                                    <div class="card-body mino-card-body">
	                                        <h6 class="mino-bold" style="margin-top: 10px" >naver</h6>
	                                        <h5 class="card-title mino-bold" style="margin-bottom: 15px;">육지수</h5>
	                                        <span class="mino-bold">java</span><br />
	                                        <span class="mino-bold">
	                                     		 서울 강서구&nbsp;&#183;&nbsp;4년차
	                                        </span>
	                                    </div>
	                                </div>
                            	</div>
                        	</c:forEach>
                            
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br /><br />
                        <div class="row">
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card" style="width: 18rem">
                                    <img
                                        src="..."
                                        class="card-img-top"
                                        alt="..."
                                    />
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">
                                            Some quick example text to build on
                                            the card title and make up the bulk
                                            of the card's content.
                                        </p>
                                        <a href="#" class="btn btn-primary"
                                            >Go somewhere</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-2"></div>
            </div>
        </div>

<%@ include file="public/footer.jsp" %>        

        