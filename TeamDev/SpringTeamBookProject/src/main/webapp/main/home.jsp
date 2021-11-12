<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>분야보기</span>
                        </div>
                        <ul>
                            <li><a href="#">국내도서</a></li>
                            <li><a href="#">외국도서</a></li>
                            <li><a href="#">eBook</a></li>
                            <li><a href="#">소설/시</a></li>
                            <li><a href="#">에세이</a></li>
                            <li><a href="#">인문</a></li>
                            <li><a href="#">경제/경영</a></li>
                            <li><a href="#">어린이</a></li>
                            <li><a href="#">외국어</a></li>
                            <li><a href="#">참고서</a></li>
                            <li><a href="#">요리</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    
                    <div class="hero__item set-bg" data-setbg="https://media.istockphoto.com/photos/old-books-on-bookshelves-with-orange-background-picture-id1154728362?k=20&m=1154728362&s=612x612&w=0&h=ksfSax646nSnRMwyaJBxwHFvD1XSJTCXMtiIskOmlRE=">
                        <div class="hero__text">
                            <span style="font-size:30px;">독서의 계절</span>
                            <h2>책과 떠나는<br/>가을 여행</h2>
                            <p style="font-size:20px">책과 떠나는 가을 여행</p>
                            <a href="#" class="primary-btn">바로가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                <c:forEach var="tvo" items="${tlist }">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${tvo.image }">
                            <h5><a href="#">${tvo.title }</a></h5>
                        </div>
                    </div>
                </c:forEach>    
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>신간도서</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".improvment">자기계발</li>
                            <li data-filter=".literature">문학</li>
                            <li data-filter=".science">인문/사회/과학</li>
                            <li data-filter=".economics">경제경영</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            	<c:forEach var="mvo" items="${mlist }">
            	<c:choose>
            	<c:when test="${mvo.genre eq '가정과 생활' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix science">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '역사와 문화' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix improvment science">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '인문' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix science">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '경제경영' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix improvment economics">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '아동' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix improvment science">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '자기계발' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix improvment">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '전공도서/대학교재' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix improvment">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
            	<c:when test="${mvo.genre eq '소설' }">
                <div class="col-lg-3 col-md-4 col-sm-6 mix literature">           
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${mvo.image }" style="width:270px;height:400px;cursor:pointer">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${mvo.title }</a></h6>
                            <h5>${mvo.price }</h5>
                        </div>
                    </div>
                </div>
                </c:when>
                </c:choose> 
                </c:forEach>    
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <!-- 
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../ogani-master/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../ogani-master/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
     -->
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>화제의 신간</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            	<c:forEach var="bnvo" items="${bnlist }" begin="0" end="2">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${bnvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${bnvo.title }</h6>
                                        <span>${bnvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                            	<c:forEach var="bnvo" items="${bnlist }" begin="3" end="5">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${bnvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${bnvo.title }</h6>
                                        <span>${bnvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>베스트셀러</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="bbvo" items="${bblist }" begin="0" end="2">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${bbvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${bbvo.title }</h6>
                                        <span>${bbvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="bbvo" items="${bblist }" begin="3" end="5">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${bbvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${bbvo.title }</h6>
                                        <span>${bbvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>추천도서</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="brvo" items="${brlist }" begin="0" end="2">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${brvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${brvo.title }</h6>
                                        <span>${brvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <c:forEach var="brvo" items="${brlist }" begin="3" end="5">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="${brvo.image }" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${brvo.title }</h6>
                                        <span>${brvo.price }</span>
                                    </div>
                                </a>
                                </c:forEach>         
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>블로그</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="https://bimage.interpark.com/partner/goods_image/9/9/3/5/354069935g.jpg" style="width:150px;height:450px;" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i>&nbsp;2021-10-26</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">젊은 친구들에게 꼭 선물하고 싶은 책</a></h5>
                            <p>트렌드를 알아야 승리한다, 트렌드 변화를 쉽게 이해 할 수 있도록 도움을 주는 책</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="https://bimage.interpark.com/partner/goods_image/9/8/0/0/4219800g.jpg" style="width:150px;height:450px;" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i>&nbsp;2021-10-27</li>
                                <li><i class="fa fa-comment-o"></i> 77</li>
                            </ul>
                            <h5><a href="#">베스트셀러는 다 이유가 있다</a></h5>
                            <p>인류 역사와 문명 분석에 흥미로운 관점을 제시해주는 책이다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="https://bimage.interpark.com/partner/goods_image/4/2/9/4/348974294g.jpg" style="width:150px;height:450px;" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i>&nbsp; 2021-10-27</li>
                                <li><i class="fa fa-comment-o"></i> 45</li>
                            </ul>
                            <h5><a href="#">디스크로 고통받는 환자들에게 추천!!</a></h5>
                            <p>이 책을 읽고 허리디스크가 나았습니다..</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
</body>
</html>