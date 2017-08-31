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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String seq_store = request.getParameter("seq");
	String title_store = request.getParameter("title");
%>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-sm-3">
<h1><%=title_store %></h1>
</div>
<div class="col-sm-4 col-sm-offset-8">
<span><a href="./bossmain.jsp">돌아가기</a></span>
</div>
</div>
<div id="food" class="row">
	<c:import url="../foodstore/foodview.jsp">
	<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
<br />
<br />
<div class="row">
<div class="col-sm-10">
<form action="./menuupload.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq_store" value="<%=seq_store %>">
<table class="table table-hover">
<tr>
	<th>분류</th>
	<th>입력</th>
</tr>

<tr>
	<td>카테고리</td>
	<td>
		<input type="text" name="food_category">
	</td>
</tr>
<tr>
	<td>음식이름</td>
	<td>
		<input type="text" name="food_name">
	</td>
</tr>
<tr>
	<td>가격</td>
	<td>
		<input type="text" name="food_price">
	</td>
</tr>
<tr>
	<td>음식사이즈(대,중,소)</td>
	<td>
		<select name="food_size">
			<option selected="selected">대</option>
			<option>중</option>
			<option>소</option>
		</select>
	</td>
</tr>
<tr>
	<td>음식이미지(제외해도됨)</td>
	<td>
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="추가">
	</td>
</tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>