<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myinfo.jsp</title>
</head>
<body>

<h3>여기는 myinfo.jsp 입니다</h3>

<h1>마이페이지</h1>
<%
String id = request.getParameter("id");



%>

<div>
<form action="./myinfoAf.jsp" method="post">
<input type="hidden" name="id" value="">
<table border="1">





</table>





</form>




</div>

</body>
</html>