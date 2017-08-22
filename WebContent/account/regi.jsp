<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>regi.jsp</title>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #8AC007;
	padding: 10px;
}
</style>

</head>
<body>

<h1>회원등록</h1>
<p>환영합니다 저기요</p>

<div class="center">

<form action="./regiAf.jsp" method="post">

<table border="1">

<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" size="20">
	</td>	
</tr>


<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>	
</tr>


<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" size="20">
	</td>	
</tr>


<tr>
	<td>연락처</td>
	<td>
		<input type="text" name="phone" size="20">
	</td>	
</tr>

<tr>
	<td>주소</td>
	<td>
		<input type="text" name="address" size="20">
	</td>	
</tr>

<tr>
	<td>상태</td>
	<td>
		<input type="text" name="status" size="20">
	</td>	
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="회원가입">
	</td>
</tr>
</table>
</form>

</div>

<a href="../index.jsp">Home</a>

</body>
</html>





