<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="food.FoodDto"%>
<%@page import="singleton.Delegate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
function goMain() {
	parent.goMain();
	parent.DoSend();
}
</script>
<style type="text/css"> 
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
    ul,li {margin:0; padding:0;}
    .menu_1 A:link {text-decoration:none; color:white;}
	.menu_1 A:visited {text-decoration:none; color:white;}
	.menu_1 A:active {text-decoration:none; color:orange;}
	.menu_1 A:hover {text-decoration:none; color:orange;}
	ul{
   list-style:none;
   }
	
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

</head>
<body style="background-color: #FCEFDA;">
<%
	String address = request.getParameter("address");
	int seq = Integer.parseInt(request.getParameter("seq"));
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
	System.out.println("주소는??? >> " + address);
%>
<br><br>
<% if (category.size() != 0) { %>
<% System.out.println("사이즈? "+category.size()); %>
<table align="center" cellspacing="30">
<tr>
<th>
<div>
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
          			 <table style="background-color: white; border-style: solid; width: 500px;">
                		<td style="width: 230px; text-align: left;"><%=list.get(j).getFood_name() %>
                			&nbsp;사이즈:(<%=list.get(j).getFood_size() %>)
                		</td>
               			 <td style="width: 170px; text-align: right;"><%=list.get(j).getFood_price() %>원</td>
               		 </table>
               		 </a> 
           			<ul class="hide">
               		 <table style="background-color: #F2F2F2; width: 500px;">
               		 <tr>
               		 	<td>
               		 		<img src="${pageContext.request.contextPath}/upload/img/<%=list.get(j).getImg_url() %>" width="150px" height="150px">
               		 	</td>
               		 	<td>
               		 		<%=list.get(j).getFood_name() %>
               		 	</td>
               		 </tr>
               		 <tr>
               		 	<td style="text-align: center;" colspan="2">
               		 		<form action="orderAf.jsp">
               		 			<input type="hidden" name="store_seq" value="<%=seq %>">
               		 			<input type="hidden" name="food_name" value="<%=list.get(j).getFood_name() %>">
               		 			<input type="hidden" name="food_price" value="<%=list.get(j).getFood_price() %>">
               		 			<input type="hidden" name="seq_food" value="<%=list.get(j).getSeq_food() %>">
               		 			<input type="hidden" name="food_size" value="<%=list.get(j).getFood_size() %>">
               		 			<input type="hidden" name="food_count" value="1">
               		 			<input type="hidden" name="address" value="<%=address %>">
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
</th>
<th>
<div>
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
	<td><a href="orderAf.jsp?count=minus&store_seq=<%=seq %>&number=<%=i %>&address=<%=address %>">-</a><%=orderlist.get(i).getFood_count() %><a href="orderAf.jsp?count=plus&store_seq=<%=seq %>&number=<%=i %>&address=<%=address %>">+</a></td>
</tr>
<% } %>
<tr>
	<td colspan="2" style="background-color: #E0FA5F;">총 가격 : <%=total %> 원</td>
</tr>
<form action="order_finalAf.jsp">
<input type="hidden" name="seq" value="<%=seq %>">
<input type="hidden" name="address" value="<%=address %>">
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="주문완료" style="width: 30em; height: 5em;">
	</td>
	</tr>
</form>
</table>
</div>
</th>
</tr>
</table>
<% } %>
<% if (category.size() == 0) { %>
<div style="text-align: center;">
<img src="${pageContext.request.contextPath}/image/open_soon.png" alt="" style="width: 25%;" />
</div>
<% } %>
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