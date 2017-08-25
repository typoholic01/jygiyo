<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
<body>
<h1>OrderList</h1>
<c:forEach items="${orderList }" var="order">
<table>
	<tr>
		<th>SEQ_ORDER</th>
		<th>SEQ_FOOD</th>
		<th>SEQ_STORE</th>
		<th>CUSTOMER_ID</th>
		<th>CREATE_AT</th>
		<th>STATUS</th>
		<th>FOOD_NAME</th>
		<th>FOOD_PRICE</th>
		<th>FOOD_COUNT</th>
	</tr>
	<tr>
		<td>${order.seq_order }</td>
		<td>${order.seq_food }</td>
		<td>${order.seq_store }</td>
		<td>${order.customer_id }</td>
		<td>${order.create_at }</td>
		<td>${order.status }</td>
		<td>${order.food_name }</td>
		<td>${order.food_price }</td>
		<td>${order.food_count }</td>
	</tr>
</table>
</c:forEach>
</body>
</html>