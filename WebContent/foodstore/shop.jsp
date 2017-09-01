<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>가게</title>
</head>
<body>
<table align="center" border="0">
<colgroup><col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
<col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
</colgroup><tbody><tr>
	<td align="left" colspan="3">
		<a href="../bmain.jsp">
			<img src="../image/logo4.png">
		</a>
	</td>
	<td valign="bottom" colspan="4">
		<div align="right" id="menubar">
		
			<b>zxc 사장님 반갑습니다.</b>
			<a href="../account/logout.jsp">로그아웃</a> | <a href="../main.jsp">메인 홈</a>
		
		</div>
	</td>
</tr>
<tr>
	<td colspan="10">
		<hr width="900">
	</td>
</tr>
</tbody></table>
<div id="food">
	<c:import url="./foodview.jsp">
	<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
<div id="bbs">
	<c:import url="./detail.jsp">
	<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
</body>
</html>