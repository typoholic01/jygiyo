<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@page import="customer.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myinfo.jsp</title>
</head>
<body>
<div align="right">
<a href="./mypage.jsp">마이페이지로</a>
</div>
<h3>여기는 myinfo.jsp 입니다</h3>

<h1 align="center">마이페이지</h1>
<%
String customer_id = request.getParameter("id");
ICustomerDao dao = CustomerDao.getInstance();

Object ologin = session.getAttribute("login");
CustomerDto dto = null;
dto = (CustomerDto)ologin;

System.out.println(dto);
%>


<div>
<form action="./myinfoAf.jsp" method="post">


<table align="center">
<col width="200" ><col width="200">

<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td>아이디</td>
	<td>
		<input type="hidden" name="id" value="<%=dto.getCustomer_id() %>">
		<%=dto.getCustomer_id() %>
	</td>
</tr>

<tr>
	<td>이름</td>
	<td>
		<%=dto.getUser_name() %>
	</td>
</tr>
<tr>
	<td>연락처</td>
	<td>
		<input type="text" name="phone" value="<%=dto.getPhone_number() %>">
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<input type="text" name="address" value="<%=dto.getAddress() %>">
	</td>
</tr>


<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>


<tr>
	<td>신규 비밀번호</td>
	<td>
		<input type="text" name="password" value="">
	</td>	
</tr>



<tr>
	<td colspan="2" align="center">
		<input type="submit" value="정보 저장">
		<input type="reset" value="취소">
	</td>		
	
</tr>

</table>
</form>

</div>

<div>
	<a href="deleteform.jsp">
		<input type="button" value="회원탈퇴" >
	</a>	
</div>


</body>
</html>











