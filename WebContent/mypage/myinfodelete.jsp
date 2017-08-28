<%@page import="customer.CustomerDto"%>
<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
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
String customer_id = request.getParameter("id");
ICustomerDao dao = CustomerDao.getInstance();

Object ologin = session.getAttribute("login");
CustomerDto dto = null;
dto = (CustomerDto)ologin;

System.out.println(dto);
%>

<div>
<form action="myinfodeleteAf.jsp" method="post" name="myform">

<table>
<tr>
	<td>
		아이디 : <input type="text" name="id" value="<%=dto.getCustomer_id() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
		비밀번호 : <input type="password" name="pwd">
	</td>
</tr>

</table>

<input type="submit" value="회원탈퇴">
<input type="button" value="취소" onclick="location.href='mydetail.jsp?id=<%=dto.getCustomer_id()%>'">

</form>
</div>


</body>
</html>

