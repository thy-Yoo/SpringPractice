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
          <h2>주문관리</h2>
          <div class="breadcrumb__option">
            <a href="../main/main.do">Home</a>
            <span>주문관리</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-4">
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
<div class="col-lg-10 col-md-7">
<div class="blog__item">
  <div class="row">
     <h4>주문내역</h4>
  </div>
  <div style="height:20px"></div>
  <div class="row">
    <table class="table">
      <tr>
        <th class="text-center">아이디</th>
        <th class="text-center">상품명</th>
        <th class="text-center">수량</th>
        <th class="text-center">금액</th>
        <th class="text-center">배송비</th>
        <th class="text-center">결제확인</th>
      </tr>
      <c:forEach var="vo" items="${list }">
	      <tr>
	        <td class="text-center">${vo.user_id }</td>
	        <td class="text-center">${vo.title }</td>
	        <td class="text-center">${vo.amount }</td>
	        <td class="text-center">${vo.price }</td>
	        <td class="text-center">2,500원</td>
	        <td class="text-center">
	          <c:if test="${vo.ischeck==0 }">
	            <a href="../admin/goodsAdminYes.do?no=${vo.order_no }" class="btn btn-sm btn-primary">승인요청</a>
	           </c:if>
	           <c:if test="${vo.ischeck==1 }">
	             <span style="color:gray">승인완료</span>
	           </c:if>
	        </td>
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