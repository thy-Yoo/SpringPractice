<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container1{
	margin:0px auto;
	width:1300px;
}
.table1{
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}
.buttona{
	font-size: 14px;
	color: #ffffff;
	width:90px;
	padding: 13px 30px 12px;
	background: #7fad39;
	border: none;
}
</style>

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
  <div class="container1" style="margin-bottom:300px;">
   
  <p></p>          
  <table class="table table-hover" style="margin:auto;margin-top:50px;">
    <thead>
      <tr>
        <th width=10% style="text-align:center;font-size:30px">번호</th>
        <th width=50% style="text-align:center;font-size:30px">제목</th>
        <th width=15% style="text-align:center;font-size:30px">작성일</th>
        <th width=15% style="text-align:center;font-size:30px">글쓴이</th>
        <th width=10% style="text-align:center;font-size:30px">조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr style="font-size:20px;">
        <td style="text-align:center;">${vo.no }</td>
        <td style=""><a href="../noticeboard/detail.do?no=${vo.no}&page=${curpage}">${vo.subject }</a>
        	<c:if test="${today==vo.dbday }">
        		&nbsp;<sup style="color:red">new</sup>
        	</c:if>
        </td>
        <td style="text-align:center;">${vo.dbday }</td>
        <td style="text-align:center;">${vo.name}(관리자)</td>
        <td style="text-align:center;">${vo.hit }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <div class="col-lg-12 col-md-12">
  
        <div class="text-left inline" style="margin-top:50px;float:left">
	        <form method="post" action="../noticeboard/find.do">
	         <input type="checkbox" value="N" class="input-sm" name="fs">이름
	         <input type="checkbox" value="S" class="input-sm" name="fs">제목
	         <input type="checkbox" value="C" class="input-sm" name="fs">내용
	         <input type=hidden name=page value="${curpage }">
	         <input type=text name=ss size=15 class="input-sm" style="width:200px;height:50px;font-size:15px;">
	         <input type=submit class="buttona" value="검색">
	        </form>
        </div>
 	
  <c:if test="${sessionScope.admin=='y' }">
  
  <table class="table1" style="margin-top:50px;float:right">
     	<tr>	
     		<td>	
     			<a href="insert.do" class="btn btn-sm btn-danger"  style="font-size: 14px;
								color: #ffffff;
								font-weight: 800;
								width:120px;
								padding: 13px 30px 12px;
								background: #7fad39;
								border: none;">공지등록</a>
     		</td>
     	</tr>
     </table>
     </c:if>
     </div>
  	<!-- 
  	<li><a href="#">1</a></li>
  	<li class="active"><a href="#">2</a></li>
  	<li><a href="#">3</a></li>
  	<li><a href="#">4</a></li>
  	<li><a href="#">5</a></li> -->
  	
  	<!-- 
  	<div class="product__pagination blog__pagination">
       <a href="#">1</a>
       <a href="#">2</a>
       <a href="#">3</a>
       <a href="#"><i class="fa fa-long-arrow-right"></i></a>
    </div>
  	 -->
  	 <div class="col-lg-12 col-md-12">
	<div class="product__pagination blog__pagination" align="center" style="margin-top:50px;">
           
             <c:if test="${startPage>1 }">
              <a href="../noticeboard/list.do?page=${startPage-1 }">&lt;</a>
             </c:if>
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${curpage==i }">
                  <a href="../noticeboard/list.do?page=${i }">${i }</a>
                </c:if>
                <c:if test="${curpage!=i }">
                  <a href="../noticeboard/list.do?page=${i }">${i }</a>
                </c:if>
                
               </c:forEach>
             <c:if test="${endPage<totalpage }">
			  <a href="../noticeboard/list.do?page=${endPage+1 }">
			  <i class="fa fa-long-arrow-right"></i></a>
			 </c:if>
		
       </div>
     </div>
</div>

</body>
</html>