<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data){
			$('#post').val(data.zonecode);
			$('#addr1').val(data.address)
		}
	}).open();
}


</script>

<script>
$(function(){
	$('body').attr("style", "overflow:auto");
	
	// 핸드폰번호 하이픈(-) 자동추가
	$(document).on("keyup","#tel",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--","-"));
	});

 	// 아이디 중복체크
 	$('#idcheckBtn').click(function(){
		let id=$('#id_check').val();
		let okbtn=$('#okBtn');

		if(id.trim()=="")
		{
			$('#id_check').focus();
			return;
		}
	
		$.ajax({
			type:'get',
			url:'../member/idcheck.do',
			data:{"id":id},
			success:function(res)
			{
				let result=res.trim();
				if(result==0)
				{
					alert("사용가능한 아이디입니다");
 					$('#okBtn').show();
				}
				else
				{
					alert("이미 사용중인 아이디입니다\n다시 입력하세요");
					$('#id_check').val("");
					$('#id_check').focus();
				}
			}
		})
	}); 
 	
 	// 회원가입 중복체크창 제어
   	$('#okBtn').click(function(){
		let id=$('#id_check').val();
		if(id.trim()!="")
		{
			$('#id').val(id);
			$('#id_check').val("");
			$('#myModal').css('display','none');
			$('.modal-backdrop').css('display','none');
			$('body').attr("style", "overflow:auto");
		}
		else
		{
			alert("아이디를 입력하세요");
			$('#id_check').focus();
		}

	});
 	
	//비밀번호 확인
 	$('#pwd2').blur(function(){
 		let pwd=$('#pwd').val();
 		let pwd2=$('#pwd2').val();
	   if(pwd!=pwd2){
	    	if(pwd2!=''){
		    alert("비밀번호가 일치하지 않습니다");
	    	    $('#pwd2').val('');
	            $('#pwd2').focus();
	       }
	    }
	   else{
		   alert("비밀번호가 일치합니다");
	   }
	});   
	
	// 회원가입 버튼 클릭 시, 입력안한 경우 return false
	$('#joinBtn').click(function(){
		let name=$('#name').val();
		let id=$('#id').val();
		let pwd=$('#pwd').val();
		let tel=$('#tel').val();
		let addr1=$('#addr1').val();
		let genreChecked=$('input[name=genre]');
		let genreCount=0;
		
		// 장르에 체크된 갯수 확인
		for(var i=0;i<genreChecked.length;i++)
			if(genreChecked[i].checked==true)
			{
				genreCount++;
			}
		
 		if(name=='')
		{
			alert("이름을 입력하세요");
			$('#name').focus();
			return false;
		}
 		else if(id=='')
		{
			alert("아이디를 입력하세요");
			$('#id').focus();
			return false;
		}
 		else if(pwd=='')
		{
			alert("비밀번호를 입력하세요");
			$('#pwd').focus();
			return false;
		}
 		else if(tel=='')
		{
			alert("전화번호를 입력하세요");
			$('#tel').focus();
			return false;
		}
 		else if(addr1=='')
		{
			alert("주소를 입력하세요");
			$('#addr1').focus();
			return false;
		}
 		else if(genreCount==0)
		{
			alert("장르는 1개이상 선택해야합니다")	;
			return false;	
		}
 		else
 		{
 			alert("회원가입이 완료되었습니다");
 		}


	});

})
</script>

<style>
body{
	padding-right:0px !important;
}

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

.hide{
	display:none;
}
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb2.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회원가입</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/list.do">Home</a>
                            <span>회원가입</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        
            <!-- 1 -->
            <div class="row">
                <div class="col-lg-12">
