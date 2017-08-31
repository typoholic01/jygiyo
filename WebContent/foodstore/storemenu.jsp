<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<% 
Object blogin = session.getAttribute("blogin");
Object login = session.getAttribute("login");

if (blogin != null) {
	
%>
	<script type="text/javascript">
	alert("사장으로는 주문할 수 없습니다 고객 아이디로 로그인해주세요");
	location.replace("${pageContext.request.contextPath}/bmain.jsp");
	</script>
<% 
} else if (login == null) {
%>
	<script type="text/javascript">
	alert("고객으로 로그인을 해주세요");
	location.replace("${pageContext.request.contextPath}/main.jsp");
	</script>
<% } %>
<script type="text/javascript">
function goMain() {
	location.replace("${pageContext.request.contextPath}/main.jsp");
	
}
</script>
<body>
<%
	String address = request.getParameter("address"); 
%>
<div id="header">
<c:import url="./header.jsp">
<c:param name="address">${param.address }</c:param>
</c:import>
</div>
	<div id="menumain.jsp" style="width:100%; height:600px;">
 	<iframe src="./menumain.jsp?seq=${param.seq }&address=${param.address }" scrolling="no" border="no" maginwidth="0" marginheight="0" frameborder="0" style="height: 750px; width: 100%">
	</iframe> 
<%-- 	<c:import url="./menumain.jsp">
		<c:param name="seq">${param.seq }</c:param>
		<c:param name="address">${param.address }</c:param>
	</c:import> --%>
	</div>
<div>
	<c:import url="./detail.jsp">
		<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
<div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
</div>
</body>
</html>