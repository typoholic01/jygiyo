<%@page import="customer.CustomerDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="order.OrderDto"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@page import="singleton.Delegate"%>
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
	String address = request.getParameter("address");
	String pop = request.getParameter("pop");
	String count = request.getParameter("count");
	String ostore_seq = request.getParameter("store_seq");
	int store_seq = Integer.parseInt(ostore_seq);
	
	if(count == null){
	String food_name = request.getParameter("food_name");
	String ofood_price = request.getParameter("food_price");
	String ofood_count = request.getParameter("food_count");
	String ofood_seq = request.getParameter("seq_food");
	String food_size = request.getParameter("food_size");
	int seq_food = Integer.parseInt(ofood_seq);
	int food_price = Integer.parseInt(ofood_price);
	int food_count = Integer.parseInt(ofood_count);
	
	Object ologin = session.getAttribute("login");
	CustomerDto cust = null;
	if(ologin != null){
		cust = (CustomerDto)ologin;
	}
	//
	Delegate d = Delegate.getInstance(); 
	FoodStoreDto dto = d.foodStoreCtrl.getFoodStore(store_seq);
	 
	List<OrderDto> orderlist = new ArrayList<>();
	Object object_order = session.getAttribute("order");
	if(object_order != null){
		orderlist = (List<OrderDto>)object_order;
	}
	boolean b = false;
	int number = 0;
	if(orderlist.size() != 0){
	for(int i=0; i<orderlist.size(); i++){
		if(orderlist.get(i).getFood_name().equals(food_name)){
			b = true;
			number = i;
		}
	}
	}
	
	if(b){
		OrderDto ddto = new OrderDto(orderlist.get(number).getStore_name(),
				orderlist.get(number).getFood_name(),
				orderlist.get(number).getFood_price(),
				orderlist.get(number).getFood_count()+1,
				orderlist.get(number).getSeq_food(),
				orderlist.get(number).getSeq_store(),
				orderlist.get(number).getCustomer_id(),
				orderlist.get(number).getCreate_at(),
				orderlist.get(number).getStatus(),
				orderlist.get(number).getFood_size());
		orderlist.set(number, ddto);
		
	}else{
		OrderDto order_temp = new OrderDto(dto.getTitle(), food_name,
											food_price, food_count,
											seq_food, store_seq, cust.getCustomer_id(),
											"create_at", "주문대기", food_size);
		orderlist.add(order_temp);
	}
	session.setAttribute("order", orderlist);
	}else{
		String onumber = request.getParameter("number");
		int number = Integer.parseInt(onumber);
		Object oorder = session.getAttribute("order");
		List<OrderDto> orderlist = new ArrayList<>();
		if(oorder != null){
			orderlist = (List<OrderDto>)oorder;
			OrderDto dto = null;
			if(count.equals("plus")){
				dto = new OrderDto(orderlist.get(number).getStore_name(),
						orderlist.get(number).getFood_name(),
						orderlist.get(number).getFood_price(),
						orderlist.get(number).getFood_count()+1,
						orderlist.get(number).getSeq_food(),
						orderlist.get(number).getSeq_store(),
						orderlist.get(number).getCustomer_id(),
						orderlist.get(number).getCreate_at(),
						orderlist.get(number).getStatus(),
						orderlist.get(number).getFood_size());
			}else{
				int temp_number = 0;
				if(orderlist.get(number).getFood_count() == 1){
					temp_number = 1;
				}else{
					temp_number = orderlist.get(number).getFood_count() -1;
				}
				dto = new OrderDto(orderlist.get(number).getStore_name(),
						orderlist.get(number).getFood_name(),
						orderlist.get(number).getFood_price(),
						temp_number,
						orderlist.get(number).getSeq_food(),
						orderlist.get(number).getSeq_store(),
						orderlist.get(number).getCustomer_id(),
						orderlist.get(number).getCreate_at(),
						orderlist.get(number).getStatus(),
						orderlist.get(number).getFood_size());
			}
			orderlist.set(number, dto);
			session.setAttribute("order", orderlist);
			
		}
		
		
	}
	if(pop == null){
%>
<script type="text/javascript">
	location.href = "./menumain.jsp?seq=<%=store_seq %>&address=<%=address %>";
</script>
<%
}else{
%>
<script type="text/javascript">
	location.href = "../shoping.jsp";
</script>
<% } %>

</body>
</html>