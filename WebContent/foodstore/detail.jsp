<%@page import="customer.CustomerDto"%>
<%@page import="boss.BossDto"%>
<%@page import="bbs.PaginationBeans"%>
<%@page import="bbs.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script src="${pageContext.request.contextPath}/js/detail.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/foodview.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<title>bbslist.jsp</title>
<script type="text/javascript">
/* 아작스를 이용해 코멘트를 뿌려준다 */
$(document).ready(function() {	
	getFoodList();
	getBbsList();
    $("[data-toggle=tooltip]").tooltip();
});		
function getBbsList() {
	var seq_store = $("#seq_store").val();
	
	var p = "${param.p}";
	
	if (p == "") {
		p = 1;
	}
	
	var currPage = p;	
	
	$.ajax({ 
		type : "GET",
		url:"../shop/bbs/list",
		data:
			{
				"seq":seq_store,
				"currPage":currPage,
			},
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
          $('#commentView').html(data);
        }
	});
}
function getFoodList() {
	var seq_store = $("#seq_store").val();
	
	var p = "${param.p}";
	
	if (p == "") {
		p = 1;
	}
	
	var currPage = p;	
	
	$.ajax({ 
		type : "GET",
		url:"../shop/food/list",
		data:
			{
				"seq":seq_store
			},
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        	console.log('통신성공!');
          $('#foodView').html(data);
        }
	});
}
</script>
<style type="text/css">
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
.reply th {
	padding-right: 10px;
}
</style>
</head>
<body>
<!--------------------------------------  

list로 접근시 사장 페이지와 고객 페이지를 아예 분할시켜서 출력을 다르게 줄 것!

--------------------------------------->

<input type="hidden" id="seq_store" value="${param.seq }" />
<a href="../account/logout.jsp">로그아웃</a>

<div align="center">
<div id="foodView">

</div>
<div id="commentView">

</div>
<% 
/* 아이디 값 찾아내는 코드 */
String id = null;
	if (session.getAttribute("blogin") != null) {
		BossDto boss = (BossDto)session.getAttribute("blogin");
		id = boss.getBoss_id();
	} else if (session.getAttribute("login") != null) {
		CustomerDto customer = (CustomerDto)session.getAttribute("login");
		id = customer.getCustomer_id();
	}
%>
<form id="insertComment" method="post" enctype="multipart/form-data">
	<input type="hidden" name="seq_store" value="${param.seq }" />
	<input type="hidden" id="comment_id" name="comment_id" value="<%=id %>" />
	<div class="container">
		<div class="row">
			<div class="col-md-1 col-md-offset-3">
				<span class="label label-primary"><%=id %></span>
			</div>
			<div class="col-md-2">
				<div class="stars">
				    <input class="star star-5" id="star-5" type="radio" name="store_rating" value="5" checked="checked"/>
				    <label class="star star-5" for="star-5"></label>
				    <input class="star star-4" id="star-4" type="radio" name="store_rating" value="4" checked="checked"/>
				    <label class="star star-4" for="star-4"></label>
				    <input class="star star-3" id="star-3" type="radio" name="store_rating" value="3" checked="checked"/>
				    <label class="star star-3" for="star-3"></label>
				    <input class="star star-2" id="star-2" type="radio" name="store_rating" value="2" checked="checked"/>
				    <label class="star star-2" for="star-2"></label>
				    <input class="star star-1" id="star-1" type="radio" name="store_rating" value="1" checked="checked"/>
				    <label class="star star-1" for="star-1"></label>
				</div>
			</div>
		</div>
		<div class="row mb-10">
			<div class="col-md-6 col-md-offset-3">
				<textarea class="form-control" rows="5" id="comments" name="comments"></textarea>		
			</div>
		</div>
		<div class="row mb-10">    
	        <div class="col-xs-12 col-md-5 col-md-offset-4 col-sm-8 col-sm-offset-2">  
	            <!-- image-preview-filename input [CUT FROM HERE]-->
	            <div class="input-group image-preview">
	                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
	                <span class="input-group-btn">
	                    <!-- image-preview-clear button -->
	                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
	                        <span class="glyphicon glyphicon-remove"></span> Clear
	                    </button>
	                    <!-- image-preview-input -->
	                    <div class="btn btn-default image-preview-input">
	                        <span class="glyphicon glyphicon-folder-open"></span>
	                        <span class="image-preview-input-title">Browse</span>
	                        <input type="file" accept="image/png, image/jpeg, image/gif" name="fileload"/> <!-- rename it -->
	                    </div>
	                </span>
	            </div><!-- /input-group image-preview [TO HERE]--> 
	        </div>
	    </div>
		<div class="row mb-10">
			<div class="col-md-1 col-md-offset-8"><button type="button" class="btn btn-primary" onclick="insertComment()">댓글</button></div>
		</div>
	</div>
</form>
</div>
</body>
</html>