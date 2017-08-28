<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="food.FoodDto"%>
<%@page import="singleton.Delegate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.6.2.min.js"></script>
<style> 
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style> 

<style>
ul{
   list-style:none;
   }
</style>
</head>
<body>
<a href="../index.jsp">메인돌아가기</a><br>
<%
	String seq_temp = request.getParameter("seq");
	int seq = Integer.parseInt(seq_temp);
	Delegate d = Delegate.getInstance();
	List<FoodDto> list = d.foodCtrl.getFoodList(seq);
	List<String> category = new ArrayList<>();
	for(int i=0; i<list.size(); i++){
		if(category.size() != 0){
			boolean b = false;
			for(int j=0; j<category.size(); j++){
				if(category.get(j).equals(list.get(i).getFood_category())){
					b = true;
				}
			}
			if(!b){
				category.add(list.get(i).getFood_category());
			}
			
		}else{
			category.add(list.get(i).getFood_category());
		}
	}
	for(int i=0; i<category.size(); i++){
	System.out.println("카테고리 > " + category.get(i));
	}
	
	List<OrderDto> orderlist = new ArrayList<>();
	Object object_order = session.getAttribute("order");
	if(object_order != null){
		orderlist = (List<OrderDto>)object_order;
	}
%>
<div style="display: inline-block; position: absolute;">
    <ul>
    	<%
    		for(int i=0; i<category.size(); i++){
    	%>
        <li class="menu">
            <a><div style="width: 500px; background-color: black; color: yellow; font-size: 20px">
            <table>
            <td align="left" style="text-align: left; width: 250px;"><%=category.get(i) %></td>
            <td align="right" style="text-align: right; width: 250px;">▼</td>
            </table>
            </div></a>
            <ul class="hide">
            	<% for(int j=0; j<list.size(); j++){
            		if(list.get(j).getFood_category().equals(category.get(i))){
            			
            	%>
                <li>
                <ul>
        			<li class="menu">
        			<a>
          			 <table>
                		<td style="width: 230px; text-align: left;"><%=list.get(j).getFood_name() %>
                			&nbsp;사이즈:(<%=list.get(j).getFood_size() %>)
                		</td>
               			 <td style="width: 170px; text-align: right;"><%=list.get(j).getFood_price() %>원</td>
               		 </table>
               		 </a> 
           			<ul class="hide">
               		 <table>
               		 <tr>
               		 	<td>
               		 	<img src="../uploadimg/<%=list.get(j).getImg_url() %>" width="150px" height="150px">
               		 	</td>
               		 </tr>
               		 <tr>
               		 	<td style="text-align: center;">
               		 		<form action="orderAf.jsp">
               		 			<input type="hidden" name="store_seq" value="<%=seq %>">
               		 			<input type="hidden" name="food_name" value="<%=list.get(j).getFood_name() %>">
               		 			<input type="hidden" name="food_price" value="<%=list.get(j).getFood_price() %>">
               		 			<input type="hidden" name="seq_food" value="<%=list.get(j).getSeq_food() %>">
               		 			<input type="hidden" name="food_size" value="<%=list.get(j).getFood_size() %>">
               		 			<input type="hidden" name="food_count" value="1">
               		 			<input type="submit" value="주문표에 담기">
               		 		</form>
               		 	</td>
               		 </tr>
               		 </table>
            		</ul>
       			 </li>
 
    			</ul>
                
                </li>
                <% } } %>
            </ul>
        </li>
        <br>
        <% } %>
    </ul>
</div>
<br><br>
<div style="float: right; display: inline-block; margin-right: 200px;">
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
	<td><a href="orderAf.jsp?count=minus&store_seq=<%=seq %>&number=<%=i %>">-</a><%=orderlist.get(i).getFood_count() %><a href="orderAf.jsp?count=plus&store_seq=<%=seq %>&number=<%=i %>">+</a></td>
	<td><%=sum %></td>
</tr>
<% } %>
<tr>
	<td colspan="2">총가격</td>
	<td colspan="2"><%=total %></td>
</tr>
<form action="order_finalAf.jsp">
<tr>
	<td colspan="5" align="center">
		<input type="submit" value="주문완료">
	</tr>
</form>
</table>
</div>
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
</body>
</html>