<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	$(document).ready(function(){



                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 

	        $('html').animate({scrollTop : 1100}, 400);

		});

	var view = {
			init : function() {
				$("#rgn1Nm").on("change", function() {
					//$("#rgn2Nm").val("");
					// $("#dong").val("");
					$("#page").val("1");
					view.submit();
				});
			}
	}

</script>
<style type="text/css">
.board_list_wrapper table th {
    color: #009223;
    font-size: 16px;
    font-weight: 300;
    height: 69px;
    border-bottom: 1px solid #009223;
    text-align: center;
}
.board_list_wrapper table td {
    height: 69px;
    border-bottom: 1px solid #dddddd;
    text-align: center;
    color: #292929;
    font-size: 16px;
}
.board_list_wrapper .board_total {
    color: #999999;
    letter-spacing: -0.045em;
    float: left;
    margin-top: 17px;
}
#content h3.h_title {
    font-size: 28px;
    color: #292929;
    font-weight: bold;
    letter-spacing: -0.05em;
    padding-bottom: 38px;
}


</style>
</head>
<body>
<div style="height:30px"></div>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" style="background-image: url(&quot;../img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>전체 매장</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>전체 매장목록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<div class="content" style="width:1300px; margin:0 auto">
						<h3 class="h_title">전체매장</h3>
						<!-- board list s -->
						<div class="board_list_wrapper">
							<div class="content">
								<p class="board_total">총<strong id="pageCount">${total }</strong>개 매장이 있습니다.</p>

							<!-- 	<form id="searchFrm" method="GET" name="searchFrm" action="../shop/main.do">
									<input id="page" name="page" type="hidden" value="1">
									<div class="cont_right">
										select
										<div class="form_select" style="width:150px;">
											<select id="rgn1Nm" name="rgn1Nm">
												<option value="">시/도</option>
												<option value="서울">서울특별시</option>
												<option value="경기">경기도</option>
												<option value="인천광역시">인천광역시</option>
												<option value="대전광역시">대전광역시</option>
												<option value="세종특별자치시">세종특별자치시</option>
												<option value="충청남도">충청남도</option>
												<option value="경상남도">경상남도</option>
												<option value="울산광역시">울산광역시</option>
												<option value="부산광역시">부산광역시</option>
												<option value="대구광역시">대구광역시</option>
												<option value="제주특별자치도">제주특별자치도</option>
												<option value="전라북도">전라북도</option>
												<option value="충청북도">충청북도</option>
												<option value="광주광역시">광주광역시</option>
												<option value="전라남도">전라남도</option>
												<option value="경상북도">경상북도</option>
											</select>
										</div>
										// select
										select
										<div class="form_select" style="width:10px;">
											<select id="rgn2Nm" name="rgn2Nm">
												<option value="">시/군/구</option>
												
											</select>
										</div>
										// select
										select
										<div class="form_select" style="width:196px;">
											<select  name="dong" id="dong">
												<option value="">동</option>
												<option th:each="rs, status : ${location3}" th:value="${rs.dong}" th:text="${rs.dong}" th:selected="${rs.dong eq search.dong}"></option>
											</select>
										</div>
										// select
									</div>
								</form> -->

								<table>
									<colgroup>
										<col width="100px">
										<col width="185px">
										<col width="*">
										<col width="250px"><!-- 20180208 -->
										<col width="170px">
										<col width="55px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO</th>
											<th scope="col">매장명</th>
											<th scope="col">매장주소</th>
											<th scope="col">영업시간</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
									 <c:forEach items="${list }" var="vo" varStatus="s">
										
										<tr>
											<td><div class="num">${s.index+1 }</div></td>
											<td>${vo.name}</td>
											<td>
											
											<div class="title">${vo.address}</div>
											</td>
											<td>
												<div class="service">
													<c:choose>
														<c:when test="${vo.open!=null }">${vo.open } ~ ${vo.close }</c:when>
														<c:otherwise>-</c:otherwise>
													</c:choose>
												</div>
											</td>
											
												
													<td><div class="coming">${vo.tel}</div></td>
												
												
											


										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<!-- board 페이지 -->
						<div class="container">
							 <div class="row" style="margin:70px 0px 70px 0px;">
							 	<div style="margin:0 auto">
									<div class="product__pagination blog__pagination">
									 <c:if test="${startPage>1 }">
										 <a href="../shop/shop_main.do?page=${startPage-1 }" class="page"><i class="fa fa-long-arrow-left"></i></a>
									 </c:if>
									 <c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
										 <a href="../shop/shop_main.do?page=${p }" class="page">${p }</a>
									 </c:forEach>
									 <c:if test="${endPage<totalpage }">
										 <a href="../shop/shop_main.do?page=${endPage+1 }" class="page"><i class="fa fa-long-arrow-right"></i></a>
									 </c:if>						
							 		</div>
							 	</div>
							 </div>
							</div>
													
							<!--// board 페이지 -->
						</div>
						<!-- board list e -->
					</div>
</body>
</html>