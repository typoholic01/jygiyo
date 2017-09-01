<%@page import="customer.CustomerDto"%>
<%@page import="boss.BossDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/logregi.css">
<link rel="stylesheet" type="text/css" href="css/a.css">
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<script>
$(document).ready(function(){
	var slider = $('.bxslider').bxSlider({
			auto: true, mode:'fade',
		});
	var slider_01 =	$('.bxslider_01').bxSlider({
			auto: true,autoControls: true, mode:'vertical',
		});
	var slider_02 =	$('.bxslider_02').bxSlider({
			auto: true,controls:false,pagerCustom: '#bx-pager1'
		});
	var slider_03 =	$('.bxslider_03').bxSlider({
			auto: true,controls:false,pager:false,maxSlides: 3,moveSlides:1,  slideWidth: 100,slideMargin:0,autoHover:true,
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click','.bx-next, .bx-prev',function() {
		slider.stopAuto();
		slider.startAuto();
		slider_01.stopAuto();
		slider_01.startAuto();
		});
		$(document).on('mouseover','.bx-pager, #bx-pager1',function() {
		slider.stopAuto();
		slider.startAuto();
		slider_01.stopAuto();
		slider_01.startAuto();
		slider_02.stopAuto();
		slider_02.startAuto();
		});	
});
</script>
<style type="text/css">

#loginbar {
background-color: #fff5ee;
float: left;
width: 450px;
height: 400px;
}

#info {
background-color: white;
clear: both;
width : 900px;
height: 120px;
padding-top: 20px;
font-size : 12px;
padding-left: 165px;
}

input[type=text] {
 padding: 0px;
 margin: 0px;
 height: 60px;
 width: 250px;
}
input[type=password] {
 padding: 0px;
 margin: 0px;
 height: 60px;
 width: 250px;
}

#lbtnout{
	background-color: grey;
	color: white;						
	width:250px; 
	height: 60px;
	border: 0;
}
#lbtnover{
	background-color: black;
	color: white;						
	width:250px;
	height: 60px;
	border: 0;
}

#lbtnout3{
	background-color: #dc9146;
	color: white;						
	width:295px; 
	height: 70px;
	border: 0;
}
#lbtnover3{
	background-color: #d2691e;
	color: white;						
	width:295px;
	height: 70px;
	border: 0;
	font-size: 18;
	
}

#loginunderbar{
	text-align: right;
	font-size: 12px;
}
#menubar{
	font-size: 12px;
}
#pagebtnout{
	background-color: grey;
	color: white;						
	width: 100px; 
	height: 50px;
	border: 0;
}
#pagebtnover{
	background-color: black;
	color: white;						
	width: 100px;
	height: 50px;
	border: 0;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bossmain.jsp</title>
</head>
<body>


<div align="center" >

<table border="0">
<col width="90" ><col width="90"><col width="90"><col width="90"><col width="90">
<col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
<tr>
	<td align="left" colspan="3">
		<a href="./bmain.jsp">
			<img src="./image/logo4.png">
		</a>
	</td>
	<td valign="bottom" colspan="4">
		<div align="right" id="menubar" >
		<%
		
		Object bologin = session.getAttribute("blogin");
		BossDto boss = null;
		boss = (BossDto)bologin;
		
		if(bologin == null && bologin == null){%>
			<a href="./main.jsp">메인 홈</a> | <a href="./account/bosslogin.jsp">가맹점 로그인</a> | <a href="./account/login.jsp">로그인</a> | <a href="./account/regi.jsp">일반 회원가입</a> | <a href="./account/bossregi.jsp">가맹점 회원가입</a>
		<%}else if(bologin !=null){%>
			<b><%=boss.getBoss_id() %> 사장님 반갑습니다.</b>
			<a href="./account/logout.jsp">로그아웃</a> | <a href="./main.jsp">메인 홈</a>
		<%}%>
		</div>
	</td>
</tr>
<tr>
	<td colspan="10">
		<hr width="900">
	</td>
</tr>
</table>

<form action="account/bossloginAf.jsp" method="post">
<table border="0" >
<col width="90"><col width="90"><col width="90"><col width="90"><col width="90">
<col width="90"><col width="90"><col width="90"><col width="90"><col width="90">

