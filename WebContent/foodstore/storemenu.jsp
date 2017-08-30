<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
<c:if test="${blogin != null }">
<script type="text/javascript">
alert("사장으로는 주문할 수 없습니다 고객 아이디로 로그인해주세요");
location.replace("${pageContext.request.contextPath}/bmain.jsp");
</script>
</c:if>
<body>
	<div id="menumain.jsp">
	<iframe src="./menumain.jsp?seq=${param.seq }&address=${param.address }" frameborder="0" width="100%" height="900px" scrolling="no">
	</iframe>
	</div>
<div>
	<c:import url="./detail.jsp">
		<c:param name="seq">${param.seq }</c:param>
	</c:import>
</div>
<div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
</div>
</body>
</html>