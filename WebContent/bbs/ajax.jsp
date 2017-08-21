<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body>

<p id="demo">여기가 p태그에 해당</p>

<input type="text" id="id" />
<input type="text" id="pw" />
<button>클릭</button>

<script type="text/javascript">
$(document).ready(function() {
	$("button").click(function() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		alert("클릭");
		
		$.ajax({ 
			url:"../ajax/test", 
			
			type:"GET",
			data:"id="+id
				+"&pw="+pw
			
			/* type:"post",
			data:{"t1":"ccc", "t2":"ddd"} */
			
			/* data:"t1=AAA&t2=BBB" */
		
		}).success(function(data, status, xhr) {
			alert("통신 성공");
			$("#demo").html(data + " " + status + " " + xhr.status);
		}).error(function (xhr, status, error) {
			alert("통신 실패");
		}).complete(function (xhr, status) {		
			alert("통신 종료");
		});				
	});
});
</script>



</body>
</html>