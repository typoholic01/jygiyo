<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String address = request.getParameter("address"); 
%>
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
<div style="background-color: white;" align="center">
<a href="../index.jsp">
<img src="${pageContext.request.contextPath}/image/logo.png" alt="저기요">
</a>
</div>
<div style="background-color: black;">
<table align="center" class="menu_1">
<tr>
	<td><a href="../store/foodStoreList.jsp?name=0&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/all_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>전체매뉴</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=1&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/chicken_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>치킨</th>
	</tr>
	</table>
	</a>
	</td>
	<td>
	<a href="../store/foodStoreList.jsp?name=2&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/jjajang_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>중국집</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=3&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/pizza_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>피자</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=4&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/hansik_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>한식</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=5&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/bun_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>분식</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=6&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/pig_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>족발,보쌈</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=7&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/jj_mini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>일식</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=8&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/dosirak_mmini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>도시락</th>
	</tr>
	</table>
	</a>
	</td>
	<td><a href="../store/foodStoreList.jsp?name=9&address=<%=address %>">
	<table>
	<tr>
	<th><img src="../image/fastfood_mmini.png" width="80px" height="80px"></th>
	</tr>
	<tr>
	<th>패스트푸드</th>
	</tr>
	</table>
	</a>
	</td>
</tr>
</table>
</div>