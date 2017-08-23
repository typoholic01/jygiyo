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
		<th>COMMENTS Reply</th>
	</tr>
	<c:forEach items="${bbsList}" var="bbs">
		<tr>
			<td>${bbs.seq_bbs }</td>
			<td>${bbs.seq_store }</td>
			<td>${bbs.comment_id }</td>			
			<td>
				<c:if test="${bbs.comments_reply != null && bbs.comments_reply != '-1' }">
					<c:forEach var="i" begin="0" end="${ fn:length(bbs.comments_reply)}" step="1" >&nbsp;&nbsp;</c:forEach><i class="fa fa fa-level-up fa-rotate-90"></i>
				</c:if>
				${bbs.comments } 
			</td>
			<td>
				<form id="${bbs.seq_bbs }" onsubmit="return false;">
					<input type="hidden" name="seq_bbs" value="${bbs.seq_bbs }"/>
					<input type="hidden" name="seq_store" value="${bbs.seq_store }" />
					<input type="hidden" name="comments_group_no" value="${bbs.comments_group_no }" />
					<input type="hidden" name="comments_reply" value="${bbs.comments_reply }" />
					<input type="text" name="comment_id" value="${login.boss_id }" readonly="readonly" />
					<input type="text" name="comments" />
					<input type="button" value="삭제" onclick="deleteReply(${bbs.seq_bbs })" />
					<input type="button" value="대댓글" onclick="insertReply(${bbs.seq_bbs })" />
				</form>
			</td>
		</tr>
	</c:forEach>
</table>