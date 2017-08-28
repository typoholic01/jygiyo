<%@page import="boss.BossDto"%>
<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>

<%
String id = request.getParameter("boss_id");
String pwd = request.getParameter("boss_pwd");

IBossDao dao = BossDao.getInstance();
BossDto boss = dao.checkLogin(new BossDto(id,null,pwd,null,null));

System.out.println("id = " + id);
System.out.println("password = " + pwd);
System.out.println(boss);

if(boss != null && !boss.getBoss_id().equals("")){
	session.setAttribute("blogin", boss);
	session.setMaxInactiveInterval(30 * 60);
	%>
	<script type="text/javascript">
	alert("안녕하세요 <%= boss.getBoss_id()%>님");
	location.href = "../bmain.jsp";
	</script>	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("아이디나 패스워드를 확인하세요");
	location.href = "bosslogin.jsp";
	</script>
	<%
}	
%>
	

</body>
</html>







