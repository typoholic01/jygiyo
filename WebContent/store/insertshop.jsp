<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../shop/insert">
<table>
	<tr>
		<th>사장아이디</th>
		<th>사장이름</th>
		<th>가게분류</th>
		<th>가게이름</th>
		<th>가게설명</th>
		<th>가게주소</th>
		<th>가게이미지</th>
	</tr>
	<tr>
		<td><input type="text" name="boss_id" /></td>
		<td><input type="text" name="name" /></td>
		<td><input type="text" name="category" /></td>
		<td><input type="text" name="title" /></td>
		<td><input type="text" name="content" /></td>
		<td><input type="text" name="address" /></td>
		<td><input type="text" name="img_url" /></td>
	</tr>
	<tr colspan="6">
		<td><input type="submit" /></td>
	</tr>
</table>
</form>


</body>
</html>