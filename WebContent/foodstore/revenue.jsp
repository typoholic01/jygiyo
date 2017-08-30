<%@page import="boss.BossDto"%>
<%@page import="order.OrderDto"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@page import="java.util.List"%>
<%@page import="singleton.Delegate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<!-- JAVA -->
<% 
BossDto boss = (BossDto)session.getAttribute("blogin");

Delegate d = Delegate.getInstance();

List<FoodStoreDto> shopList = d.foodStoreCtrl.getBossFoodStoreList(boss.getBoss_id());

long shopPrice = 0;
long fullPrice = 0;

%>
<table class="table table-hover">
	<tr class="info">
		<td>주문고객</td>
		<td>주문메뉴</td>
		<td>가격</td>
		<td>갯수</td>
		<td>주문일자</td>
	</tr>
	<% for (FoodStoreDto dto : shopList) {
		List<OrderDto> list = d.orderCtrl.getOrderList_boss(dto.getSeq_store());

		shopPrice = 0;
	%>
	<tr>
		<th colspan="5" class="active"><%=dto.getTitle() %></td>
	</tr>
	<% 
		for (OrderDto order : list) {
	%>
	<tr>
		<td><%=order.getCustomer_id() %></td>
		<td><%=order.getFood_name() %></td>
		<td><%=order.getFood_price() %></td>
		<td><%=order.getFood_count() %></td>
		<td><%=order.getCreate_at() %></td>
	</tr>
	<%	
	shopPrice += order.getFood_price() * order.getFood_count();
		}
	%>
	<% if (shopPrice != 0) { %>
	<tr id="result">
		<td colspan="2">가게 매상</td>
		<td colspan="3"><%=shopPrice %></td>
	</tr>
		<% } %>
	<% 	
	fullPrice += shopPrice;
		}  
	%>
	<tr>
		<th colspan="2">전체 매상</th>
		<th colspan="3"><%=fullPrice %></th>
	</tr>
</table>


</body>
</html>