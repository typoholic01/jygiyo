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
<title>myinfoAf.jsp</title>
</head>
<body> 

<%
String customer_id = request.getParameter("id");
String phone_number = request.getParameter("phone");
String address = request.getParameter("address");
String password = request.getParameter("password");

/* System.out.println(phone_number);
System.out.println(address);
System.out.println(password); */
ICustomerDao dao = CustomerDao.getInstance();
CustomerDto cuss = dao.getDetail(customer_id);

boolean isS = dao.modifyInfomation(customer_id, password, phone_number, address);
if(isS == true){
	%>
	<script type="text/javascript">
	alert("수정완료");
	location.href="mypage.jsp";	
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("수정실패");
	location.location.href="mypage.jsp?id=<%=cuss.getCustomer_id()%>";
	</script>
	<%
}
%>


</body>
</html>