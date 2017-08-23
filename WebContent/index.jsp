<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>main.jsp</title>
<%
	String address = request.getParameter("value");
	
	if(address == null){
		address = "어느동네?";
	}
%>
</head>
<body>
<div align="center">

<form action="index.jsp">

<div align="right">
<a href="./account/bosslogin.jsp">가맹점 로그인</a> | <a href="./account/login.jsp">로그인</a> | <a href="./account/regi.jsp">일반 회원가입</a> | <a href="./account/bossregi.jsp">가맹점 회원가입</a>
</div>

<h3 align="center"><img src="./image/jugiyo.png" alt="저기요"></h3><br>
<p>※주소검색 후 완료 버튼을 눌러주세요.(지번을 선택하면 더 정확합니다!)</p><br>
<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색">
<input type="text" id="sample4_jibunAddress" placeholder="<%=address %>" name="value">
<input type="submit" value="완료">
<span id="guide" style="color:#999"></span>
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
</form>
</div><br>
<div align="center">
<%
if(!address.equals("어느동네?")){
%>
<p><%=address %> 이(가) 선택되었습니다. 이제 매뉴를 선택해 주세요!</p>
<%
}
%>
</div>
<br><br><br><br>

<table rules="none" align="center">
	<tr>
		<td>
			<a href="foodStoreList.jsp?name=1&address=<%=address %>">
			<img src="image/chicken.jpg" width="200" height="150" id="chicken" name="chicken">
			</a>
		</td>
		
		<td>
			<a href="foodStoreList.jsp?name=9&address=<%=address %>">
			<img src="image/fastfood.png" width="200" height="150">
			</a>
		</td>
		<td><a href="foodStoreList.jsp?name=6&address=<%=address %>"><img src="image/pig.jpg" width="200" height="150"></a></td>
		<td><a href="foodStoreList.jsp?name=3&address=<%=address %>"><img src="image/pizza.jpg" width="200" height="150"></a></td>
	</tr>
	<tr>		
		<td><a href="foodStoreList.jsp?name=8&address=<%=address %>"><img src="image/dosirack.png" width="200" height="150"></a></td>
		<td><a href="foodStoreList.jsp?name=7&address=<%=address %>"><img src="image/jj.jpg" width="200" height="150"></a></td>
		<td><a href="foodStoreList.jsp?name=2&address=<%=address %>"><img src="image/jjajang.jpg" width="200" height="150"></a></td>
		<td><a href="foodStoreList.jsp?name=4&address=<%=address %>"><img src="image/hansic.jpg" width="200" height="150"></a></td>
	</tr>
	
	<tr>
		
		<td><a href="foodStoreList.jsp?name=5&address=<%=address %>"><img src="image/bun.jpg" width="200" height="150"></a></td>
		<td><a href="foodStoreList.jsp?name=0&address=<%=address %>"><img src="image/all.jpg" width="200" height="150"></a></td>
	</tr>
</table>

</body>
</html>