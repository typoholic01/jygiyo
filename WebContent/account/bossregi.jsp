<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<title>bossregi.jsp</title>

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

<h1>가맹점 등록</h1>
<p>환영합니다 저기요</p>

<div class="center">

<form method="post" name="regForm" action="bossregiAf.jsp">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="regi_id" onchange="idchange(this.form.regi_id.value)" size="15">
		<input type="hidden" name="idcks" value="0">
		<input type="button" value="ID중복확인" id="btnId" onclick="idCheck(this.form.regi_id.value)">
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
	<td colspan="2">
		<input type="button" value="회원가입" onclick="inPutCheck(this.form)"> 
		<!-- <input type="submit" value="회원가입"> -->
	</td>
</tr>
</table>
</form>

</div>

<a href="../main.jsp">Home</a>

<script type="text/javascript">
function idCheck(id) {
wx = 300;
wy = 150;
sx = screen.width;
sy = screen.heigth;
x = (sx-wx) /2;
y = (sy-wy) /2;
if(id ==""){
	window.alert("아이디를 입력하세요");
	document.regForm.regi_id.focus();
}else{
	url="Bossidck.jsp?id=" + id;
	wr = window.open(url,"아이디검색","width=300,height=150");
	wr.moveTo(x-100,y+100);
	document.regForm.idcks.value = 1;
	}
}
</script>

<script type="text/javascript">
function idchange(id) { // 중복 체크후 아이디를 바꾸면 value를 0으로 만들어 다시 중복 체크 하게 만든다.
		document.regForm.idcks.value = 0;
}
</script>


<script type="text/javascript">
function inPutCheck(f) {
if(f.idcks.value==0){
	alert("아이디 중복 체크를 해주세요.");
	return false;
}
if(f.regi_id.value==""){
	alert("아이디를 입력 해주세요.")
	f.regi_id.focus();
	return;
	}
if(f.name.value==""){
	alert("이름을 입력 해주세요.")
	f.name.focus();
	return;
	}
if(f.pwd.value==""){
	alert("패스워드를 입력 해주세요.")
	f.pwd.focus();
	return;
	}
if(f.phone.value==""){
	alert("전화번호를 입력 해주세요.")
	f.phone.focus();
	return;
	}
	f.submit();
}
</script>


</body>
</html>





