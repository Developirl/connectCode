$(document).ready(function(){
      $("#check_all").click(function(){
         if($("#check_all").is(":checked")) $("input[name=chk]").prop("checked",true);
         else $("input[name=chk]").prop("checked",false);
      });
      
      $("input[name=chk]").click(function(){
         var total = $("input[name=chk]").length;
         var checked=$("input[name=chk]:checked").length;
         
         if(total != checked) $("#check_all").prop("checked",false);
         else $("#check_all").prop("checked",true);
      });
   });

function check(){
   if(check_all.checked != true){
      alert("약관에 모두 동의해주세요.");
      return false;
   }

}