<tr height="20">
</tr>
<tr>
	<td colspan="7" rowspan="10">
		<div id="s_banner_wrap">
			<ul class="bxslider">
		      <li class="banner_01"><img src="image/madein.png"/></li>
		      <li class="banner_02"><img src="image/pig.png" /></li>
		      <li class="banner_03"><img src="image/there.png"/></li>
		    </ul>
		</div>
	</td>
	
	<td colspan="3" rowspan="10">
		<div align="center">
			<table align="center">
			<%if(bologin == null){ %>
			<tr valign="top">
				<td align="center">
					<input type="text" id="boss_id" name="boss_id" size="33" placeholder="아이디 입력">
				</td>							
			</tr>
			<tr>
				<td align="center">
					<input type="password" id="boss_pwd" name="boss_pwd" size="33" placeholder="비밀번호 입력">
				</td>	
			</tr>
			<tr height="10">			
			</tr>
			<div>
			<tr>
				<td id="menubar">
				<input type="checkbox" id="cb_saveId">아이디 저장
					<span style="float : right;">
						<!-- <a href="#" class="">ID찾기</a> |  --><a href="account/bossregi.jsp">회원가입</a>
				</span>
				</td>
			</tr>
			</div>
			<tr height="10">			
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="로그인" id="lbtnout" onclick="bossSubmit(this.form)"
						onmouseover="this.id='lbtnover'" onmouseout="this.id='lbtnout'">
				</td>
			</tr>
			<%}else{ %>
			<tr align="center">
				<td align="center"><img src="image/chef1.png" width="220" height="150"></td>
			<tr>
				<td align="center"><b><%=boss.getBoss_id() %></b> 사장님 반갑습니다.</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="마이페이지" id="pagebtnout" onclick="bossmypage()"
						onmouseover="this.id='pagebtnover'" onmouseout="this.id='pagebtnout'">

				<input type="button" value="로그아웃" id="pagebtnout" onclick="logout()"
						onmouseover="this.id='pagebtnover'" onmouseout="this.id='pagebtnout'">
				<!-- <a href="account/logout.jsp">로그아웃</a> -->
				</td>
			</tr>
			<%} %>			
			</table>		
		</div>	
	</td>	
</tr>
</table>
</form>
</div>
<table>
<tr height="30">
</tr>
</table>
<div align="center">
<% 
Object blogin = session.getAttribute("blogin");

if (blogin != null) {
	
%>
<table border="0" width="900">

<tr>
	<td>
		<a href="./boss/bossmain.jsp">
			<input type="button" value="업체 정보수정" id="lbtnout3" onmouseover="this.id='lbtnover3'" onmouseout="this.id='lbtnout3'">
		</a>
	</td>
	<td>
		<a href="./foodstore/revenue.jsp"><input type="button" value="정산관리" id="lbtnout3" onmouseover="this.id='lbtnover3'" onmouseout="this.id='lbtnout3'"></a>
	</td>
	<td>
		<%if(bologin == null){ %>
			<a href="boss_order.jsp">
				<input type="button" value="주문내역확인" id="lbtnout3" onmouseover="this.id='lbtnover3'" onmouseout="this.id='lbtnout3'">
			</a>
			<%}else{ %>
			<a href="boss_order.jsp?boss_id=<%=boss.getBoss_id() %>">
				<input type="button" value="주문내역확인" id="lbtnout3" onmouseover="this.id='lbtnover3'" onmouseout="this.id='lbtnout3'">
			</a>
			<%} %>
		</td>
	</tr>
</table>
<% 
}
%>
</div>
<table>
<tr height="20">
</table>
<div align="center">
	<div id="info" >
	사업자등록번호 : 120-87-65763 <span class="bar">l</span> 통신판매업 신고번호 : 서울 송파 - 0515호 <span class="bar">I</span> 대표 : 김종희 김나연 최국호 문성환 
      <br><span class="bar">l</span> 주소 : 서울특별시 강남구 강남구 테헤란로14길 6 남도빌딩 2층 A클래스 
    </div>
</div>


<script type="text/javascript">
//TODO 체크
$(document).ready(function() {
	// id 저장
	var user_email = $.cookie("boss_id");
	if (user_email != null) {
		$("#boss_id").val(user_email);
		$("#cb_saveId").attr("checked", "checked");
	};
	
	$("#cb_saveId").click(function () {
		//alert("현재 아이디를 저장합니다3");
		if ($(this).is(':checked')) {
			$.cookie("boss_id",$("#boss_id").val(), {path:"/", expires:365});
			alert("현재 아이디를 저장합니다");
		} else {
			$.cookie("boss_id",$("#boss_id").val(), {path:"/", expires:-1});
		}
		
	});
})
// id에서 엔터키를 눌렀을때 password 입력으로 focus를 이동시켜주는 부분 
$("#boss_id").keypress(function(event) {
    if(event.which == '13') { // 엔터키를 의미함
        event.preventDefault(); // 초기화 해주는 부분
        $("#boss_pwd").focus();
    }    
});
function bossmypage() {
	location.href="mypage/bosspage.jsp"
}
function logout() {
	location.href="account/logout.jsp"
}

</script>

</body>
</html>