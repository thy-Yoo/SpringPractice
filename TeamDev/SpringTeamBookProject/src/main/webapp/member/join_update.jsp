<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> 
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
	// 핸드폰번호 하이픈(-) 자동추가
	$(document).on("keyup","#tel",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--","-"));
	});
	
	// 수정 버튼 클릭 시, 입력안한 경우 return false
	$('#updateBtn').click(function(){
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
		
	});
	
	// 장르선택된 갯수 가져오기
    hobbyCheck();

	function hobbyCheck(){
		//1 입력값
		var genre = document.getElementById("genreCheck").value;
		
		//2 문자열 자르기
		var strArray = genre.split(",");

  		//3 체크해주기
		var i;
		for(i=0; i<100; i++){
			$("input:checkbox[id="+ strArray[i].replace('/','') +"]").attr("checked", true);
		}
	}
	
	
})
</script>
<script type="text/javascript">
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
	

});
</script>
<script>
$(function(){
	
	// 수정 버튼 클릭 시, 입력안한 경우 return false
	$('#updateBtn').click(function(){
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
		
		if(pwd=='')
		{
			alert("비밀번호를 입력하세요");
			$('#pwd').focus();
			return false;
		}
 		else if(genreCount==0)
		{
			alert("장르는 1개이상 선택해야합니다")	;
			return false;	
		}
		
	});

})
</script>
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
	                        <h2>회원정보 수정</h2>
	                        <div class="breadcrumb__option">
	                            <a href="../main/list.do">Home</a>
	                            <span>회원정보 수정</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	</section>



    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span><a href="join_delete.do" style="text-decoration:none; color:black; font-weight:400">회원탈퇴를 원하시면 여기를 클릭하세요</a>
                    </h6>
                </div>
            </div>
            
            <div class="checkout__form">
                <h4>회원정보 수정</h4>
                <form method=post action="join_update_ok.do" id="joinForm">
                	<div class="row">
						         	
	                	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
	                	
	                		<!-- 이름 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>이름<span>*</span></p>
	                                    <input type="text" name=name id="name" value="${vo.name }">
	                               </div>
	                            </div>
	                		
	                		<!-- 아이디 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>아이디<span>*</span></p>
		                                    <input type="text" name=user_id id=id readonly value="${vo.user_id }">
	                               </div>
	                            </div>

	                       
	                	   <!-- 비밀번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>비밀번호<span>*</span></p>
	                                    <input type="password" name=pwd id=pwd>
	                               </div>
	                            </div>
	                       
	                	   <!-- 성별 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input" id="radio">
	                                	<p>성별<span>*</span></p>
	                                    <input type="radio" name=sex class="radioBox" value="남자" ${vo.sex=='남자'?"checked":"" }>&nbsp;남자&nbsp;
	                                    <input type="radio" name=sex class="radioBox" value="여자" ${vo.sex=='여자'?"checked":"" }>&nbsp;여자&nbsp;
	                               </div>
	                            </div>
	                       
	                       <!-- 생일 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>생일<span>*</span></p>
	                                    <input type="date" name=birthday id=birthday value="${vo.birthday}">
	                               </div>
	                            </div>
	                       
	                       <!-- 전화번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>전화번호<span>*</span></p>
	                                    <input type="text" name=tel id=tel value="${vo.tel }">
	                               </div>
	                            </div>
	                       
	                       <!-- 이메일 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>이메일<span>*</span></p>
	                                    <input type="email" name=email value="${vo.email }">
	                               </div>
	                            </div>
	                            
	                       <!-- 우편번호 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>우편번호<span>*</span></p>
	                                    <input type="text" name=post readonly id=post style="width:60%;" value="${vo.post }">
	                                    <input type="button" name=post readonly id=post class="searchBtn" value="우편번호검색" onclick="postfind()" >
	                               </div>
	                            </div>
	                       
	                        <!-- 주소1 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>주소<span>*</span></p>
	                                    <input type="text" name=addr1 readonly id=addr1 value="${vo.addr1 }">
	                               </div>
	                            </div>
	                       
	                       <!-- 주소2 -->
	                            <div class="col-lg-8">
	                            	<div class="checkout__input">
	                                	<p>상세주소<span>*</span></p>
	                                    <input type="text" name=addr2 value="${vo.addr2 }">
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
	                            
	                       <!-- 수정/취소버튼-->
	                            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12" style="text-align:center; margin-top:50px;">
	                              <input type="submit" class="btnLg" value="수정" id="updateBtn" style="background:black; margin-right:10px;">
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