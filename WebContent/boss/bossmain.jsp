<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bossmain.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bossmain.css">
<link rel="stylesheet" href="../css/a.css"> 
<script type="text/javascript">
window.history.replaceState(null, '', "${pageContext.request.contextPath}/boss/bossmain.jsp");
</script>
<title>bossmain.jsp</title>
<script type="text/javascript">
/* 아작스를 이용해 가게 리스트를 뿌려준다 */
$(document).ready(function() {	
	getShopList();
});		
function getShopList() {
	$.ajax({ 
		type : "GET",
		url:"../shop/list",
        dataType : "text",
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
          $('#view').html(data);
        }
	});
}
</script>
</head>
<body>
<table align="center" border="0">
<colgroup><col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
<col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
</colgroup><tbody><tr>
	<td align="left" colspan="3" rowspan="2">
		<a href="../bmain.jsp">
			<img src="../image/logo4.png">
		</a>
	</td>
	<td colspan="4">
		<div class="insertShop" align="right">
			<a href="./insertshop.jsp"><button>가게 등록</button></a>
		</div>
	</td>
	<tr>
	<td valign="bottom" colspan="4">
		<div align="right" id="menubar">
		
			<b>zxc 사장님 반갑습니다.</b>
			<a href="../account/logout.jsp">로그아웃</a> | <a href="../main.jsp">메인 홈</a>
		
		</div>
	</td>
	</tr>
</tr>
<tr>
	<td colspan="10">
		<hr width="900">
	</td>
</tr>
</tbody>
</table>

<h3 align="center">가게목록</h3>
<div id="view">

</body>
</html>