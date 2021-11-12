<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.contact-form form textarea {
	width: 100%;
	height: 400px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	margin-bottom: 24px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding-top: 12px;
	resize: none;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let imageIndex=0;
$(function(){
	$('#add').click(function(){
		$('#imageView').append(
			'<tr id=m'+(imageIndex)+'>'
			+ '<td width=25% class="text-right">파일 '+(imageIndex+1)+'</td>'
			+ '<td width=75%><input type=file name=files['+imageIndex+'] size=20></td>'
			+ '</tr>'
		)
		imageIndex++;
	});
	$('#remove').click(function(){
		if(imageIndex>0)
			{
				$('#m'+(imageIndex-1)).remove();
				imageIndex--;
			}
	})
});
</script>
</head>
<body>

<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
                        <div class="breadcrumb__option">
                            <a href="../main/main.do">Home</a>
                            <span>공지사항</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="contact__form__title">
                        <h2>공지사항 등록</h2>
                    </div>
                </div>
            </div>
            <form method="post" action="update_ok.do" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name=subject placeholder="제목" value=${vo.subject }>
                        <input type=hidden name=no value="${vo.no }">
                        <input type=hidden name=name value="${vo.name }">
          				<input type=hidden name=page value="${page }">
                    </div>
                   
                    <div class="col-lg-10 text-center">
                        <textarea rows=20 cols=60 placeholder="공지내용" name=content>${vo.content }</textarea>
                    </div>
                    
                    <div class="col-lg-10 text-center" style="margin-top:50px;">
                        <input type="submit" value="수정" style="font-size: 14px;
								color: #ffffff;
								font-weight: 800;
								width:90px;
								padding: 13px 30px 12px;
								background: #7fad39;
								border: none;">
                        <input type="button" onclick="javascript:history.back()" value="취소" style="font-size: 14px;
								color: #ffffff;
								font-weight: 800;
								width:90px;
								padding: 13px 30px 12px;
								background: #7fad39;
								border: none;">
                    </div>
                    
                </div>
            </form>
        </div>
    </div>
  
</body>
</html>