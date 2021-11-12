<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-lg-8, .col-md-6, .col-md-12, .col-sm-12, .col-xs-12{
	float: none;
	margin:0 auto;
}

h1,h2,h3,h4,h5,h6{
	text-align:center;
}

input{
 	padding:5px 10px !important;
}

input.searchBtn{
	background:black;
	color:white;
	width:38.6%;
	text-align:center;
}

#radio{
	font-size:16px;
}

#radio input{
	width:15px;
	height:14px;
}

#genre {
	font-size:16px;
}

#genre input{
	width:15px;
	height:14px;
}

button{
	text-align:center;
}

.btnLg{
	border:none;
	color:white;
	width:47%;
	height:46px;
	border-radius:4px;
	font-size:16px; 
}

#dialog_idcheck .dialogBtn{
	font-size:12px; 
	border-radius:3px;
	border:none;
}
</style>
</head>

<body>
	<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12 text-center">
	                    <div class="breadcrumb__text">
	                        <h2>회원탈퇴</h2>
	                        <div class="breadcrumb__option">
	                            <a href="../main/list.do">Home</a>
	                            <span>회원탈퇴</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	</section>
	
   <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            
            <div class="checkout__form">
                <h4>회원탈퇴</h4>
                <form method=post action="join_delete_ok.do" id="joinForm">
                	<div class="row">
						         	
	                	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">

	                       
	                	   <!-- 비밀번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>비밀번호<span>*</span></p>
	                                    <input type="password" name=pwd id=pwd >
	                               </div>
	                            </div>

	                            
	                       <!-- 수정/취소버튼-->
	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12" style="text-align:center; margin-top:50px;">
	                              <input type="submit" class="btnLg" value="회원탈퇴" id="deleteBtn" style="background:black; margin-right:10px;">
	                              <input type="button" class="btnLg" value="취소" style="background:silver;"
	                               onclick="javascript:history.back()">
		                        </div>       
 
                        </div>

                	</div>
                </form>
            </div>
            
        </div>
    </section>
    
</body>
</html>