<%@page import="jdbc.DBConn"%>
<%@page import="foodStore.FoodStoreDao"%>
<%@page import="foodStore.IFoodStoreDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <%
    	DBConn.initConnect();
    
    	String name = request.getParameter("name");
    	String serchpage_temp = request.getParameter("serchpage");
    	String address = request.getParameter("address");
    	System.out.println("넘어온 주소는? = " + address);
    	int serchpage = 0;
    	if(serchpage_temp == null){
    		serchpage = 1;
    	}else{
    		serchpage = Integer.parseInt(serchpage_temp);
    	}
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align="center">
<tr>
	<td><a href="foodStoreList.jsp?name=0&address=<%=address %>">전체메뉴</a></td>
	<td><a href="foodStoreList.jsp?name=1&address=<%=address %>">치킨</a></td>
	<td><a href="foodStoreList.jsp?name=2&address=<%=address %>">중국집</a></td>
	<td><a href="foodStoreList.jsp?name=3&address=<%=address %>">피자</a></td>
	<td><a href="foodStoreList.jsp?name=4&address=<%=address %>">한식</a></td>
	<td><a href="foodStoreList.jsp?name=5&address=<%=address %>">분식</a></td>
	<td><a href="foodStoreList.jsp?name=6&address=<%=address %>">족발,보쌈</a></td>
	<td><a href="foodStoreList.jsp?name=7&address=<%=address %>">일식</a></td>
	<td><a href="foodStoreList.jsp?name=8&address=<%=address %>">도시락</a></td>
	<td><a href="foodStoreList.jsp?name=9&address=<%=address %>">패스트푸드</a></td>
</tr>
</table><br>
<div align="right">
<select>
	<option selected="selected">기본정렬</option>
	<option>리뷰많은순서</option>
	<option>별점높은순서</option>
</select></div><br>
<%
	String category = "";
	IFoodStoreDao dao = FoodStoreDao.getInstance();
	List<FoodStoreDto> list = new ArrayList<>();
	// List<FoodStoreDto> foodstorelist = new ArrayList<>();
	if(name == null){ 
		category = "전체매뉴";
		name = "0";
	}
	else{
	if(name.equals("0")){category = "전체매뉴";}
	else if(name.equals("1")){category = "치킨";}
	else if(name.equals("2")){category = "중국집";}
	else if(name.equals("3")){category = "피자";}
	else if(name.equals("4")){category = "한식";}
	else if(name.equals("5")){category = "분식";}
	else if(name.equals("6")){category = "족발,보쌈";}
	else if(name.equals("4")){category = "일식";}
	else if(name.equals("8")){category = "도시락";}
	else if(name.equals("9")){category = "패스트푸드";}
	}
	
	list = dao.getAddressFoodStoreList(address, serchpage, category);
	int number = list.size() / 3;
	int number2 = list.size() % 3;
	
	/////////////////////////////////
	int paging_temp = dao.getallcount(category);
	int paging = paging_temp / 12;
	if(paging_temp % 12 != 0){
		paging++;
	}
	

%>
<table align="center" cellspacing="20">
<%
int temp = 0;
for(int i=0; i<number; i++){
%>
<tr>
<%
for(int j=0; j<3; j++){
%>
	<td style="background-color: gray;">
	<a href="foodStoreDetail.jsp?seq=<%=list.get(temp).getSeq_store() %>">
	<table>
	<td>
	<img src="<%=list.get(temp).getImg_url() %>" width="150px" height="150px">
	</td>
	<td>
	<%=list.get(temp).getTitle() %>
	</td>
	</table>
	</a>
	</td><% temp++; }%>
</tr>
<%
}
if(number2 !=0){
%>
<tr>
	<%for(int i=0; i<number2; i++){ 
	%>
		<td style="background-color: gray;">
	<a href="foodStoreDetail.jsp?seq=<%=list.get(temp).getSeq_store() %>">
	<table>
	<td>
	<img src="<%=list.get(temp).getImg_url() %>" width="150px" height="150px">
	</td>
	<td>
	<%=list.get(temp).getTitle() %>
	</td>
	</table>
	</a>
	</td><% temp++; %>
	<%
	}
	%>

</tr>
<%
}
%>
</table>
<div align="center">
<%
if(paging > 0){
for(int i=0; i<paging; i++){
%>
<a href = "foodStoreList.jsp?serchpage=<%=i+1 %>&name=<%=name %>&address=<%=address %>"><%=i+1 %></a>
<%
}
}
%>
</div>

</body>
</html>