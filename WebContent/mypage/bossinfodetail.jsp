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
<title>bossinfodetail.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/a.css">
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

Object bologin = session.getAttribute("blogin");
BossDto boss = (BossDto)bologin;

IBossDao dao = BossDao.getInstance();

BossDto bossRe = dao.getDetail(boss_id);


%>
<div align="right" id="menubar">
<%

if(bologin != null){%>	
	<b><%=boss.getBoss_id() %> 사장님</b>
	<a href="../account/logout.jsp" >로그아웃</a> | <a href="./bosspage.jsp" >마이페이지</a>
<%} %>
</div>

<div align="center">
<form action="./bossinfoAf.jsp" method="post">

<table width="800">

<col width="200"><col width="200"><col width="200"><col width="200">
<tr>
	<td colspan="4" align="center">
		<a href="../main.jsp" ><img src="../image/logo3.png"></a>
	</td>
</tr>
<tr id="menubar" align="left">
	<td colspan="4" align="left">
		<a href="../bmain.jsp">홈</a>
		> <a href="./bosspage.jsp" >마이페이지</a>	
		> <a href="./bossinfodetail.jsp?id=<%=boss.getBoss_id()%>" ><b>내 정보</b></a>
	</td>		
</tr>
<tr height="40">
</tr>


<tr>
	<td colspan="2">
		<a href="./bossinfodetail.jsp?id=<%=boss.getBoss_id()%>" >
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
		<h2><b>내 정보</b><hr></h2>
	</td>
</tr>

<tr>
	<td><b>저기요 사장님ID</b></td>
	<td colspan="2">
		<input type="hidden" name="id" value="<%=boss.getBoss_id() %>">
		<%=boss.getBoss_id() %></td>
</tr>
<tr height="25">
</tr>
<tr>
	<td><b>이름</b></td>
	<td><%=boss.getUser_name() %></td>
</tr>
<tr height="25">
</tr>
<tr>
	<td><b>연락처</b></td>
	<td colspan="2">
		<%=bossRe.getPhone_number() %>
	</td>	
</tr>
<tr height="20">
</tr>

<tr height="20">
</tr>

<tr height="20">
</tr>
<tr>
	<td colspan="3" align="center"> 		
		<input type="button" size="600" value="변경하기" id="lbtnout1" onclick="updateinfo('<%=boss.getBoss_id() %>')"
		 onmouseover="this.id='lbtnover1'"  onmouseout="this.id='lbtnout1'">	
	</td>	
	<td colspan="1" align="center">
		<input type="button" value="탈퇴하기" id="lbtnout2" onclick="deleteinfo('<%=boss.getBoss_id() %>')"
		 onmouseover="this.id='lbtnover2'" onmouseout="this.id='lbtnout2'">
	</td>			
</tr>

<tr height="40">
</tr>

</table>

</form>

</div>

<script type="text/javascript">
function updateinfo(id) {
	location.href = "bossinfoupdate.jsp?id=" + id;
}
function deleteinfo(id) {
	location.href = "bossinfodelete.jsp?id=" + id;
}
</script>

</body>

</html>
