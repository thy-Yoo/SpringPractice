<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
	margin: 0px auto;
	width: 100%
}
</style>
</head>
<body>
  <div class="container">
      <%-- 이미지 출력 --%>
      <c:forEach var="vo" items="${list }">
	          <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.image }" style="width:200px;height:280px;">
			        <%-- <div class="caption">
			          <p>${vo.title }&nbsp;<span style="color:orange">${vo.writer }</span></p>
			        </div> --%>
			      </a>
			    </div>
			  </div>
      </c:forEach>
    </div>
    <div style="height:30px"></div>
    <div class="row">
      <%-- 페이지 출력 --%>
      <div class="text-center">
        <ul class="pagination">
          <c:forEach var="i" begin="1" end="${totalpage }">
            <c:if test="${curpage==i }">
		      <li class="active"><a href="#">${i }</a></li>
		    </c:if>
		    <c:if test="${curpage!=i }">
		      <li><a href="#">${i }</a></li>
		    </c:if>
		  </c:forEach>
		</ul>
	  </div>
    </div>
  </div>
</body>
</html>