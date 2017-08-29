<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myreview.jsp</title>
<script type="text/javascript">
function insertComment() {
	var customerId;
	
	$.ajax({ 
		type: 'GET',
		url:"../shop/bbs/comment/insert", 
		data: 
			{
				"customerId" = customerId
			},
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
        }
	});
	var currentLocation = window.location;
	$("#view").load(currentLocation + '#view');
}
</script>
</head>
<body>
<h3>여기는 myreview.jsp 입니다</h3>
<div id="view" class="container">
</div>
</body>
</html>