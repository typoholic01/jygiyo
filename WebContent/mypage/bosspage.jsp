<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@page import="boss.BossDto"%>
<%@page import="customer.CustomerDto"%>
<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/a.css">
<style type="text/css">
#menubar{
	text-align: right;
	font-size: 12px;
	margin-right: 180px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bossmypage.jsp</title>

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
	background-color: gray;
	color: white;						
	width: 400px; 
	height: 50px;
	border: 0;
}
#lbtnover{
	background-color: black;
	color: white;						
	width: 400px;
	height: 50px;
	border: 0;
}
#loginunderbar{
	text-align: right;
	font-size: 12px;
}
</style>

</head>
<body>
<%
Object bologin = session.getAttribute("blogin");
IBossDao dao = BossDao.getInstance();
BossDto boss = (BossDto)bologin;
%>
<div align="right" id="menubar">
<%

if(bologin != null){%>	
	<b><%=boss.getBoss_id()%> 사장님</b>
	<a href="../account/logout.jsp">로그아웃</a> | <a href="./bosspage.jsp">마이페이지</a>
<%} %>

</div>



<div align="center">
<form>
<table width="800">
<col width="400"><col width="400">
<tr>
	<td colspan="2" align="center">
		<a href="../main.jsp"><img src="../image/logo3.png"></a>
	</td>
</tr>
<tr id="menubar" align="left">
	<td colspan="2" align="left">
		<a href="../bmain.jsp">홈</a>
		> <a href="./bosspage.jsp"><b>마이페이지</b></a>	
	</td>	
	
</tr>

<tr>
	<td colspan="2" align="left">
		<h1><b>마이페이지</b></h1>
	</td>
</tr>
<tr>
	<td align="center">
		<img src="../image/chef.png">
	</td>
	<td align="center">
		<img src="../image/chef.png">
	</td>	
</tr>
<tr>
	<td>
		<a href="bossinfodetail.jsp?id=<%=boss.getBoss_id() %>">
			<input type="button" value="내 정보" id="lbtnout"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
		</a>
	</td>
	<td>
		<a href="../boss/bossmain.jsp">	
			<input type="button" value="업체정보 수정" id="lbtnout"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">	
		</a>
	</td>
</tr>

</table>

</form>

</div>

</body>
</html>
