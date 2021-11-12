<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<script>

// 핸드폰번호 하이픈(-) 자동추가
$(document).on("keyup","#tel",function(){
	$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--","-"));
});

// 아이디, 비밀번호 찾기
$(function(){
	$('#telBtn').click(function(){
		let tel=$('#tel').val();
		if(tel.trim()=="")
		{
			alert("핸드폰번호를 입력하세요");
			$('#tel').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/idfind_ok.do',
			data:{"tel":tel},
			success:function(res)
			{
				$('#result_tel').html(res);
			}
		})
	});
	
	$('#idBtn').click(function(){
		let id=$('#find_id').val();
		if(id.trim()=="")
		{
			alert("아이디를 입력하세요");
			$('#find_id').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/pwdfind_ok.do',
			data:{"id":id},
			success:function(res)
			{
				$('#result_id').html(res);
			}
		})
	});
	
})


// 탭메뉴 자바스크립트
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  
  tabcontent = document.getElementsByClassName("tabcontent");
  tablinks = document.getElementsByClassName("tablinks");
  
  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
  }

  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

</script>

<style>
.col-lg-8, .col-md-6, .col-md-12, .col-sm-12, .col-xs-12{
	float: none;
	margin: 0 auto;
}

 .findTab{
 	padding:0px 130px !important;
}
 
.contact-form button {
    font-size: 20px;
    letter-spacing: 0px;
}

.contact-form input {
    width: 100%;
    height: 50px;
    font-size: 16px;
    color: #6f6f6f;
    padding-left: 20px;
    margin-bottom: 30px;
    border: 1px solid #ebebeb;
    border-radius: 4px;
}

/* Style the tab */
.tab {
  overflow: hidden;
/*   border: 1px solid #ccc; */
  border: none;
/*   background-color: #f1f1f1; */
	background-color: white !important;
}

/* Style the buttons inside the tab */
.tab button {
/*   background-color: inherit; */
  border-bottom: 3px solid #f1f1f1 !important;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  width:50%;
  background-color: white;
  color: #7fad39;
}

/* Change background color of buttons on hover */
.tab button:hover {
/*   background-color: #ddd; */
}

/* Create an active/current tablink class */
.tab button.active {
  color: #7fad39;
  border-bottom: 4px solid #7fad39 !important;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 30px 12px;
/*   border: 1px solid #ccc; */
  border-top: none;
  font-size:20px !important;
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
                        <h2>아이디 · 비밀번호 찾기</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>아이디 · 비밀번호 찾기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form Begin -->
    
    <div class="contact-form spad" style="margin:0px auto;">
        <div class="container">          
            
                <div class="row">
	            	<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 findTab">
							<div class="tab">
							  <button class="tablinks active" onclick="openCity(event, 'Id')"><strong>아이디찾기</strong></button>
							  <button class="tablinks" onclick="openCity(event, 'Pwd')"><strong>비밀번호찾기</strong></button>
							</div>
							
							<div id="Id" class="tabcontent active" style="display:block;">
							    <button style="font-weight:bold; display:block; margin-bottom:20px; border:none; background-color:white; padding:0">내 정보에 등록된 핸드폰번호로 찾기</button>
								    <input type=text id=tel placeholder="핸드폰번호를 입력하세요">
								    <input type=button value="검색" id="telBtn" style="background-color:#7fad39; color:white;">
								    <p id="result_tel" style="color:#7fad39"></p>
							</div>
							
							<div id="Pwd" class="tabcontent">
							    <button style="font-weight:bold; display:block; margin-bottom:20px; border:none; background-color:white; padding:0">내 정보에 등록된 아이디로 찾기</button>
								    <input type=text id=find_id placeholder="아이디를 입력하세요">
								    <input type=button value="검색" id="idBtn" style="background-color:#7fad39; color:white;">
								    <p id="result_id" style="color:#7fad39"></p>
							</div>
							
					</div>
                </div>
            
        </div>
    </div>
    <!-- Contact Form End -->

	
</body>
</html>