<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../book/css/book.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> 
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/test/2979/js/jquery.raty.js"></script>
<!-- 별점주기 -->


<script>
<!--별점-->
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});



$(function(){
/* 	$("#btn-order").click(function(){
		let book_no = $("#book_no").val();
		//alert(productId)
		let user_id = $("#user_id").val();
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
 	$("#btn-order").click(function(){
		let book_no = $("#book_no").val();
		//alert(productId)
		let user_id = $("#user_id").val();
		$.ajax({
			type:'post',
			url:'../mypage/order_form_ok.do',
			data:{"productId":book_no},
			success:function(res)
			{
				let result=res.trim();
				confirm("결제페이지로 이동하시겠습니까?")
				location.href("../mypage/order_form_ok.do");				
			}
		});
	}) 
	$("#btn-cart").click(function(){
		let productId = $("#productId").val();
		//alert(productId)
		let userId = $("#userId").val();
		$.ajax({
			type:'post',
			url:'../mypage/cartcheck.do',
			data:{"productId":productId},
			success:function(res)
			{
				let result=res.trim();
				//alert(result)
				if (result == 'add_success') {
						if(confirm("장바구니에 등록되었습니다. 장바구니로 이동하시겠습니까?")){
							location.href("../mypage/cart_insert_ok.do");
						}
						else{
							return false;
						}
				} else {
					if(confirm("이미 장바구니에 등록된 상품입니다. 장바구니로 이둥하시겠습니까?")){
						location.href("../mypage/cart_insert_ok.do");
					}
					else{
						return false;
					}
				}
			}
		});
	})
	
	$('#select_count').change(function(){
		let count=$(this).val();
		let price=$('#price').text();
		price=price.replace(",","");
		price=price.replace("원","");
		let total=parseInt(count)*parseInt(price)+5000;
		$('#total').text(total+"원");
		$("#btn-cart").click(function(){
			$('#cart_qty').val(count);			
		})
		$("#btn-order").click(function(){			
			$('#amount').val(count);
		})
/* 		$("#btn-order").click(function(){			
			$('#amount').val(count);
		}) */
	})
});
</script>
</head>
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../ogani-master/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>신간 도서</h2>
                        <div class="breadcrumb__option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src=" ${vo.image}" alt="">
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3> ${vo.title}</h3>
                         
                        <div class="product__details__rating">
                        <span>
                        	
											<!-- 별점은 사용자가 등록한 별점으로 if문 처리해서 갯수 띄우기. -->
											<div class="print_comments_stars">
											<c:if test="${starvo.avgs==5}">
											        <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                    </c:if>
						                    <c:if test="${starvo.avgs>4&&starvo.avgs<5}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-half-o"></i>
						                    </c:if>  
						                     <c:if test="${starvo.avgs==4}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>
						                    <c:if test="${starvo.avgs>3&&starvo.avgs<4}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-half-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if> 
						                    <c:if test="${starvo.avgs==3}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>    
						                    <c:if test="${starvo.avgs>2&&starvo.avgs<3}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-half-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>
						                    <c:if test="${starvo.avgs==2}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>
						                    <c:if test="${starvo.avgs>1&&starvo.avgs<2}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star-half-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>
						                    <c:if test="${starvo.avgs==1}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if> 
						                    <c:if test="${starvo.avgs>0&&starvo.avgs<1}">
						                    		<i class="fa fa-star-half-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>
						                    <c:if test="${avgstars==0}">
						                    		<i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>    
						                    </div> 
							
                        
                        </span>
                       
                       
                            
                        </div>
                        <div class="product__details__price"><span id="price"> ${vo.price}</span></div>
                        <div class="bookdetail_pricedata_group"> 
                        <p class="bookdetail_textdata_title"> 적립금 </p>
                        <p class="bookdetail_textdata"> ${point}원(5%) + 멤버십(1~3%) </p>
                        </div>
                        <div class="bookdetail_textdata_group">                        
                        <p class="bookdetail_textdata_title"> 저자 </p>
                        <p class="bookdetail_textdata"> ${vo.writer} </p>
                        <p class="bookdetail_textdata_title"> 출간일 </p>
                        <p class="bookdetail_textdata"> ${vo.pubdate} </p>
                        <p class="bookdetail_textdata_title"> 출판사 </p>
                        <p class="bookdetail_textdata"> ${vo.publisher} </p>
                        <p class="bookdetail_textdata_title"> 카테고리 </p>
                        <p class="bookdetail_textdata"> ${vo.genre} </p>
                        </div>
                        <div>
                              <select class="form-control" id="select_count">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i }" style="width:100px;">${i}</option>
									</c:forEach>
							  </select>
                        </div>
                        <div style="height:50px"></div>
                        
						<div class="bookdetail_textdata_title">
								<span style="font-size:14pt;">합계금액: <span id="total"></span></span>
						</div>
                    
                        <div style="height:50px"></div>
	                        <form method="post" action="../mypage/order_form_ok.do" style="display:inline">
		                        <input type="submit" class="primary-btn" id="btn-order" style="border:none" value="주문하기">
		                        <input type="hidden" name="book_no" value="${vo.bno}" id="book_no">
		                        <input type="hidden" name="amount" value="" id="amount">
	                        </form>
	                        
	                        <form method="post" action="../mypage/cart_insert_ok.do" style="display:inline">
		                        <input type="submit" class="primary-btn" id="btn-cart" style="border:none" value="장바구니">
		                        <input type="hidden" name="productId" value="${vo.bno}" id="productId">
		                        <input type="hidden" name="cart_qty" value="" id="cart_qty">
	                        </form>
	                        
	                        <input type="button" class="btn primary-btn btn-wishlist" style="border:none;display:inline" value="위시리스트">
	                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        
                        
                        <ul>
                            <!--  Book_DATA 테이블에 재고를 관리하는 컬럼이 없음.
                            <li><b>판매정보</b> <span>판매중</span></li>-->
                            <li><b>배송정보</b> <span>배송비 2500원 / 5,000원 이상 결제시 무료배송</span></li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">책소개</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">목차</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">리뷰 <span>(${ccvo.cnt})</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>책소개</h6>
                                    <p>${vo.introduce}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>목차</h6>
                                    <p> ${vo.contents}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                <div class="input_and_print_comments">
                                   
			<!-- 리뷰 입력 파트 -->
                        <c:if test="${sessionScope.id!=null }"><!--로그인 된 상태 -->
				<div class="input_comments">
					<form method="post" action="newdetail_commentInput.do" class="comment_form" name="myform" id="myform">
						<input type="text" class="comment_title" size=70 name="title">
						<p></p>
						<input type="text" class="comment_text" size=70 name="comments">
						<input type="hidden" name="bno" value="${vo.bno }">
						<input type="hidden" name="writer" value="${sessionScope.name }">
						<input type="hidden" name="c_userid" value="${sessionScope.id }">
						<p></p>
						 <!-- 평점 선택창 -->
						<fieldset>
							<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
							<input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
							<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
							<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
							<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
						</fieldset>
						<!-- 전송 버튼 -->
						<input type="submit" class="commnet_submit_btn" value="등록">
										
					</form>
					<!--  ------------------------------------------------------------ -->
				</div>
			</c:if>
									<!-- 리뷰 출력 파트-->
									<div class="print_comments">
										<c:forEach var="cvo" items="${clist }">
											<!-- 별점은 사용자가 등록한 별점으로 if문 처리해서 갯수 띄우기. -->
											<div class="print_comments_stars">
											<c:if test="${cvo.stars==5}">
											        <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                    </c:if>
						                    <c:if test="${cvo.stars==4}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>  
						                    <c:if test="${cvo.stars==3}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>    
						                    <c:if test="${cvo.stars==2}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if> 
						                    <c:if test="${cvo.stars==1}">
						                    		<i class="fa fa-star"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if> 
						                    <c:if test="${cvo.stars==0}">
						                    		<i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                            <i class="fa fa-star-o"></i>
						                    </c:if>    
						                    </div> 
												<div class="print_comments_texts">
					                        <!-- 레이아웃만 만들어둠. 아직 기능 구현 안함.  -->
												<div class="comments_title">${cvo.title }</div>
												<div class="comments_comments">${cvo.comments }</div>
												<div class="comments_write_data">
												<div class="comments_writer">${cvo.writer }</div>
												<div class="comments_writedate">${cvo.writedate }</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 도서</h2> <!-- 관련 도서는 장르가 같은 책들을 랜덤으로 추천 -->
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="vo" items="${list }">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="">
                            <a href="../book/newdetail.do?bno=${vo.bno }"><img src="${vo.image}"></a>
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="../book/newdetail.do?bno=${vo.bno }">${vo.title}</a></h6>
                            <h5>${vo.price}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
</body>

</html>
