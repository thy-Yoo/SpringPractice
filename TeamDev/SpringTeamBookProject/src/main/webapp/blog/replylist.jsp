<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;// 전역변수
$(function(){
	$('.updates').click(function(){
		$('.up').hide();// 출력된 수정창을 닫는다
		let no=$(this).attr("data-value"); // 출력할 위치를 확인 (어떤것이 수정할 지 확인 )
		if(u==0) // 열고
		{
			u=1; // 닫기
			$('#u'+no).show();
			$(this).text("취소");
		}
		else // 닫기
		{
			u=0; // 열기 
			$('#u'+no).hide();
			$(this).text("수정");
		}
	})
})
</script>
</head>
<body>
<div id="comments">
        <h2>댓글</h2>
        <ul style="list-style:none">
        <c:forEach var="rvo" items="${list }">
        <hr>
          <li>
            <article>
              <header>
               <div style="font-size:20px;">
                작성자 : ${rvo.name }
               </div>
                <div>
                	작성일 : ${rvo.dbday }
                </div>
                 <div style="float:right;">
                <c:if test="${sessionScope.id==rvo.user_id }">
               
                 <span class="btn btn-xs btn-danger updates" style="color:black" data-value="${rvo.no }">수정</span>
                 </c:if>
                 <c:if test="${sessionScope.id==rvo.user_id || sessionScope.admin=='y' }">
                 <a href="../blog/replydelete.do?no=${rvo.no }&bno=${vo.no}&page=${curpage}" class="btn btn-xs btn-success" style="color:black">삭제</a>
               	</c:if>
                
                 </div>
                <table class="table up" style="display:none" id="u${rvo.no }">
			       <tr>
			        <td class="inline">
			         <form method="post" action="replyupdate.do">
			         <input type=hidden name=bno value="${vo.no }">
			         <input type=hidden name=no value="${rvo.no }">
			         
			         <input type=hidden name=page value="${curpage}">
			         <textarea rows="5" cols="50" name="msg" style="float: left;">${rvo.msg }</textarea>
			           <input type=submit value="댓글수정" style="height: 105px;float: left" class="btn btn-danger">
			        </form>
			        </td>
			       </tr>
			   </table>
              </header>
              <div class="comcont">
                <p style="margin-top:30px;font-size:30px;">${rvo.msg }</p>
              </div>
            </article>
          </li>
          
         </c:forEach> 
        </ul>
        <%-- session에 등록 (회원가입) --%>
      </div>
      <c:if test="${sessionScope.id!=null }"><!-- 로그인된 경우만 사용이 가능  -->
	      <table class="table">
		       <tr>
		        <td class="inline">
		          <form method="post" action="replyinsert.do">
		           <input type=hidden name=bno value="${vo.no }">
			       <input type=hidden name=page value="${curpage}">
		           <textarea rows="5" cols="50" name="msg" style="float: left"></textarea>
		           <input type=submit value="댓글쓰기" style="height: 105px;float: left" class="btn btn-danger">
		          </form>
		        </td>
		       </tr>
		  </table>
	  </c:if>
</body>
</html>