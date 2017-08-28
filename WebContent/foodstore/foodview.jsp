<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
<body> 
<div class="foodView">
	<div class="foodCategory">
		<div class="foodCategoryTitle"><span>치킨</span></div>
		<c:forEach items="${foods }" var="food">
			<c:if test="${food.food_category == '치킨' }">
				<div class="food">
					<div class="foodImage">
						<img src="${pageContext.request.contextPath}${food.img_url }" alt=""/>						
					</div>
					<div class="foodDesc">
						<div class="foodName">${food.food_name }</div>
						<div class="foodPrice">${food.food_price }</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
</body>
</html>