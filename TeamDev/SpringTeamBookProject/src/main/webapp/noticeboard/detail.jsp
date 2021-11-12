<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container1{
	margin:0px auto;
	width:1000px;
	margin-bottom:100px;
}
.buttona{
	font-size: 14px;
	color: #ffffff;
	width:90px;
	padding: 13px 30px 12px;
	background: #7fad39;
	border: none;
}
#del{
	font-size: 14px;
	color: #ffffff;
	width:90px;
	padding: 11px 27px 10px;
	background: #7fad39;
	border: none;"
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#del').click(function(){
		let no=$('#no').val();
		let page=$('#page').val();
		$.ajax({
			type:'get',
			url:'../noticeboard/delete_ok.do',
			data:{"no":no},
			success:function(result1)
			{
				alert("삭제 완료");
				location.href="../noticeboard/list.do?page="+page;
			}
		})
		
	})
})


</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="container1">
   <div class="row">
     <table class="table" style="margin:auto;margin-top:50px;font-size:20px;">
      <tr>
        <th width=20% class="success text-center" style="font-size:20px;">번호</th>
        <td width=30% class="text-center">${vo.no }</td> 
        <th width=20% class="success text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td> 
      </tr>
      <tr>
        <th width=20% class="success text-center">이름</th>
        <td width=30% class="text-center">${vo.name }</td> 
        <th width=20% class="success text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td> 
      </tr>
      <tr>
        <th width=20% class="success text-center">제목</th>
        <td colspan="3" class="text-left">${vo.subject }</td> 
      </tr>
      <c:if test="${vo.imagecount>0 }">
	      <tr>
	        <th width=20% class="success text-center">첨부이미지</th>
	        <td colspan="3" class="text-left">
	          <ul style="list-style:none">

	     		 <c:forEach var="fn" items="${fList }" varStatus="s">
	        
	            <li><a href="download.do?fn=${fn }">${fn }</a>&nbsp;(${sList[s.index]}Bytes)</li>
	           </c:forEach>
	          </ul>
	        </td>
	      </tr>
      </c:if>
      <tr>
        <td colspan="4" valign="top" height="200">
         <pre style="white-space: pre-wrap;border:none;background-color: white;font-size:20px;">${vo.content }</pre>
        </td>
      </tr>
      <%-- <tr>
      	<td>
      		<c:forEach var="fn" items="${fList}" >
      		<img src="../resources/noticeboardimage/${fn}" style="width:100px;height:100px;">
      		</c:forEach>
      	</td>
      </tr> --%>
      <tr>
        <td colspan="4" class="text-right">
        <c:if test="${sessionScope.admin=='y' }">
         <a href="../noticeboard/update.do?no=${vo.no }&page=${curpage}" class="buttona">수정</a>
         <input type="button" id="del" value="삭제">
         <input type=hidden name=no id=no value="${vo.no }">
         <input type=hidden name=name id=name value="${vo.name }">
         <input type=hidden name=page id=page value="${curpage }">
        </c:if>
          <!-- <input type=button class="btn btn-xs btn-primary" value="삭제" id="del"> -->
          <a href="../noticeboard/list.do?page=${curpage }" class="buttona">목록</a>
        </td>
      </tr>
     </table>
   </div>
   <div class="row">
   
   </div>
  </div>
</body>
</html>