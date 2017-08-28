<%@page import="order.OrderDao"%>
<%@page import="order.IOrderDao"%>
<%@page import="singleton.Delegate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderDto"%>
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
	String pop = request.getParameter("pop");
	Object oorder = session.getAttribute("order");
	List<OrderDto> orderlist = new ArrayList<>();
	if(oorder != null){
		orderlist = (List<OrderDto>)oorder;
	}
	Delegate d = Delegate.getInstance();
	
	boolean isS = d.orderCtrl.order_final(orderlist);
	if(isS){
		int w = 0;
		while(w<1){
		for(int i=0; i<orderlist.size(); i++){
			orderlist.remove(0);
		}
		if(orderlist.size() == 0){
			w++;
		}
		}
		session.setAttribute("order", orderlist);
		if(pop != null){
	%>
		<script type="text/javascript">
		alert("주문완료!!");
		location.href = '../index.jsp?close=close';
		</script>
	<%
	}else{
	%>
	<script type="text/javascript">
		alert("주문완료!!");
		location.href = '../index.jsp';
	</script>
	<%
	}
	}else{
	%>
		<script type="text/javascript">
		alert("주문실패 ㅠㅠ");
		location.href = '../index.jsp';
		</script>
	<%
	}
	%>

</body>
</html>