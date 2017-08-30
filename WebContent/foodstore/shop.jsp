<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>가게</title>
</head>
<body>
<div id="food">
	<c:import url="./foodview.jsp">
	<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
<div id="bbs">
	<c:import url="./detail.jsp">
	<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
</body>
</html>