<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@page import="boss.BossDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/a.css">
<title>탈퇴</title>

<style type="text/css">
input[type=text] {
 padding: 8px;
 margin: 0px;
}
input[type=password] {
 padding: 8px;
 margin: 0px;
}
#lbtnout{
	background-color: white;
	color: gray;						
	width: 400px; 
	height: 50px;
	border: 1;
}
#lbtnover{
	background-color: black;
	color: white;						
	width: 400px;
	height: 50px;
	border: 0;
}
#lbtnout1{
	background-color: #696969;
	color: white;						
	width: 600px; 
	height: 50px;
	border: 0;
}
#lbtnout2{
	background-color: #696969;
	color: white;						
	width: 200px; 
	height: 50px;
	border: 0;
}
#lbtnover1{
	background-color: black;
	color: white;						
	width: 600px;
	height: 50px;
	border: 0;
}

#lbtnover2{
	background-color: black;
	color: white;						
	width: 200px;
	height: 50px;
	border: 0;
}
#loginunderbar{
	text-align: right;
	font-size: 12px;
}

a.no-uline { text-decoration:none }

#menubar{
	text-align: right;
	font-size: 12px;
	margin-right: 180px;
}

</style>

</head>
<body>
<%
String boss_id = request.getParameter("id");
IBossDao dao = BossDao.getInstance();

Object bologin = session.getAttribute("blogin");
BossDto dto = null;
dto = (BossDto)bologin;

System.out.println(dto);
%>
<div align="right" id="menubar">
<%

if(bologin != null){%>	
	<b><%=dto.getBoss_id()%> 사장님</b>
	<a href="../account/logout.jsp" >로그아웃</a> | <a href="./bosspage.jsp" >마이페이지</a>
<%} %>
</div>

<div align="center">
<form action="bossinfodeleteAf.jsp" method="post" name="myform">

<table width="800">
<col width="200"><col width="200"><col width="200"><col width="200">
<tr>
	<td colspan="4" align="center">
		<a href="../main.jsp" ><img src="../image/logo3.png"></a>
	</td>
</tr>
<tr id="menubar" align="left">
	<td colspan="4" align="left">
		<a href="../main.jsp" >홈</a>
		> <a href="./bosspage.jsp" >마이페이지</a>	
		> <a href="./bossinfodetail.jsp?id=<%=dto.getBoss_id() %>" >내 정보</a>
		> <a href=".bossinfodelete.jsp?id=<%=dto.getBoss_id() %>"><b>회원탈퇴</b></a>
	</td>		
</tr>
<tr height="40">
</tr>
<tr>
	<td colspan="2">
		<a href="./bossinfodetail.jsp?id=<%=dto.getBoss_id()%>">
			<input type="button" value="내 정보" id="lbtnout" style="background-color: black; color: white; font-size: 20"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
		</a>
	</td>
	<td colspan="2">
		<a href="../boss/bossmain.jsp">	
			<input type="button" value="업체정보 수정" id="lbtnout"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">	
		</a>
	</td>
</tr>
<tr>
	<td colspan="4" align="left">
		<h2><b>회원탈퇴</b><hr></h2>
	</td>
</tr>
<tr>
	<td><b>저기요 ID</b></td>
	<td colspan="2">
		<input type="text" name="id" size="50" value="<%=dto.getBoss_id() %>" readonly>
	</td>
</tr>
<tr height="55">
</tr>
<tr>
	<td><h3>비밀번호 확인</h3></td>
</tr>
<tr>
	<td colspan="3" style="font-size: 8">회원탈퇴를 원하실 경우, 본인확인을 위해 비밀번호를 한 번 더 입력 해주세요.</td>
</tr>
<tr height="15">
</tr>
<tr>
	<td><b>비밀번호</b></td>
	<td colspan="2">
		<input type="password" size="50" name="pwd" placeholder="비밀번호를 입력해주세요">
	</td>
</tr>
<tr height="45">
</tr>
<tr>		
	<td colspan="3">
		<input type="submit" value="회원탈퇴" id="lbtnout1" onmouseover="this.id='lbtnover1'"  onmouseout="this.id='lbtnout1'">
	</td>
	<td colspan="1">
		<a href="./bossinfodetail.jsp?id=<%=dto.getBoss_id()%>">
			<input type="button" value="취소" id="lbtnout2" onmouseover="this.id='lbtnover2'" onmouseout="this.id='lbtnout2'">
		</a>
	</td>	
</tr>
<tr height="45">
</tr>

</table>

</form>
</div>


</body>
</html>

