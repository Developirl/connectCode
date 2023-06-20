<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>

	<div class="w3-container">
		<div class="fixedTop_div"></div>
		<font class="large_jh"> 1:1 문의 </font>
		<hr class="title_hr">
		<!-- CONTENT -->
		
		<!-- 검색 -->
		<div align="right" class="cont_mar">
		
		<!-- TITLE -->
		<div class="form_write">
			<div class="medium_jh flex-txtAlign" style="position: relative;">
				 &nbsp;&nbsp;
				<form action="/submit" method="POST">
					  <div>
					    <label for="title">제목:</label>
					    <input type="text" id="title" name="title" required>
					  </div>
					  <div>
					    <label for="content">내용:</label>
					    <textarea id="content" name="content" rows="4" cols="50" required></textarea>
					  </div>
					  <div>
					    <input type="file" id="attachment" name="attachment">
					  </div>
					  <div>
					    <input type="submit" value="작성">
					  </div>
				</form>
			</div>
		</div>

		</div>
	<!-- CONTENT end -->
	</div>

<%@ include file="../public/sidebar_footer.jsp" %>
