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
<style type="text/css">
.order table {
font-family: "Lato","sans-serif"; 
}
.order table.one {                                
margin-bottom: 3em;
border-collapse:collapse;   
}  
.order td { 
text-align: center; 
width: 10em;                   
padding: 1em;
}     

.order th {
text-align: center;                
padding: 1em;
background-color: #e8503a;
color: white;       
}
.order tr {
height: 1em;
}

.order table tr:nth-child(even) {
    background-color: #eee;
}
.order table tr:nth-child(odd) {
background-color:#fff;
}
</style>
</head>
<body>
<%

Object object_order = session.getAttribute("order");
List<OrderDto> orderlist = new ArrayList<>();
if(object_order != null){
	orderlist = (List<OrderDto>)object_order;
}
%>
<table class="order">
<tr>
	<th colspan="2" style="text-align: center;">주문표에담기</th>
</tr>
<%
	int total = 0;
	for(int i=0; i<orderlist.size(); i++){
		if((i+1)%2 == 0){
%>
<tr style="text-align: center; background-color: #EDE9E9;">
<%
}else{
%>
<tr style="text-align: center; background-color: white;">
	<% }
		int sum = orderlist.get(i).getFood_price() * orderlist.get(i).getFood_count();
		total += sum;
	%>
	<td><%=orderlist.get(i).getFood_name() %></td>
	<td><a href="./foodstore/orderAf.jsp?count=minus&store_seq=<%=orderlist.get(i).getSeq_store() %>&number=<%=i %>&pop=pop">-</a><%=orderlist.get(i).getFood_count() %><a href="./foodstore/orderAf.jsp?count=plus&store_seq=<%=orderlist.get(i).getSeq_store() %>&number=<%=i %>&pop=pop">+</a></td>
</tr>
<% } %>
<tr>
	<td colspan="2" style="background-color: #E0FA5F;">총 가격 : <%=total %> 원</td>
</tr>
<form action="./foodstore/order_finalAf.jsp">
<input type="hidden" name="pop" value="pop">
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="주문완료" style="width: 30em; height: 5em;">
	</td>
	</tr>
</form>
</table>

</body>
</html>