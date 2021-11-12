<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){

 	// 로그인버튼 클릭
	$('#logBtn').click(function(){
		let id=$('#id').val();
		let pwd=$('#pwd').val();
		
		if(id.trim()=="")
		{
			alert("아이디를 입력하세요");
			$('#id').focus();
			return false;
		}
		
		if(pwd.trim()=="")
		{
			alert("비밀번호를 입력하세요");
			$('#pwd').focus();
			return false;
		}
		
		// ajax
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(res)
			{
				let result=res;
				if(result=='NOID') // 아이디가 존재하지 않는 경우
				{
					alert("아이디가 존재하지 않습니다");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
 				else if(result=='NOPWD') // 아이디는 존재하고, 비밀번호가 일치하지 않음
				{
					alert("비밀번호가 일치하지 않습니다");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else if(result=='OK')
				{
					alert("로그인이 완료되었습니다");
					location.href="../main/main.do";
				}
				
			}
		})
		
	})
	
})

</script>
<style>
.col-lg-8, .col-md-6, .col-md-12, .col-sm-8, .col-xs-12{
	float: none;
	margin:0 auto;"
}

.contact-form input {
    width: 100%;
    height: 50px;
    font-size: 16px;
    color: #6f6f6f;
    margin-bottom: 30px;
    border: 1px solid #ebebeb;
    border-radius: 4px;
}

 input{
	margin:0 auto;
	padding-left:15% !important;
}

/* 로그인 버튼  */
input[type=button]{
	padding:0 !important;
	color:white !important;
} 

.icon{
	position:relative;
	width:100%;
	height:80px;
	font-size:25px;
	color:#7fad39;
}
.icon span{
   position:absolute;
   top:18%;
   left:4%;
}

ul.link {
	margin:30px auto;
	text-align:center;
}

ul.link li{
	position:relative;
	list-style:none;
	display:inline-block;
	font-size:15px;
}

ul.link li+li::before{
	content: "";
    display: inline-block;
    position: relative;
    margin:0 8px;
    top: 0px;
    left: 0;
    width:1px;
    height:12px;
    background: #e0e0e0;
}

ul.link a{
	text-decoration:none;
	color:#6f6f6f;
}


</style>
</head>
<body>
	
    <!-- Breadcrumb Section Begin  -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>로그인</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>로그인</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Contact Form Begin -->
    
    <div class="contact-form spad" style="margin:20px auto;">
        <div class="container">          
            
                <div class="row">
	                	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
	                	
 	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-user"></span>
		                                    <input type="text" placeholder="아이디" id="id" class="btnId">
 	                            		</div>

	                            </div>
	                            
 	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
 	                            		<div class="icon">
	 	                                    <span class="fa fa-lock"></span>
		                                    <input type="password" placeholder="비밀번호" id="pwd" class="btnId">
 	                            		</div>

	                            </div>

	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12" >
		                       			<input type=button class="site-btn" style="width:100%; text-align:center" id="logBtn" value="로그인">
	                            </div> 
	                            
	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12" style="text-center;">
		                       		<ul class="link">
		                       			<li><a href="join.do">회원가입</a></li>
		                       			<li><a href="idpwd_find.do">아이디·비밀번호찾기</a></li>
		                       		</ul>
	                            </div> 
		                    
	                	</div>

                </div>
        </div>
    </div>
    <!-- Contact Form End -->
    
</body>
</html>