<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>마이페이지</h2>
          <div class="breadcrumb__option">
            <a href="../main/main.do">Home</a>
            <span>마이페이지</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
   <section class="product spad">
        <div class="container">
            <div class="row">
              <table width=100% cellpadding="0" cellspacing="0" align="center">
              <tbody>
              
              <tr>
                <td>
                  <a href="../mypage/mypage.do"><img src="../img/mypage.gif"></a>
                </td>
                <c:forEach var="vo" items="${list }">
                <td width="1000" background="../img/mypage2.gif" style="padding:0 0 0 30px; font-weight:bold;font-size:16px;letter-spacing:-1px;color:#C2EDF3;">
                  <img src="../img/mypage3.gif" align="top">
                  <span style="color:fff;">${vo.name }님</span>
                  오늘도 즐겁고 행복한 하루 보내세요
                  <img src="../img/mypage4.gif" align="top">
                </td>
                </c:forEach>
              </tr>
              
              </tbody>
              </table>
            </div>
            <div style="height:30px"></div>
              <div class="row">
                
                  <table width=100% cellpadding="0" cellspacing="0" border="0" width="960">
                    <tbody>
                      <tr>
                        <td width="187" valign="top">
                          <div>
                            
                          </div>
                          <div>
                            <dl>
                              <dt>
                                나의 오가니 등급
                                <c:forEach var="vo" items="${list }">
                                <strong>
                                  <span style="color:orange">${vo.membership }</span>
                                </strong>
                                </c:forEach>
                              </dt>
                            </dl>
                          </div>
                          <div>
                            <dl>
                              <dt>주문내역</dt>
                              
                              <dd>
                                <ul>
                                  <li><a href="../mypage/cart_list.do">장바구니</a></li>
                                  <li><a href="../mypage/order_list.do">주문내역</a></li>
                                  <li><a href="#">반품/교환 신청 및 조회</a></li>
                                  <li><a href="#">취소 주문 내역</a></li>
                                </ul>
                              </dd>
                              
                              <dt>계좌내역</dt>
                              <dd>
                                <ul>
                                  <li><a href="#">Organi포인트</a></li>
                                  <li><a href="#">쿠폰</a></li>
                                </ul>
                              </dd>
                              <dt>나의 정보</dt>
                              <dd>
                                <ul>
                                  <li><a href="../member/join_update.do">나의 정보</a></li>
                                  <li><a href="#">회원탈퇴</a></li>
                                </ul>
                              </dd>
                              <dt>내 블로그</dt>
                              <dd>
                                <ul>
                                  <li><a href="#">나의 블로그</a></li>
                                </ul>
                              </dd>
                            </dl>
                          </div>
                        </td>
                        <td width="586" valign="top" style="padding:10px auto;" align="center">
                          <div style="margin: 0 0 30px 0;">
                            
                            <div style="position: relative;width: 526px;text-align: left;">
                              <h7>나의 최근 구매 내역</h7>
                            </div>
                            <table class="table">
                              <tr>
                                <th>주문일자</th>
                                <th>주문번호</th>
                                <th>주문자</th>
                              </tr>
                              <c:forEach var="ovo" items="${olist }">
                              <tr>
                                <td>${ovo.orderdate }</td>
                                <td>${ovo.order_no }</td>
                                <td>${ovo.name }</td>
                              </tr>
                              </c:forEach>
                            </table>
                          </div>
                          <div style="margin: 0 0 30px 0;">
                            <img src="../img/review.gif">
                          </div>
                        </td>
                        <td width="187" valign="top">
                          <div style="width:187px;height:270px;overflow:hidden;text-align:center;margin-bottom:10px;padding-top:2px;">
                            <a href="#"><img src="../img/event.jpg"></a>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                 
              </div>
           </div>
     </section>
</body>
</html>