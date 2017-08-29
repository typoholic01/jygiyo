<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<table class="table table-hover shopList">
	<tr>
		<th>가게 번호</th>
		<th>가게 이름</th>
		<th>가게 설명</th>
		<th>메뉴 추가</th>
		<th>폐점</th>
	</tr>
	<c:forEach items="${shopList}" var="shop">
		<tr>
			<td>${shop.seq_store }</td>
			<td><a href="${pageContext.request.contextPath}/foodstore/detail.jsp?seq=${shop.seq_store }">${shop.title }</a></td>
			<td>${shop.content }</td>
			<td><a href="./menu.jsp?seq=${shop.seq_store }&title=${shop.title }">추가</a></td>
			<td><input type="button" value="폐점" onclick="deleteShop(${shop.seq_store })" /></td>
		</tr>
	</c:forEach>
</table>