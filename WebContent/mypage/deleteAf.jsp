<%@page import="customer.CustomerDto"%>
<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete.jsp</title>
</head>
<body>

<% 
String customer_id = request.getParameter("id");
String password = request.getParameter("pwd");

ICustomerDao dao = CustomerDao.getInstance();

int check = dao.userCheck(customer_id, password);

if(check==1){
	dao.deleteInfomation(customer_id);	
	session.invalidate();	
%>

<div align="center">

탈퇴하였습니다
<input type="button" value="확인" onclick="location.href='../main.jsp'">

</div>

</body>
</html>
<%}else{%>
    <!-- 무엇이 틀렸는지 안알려준다  보안! -->
    <script>
        alert("비밀번호가 맞지 않습니다.");
	
        history.go(-1);
    </script>
<%}%>