<!--                     <h6><span class="icon_tag_alt"></span>이미 회원이신가요?<a href="login.do">Click here</a>로그인 창으로 이동하세요 -->
                    <h6><span class="icon_tag_alt"></span><a href="login.do" style="text-decoration:none; color:#7fad39; font-weight:400">이미 회원이신가요? 클릭하여 로그인 창으로 이동하세요</a>
                    </h6>
                </div>
            </div>
            
            <div class="checkout__form">
                <h4>회원가입</h4>
                <form method=post action="join_ok.do" id="joinForm">
                	<div class="row">
						         	
	                	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
	                		<!-- 이름 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>이름<span>*</span></p>
	                                    <input type="text" name=name id="name">
	                               </div>
	                            </div>
	                		
                	   <!-- 아이디 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>아이디<span>*</span></p>
		                                    <input type="text" name=user_id id=id style="width:60%;" readonly>
		                                    <input type="button" id="idBtn" class="searchBtn" value="중복체크" data-toggle="modal" data-target="#myModal">
	                               </div>
	                            </div>

	                       
	                	   <!-- 비밀번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>비밀번호<span>*</span></p>
	                                    <input type="password" name=pwd id=pwd>
	                                    <input type="password" name=pwd2 id=pwd2 placeholder="비밀번호 재입력" style="margin-top:10px;">
	                               </div>
	                            </div>
	                       
	                	   <!-- 성별 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input" id="radio">
	                                	<p>성별<span>*</span></p>
	                                    <input type="radio" name=sex class="radioBox" value="남자" checked>&nbsp;남자&nbsp;
	                                    <input type="radio" name=sex class="radioBox" value="여자">&nbsp;여자&nbsp;
	                               </div>
	                            </div>
	                       
	                       <!-- 생일 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>생일<span>*</span></p>
	                                    <input type="date" name=birthday id=birthday>
	                               </div>
	                            </div>
	                       
	                       <!-- 전화번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>전화번호<span>*</span></p>
	                                    <input type="text" name=tel id=tel>
	                               </div>
	                            </div>
	                       
	                       <!-- 이메일 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>이메일<span>*</span></p>
	                                    <input type="email" name=email>
	                               </div>
	                            </div>
	                            
	                       <!-- 우편번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>우편번호<span>*</span></p>
	                                    <input type="text" name=post readonly id=post style="width:60%;">
	                                    <input type="button" name=post readonly id=post class="searchBtn" value="우편번호검색" onclick="postfind()" >
	                               </div>
	                            </div>
	                       
	                        <!-- 주소1 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>주소<span>*</span></p>
	                                    <input type="text" name=addr1 readonly id=addr1>
	                               </div>
	                            </div>
	                       
	                       <!-- 주소2 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>상세주소<span>*</span></p>
	                                    <input type="text" name=addr2>
	                               </div>
	                            </div>
	                        
	                        <!-- 선호장르 -->
	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
	                            	<div class="checkout__input">
	                                	<p>선호장르<span>*</span></p>
	                               </div>
			                         
			                      <div class="checkout__input" id="genre" class="genreBox">
			                        
			                      <input type='hidden' id='genreCheck' value="${vo.genre}">
							      <input type="checkbox" name="genre" class="genreBox" id="국내도서" value="국내도서">&nbsp;국내도서&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="외국도서" value="외국도서">&nbsp;외국도서&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="EBook" value="EBook">&nbsp;EBook&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="소설시" value="소설/시">&nbsp;소설/시&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="경제경영" value="경제/경영">&nbsp;경제/경영&nbsp;
							      <br>
							      <input type="checkbox" name="genre" class="genreBox" id="에세이" value="에세이">&nbsp;에세이&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="인문" value="인문">&nbsp;인문&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="어린이" value="어린이">&nbsp;어린이&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="외국어" value="외국어">&nbsp;외국어&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="참고서" value="참고서">&nbsp;참고서&nbsp;
							      <input type="checkbox" name="genre" class="genreBox" id="요리" value="요리">&nbsp;요리&nbsp;

			                      </div>
			                        
	                            </div>
	                            
	                       <!-- 가입/취소버튼-->
	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12" style="text-align:center; margin-top:50px;">
	                              <input type="submit" class="btnLg" value="가입" id="joinBtn" style="background:black; margin-right:10px;">
	                              <input type="button" class="btnLg" value="취소" style="background:silver;"
	                               onclick="javascript:history.back()">
		                        </div>       
 
                        </div>

                	</div>
                </form>
            </div>
            
        </div>
    </section>
    
    
   <!-- 부트스트랩 모달창  -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

        <div class="modal-header">
          <h5 class="modal-title" style="font-weight:600;">아이디 중복체크</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
        	<div style="text-align:center; margin-top:10px;">
			 ID<input type=text id="id_check" style="border:1px solid #ebebeb; border-radius:3px; width:150px; height:30px; margin:0px 5px !important;">
		       <input type=button value="중복체크" id="idcheckBtn" style="background:black; color:white; border:none; border-radius:3px; height:30px; padding:3px 10px !important;">
        	</div>
        	
        	<div style="text-align:center; margin-top:20px; margin-bottom:10px;">
		        <input type=button value="확인" id="okBtn" class="dialogBtn" style="background:black; color:white; border:none; border-radius:3px; height:30px; padding:3px 10px !important; display:none;">
		        <input type=button value="취소" id="idcanBtn" data-dismiss="modal" class="dialogBtn" style="background:#e9e9e9; color:black; border:none; border-radius:3px; height:30px; padding:3px 10px !important;">
		    </div>
        </div>

      </div>
    </div>
  </div>

    
</body>
</html>