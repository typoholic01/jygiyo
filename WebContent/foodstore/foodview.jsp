<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="food.FoodDto"%>
<%@page import="java.util.List"%>
<%@page import="singleton.Delegate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//파라미터 값
int seq = Integer.parseInt(request.getParameter("seq"));

//이벤트 객체
Delegate d = Delegate.getInstance();

//run
//배열 담기
List<FoodDto> list = d.foodCtrl.getFoodList(seq);
List<String> categorys = new ArrayList<>();

//foodList 받아오기
for(int i=0; i<list.size(); i++){
	if(categorys.size() != 0){
		boolean b = false;
		for(int j=0; j<categorys.size(); j++){
			if(categorys.get(j).equals(list.get(i).getFood_category())){
				b = true;
			}
		}
		if(!b){
			categorys.add(list.get(i).getFood_category());
		}
		
	}else{
		categorys.add(list.get(i).getFood_category());
	}
}

//카테고리 받아오기
for(int i=0; i<categorys.size(); i++){
System.out.println("카테고리 > " + categorys.get(i));
}
request.setAttribute("categorys", categorys);
request.setAttribute("foodList", list);
%>
<style>
.food {
	border: lightgrey;
    border-style: solid;
    border-width: thin;
}
</style>
<!-- 
제대로 출력이 안되는 문제 해결할 것
 -->
<div class="container">
 	<c:forEach items="${categorys }" var="category">
	<div class="row">
		<div class="category col-sm-3"><h1>${category }</h1></div>
	</div>
		<div class="row">
		<c:forEach items="${foodList }" var="food">
			<c:if test="${food.food_category == category }">
			<div class="food col-sm-3">
				<c:if test="${food.img_url != null && food.img_url != '' }">
				<div class="cover"><img src="${pageContext.request.contextPath}/upload/img/${food.img_url }" alt="이미지" width="210px" height="140px" /></div>
				</c:if>
				<div class="desc">
					<h3>${food.food_name }</h3>
					<br />
					${food.food_price } 원
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
 	</c:forEach> 
</div>