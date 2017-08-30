<%@page import="boss.BossDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/logregi.css">
<link rel="stylesheet" type="text/css" href="css/a.css">

<style type="text/css">
#container {
background-color: white;
width: 1800px;
padding: 10px;
}

#header {
background-color: white;
width : 1400px;
height: 300px;
}
 
#content {
background-color: #fff5ee;
float: left;
width: 1000px;
height: 400px;
padding-left: 60px;
}

#loginbar {
background-color: #fff5ee;
float: left;
width: 450px;
height: 400px;
}

#info {
background-color: white;
clear: both;
width : 920px;
height: 120px;
padding-top: 20px;
font-size : 12px;
padding-left: 165px;
}

input[type=text] {
 padding: 8px;
 margin: 0px;
}

#lbtnout{
	background-color: grey;
	color: white;						
	width:280px; 
	height: 50px;
	border: 0;
}
#lbtnover{
	background-color: black;
	color: white;						
	width:280px;
	height: 50px;
	border: 0;
}
#loginunderbar{
	text-align: right;
	font-size: 12px;
}
#menubar{
	font-size: 12px;
}
#pagebtnout{
	background-color: grey;
	color: white;						
	width: 140px; 
	height: 50px;
	border: 0;
}
#pagebtnover{
	background-color: black;
	color: white;						
	width: 140px;
	height: 50px;
	border: 0;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bossmain.jsp</title>
</head>
<body>
<%
Object bologin = session.getAttribute("blogin");
BossDto boss = null;
boss = (BossDto)bologin;
%>

<div style="margin-right: 180px; text-align: right;">
<a href="main.jsp">홈</a>
</div>
<div id="container">
	<div id="header" align="center">
	<img src="image/bosslogo.png" width="600" height="300">
	</div>
    <div id="content" align="center">
    	<table style="padding-top: 90px;">
    		<tr>
			    <td colspan="2">
			   		<a href="./boss/bossmain.jsp"><img src="image/bosslist.png" width="350" height="200"></a>
			    </td>
			    <td>
			    	<img src="image/bosscalculate.png" width="350" height="200">
			    </td>
		    </tr>
    	</table>
    </div>
    
    	 <form action="account/bossloginAf.jsp" method="post">
    	 <div id="loginbar">
    	 <a href="./boss_order.jsp?boss_id=<%=boss.getBoss_id() %>">여기여기여기</a>
    	 <table align="center" style="padding-top: 75px; padding-right: 20px">
    	 <%if(bologin == null){ %>
    	 	<br> 
   			<tr>
				<td>
					<input type="text" id="boss_id" name="boss_id" size="33" placeholder="아이디 입력">
				</td>	
			</tr>
			
			<tr>
				<td>
					<input type="password" id="boss_pwd" name="boss_pwd" size="33" placeholder="비밀번호 입력">
				</td>	
			</tr>
			
			<div>
			<tr>
				<td id="menubar">
				<input type="checkbox" id="cb_saveId">아이디 저장
					<span style="float : right;">
						<a href="#" class="">ID찾기</a> | <a href="account/bossregi.jsp">회원가입</a>
				</span>
				</td>
			</tr>
			</div>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" id="lbtnout" onclick="bossSubmit(this.form)"
						onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
				</td>
			</tr>
			<%}else{ %>
			<tr align="center" style="border: 1px;">
				<td align="center"><img src="image/bosscharater.jpg" width="220" height="150"></td>
			<tr>
				<td align="center"><b><%=boss.getBoss_id() %></b> 사장님 반갑습니다.</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="내 정보 수정" id="pagebtnout" onclick="bossmypage()"
						onmouseover="this.id='pagebtnover'" onmouseout="this.id='pagebtnout'">

				<input type="button" value="로그아웃" id="pagebtnout" onclick="logout()"
						onmouseover="this.id='pagebtnover'" onmouseout="this.id='pagebtnout'">
				<!-- <a href="account/logout.jsp">로그아웃</a> -->
				</td>
			</tr>
			<%} %>
	    </table>
		</div>
		</form>

    <div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
    </div>
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
function bossmypage() {
	location.href="mypage/bosspage.jsp"
}
function logout() {
	location.href="account/logout.jsp"
}

</script>

</body>
</html>