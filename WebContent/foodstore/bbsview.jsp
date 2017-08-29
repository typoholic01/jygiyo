<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<div class="container">
	<div class="table-responsive">          
	<table id="view" class="table">
		<c:forEach items="${bbsList}" var="bbs">
			<c:if test="${bbs.comments_reply == '-1' }">
			<!-- 원 댓글 -->
			<tr>
				<th class="tg-yw4l" rowspan="3"><img src="../image/baby.png" width="100px" /></th>
				<th class="tg-yw4l">${bbs.comment_id }</th>
				<td class="tg-yw4l">${bbs.create_at }</td>
			</tr>
			<tr>
				<c:if test="${bbs.store_rating != null && bbs.store_rating != '' && bbs.store_rating != '0' }">
				<td class="tg-yw4l" colspan="2">
				<c:forEach begin="1" end="${bbs.store_rating }" step="1">
					<label for="" class="starView"></label>
				</c:forEach>
				</td>
				</c:if>
			</tr>
			<tr>
				<td class="tg-yw4l" colspan="2">
					<div class="comments${bbs.seq_bbs }">${bbs.comments }</div>
					<br>
					<c:if test="${bbs.img_url != null}">				
						<img src="${pageContext.request.contextPath}/upload/img/${bbs.img_url}" alt="" width="300px" />
					</c:if>
					<form id="${bbs.seq_bbs }" onsubmit="return false;" >
					<!-- 수정/댓글 페이지. 기본적으로 hidden -->
					<div class="${bbs.seq_bbs }" style="display:none;">								
						<div class="form-group">
							<!-- <label class="wr_secret">수정</label> -->
						</div>
						<div class="form-group">
							<textarea id="wr_content" name="comments" maxlength="10000" rows="5" required="" class="form-control" title="내용"></textarea>
						</div>
						<div class="form-group">
							<c:if test="${login != null }">
							<!-- 수정버튼 -->
							<button type="submit" id="btn_submit" class="btn btn-primary comment-submit" onclick="modifyComment(${bbs.seq_bbs })" ><i class="fa fa-pencil-square-o"></i> 수정 하기</button>
							</c:if>
							<c:if test="${blogin != null }">
							<!-- 대댓글버튼 -->
							<input type="hidden" name="seq_bbs" value="${bbs.seq_bbs }"/>
							<input type="hidden" name="seq_store" value="${bbs.seq_store }" />
							<input type="hidden" name="comment_id" value="${bbs.comment_id }" />
							<input type="hidden" name="comments_group_no" value="${bbs.comments_group_no }" />
							<input type="hidden" name="comments_reply" value="${bbs.comments_reply }" />
							<button type="submit" id="btn_submit" class="btn btn-primary comment-submit" onclick="insertReply(${bbs.seq_bbs })" ><i class="fa fa-pencil-square-o"></i> 댓글 달기</button>
							</c:if>
						</div>
					</div>				
					<div align="right">
					<c:if test="${login != null }">
						<c:if test="${login.customer_id == bbs.comment_id }">			
							<!-- 수정, 삭제버튼 -->
							<input type="hidden" name="seq_bbs" value="${bbs.seq_bbs }"/>
							<input type="button" value="수정" onclick="showModifyView(${bbs.seq_bbs })" />
							<input type="button" value="삭제" onclick="deleteComment(${bbs.seq_bbs })" />
						</c:if>
					</c:if>
					<c:if test="${blogin != null}">
						<br />			
							<input type="button" value="대댓글" onclick="showReplyView(${bbs.seq_bbs })" />
					</c:if>
					</div>
					</form>
				</td>
			</tr>
			
			</c:if>
			<c:if test="${bbs.comments_reply != '-1' }">
			<!-- 대댓글 -->
			<tr>
				<td class="reply" colspan="3" style="padding-left: 152px;">
					<table>
						<tr>
							<th class="tg-yw4l">${bbs.comment_id }</th>
							<td class="tg-yw4l">${bbs.create_at }</td>
						</tr>
						<tr>
							<td class="tg-yw4l" colspan="2">
								${bbs.comments }
								<!-- 삭제버튼 -->								
								<c:if test="${blogin != null }">									
									<form id="${bbs.seq_bbs }" onsubmit="return false;" >	
									<div style="    display: inline-block;    float: right;">
									<input type="hidden" name="seq_bbs" value="${bbs.seq_bbs }"/>
									<input type="button" value="삭제" onclick="deleteComment(${bbs.seq_bbs })" />	
									</div>	
									</form>						
								</c:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>			
			</c:if>
		</c:forEach>
		<!-- 페이징 -->
		<tr style="text-align: center;">
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