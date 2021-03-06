<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../css/logregi.css">
<link rel="stylesheet" type="text/css" href="../css/a.css">
<style type="text/css">
input[type=text] {
 padding: 8px;
 margin: 0px;
 height: 40px;
}
input[type=password] {
 padding: 8px;
 margin: 0px;
 height: 40px;
}
#menubar{
	font-size: 12px;
}
</style>
</head>
<body>

<div align="center">

<form action="${pageContext.request.contextPath }/do/users/login" method="post">
 
<table>
<tr>
	<td align="center">
		<a href="../main.jsp"><img src="../image/logo3.png"></a>
	</td>
</tr>
<tr height="40">
</tr>
<tr>
	<td>
		<input type="text" id="userId" name="userId" size="57" placeholder="아이디 입력">
	</td>	
</tr>

<tr>
	<td>
		<input type="password" id="password" name="password" size="57" placeholder="비밀번호 입력">
	</td>	
</tr>
<tr>
	<td id="menubar">
	<input type="checkbox" id="cb_saveId">아이디 저장
		<span style="float : right;" >
			<!-- <a href="#">ID찾기</a> |  --><a href="regi.jsp">회원가입</a>
		</span>
	</td>
</tr>
<tr id="loginunderbar">
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
	var user_email = $.cookie("userId");
	if (user_email != null) {
		$("#userId").val(user_email);
		$("#cb_saveId").attr("checked", "checked");
	};
	
	$("#cb_saveId").click(function () {
		//alert("현재 아이디를 저장합니다3");
		if ($(this).is(':checked')) {
			$.cookie("user_id",$("#userId").val(), {path:"/", expires:365});
			alert("현재 아이디를 저장합니다");
		} else {
			$.cookie("user_id",$("#userId").val(), {path:"/", expires:-1});
		}
		
	});
})
// id에서 엔터키를 눌렀을때 password 입력으로 focus를 이동시켜주는 부분 
$("#userId").keypress(function(event) {
    if(event.which == '13') { // 엔터키를 의미함
        event.preventDefault(); // 초기화 해주는 부분
        $("#password").focus();
    }    
});

</script>


</body>
</html>


