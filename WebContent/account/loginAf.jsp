<%@page import="customer.CustomerDto"%>
<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>

<%
String customer_id = request.getParameter("id");
String password = request.getParameter("pwd");

ICustomerDao dao = CustomerDao.getInstance();
CustomerDto cus = dao.checkLogin(new CustomerDto(customer_id, null, password, null, null, null));

System.out.println("customer_id = " + customer_id);
System.out.println("password = " + password);
System.out.println(cus);

if(cus != null && !cus.getCustomer_id().equals("")){
	session.setAttribute("login", cus);
	session.setMaxInactiveInterval(30 * 60);
	%>
	<script type="text/javascript">
	alert("안녕하세요 <%= cus.getCustomer_id()%>님");
	location.href = "../main.jsp";
	</script>	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("아이디나 패스워드를 확인하세요");
	location.href = "login.jsp";
	</script>
	<%
}	
%>
	

</body>
</html>







