<%@page import="singleton.Delegate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="order.OrderDto"%>
<%@page import="customer.CustomerDto"%>
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
Object ologin = session.getAttribute("login");
CustomerDto cust = null;
if(ologin != null){
	cust = (CustomerDto)ologin;
}
Delegate d = Delegate.getInstance();
List<OrderDto> orderlist = d.orderCtrl.getcustorderlist(cust.getCustomer_id());
%>

<table>
<tr>
	<th>음식이름</th>
	<th>가격</th>
	<th>수량</th>
	<th>상태</th>
</tr>
<%
	for(int i=0; i<orderlist.size(); i++){
%>
<tr>
	<td><%=orderlist.get(i).getFood_name() %></td>
	<td><%=orderlist.get(i).getFood_price() %></td>
	<td><%=orderlist.get(i).getFood_count() %></td>
	<td><%=orderlist.get(i).getStatus() %></td>
</tr>
<% } %>
</table>
</body>
</html>