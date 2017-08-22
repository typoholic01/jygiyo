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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>bbslist.jsp</title>
<p id="demo"></p>
<script type="text/javascript">
/* 아작스를 이용해 코멘트를 뿌려준다 */
$(document).ready(function() {	
	getBbsList();
});		
function getBbsList() {
	var seq_store = $("#seq_store").val();
	
	$.ajax({ 
		type : "GET",
		url:"../comment/list",
		data:"seq="+seq_store,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
          $('#view').html(data);
        }
	});
}
function insertComment() {
	var seq_store = $("#seq_store").val();
	var comment_id = $("#comment_id").val();
	var comments = $("#comments").val();
	
	$.ajax({ 
		type : "GET",
		url:"../comment/insert",
		data:"seq_store="+seq_store
		+"&comment_id="+comment_id
		+"&comments="+comments,
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	
	getBbsList();
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
</style>
</head>
<body>
<h1>bbs_notice_list.jsp</h1>
<a href="./calendar.jsp">달력 보기</a>
<a href="logout.jsp">로그아웃</a>
<hr>

<div align="center">
<h1>게시판</h1>
<div id="view">

</div>
<form>
	<input type="hidden" id="seq_store" name="seq_store" value="${param.seq }" />
	<input type="text" id="comment_id" name="comment_id" />
	<input type="text" id="comments" name="comments" />
</form>
<button onclick="insertComment()">댓글</button>
</div>
</body>
</html>