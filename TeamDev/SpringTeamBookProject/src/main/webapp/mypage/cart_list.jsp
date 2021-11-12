<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	$('#sel').change(function(){
		let num=$(this).val();
		let price=$("#sellPrice").text();
		$("#plusBtn").click(function(){
			let plusNum=parseInt(num)+1;
			if(plusNum>=10){
				$("#qty").val(num);
				var total=parseInt(num)*parseInt(price);
				$('#total').text(total+"원");
			}
			else{
				$("#qty").val(plusNum);
				var total=plusNum*parseInt(price);
				$('#total').text(total+"원"); 
			}
		})
		
		$("#minusBtn").click(function(){
			let minusNum=parseInt(num)-1;
			if(minusNum>=10){
				$("#qty").val(num);
				var total=parseInt(num)*parseInt(price);
				$('#total').text(total+"원");
			}
			else{
				$("#qty").val(minusNum);
				var total=minusNum*parseInt(price);
				$('#total').text(total+"원");
			}
		})
		
	})
	
/* 	$("#btn-order").click(function(){
		let book_no = $("#book_no").val();
		let user_id = $("#userId").val();
		$.ajax({
			type:'post',
			url:'../mypage/order_form_ok.do',
			data:{"book_no":book_no},
			success:function(res)
			{
				let result=res.trim();
				confirm("결제페이지로 이동하시겠습니까?")
					location.href("../mypage/order_form_ok.do");				
			}
		});
	}) */
	
	$("#allCheck").click(function () {
	   let chk = $("#allCheck").prop("checked");
	   if (chk) {
	   	   $(".chkbox").prop("checked", true);
	       itemSum();
	   } else {
	       $(".chkbox").prop("checked", false);
	        itemSum();
	    }
	 });
	
	function itemSum() {
		let str = "";
		let sum = 0;
		let count = $(".chkbox").length;
		for (let i = 0; i < count; i++) {
			if ($(".chkbox")[i].checked == true) {
		    	sum += parseInt($(".chkbox")[i].value);
		   	}
		}
		$("#total_sum").html(sum + " 원");
		$("#amount").val(sum);
	}
})
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="shoping-cart spad">
        <div class="container">
          
            <div class="row"> 
              <a href="../mypage/cart_list.do" class="primary-btn cart-btn">장바구니</a>
              <a href="../mypage/order_form.do" class="primary-btn cart-btn">결제</a>
              <a href="../mypage/order_list.do" class="primary-btn cart-btn">구매내역</a>
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                <th><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
                                    <th class="shoping__product">장바구니</th>
                                    <th>금액</th>
                                    <th>수량</th>
                                    <th>총합</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                             <c:when test="${count==0 }">
                             <!-- 초기화면 상품 전체선택이지만 하나라도 체크박스 해제할 경우 이벤트  -->
			                    <script>
			                        $(".chkbox").click(function () {
			                            $("#allCheck").prop("checked", false);
			                        });
			                    </script>
                               <c:set var="cart" value="false" />
		                        <div class="card border-light mb-3 text-center spad">
		                            <div class="card-header">
		                                <h3>카트에 상품이 없습니다.</h3>
		                            </div>
		                            <div class="card-body">
		                                <p class="card-text">카트에 물건을 담고 이용해주세요!</p>
		                            </div>
		 
		                        </div>
                             </c:when>
                             <c:otherwise>
                              <c:forEach var="vo" items="${list }">
                                <tr>
                                  <td class="product-close">
                                  <input type="checkbox" onClick="itemSum()"
                                      class="chkbox" value="${vo.price * vo.cart_qty}"
                                      data-cartNum="${vo.cartId}">
                                   </td>
                                    <td class="shoping__cart__item">
                                        <img src="${vo.image }" style="width:110px;height:150px;">
                                        <h5>${vo.title }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                     <fmt:parseNumber value="${vo.price }" var="price" type="number" pattern="##,###"/>
                                        ${price }원
                                    </td>
                                    <td class="shoping__cart__quantity" id="sel">
                                    	   <input type=hidden id="sellPrice" value="${vo.price }">
                                           <button id="minusBtn" style="border:none">-</button>
                                           <input type="text" id="qty" value="${vo.cart_qty }" size=1 style="text-align:center;border:none" readonly=readonly>
                                           <button id="plusBtn" style="border:none">+</button>
                                    </td>
                                    <td class="shoping__cart__total">
                                    	<span id="total">${vo.price*vo.cart_qty }원</span>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="../mypage/cart_delete.do?no=${vo.cartId }" class="icon_close"></a>
                                    </td>
                                </tr>
                               </c:forEach>
                             </c:otherwise>
                           </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="../main/main.do" class="primary-btn cart-btn">계속 쇼핑하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            새로고침</a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>결제 예정 금액</h5>
                        <ul>
                            <li>배송료<span>${fee }</span></li>
                            <li>총 가격<span id="total_sum"></span></li>
                        </ul>
                        <a href="../mypage/order_form.do" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>