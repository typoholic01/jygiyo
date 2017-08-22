<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<h1>BBS_Viewer</h1>
<table border="1">
	<tr>
		<th>SEQ_BBS</th>
		<th>seq_store</th>
		<th>COMMENT_ID</th>
		<th>COMMENTS</th>
	</tr>
	<c:forEach items="${bbsList}" var="bbs">
		<tr>
			<td>${bbs.seq_bbs }</td>
			<td>${bbs.seq_store }</td>
			<td>${bbs.comment_id }</td>
			<td>${bbs.comments }</td>
		</tr>
	</c:forEach>
</table>