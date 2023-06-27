<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../public/sidebar_jh.jsp" %>


<script type="text/javascript">

	function mentorInqueryUpdate(){	

		if($("#content").val()==""){
			alert("내용을 입력 하세요.");
			$("#content").focus();
			return false;
		}
		
		var result = confirm("정말 수정 하시겠습니까?");
		if(result){
			return true;
		}else{
			return false;
		}
	}
   
</script>
<div class="w3-container">
	<div class="fixedTop_div"></div>
	<font class="large_jh"> 1:1 문의 </font>
	<hr class="title_hr">
	<!-- CONTENT -->
	
	<div align="center" class="cont_mar" style="margin-top: 60px;">
		<img src="/mentor/img/question2.png" style="width: 150px;">		
	</div>
	
	<div class="cont_mar" style="margin-top: 0px;">
		<form method="POST" action="mentorInqueryUpdate" onSubmit="return mentorInqueryUpdate()">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  			<input type="hidden" name="post_no" value="${mymentoring.post_no}" />
 			<input type="hidden" name="page" value="${page}" />
  
			<!-- TITLE -->
			<div class="medium_jh" align="center">
				<div class="infoTitle" style="margin-top: 0px;">
					<div class="mentor_info" id="title" style="width: 100%; text-align: center; margin-bottom: 20px;">1:1 문의합니다.</div>
					<textarea class="mentor_info" name="content" id="content" style="width: 100%; height: 350px; resize: none;">${mymentoring.content}</textarea>
		   		</div>
		   		
			   	<input type="submit" value="수정" class="btn_jh">
			    <button type="button" onclick="location.href='mentorInqueryDetail?page=${page}&post_no=${mymentoring.post_no}&ref_post_no=${mymentoring.ref_post_no}&mentor_no=${msel.mentor_no}'" class="btn_jh" style="width: 150px;">이전페이지</button>
			</div>
	
		</form>
	</div>
</div>

<%@ include file="../public/sidebar_footer.jsp" %>
