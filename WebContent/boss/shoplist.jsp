<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<h1>Shop_Viewer</h1>
<table>
	<tr>
		<th>seq_store</th>
		<th>title</th>
		<th>content</th>
		<th>menu</th>
	</tr>
	<c:forEach items="${shopList}" var="shop">
		<tr>
			<td>${shop.seq_store }</td>
			<td><a href="${pageContext.request.contextPath}/foodstore/detail.jsp?seq=${shop.seq_store }">${shop.title }</a></td>
			<td>${shop.content }</td>
			<td><a href="./menu.jsp?seq=${shop.seq_store }&title=${shop.title }">매뉴보기</a></td>
		</tr>
	</c:forEach>
</table>