<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../book/css/book.css">

 <!-- 별점 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../book/css/jquery.raty.js"></script>

</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>신간 도서</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
                    <h4>분류</h4>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="1" />
								<input type="submit" class="category_menus" value="소설">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="2" />
								<input type="submit" class="category_menus" value="시/에세이">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="3" />
								<input type="submit" class="category_menus" value="인문">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="4" />
								<input type="submit" class="category_menus" value="사회과학">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="5" />
								<input type="submit" class="category_menus" value="예술/대중문화">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="6" />
								<input type="submit" class="category_menus" value="가정과 생활">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="7" />
								<input type="submit" class="category_menus" value="유아">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="8" />
								<input type="submit" class="category_menus" value="국어/외국어/사전">
							</form>
							<form action="newlistSelectCate.do" type="post">
								<input type="hidden" name="select" value="9" />
								<input type="submit" class="category_menus" value="자기계발">
							</form>
						</div><!-- class="sidebar__item" -->
                    
                    
                    <div class="sidebar__item">
                    <!--
                    <h4>가격</h4>
                    	
                     -->
                     </div>
                    <!-- 신간 도서 -->
                    
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                      
                                <h4>추천 도서</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                       <c:forEach var="rvo" items="${rlist }">
	                                        <a href="../book/newdetail.do?bno=${rvo.bno }" class="latest-product__item">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${rvo.image}" alt="">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <h6>${rvo.title}</h6>
	                                                <span>${rvo.price}</span>
	                                            </div>
	                                        </a>
	                                    </c:forEach>
                                        
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                       <c:forEach var="r2vo" items="${r2list }">
	                                        <a href="../book/newdetail.do?bno=${r2vo.bno }" class="latest-product__item">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${r2vo.image}" alt="">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <h6>${r2vo.title}</h6>
	                                                <span>${r2vo.price}</span>
	                                            </div>
	                                        </a>
	                                    </c:forEach>                                       
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                       <c:forEach var="r3vo" items="${r3list }">
	                                        <a href="../book/newdetail.do?bno=${r3vo.bno }" class="latest-product__item">
	                                            <div class="latest-product__item__pic">
	                                                <img src="${r3vo.image}" alt="">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <h6>${r3vo.title}</h6>
	                                                <span>${r3vo.price}</span>
	                                            </div>
	                                        </a>
	                                    </c:forEach>                                       
                                    </div>
                                </div>
                               
                               
                            </div>
                        </div>
                    </div><!-- class="sidebar" -->
                </div><!--  class="col-lg-3 col-md-5"-->
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>판매중인 도서</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                              
                                <c:forEach var="svo" items="${saleslist }">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg" data-setbg="${svo.image}">
                                            <a href="../book/newdetail.do?bno=${svo.bno }"><img src="${svo.image}"></a>
                                        	<div class="product__discount__item__pic set-bg"></div>
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>${svo.writer}</span>
                                            <h5><a href="../book/newdetail.do?bno=${svo.bno }">${svo.title}</a></h5>
                                            <div class="product__item__price">${svo.saleprice}원<span>${svo.price}</span></div>
                                        </div>
                                    </div>                                    
                                </div>
                                </c:forEach>
                                 
                           
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="row">
                    <c:forEach var="vo" items="${list }">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                        
                            <div class="product__item">
                            
                                <div class="product__item__pic set-bg" data-setbg="">
                               
                                <a href="../book/newdetail.do?bno=${vo.bno }&page=${curpage}">
                                <img src="${vo.image}">
                                </a>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="../book/newdetail.do">${vo.title }</a></h6>
                                    <h5>${vo.price }</h5>
                                </div>
                              
                            </div>
                     
                        </div>                    
                        </c:forEach> 
                    </div>
                    <div class="product__pagination">
						<ul>
							<c:if test="${startPage>1 }">
								<li><a href="../book/newlistSelectCate.do?select=${whatCate }&page=${startPage-1 }">
									<i class="fa fa-long-arrow-left"></i>
									</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i==curpage }">
									<li class="current"><a href="../book/newlistSelectCate.do?select=${whatCate }&page=${i }">${i }</a></li>
								</c:if>
								<c:if test="${i!=curpage }">
									<li><a href="../book/newlistSelectCate.do?select=${whatCate }&page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${endPage<totalpage }">
								<li>
									<a  href="../book/newlistSelectCate.do?select=${whatCate }&page=${endPage+1 }">
										<i class="fa fa-long-arrow-right"></i>
									</a>
								</li>
							</c:if>
						</ul>

					</div>
                </div>
            </div>
        </div>
</section>


</body>
</html>