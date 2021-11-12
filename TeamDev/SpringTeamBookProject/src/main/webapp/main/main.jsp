<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../ogani-master/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../ogani-master/css/style.css" type="text/css">
</head>
<body>
  <%-- 메뉴  --%>
  <jsp:include page="header.jsp"></jsp:include>
  <%-- 페이지변경(변수명) --%>
  <jsp:include page="${main_jsp }"></jsp:include>
  <%-- Footer --%>
  <jsp:include page="footer.jsp"></jsp:include>
  <script src="../ogani-master/js/jquery-3.3.1.min.js"></script>
  <script src="../ogani-master/js/bootstrap.min.js"></script>
  <script src="../ogani-master/js/jquery.nice-select.min.js"></script>
  <script src="../ogani-master/js/jquery-ui.min.js"></script>
  <script src="../ogani-master/js/jquery.slicknav.js"></script>
  <script src="../ogani-master/js/mixitup.min.js"></script>
  <script src="../ogani-master/js/owl.carousel.min.js"></script>
  <script src="../ogani-master/js/main.js"></script>
  <%-- 팝업창 --%>
  <jsp:include page="../popup/popup.jsp"/>
</body>
</html>