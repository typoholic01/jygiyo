<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<h3>여기는 bossmain.jsp 입니다</h3>
<a href="./insertshop.jsp">가게 등록</a>
<h3>가게목록</h3>
<div id="view">
</div>
</body>
</html>