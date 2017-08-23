<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>음식 등록</h1>
<p>환영합니다</p>

<div class="center">

<form action="foodInsertAf.jsp" method="post" enctype="multipart/form-data">

	<table border="1">
		<tr>
			<td>가게번호</td>
			<td>
				<input type="text" name="number" size="20">
			</td>
		</tr>
		
		<tr>
			<td>카테고리</td>
			<td>
				<select name="category" id="category">
					<option>치킨</option>
					<option>피자</option>
					<option>중국집</option>				
				</select>
			</td>
		</tr>
	
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" size="20">
			</td>
		</tr>
		
		<tr>
			<td>가격</td>
			<td>
				<input type="text" name="price" size="20">
			</td>
		</tr>
		
		<tr>
			<td>사이즈</td>
			<td>
				<input type="text" name="size" size="20">
			</td>
		</tr>
		
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" name="fileload" style="width: 400px;">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">	
				<input type="submit" value="음식 등록">
			</td>
		</tr>
	</table>
</form>


</div>
</body>
</html>