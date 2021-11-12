<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .blog__item__pic img{
 	width:230px;
 	height:400px;
 }
</style>
</head>
<body>

    <!-- Hero Section End -->
	<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>블로그</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>블로그</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="../blog/list.do">전체</a></li>
                                <li><a href="../blog/list.do?category=리뷰">도서리뷰</a></li>
                                <li><a href="../blog/list.do?category=일상">일상</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>최신 글</h4>
                            <div class="blog__sidebar__recent">
                            <c:forEach var="nvo" items="${list }" begin="0" end="2">
                                <a href="../blog/detail.do?no=${nvo.no}&page=${curpage}" class="blog__sidebar__recent__item">
                                    
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>"${nvo.subject }"</h6>
                                        <span>"${nvo.dbday }"</span>
                                    </div>
                                </a>
                            </c:forEach>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>키워드</h4>
                            <div class="blog__sidebar__item__tags">
                            <c:forEach var="tag" items="${tagList }">
                                <a href="../blog/list.do?tag=${tag }">${tag }</a>
                           </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                    	<c:forEach var="vo" items="${list }">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                <c:if test="${vo.image!=null }">
                                    <img src="${vo.image }">
                                 </c:if>
                                 <c:if test="${vo.image==null }">
                                 	<img src="../img/blog/blog-1.jpg">
                                 </c:if>
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> ${vo.dbday }</li>
                                        <li><i class="fa fa-comment-o"></i> ${vo.replycount }</li>
                                    </ul>
                                    <h3>${vo.subject }</h3>
                                    <p style="margin-top:10px;">${vo.content } </p>
                                    <a href="../blog/detail.do?no=${vo.no}&page=${curpage}" class="blog__btn">더보기 <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <div class="col-lg-12">
                        <c:if test="${sessionScope.id!=null }">
  						<table class="table1">
     						<tr>		
     						<td>
     						<a href="insert.do" class="btn btn-sm btn-danger" style="font-size: 14px;
								color: #ffffff;font-weight: 800;width:120px;padding: 13px 30px 12px;background: #7fad39;
								border: none;">글쓰기</a>
     						</td>
     						</tr>
     						</table>
     						</c:if>
     					</div>
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination" align="center" style="margin-top:50px;">
           
             <c:if test="${startPage>1 }">
              <a href="../blog/list.do?page=${startPage-1 }&category=${category}&tag=${tag}">&lt;</a>
             </c:if>
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${curpage==i }">
                  <a href="../blog/list.do?page=${i }&category=${category}&tag=${tag}">${i }</a>
                </c:if>
                <c:if test="${curpage!=i }">
                  <a href="../blog/list.do?page=${i }&category=${category}&tag=${tag}">${i }</a>
                </c:if>
                
               </c:forEach>
             <c:if test="${endPage<totalpage }">
			  <a href="../blog/list.do?page=${endPage+1 }&category=${category}&tag=${tag}">
			  <i class="fa fa-long-arrow-right"></i></a>
			 </c:if>
		
       </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>