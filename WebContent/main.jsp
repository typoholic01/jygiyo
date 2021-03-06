<%@page import="customer.CustomerDto"%>
<%@page import="boss.BossDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/a.css">
<style type="text/css">
#menubar{
	text-align: right;
	font-size: 12px;
	margin-right: 180px;
}
input[type=text] {
 padding: 5px;
 margin: 0px;
 height: 25px;
}
#btnout{
	background-color: grey;
	color: white;						
	width: 83px; 
	height: 37.5px;
	border: 0;
	
}
#btnover{
	background-color: black;
	color: white;						
	width: 83px;
	height: 37.5px;
	border: 0;
}

#info {
background-color: white;
clear: both;
width : 920px;
height: 120px;
}
</style>
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

<div align="center" style="background-color: white">

<form action="">
<div align="right" id="menubar">
<%
Object ologin = session.getAttribute("login");
Object bologin = session.getAttribute("blogin");

CustomerDto cus = null;
BossDto boss = null;
cus = (CustomerDto)ologin;
boss = (BossDto)bologin;

if(ologin == null && bologin == null){%>
	<a href="bmain.jsp">사장님 사이트</a> | <a href="./account/bosslogin.jsp">가맹점 로그인</a> | <a href="./account/login.jsp">로그인</a> | <a href="./account/regi.jsp">일반 회원가입</a> | <a href="./account/bossregi.jsp">가맹점 회원가입</a>
<%}else if(bologin !=null){%>
	<b><%=boss.getBoss_id() %> 사장님 반갑습니다.</b>
	<a href="./account/logout.jsp">로그아웃</a> | <a href="bmain.jsp">사장님 홈</a>
<%}else{%>
	<b><%=cus.getCustomer_id()%> 님 반갑습니다.</b>
	<a href="./account/logout.jsp">로그아웃</a> | <a href="mypage/mypage.jsp">마이페이지</a><br>
	<a href="javascript:popupOpen_1();">담은음식열기</a> | <a href="javascript:popupOpen_2();">주문완료열기</a>
<%} %>
</div>

<a href="main.jsp"><img src="./image/logo3.png" alt="저기요"></a>
<p>※주소검색 후 완료 버튼을 눌러주세요.(지번을 선택하면 더 정확합니다!)</p><br>
<table>
<tr>
	<td>
		<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" id="btnout"
		onmouseover="this.id='btnover'" onmouseout="this.id='btnout'">
	</td>
	<td>
		<input type="text" id="sample4_jibunAddress" placeholder="<%=address %>" name="value">
	</td>
	<td>
		<input type="submit" value="완료" id="btnout"
		onmouseover="this.id='btnover'" onmouseout="this.id='btnout'">
		<span id="guide" style="color:#999"></span>
	</td>


</tr>

</table>
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
<p><%=address %> 이(가) 선택되었습니다. 이제 메뉴를 선택해 주세요!</p>
<%
}
%>
</div>
<br><br><br><br>

<table rules="none" align="center">
	<tr>
		<td>
			<a href="./store/foodStoreList.jsp?name=1&address=<%=address %>">
			<img src="image/chicken.jpg" width="200" height="150" id="chicken" name="chicken"
			 onmouseover="this.src='image/chover.png';" onmouseout="this.src='image/chicken.jpg';">
			</a>
		</td>
		
		<td>
			<a href="./store/foodStoreList.jsp?name=9&address=<%=address %>">
			<img src="image/fastfood.png" width="200" height="150"
				onmouseover="this.src='image/fastfoodover.jpg';" onmouseout="this.src='image/fastfood.png';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=6&address=<%=address %>">
			<img src="image/pig.jpg" width="200" height="150"
				onmouseover="this.src='image/pigover.jpg';" onmouseout="this.src='image/pig.jpg';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=3&address=<%=address %>">
			<img src="image/pizza.jpg" width="200" height="150"
				onmouseover="this.src='image/pizzaover.png';" onmouseout="this.src='image/pizza.jpg';">
			</a>
		</td>
	</tr>
	<tr>		
		<td>
			<a href="./store/foodStoreList.jsp?name=8&address=<%=address %>">
			<img src="image/dosirak.png" width="200" height="150"
				onmouseover="this.src='image/dosirakover.png';" onmouseout="this.src='image/dosirak.png';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=7&address=<%=address %>">
			<img src="image/jj.jpg" width="200" height="150"
				onmouseover="this.src='image/jjover.jpg';" onmouseout="this.src='image/jj.jpg';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=2&address=<%=address %>">
			<img src="image/jjajang.jpg" width="200" height="150"
				onmouseover="this.src='image/JJajangover.png';" onmouseout="this.src='image/jjajang.jpg';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=4&address=<%=address %>">
			<img src="image/hansik.jpg" width="200" height="150"
			onmouseover="this.src='image/hansikover.jpg';" onmouseout="this.src='image/hansik.jpg';">
			</a>
		</td>
	</tr>
	
	<tr>
		<td>
			<a href="./store/foodStoreList.jsp?name=5&address=<%=address %>">
			<img src="image/bun.jpg" width="200" height="150"
				onmouseover="this.src='image/bunsikover.png';" onmouseout="this.src='image/bun.jpg';">
			</a>
		</td>
		<td>
			<a href="./store/foodStoreList.jsp?name=0&address=<%=address %>">
			<img src="image/all.jpg" width="200" height="150"
				onmouseover="this.src='image/Allover.png';" onmouseout="this.src='image/all.jpg';">
			</a>
		</td>
	</tr>
</table>
<div id="info">
</div>

<script type="text/javascript">
function mover() {
	var m;
	m = document.getElemetById("ch")
	
}
</script>
<script type="text/javascript">
function popupOpen_1(){
	var popUrl = "shoping.jsp?pop=pop";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
<script type="text/javascript">
function popupOpen_2(){
	var popUrl = "shoping_final.jsp?pop=pop";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>






</body>
</html>