<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 검색창 css 수정 */
.form{
	float:left;
}

.site-btn{
	padding:0px;
}

.nice-select{
	height:46px;
	border-radius:0px;
	line-height:45px;
	width:20%;
	min-width:100px;
}

.nice-select .list{
	border-radius:0px;
	width:100%;
}

</style>
</head>
<body>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li>1권만 주문해도 무료배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6" >
                        <div class="header__top__right" style="min-width:500px;">
                          <div class="header__top__right__auth">
                            	<a href="../member/join_update.do"><i class="fa fa-user"></i>회원정보수정</a>		
                            <c:if test="${sessionScope.id!=null }">
                            	<a href="../member/logout.do" id="login"><i class="fa fa-user"></i>로그아웃</a>		
                            </c:if>
                            <c:if test="${sessionScope.id==null }">
                            	<a href="../member/login.do" id="login"><i class="fa fa-user"></i>로그인</a>	
                            	<a href="../member/join.do"><i class=""></i>회원가입</a>	
                            </c:if>
                            <c:if test="${sessionScope.id=='admin'}">
								<a href="../admin/main.do"><i class=""></i>관리자페이지</a>
							</c:if>
                            <c:if test="${sessionScope.id!=null && sessionScope.id!='admin' }">
                            	<a href="../mypage/mypage.do"><i class=""></i>마이페이지</a>
                            </c:if>
                            <a href="#"><i class=""></i>고객센터</a>    
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="../main/main.do"><img src="../ogani-master/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu" style="min-width:600px;">
                        <ul>
                        	<li><a href="#">빠른분야찾기</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="#">국내도서</a></li>
                                    <li><a href="#">외국도서</a></li>
                                    <li><a href="#">eBook</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="../main/main.do">홈</a></li>
                            <li><a href="../book/list.do">베스트셀러</a></li>
                            <li><a href="../book/newlistSelectCate.do">신간도서</a></li>
                            <li><a href="../blog/list.do">블로그</a></li>
                            <li><a href="#">게시판</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../freeboard/list.do">자유게시판</a></li>
                                    <li><a href="../noticeboard/list.do">공지사항</a></li>
                                    <li><a href="../shop/shop_main.do">서점 찾기</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="../mypage/cart_list.do"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
        
        <div class="container" style="width:100%; padding-right:15px; padding-left:15px; margin-right:auto; margin-left:auto;">
		  <div class="row">
			<div class="col-lg-3" style="height:10px; float:left;">
			
			</div>
            <div class="col-lg-9" style="margin-bottom:30px; float:left; min-width:600px;">

		              <form method="get" action="../search/search.do" style="width:75%; margin-top:20px; float:left;">
		                <select name=fs class="input-sm" style="height:45px;">
		                   <option value="All">통합검색</option>
		                   <option value="T">제목</option>
		                   <option value="W">작가</option>
		                   <option value="TR">번역가</option>
		                  <option value="G">장르</option>
		                </select>
		                <input type=text name=ss size=25 class="input-sm" value="${ss }" style="height:46px !important; width:58%; border:solid 1px #e8e8e8; float:left; padding-left:15px; font-size:14px;">
		                <button type="submit" class="site-btn" style="height:46px; width:15%; float:left;">검색</button>
		              </form>

                        <div class="hero__search__phone" style="width:23%; min-width:200px; float:left; margin-top:20px;">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>02-XXXX-XXXX</h5>
                                <span>고객센터: 9:00-18:00</span>
                            </div>
                        </div>
              
            </div>
         </div>
            
        </div>
        
    </header>
</body>
</html>