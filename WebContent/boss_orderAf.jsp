<%@page import="boss.BossDto"%>
<%@page import="singleton.Delegate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
Object bologin = session.getAttribute("blogin");
BossDto boss = null;
boss = (BossDto)bologin;
%>
<%
	String oseq_order = request.getParameter("seq_order");
	Delegate d = Delegate.getInstance();
	int seq_order = Integer.parseInt(oseq_order);
	
	boolean isS = d.orderCtrl.deleteOrder(seq_order);
	if(isS){ 
		%>
		<script type="text/javascript">
		alert("성공적!");
		location.href = './boss_order.jsp?boss_id=<%=boss.getBoss_id() %>';
		</script>
		<%
	}else{	
		%>
		<script type="text/javascript">
		alert("실패ㅠ");
		location.href = './boss_order.jsp?boss_id=<%=boss.getBoss_id() %>';
		</script>
	<%}%>

</body>
</html>