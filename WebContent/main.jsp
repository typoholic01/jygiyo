<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>main.jsp</title>
</head>
<body>
<div align="center">

<form action="">

<div align="right">
<a href="bosslogin.jsp">가맹점 로그인</a> | <a href="login.jsp">로그인</a> | <a href="regi.jsp">일반 회원가입</a> | <a href="bossregi.jsp">가맹점 회원가입</a>
</div>

<h3 align="center"><img src="./image/jugiyo.png" alt="저기요"></h3>

<input type="hidden" ><select name="city" id="city">
	<option id="seoul" value="seoul">서울</option>
	<option>인천</option>
	<option>수원</option>
	<option>광명</option>
</select>
<select>
	<option>강남구</option>
	<option>영등포구</option>
	<option>노원구</option>
	<option>구로구</option>
</select>

<input type="text" name="serch" size="20">
<input type="submit" value="검색">
</form>
</div>
<br><br><br><br>

<table rules="none" align="center">
	<tr>
		<td>
			<a href="chickenList.jsp">
			<img src="image/chicken.jpg" width="200" height="150" id="chicken" name="chicken">
			</a>
		</td>		
		
		<td>
			<a href="fastfoodList.jsp">
			<img src="image/fastfood.png" width="200" height="150">
			</a>
		</td>
		<td><img src="image/pig.jpg" width="200" height="150"></td>
		<td><img src="image/Sushi.jpg" width="200" height="150"></td>
	</tr>
	<tr>		
		<td><img src="image/dosirack.png" width="200" height="150"></td>
		<td><img src="image/jj.jpg" width="200" height="150"></td>
		<td><img src="image/jjajang.jpg" width="200" height="150"></td>
		<td><img src="image/hansic.jpg" width="200" height="150"></td>
	</tr>
	
	<tr>
		
		<td><img src="image/porkC.jpg" width="200" height="150"></td>
	</tr>
</table>

</body>
</html>