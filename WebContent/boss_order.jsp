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
#info {
background-color: white;
clear: both;
width : 1500px;
height: 120px;
padding-top: 20px;
font-size : 12px;
padding-left: 165px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setInterval(refresh, 30000);
})
function refresh() {
	location.reload();
}
</script>
</head>
<body style="background-color: #FCEFDA;">
<%
	String boss_id = request.getParameter("boss_id");
	List<FoodStoreDto> storelist = new ArrayList<>();
	Delegate d = Delegate.getInstance();
	storelist = d.foodStoreCtrl.getBossFoodStoreList(boss_id);
%>
<div style="background-color: white;" align="center">
<a href="./index.jsp"><img src="./image/logo.png" alt="저기요" height="300px" width="350px"></a>
</div>
	<div align="center">
	<table class="order">
<%
	for(int i=0; i<storelist.size(); i++){
%>
	<tr><th colspan="6"><h3><%=storelist.get(i).getTitle() %> 가게</h3></th></tr>
	<tr>
		<th>주문고객</th>
		<th>주문매뉴</th>
		<th>가격</th>
		<th>갯수</th>
		<th>주문시각</th>
		<th>확인하기</th>
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
	<td><a href="./boss_orderAf.jsp?seq_order=<%=orderlist.get(j).getSeq_order() %>">접수완료하기</a></td>
	</tr>
<% }%>
<% } %>
</table>
</div>
<br><br><br>
<div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
    </div>
</div>
</body>
</html>