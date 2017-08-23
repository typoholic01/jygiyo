<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>foodInsertAf.jsp</title>
</head>
<body>
<%

String number = request.getParameter("number");
String category = request.getParameter("category");
String name = request.getParameter("name");
String price = request.getParameter("price");
String size = request.getParameter("size");

System.out.println(number);
System.out.println(category);

%>


</body>
</html>