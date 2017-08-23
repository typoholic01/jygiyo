<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@page import="boss.BossDto"%>
<%@page import="boss.BossDao"%>
<%@page import="boss.IBossDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head> 
<body>
<%
String id = request.getParameter("id");
System.out.println("id : " + id);
%>
<center>
<b><%=id %></b>
<%
ICustomerDao dao = CustomerDao.getInstance();
boolean isS = dao.IdCheck(id);
if(isS){
	out.print("는 중복 된 ID입니다.<br>사용 할 수 없습니다.<br>");
}else{
	out.print("는 사용 가능합니다<br>");
}
%>
<a href="JavaScript:window.close()">닫기</a>
</center>
</body>
</html>