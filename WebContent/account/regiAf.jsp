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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>regiAf.jsp</title>
</head>
<body>
<%
String customer_id = request.getParameter("id");
String user_name = request.getParameter("name");
String password = request.getParameter("pwd");
String phone_number = request.getParameter("phone");
String address = request.getParameter("address");
String status = request.getParameter("status");

ICustomerDao dao = CustomerDao.getInstance();

boolean isS = dao.sign(new CustomerDto(customer_id, user_name, password, phone_number, address, status));
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
	alert("다시 가입하십시오");
	location.href = 'regi.jsp';
	</script>
	<%
}	
%>


</body>
</html>







