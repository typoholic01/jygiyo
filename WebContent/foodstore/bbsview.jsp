<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<h1>BBSViewer</h1>
<div class="container">
	<div class="table-responsive">          
	<table class="table">
		<c:forEach items="${bbsList}" var="bbs">	
			<tr>
				<td class="tg-yw4l" rowspan="3"><img src="../image/freepik.jpg" width="100px" /></th>
				<th class="tg-yw4l">${bbs.comment_id }</th>
				<td class="tg-yw4l">${bbs.create_at }</th>
			</tr>
			<tr>
				<td class="tg-yw4l" colspan="2">
					${bbs.store_rating }
				</td>
			</tr>
			<tr>
				<td class="tg-yw4l" colspan="2">
					${bbs.comments }
					<br>
					<c:if test="${bbs.img_url != null}">				
						<img src="${pageContext.request.contextPath}/upload/img/${bbs.img_url}" alt="" width="300px" />
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
				<ul class="pagination">
					<c:if test="${param.currPage != 1 }">
						<li><a href="?seq=${param.seq }&p=${param.currPage-1 }${queryURL}">❮</a></li>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" step="1">				
						<c:choose>
							<c:when test="${i == param.currPage }">
								<li class="active">
							</c:when>
							<c:when test="${i != param.currPage }">
								<li>
							</c:when>
						</c:choose>
						<a href="?seq=${param.seq }&p=${i }${queryURL}">${i }</a></li>
					</c:forEach>
					<c:if test="${param.currPage != paging.endPage }">
						<li><a href="?seq=${param.seq }&p=${param.currPage+1 }${queryURL}">❯</a></li>
					</c:if>
				</ul>
			</td>
		</tr>
	</table>	
	</div>
</div>
<!--  -->	