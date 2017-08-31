<%@page import="java.util.ArrayList"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@page import="food.FoodDto"%>
<%@page import="singleton.Delegate"%>
<%@page import="java.util.List"%>
<%@page import="bbs.BbsDto"%>
<%@page import="bbs.BbsDao"%>
<%@page import="boss.BossDto"%>
<%@page import="customer.CustomerDto"%>
<%@page import="customer.CustomerDao"%>
<%@page import="customer.ICustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/a.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/foodview.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<title>mypage.jsp</title>

<style type="text/css">
#menubar{
	text-align: right;
	font-size: 12px;
	margin-right: 180px;
}

input[type=text] {
 padding: 8px;
 margin: 0px;
}
input[type=password] {
 padding: 8px;
 margin: 0px;
}
#lbtnout{
	background-color: white;
	color: gray;						
	width: 400px; 
	height: 50px;
	border: 1;
}
#lbtnover{
	background-color: black;
	color: white;						
	width: 400px;
	height: 50px;
	border: 1;
}
#loginunderbar{
	text-align: right;
	font-size: 12px;
}

.write{
  text-align:left;  
  background-color: #666666;  
  border-left-color:#666666;
  border-right-color:#666666;
  border-bottom-color: #666666;
}
.search{
  text-align:center;  
  background-color: #666666;  
  border-left-color:#666666;
  border-right-color:#666666;
  border-bottom-color: #666666;
}
.center{
  text-align:center; 

}
.right{
  text-align:right;
}
#wrapper {
  display: inline-table;
  float:right;
}
#cell {
  display: table-cell; 
  vertical-align: middle;
}
.reply {
    background-color: aliceblue;

}
#tdunder {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>

</head>
<body>
<%
Object ologin = session.getAttribute("login");
ICustomerDao dao = CustomerDao.getInstance();
CustomerDto cus = (CustomerDto)ologin;

String id = request.getParameter("id");
Delegate d = Delegate.getInstance();
List<BbsDto> list = d.bbsCtrl.getmyreview(id);
%>
<div align="right" id="menubar">
<%
if(ologin != null){%>	
	<b><%=cus.getCustomer_id()%> 님</b>
	<a href="../account/logout.jsp" >로그아웃</a> | <a href="./mypage.jsp" >마이페이지</a>
<%} %>
</div>

<div align="center">
<form>
<table width="800">
<col width="200"><col width="200"><col width="200"><col width="200">
<tr>
	<td colspan="4" align="center">
		<a href="../main.jsp" ><img src="../image/logo3.png"></a>
	</td>
</tr>
<tr id="menubar" align="left">
	<td colspan="4" align="left">
		<a href="../main.jsp" >홈</a>
		> <a href="./mypage.jsp" >마이페이지</a>	
		> <a href="./myreview.jsp?id=<%=cus.getCustomer_id() %>" ><b>나의 리뷰</b></a>	
	</td>		
</tr>
<tr height="40">
</tr>

<tr>
	<td colspan="2">
		<a href="./mydetail.jsp?id=<%=cus.getCustomer_id()%>">
			<input type="button" value="내 정보" id="lbtnout"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
		</a>
	</td>
	<td colspan="2">
		<a href="./myreview.jsp?id=<%=cus.getCustomer_id()%>">	
			<input type="button" value="리뷰 관리" id="lbtnout"  style="background-color: black; color: white; font-size: 20"
				onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">	
		</a>
	</td>
</tr>
</table>

<table>
<col width="180"><col width="200"><col width="420">
<tr>
	<td colspan="4" align="left">
		<h2><b>내가 작성한 리뷰</b><hr></h2>
	</td>
</tr>
<tr align="center">
<td><b>작성 날짜</b></td><td><b>별점</b></td><td><b>리뷰 내용</b></td>
</tr>

<div class="stars">
<%
int count = 0;

for(int i = 0;i < list.size(); i++){
	BbsDto bbs = list.get(i);
	%>
	<td id="tdunder"><%=bbs.getUpdate_at() %></td>
	<td id="tdunder"> 
	<%if(true){%>
			<div class="col-md-8">
				<% for(int j = 0;j < bbs.getStore_rating();j++) {%>
					<label for="" class="starView"></label>
				<%} %>
			</div>
	<%}%>
	</td>
	
	<!-- 코멘트 10자 이상 ... 표시 -->
	<td id="tdunder">
	<a href="../foodstore/storemenu.jsp?seq=<%=list.get(count).getSeq_store()%>">
	<%if(bbs.getComments().length() < 10){%>
		<%=bbs.getComments()%>
	<%}else{%>
		<%=bbs.getComments().substring(0, 10)+"..." %>
	<%}%>
	</a>
	</td>
	<% count++; %>
	</tr>	
	<%
}
%>

</table>
</form>
</div>



</body>
</html>