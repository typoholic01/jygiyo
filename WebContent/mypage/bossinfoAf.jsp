<%@page import="boss.BossDto"%>
<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bossmyinfoAf.jsp</title>
</head>
<body> 

<%
String boss_id = request.getParameter("id");
String phone_number = request.getParameter("phone");
String password = request.getParameter("password");
/* System.out.println(dto); */

IBossDao dao = BossDao.getInstance(); 
BossDto boss = dao.getDetail(boss_id);

boolean isS = dao.modifyInfomation(boss_id, phone_number, password);
System.out.println(phone_number);
System.out.println(password);
if(isS == true){
	%>
	<script type="text/javascript">
	alert("수정완료");
	location.href="bosspage.jsp";	
	</script>
	<%
	
}else{
	%>
	<script type="text/javascript">
	alert("수정실패");
	location.href="bosspage.jsp?id=<%=boss.getBoss_id() %>";
	</script>
	<%
}
%>


</body>
</html>