<%@page import="singleton.Delegate"%>
<%@page import="jdbc.DBConn"%>
<%@page import="foodStore.FoodStoreDao"%>
<%@page import="foodStore.IFoodStoreDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <%
    	DBConn.initConnect();
    
    	String name = request.getParameter("name");
    	String serchpage_temp = request.getParameter("serchpage");
    	String address = request.getParameter("address");
    	if(address.equals("어느동네?") || address.equals("")){
    		address = "all";
    	}
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type"text/css">
.menu A:link {text-decoration:none; color:white;}
.menu A:visited {text-decoration:none; color:white;}
.menu A:active {text-decoration:none; color:orange;}
.menu A:hover {text-decoration:none; color:orange;}
.list A:link {text-decoration:none; color:black;}
.list A:visited {text-decoration:none; color:black;}
.list A:active {text-decoration:none; color:black;}
.list A:hover {text-decoration:none; color:black;}
#info {
background-color: white;
clear: both;
width : 1500px;
height: 120px;
padding-top: 20px;
font-size : 12px;
padding-left: 165px;
}
.task-list {
  width: 250px;
  float: left;
  margin: 0 5px;
  background-color: #e3e3e3;
  min-height: 240px;
  border-radius: 10px;
  padding-bottom: 15px;
}
.task-list input, .task-list textarea {
  width: 240px;
  margin: 1px 5px;
}
.task-list input {
  height: 30px;
}
.todo-task {
  border-radius: 5px;
  background-color: #fff;
  width: 230px;
  margin: 5px;
  padding: 5px;
}
.task-list input[type="button"] {
  width: 100px;
  margin: 5px;
}
.todo-task > .task-header {
  font-weight: bold;
}
.todo-task > .task-date {
  font-size: small;
  font-style: italic;
}
.todo-task > .task-description {
  font-size: smaller;
}
h3 {
  text-align: center;
}
#delete-div {
  background-color: #fff;
  border: 3px dotted #000;
  margin: 10px;
  height: 75px;
  line-height: 75px;
  text-align: center;
}
</style>

</head>
<body style="background-color: #FCEFDA;">
<div id="header">
<c:import url="../foodstore/header.jsp">
<c:param name="address">${param.address }</c:param>
</c:import>
</div>
<br>
<%
	String category = "";
	Delegate d = Delegate.getInstance();
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
	System.out.println("category: "+ category);
	list = d.foodStoreCtrl.getAddressFoodStoreList(address, serchpage, category);
	int number = list.size() / 3;
	int number2 = list.size() % 3;
	System.out.println(list.toString());
	//////////////////////
	
	/////////////////////////////////
	int paging_temp =  d.foodStoreCtrl.getallcount(category);
	int paging = paging_temp / 12;
	if(paging_temp % 12 != 0){
		paging++;
	}
	

%>
<table align="center" cellspacing="30" class="list">
<%
int temp = 0;
for(int i=0; i<number; i++){
%>
<tr>
<%
for(int j=0; j<3; j++){
%>
	<td>
	<a href="../foodstore/storemenu.jsp?seq=<%=list.get(temp).getSeq_store() %>&address=<%=address %>">
	<div class="task-list" id="pending">
	<div align="center"><br>
	<%if(list.get(temp).getImg_url() != null){ %>
  	<img src="${pageContext.request.contextPath}/upload/img/<%=list.get(temp).getImg_url() %>" width="150px" height="150px">
  	<% }else{ %>
  	<img src="../image/noimage.png" width="150px" height="150px">
  	<% } %>
  	</div>
 	 <div class="todo-task">
     <div class="task-header"><%=list.get(temp).getTitle() %></div>
     <div class="task-date"><%=list.get(temp).getAddress() %></div>
     <div class="task-description">
     <% int count = d.bbsCtrl.getBbsCount(list.get(temp).getSeq_store());
     	int star_count = d.bbsCtrl.getBbsStarCount(list.get(temp).getSeq_store());%>
	  리뷰갯수 : <%=count %> 개<br>
	  <% if(star_count != 0){ %>
		평균별점 : <img src="../image/star_<%=star_count %>.png">
		<%}else{ %>
		평균별점 : 없음
		<% } %>
     </div>
 	</div>
	</div>
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
	<td>
	<a href="../foodstore/storemenu.jsp?seq=<%=list.get(temp).getSeq_store() %>&address=<%=address %>">
	<div class="task-list" id="pending">
	<div align="center"><br>
  	<%if(list.get(temp).getImg_url() != null){ %>
  	<img src="${pageContext.request.contextPath}/upload/img/<%=list.get(temp).getImg_url() %>" width="150px" height="150px">
  	<% }else{ %>
  	<img src="../image/noimage.png" width="150px" height="150px">
  	<% } %>
  	</div>
  	<div class="todo-task">
   	 <div class="task-header"><%=list.get(temp).getTitle() %></div>
  	  <div class="task-date"><%=list.get(temp).getAddress() %></div>
  	  <div class="task-description">
  	  <% int count = d.bbsCtrl.getBbsCount(list.get(temp).getSeq_store());
  	  	 int star_count = d.bbsCtrl.getBbsStarCount(list.get(temp).getSeq_store());%>
		리뷰갯수 : <%=count %> 개
		<% if(star_count != 0){ %>
		평균별점 : <img src="../image/star_<%=star_count %>.png">
		<%}else{ %>
		평균별점 : 없음
		<% } %>
  	  </div>
 	 </div>
	</div>
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
<br><br><br>
<div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
    </div>
</div>

</body>
</html>