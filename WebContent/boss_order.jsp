<%@page import="order.OrderDto"%>
<%@page import="singleton.Delegate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setInterval(refresh, 60000);
})
function refresh() {
	location.reload();
}
</script>
</head>
<body>
<%
	String boss_id = request.getParameter("boss_id");
	List<FoodStoreDto> storelist = new ArrayList<>();
	Delegate d = Delegate.getInstance();
	storelist = d.foodStoreCtrl.getBossFoodStoreList(boss_id);
%>
	<table>
<%
	for(int i=0; i<storelist.size(); i++){
%>
	<tr><th colspan="5"><h3><%=storelist.get(i).getTitle() %> 가게</h3></th></tr>
	<tr>
		<th>주문고객</th>
		<th>주문매뉴</th>
		<th>가격</th>
		<th>갯수</th>
		<th>주문시각</th>
	</tr>
<%
		List<OrderDto> orderlist = d.orderCtrl.getOrderList_boss(storelist.get(i).getSeq_store());
		for(int j=0; j<orderlist.size(); j++){
%>
	<tr>
	<td><%=orderlist.get(j).getCustomer_id() %> 님</td>
	<td><%=orderlist.get(j).getFood_name() %></td>
	<td><%=orderlist.get(j).getFood_price() %></td>
	<td><%=orderlist.get(j).getFood_count() %></td>
	<td><%=orderlist.get(j).getCreate_at() %></td>
	</tr>
<% }%>
<% } %>
</table>
</body>
</html>