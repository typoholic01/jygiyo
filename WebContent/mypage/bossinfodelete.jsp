<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@page import="boss.BossDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴</title>
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

<div>
<form action="bossinfodeleteAf.jsp" method="post" name="myform">

<table>
<tr>
	<td>
		아이디 : <input type="text" name="id" value="<%=dto.getBoss_id()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
		비밀번호 : <input type="password" name="pwd">
	</td>
</tr>

</table>

<input type="submit" value="회원탈퇴">
<input type="button" value="취소" onclick="location.href='bossinfodetail.jsp?id=<%=dto.getBoss_id()%>'">

</form>
</div>


</body>
</html>

