<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">

input[type=text] {
 padding: 5px;
 margin: 0px;
 height: 50px;
}

#blbtnout{
	background-color: grey;
	color: white;						
	width: 450px; 
	height: 70px;
	border: 0;
}
#blbtnover{
	background-color: black;
	color: white;						
	width: 450px;
	height: 70px;
	border: 0;
}
#bregibtnout{
	background-color: grey;
	color: white;						
	width: 83px; 
	height: 60px;
	border: 0;
	
}
#bregibtnover{
	background-color: black;
	color: white;						
	width: 83px;
	height: 60px;
	border: 0;
}
</style>
<title>bossregi.jsp</title>
</head>
<body>

<div align="center">

<form method="post" name="regForm" action="bossregiAf.jsp">

<table>
<tr>
	<td align="center">
		<a href="../bmain.jsp"><img src="../image/logo4.png"></a>
	</td>
</tr>
<tr height="40">
</tr>
<tr>
	<td>
		<input type="text" name="regi_id" onchange="idchange(this.form.regi_id.value)" size="45" placeholder="아이디 입력">
		<input type="hidden" name="idcks" value="0">	
		<input type="button" value="ID중복확인" onclick="idCheck(this.form.regi_id.value)"
		id="bregibtnout" onmouseover="this.id='bregibtnover'" onmouseout="this.id='bregibtnout'">
</td>
</tr>

<tr>
	<td>
		<input type="text" name="name" size="58" placeholder="이름 입력">
	</td>	
</tr>


<tr>
	<td>
		<input type="text" name="pwd" size="58" placeholder="비밀번호 입력">
	</td>	
</tr>


<tr>
	<td>
		<input type="text" name="phone" size="58" placeholder="전화번호 입력">
	</td>	
</tr>
<tr height="15">
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="회원가입" onclick="inPutCheck(this.form)"
		id="blbtnout" onmouseover="this.id='blbtnover'" onmouseout="this.id='blbtnout'">
	</td>
</tr>
</table>
</form>

</div>

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





