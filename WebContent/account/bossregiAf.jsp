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
<title>regiAf.jsp</title>
</head>
<body>
<%
String boss_id = request.getParameter("regi_id");
String user_name = request.getParameter("name");
String password = request.getParameter("pwd");
String phone_number = request.getParameter("phone");
IBossDao dao = BossDao.getInstance();

boolean isS = dao.sign(new BossDto(boss_id, user_name, password, phone_number));
if(isS){ 
	%>
	<script type="text/javascript">
	alert("성공적으로 가입하셨습니다");
	location.href = '../main.jsp';
	</script>
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("중복 된 ID거나 잘못 입력 하셨습니다.");
	location.href = 'bossregi.jsp';
	</script>
<%}%>


</body>
</html>







