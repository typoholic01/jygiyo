<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/logregi.css">
<link rel="stylesheet" type="text/css" href="../css/a.css">
<style type="text/css">
input[type=text] {
 padding: 8px;
 margin: 0px;
}
#menubar{
	font-size: 12px;
}
</style>
<title>BossLogin</title>
</head>
<body>

<div align="center">

<form action="bossloginAf.jsp" method="post">

<table>

<tr>
	<td>
		<a href="../main.jsp"><img src="../image/bosslogin.png" width="450"></a>
	</td>
</tr>

<tr>
	<td>
		<input type="text" name="boss_id" size="57" id="boss_id" placeholder="아이디 입력">
	</td>	
</tr>

<tr>
	<td>
		<input type="password" name="boss_pwd" size="57" id="boss_pwd" placeholder="비밀번호 입력">
	</td>	
</tr>

<tr>
	<td id="menubar">
	<input type="checkbox" id="cb_saveId">아이디 저장
		<span style="float : right;">
			<a href="#">ID찾기</a>&nbsp; | <a href="regi.jsp">회원가입</a>
		</span>
	</td>
</tr>

<tr>
	<td>
		<input type="submit" value="로그인" id="lbtnout"
			onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
	</td>
</tr>
</table>
</form>

</div>

<script type="text/javascript">
//TODO 체크
$(document).ready(function() {
	// id 저장
	var user_email = $.cookie("boss_id");
	if (user_email != null) {
		$("#boss_id").val(user_email);
		$("#cb_saveId").attr("checked", "checked");
	};
	
	$("#cb_saveId").click(function () {
		//alert("현재 아이디를 저장합니다3");
		if ($(this).is(':checked')) {
			$.cookie("boss_id",$("#boss_id").val(), {path:"/", expires:365});
			alert("현재 아이디를 저장합니다");
		} else {
			$.cookie("boss_id",$("#boss_id").val(), {path:"/", expires:-1});
		}
		
	});
})
// id에서 엔터키를 눌렀을때 password 입력으로 focus를 이동시켜주는 부분 
$("#boss_id").keypress(function(event) {
    if(event.which == '13') { // 엔터키를 의미함
        event.preventDefault(); // 초기화 해주는 부분
        $("#boss_pwd").focus();
    }    
});

</script>

</body>
</html>


