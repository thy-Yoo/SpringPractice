<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Admin Page</h2>
          <div class="breadcrumb__option">
            <a href="../main/main.do">Home</a>
            <span>회원관리</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-3">
                    <div class="blog__sidebar">
                        <div class="sidebar__item">
                            <h4>관리자 메뉴</h4>
                            <ul>
                                <li><a href="../admin/orderList.do">주문 현황</a></li>
                                <li><a href="../admin/memberList.do">회원 관리</a></li>
                                <li><a href="#">상품 등록</a></li>
								<li><a href="#">상품 조회</a></li>
					            <li><a href="#">상품 정보 수정</a></li>
								<li><a href="#">상품 삭제</a></li>
                            </ul>
                        </div>
                     </div>
                 </div>
<div class="col-lg-10 col-md-5">
<div class="blog__item">
  <div class="row">
     <h4>회원리스트</h4>
  </div>
  <div style="height:20px"></div>
  <div class="row">
    <table class="table">
      <tr>
        <th class="text-center">회원ID</th>
        <th class="text-center">이름</th>
        <th class="text-center">Email</th>
        <th class="text-center">전화번호</th>
        <th class="text-center">주소</th>
        <th class="text-center">생일</th>
        <th class="text-center">선호 장르</th>
      </tr>
      <c:forEach var="vo" items="${list }">
	      <tr>
	        <td class="text-center">${vo.user_id }</td>
	        <td class="text-center">${vo.name}</td>
	        <td class="text-center">${vo.email}</td>
	        <td class="text-center">${vo.tel}</td>
	        <td class="text-center">${vo.addr1}</td>
	        <td class="text-center">${vo.birthday}</td>
	        <td class="text-center">${vo.genre}</td>
	      </tr>
      </c:forEach>
    </table>
  </div>
  </div>
  </div>
  </div>
  </div>
</section>
</body>
</html>