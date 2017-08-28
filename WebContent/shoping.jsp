<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

Object object_order = session.getAttribute("order");
List<OrderDto> orderlist = new ArrayList<>();
if(object_order != null){
	orderlist = (List<OrderDto>)object_order;
}
%>
<table>
<tr>
	<td colspan="4" style="text-align: center;">주문표</td>
</tr>
<tr>
	<th>가게이름</th>
	<th>음식이름</th>
	<th>가격</th>
	<th>개수</th>
	<th>합</th>
</tr>
<%
	int total = 0;
	for(int i=0; i<orderlist.size(); i++){
%>
<tr style="text-align: center;">
	<% int sum = orderlist.get(i).getFood_price() * orderlist.get(i).getFood_count();
	   total += sum;
	%>
	<td><%=orderlist.get(i).getStore_name() %></td>
	<td><%=orderlist.get(i).getFood_name() %></td>
	<td><%=orderlist.get(i).getFood_price() %></td>
	<td><a href="foodstore/orderAf.jsp?count=minus&store_seq=<%=orderlist.get(i).getSeq_store() %>&number=<%=i %>&pop=pop">-</a><%=orderlist.get(i).getFood_count() %><a href="foodstore/orderAf.jsp?count=plus&store_seq=<%=orderlist.get(i).getSeq_store() %>&number=<%=i %>&pop=pop">+</a></td>
	<td><%=sum %></td>
</tr>
<% } %>
<tr>
	<td colspan="2">총가격</td>
	<td colspan="2"><%=total %></td>
</tr>
<form action="foodstore/order_finalAf.jsp">
<input type="hidden" name="pop" value="pop">
<tr>
	<td colspan="5" align="center">
		<input type="submit" value="주문완료">
	</tr>
</form>
</table>

</body>
</html>