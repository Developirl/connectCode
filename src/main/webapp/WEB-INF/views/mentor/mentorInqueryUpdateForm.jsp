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
		
 <div id="wrap">
  <h2 class="title">게시판 수정</h2>
  <form method="POST" action="mentorInqueryUpdate" onSubmit="return mentorInqueryUpdate()">
  <input type="hidden" name="post_no" value="${mymentoring.post_no}" />
  <input type="hidden" name="page" value="${page}" />
  
   <table id="tableInquery">
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="content" id="content" rows="8" cols="50"
      			class="input_box">${mymentoring.content}</textarea>
     </td>
    </tr> 
    
   </table>
   
   <div id="inqueryMenu">
   
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   <%--  <a href="javascript:onClick=mentorInqueryUpdate('${mymentoring.post_no}', '${page}', '${mymentoring.ref_post_no}')" class="btn btn-info">수정</a> --%>
    <input type="submit" value="수정" class="btn btn-info">
    <a href="mentorInqueryDetail?page=${page}&post_no=${mymentoring.post_no}&ref_post_no=${mymentoring.ref_post_no}&mentor_no=${msel.mentor_no}" class="btn btn-info">이전페이지</a>

<!--     <input type="reset" value="취소" class="input_button"/>
    <input type="submit" value="수정" class="input_button" />
 -->   
 </div>
  </form>
 </div>

<%@ include file="../public/sidebar_footer.jsp" %>
