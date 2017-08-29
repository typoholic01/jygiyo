<%@page import="java.util.ArrayList"%>
<%@page import="boss.BossDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<style type="text/css">

table.basic{
  margin: 0; padding: 0; line-height: 51px;
  border-top: 1px solid #cccccc;
  border-left: 1px solid #cccccc;
  border-collapse: collapse;
}
table.basic th, table.basic td{
  margin: 0; padding: 3px 0; width: 400px;
  text-align: center;
  border-right: 1px solid #cccccc;
  border-bottom: 1px solid #cccccc;
}
table.basic caption{ margin: 0; padding: 0; }
table.basic th{ background-color: #e9e9e9; }
table.basic td{ background-color: #e9e9e9; }
#info {
background-color: white;
clear: both;
height: 120px;
padding-top: 20px;
font-size : 12px;
padding-left: 165px;
}
</style>
</head>
<body style="background-color: #FCEFDA;">
<%
Object boss_login = session.getAttribute("blogin");
BossDto login = null;
if(boss_login != null){
	login = (BossDto)boss_login;
}
%>
<div style="background-color: white;" align="center">
<a href="../main.jsp"><img src="../image/logo.png" alt="저기요" height="300px" width="350px"></a>
</div>
<div style="background-color: "></div>
<form action="./storeupload.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="boss_id" value="<%=login.getBoss_id() %>">
<table align="center">
<tr>
<th>
<table class="basic">
  <caption><h3><%=login.getBoss_id() %> 님의 가게등록</h3></caption>
  <thead>
    <tr><th>항목</th> <th>작성</th></tr>
  </thead>
  <tfoot>
    <tr><th>등록하기</th> <td><input type="submit" value="등록"></td></tr>
  </tfoot>
  <tbody>  
    <tr><td>가게이름</td><td><input type="text" placeholder="Title" name="title" size="40"/></td></tr>
    <tr><td>카테고리</td>
    <td>
    <select style="width: 150px" name="category" style="width: 300px;">
			<option selected="selected">치킨</option>
			<option>중국집</option>
			<option>피자</option>
			<option>한식</option>
			<option>분식</option>
			<option>족발,보쌈</option>
			<option>일식</option>
			<option>도시락</option>
			<option>패스트푸드</option>
	</select>
    </td>
    </tr>
    <tr><td>가게설명</td><td><textarea placeholder="가게설명" name="content" style="width: 300px;"></textarea></td></tr>
    <tr><td><input type="button" onclick="sample4_execDaumPostcode()" value="주소검색">
    </td>
    <td>
    <input type="text" id="sample4_jibunAddress" placeholder="가게주소(옆버튼으로 검색)" name="address" size="40">
    </td>
    </tr>
    <tr>
    <td>이미지등록</td>
    <td><input type="file" name="fileload" size="40"></td></tr>
  </tbody>
</table>
</th>
</tr>
</table>
<span id="guide" style="color:#999"></span>
</form>



<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

</script>
<br><br><br>
<div id="info">사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
    </div>
</body>

</body>
</html>