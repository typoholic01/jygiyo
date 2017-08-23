<%@page import="pds.pdsdto"%>
<%@page import="java.util.List"%>
<%@page import="pds.pdsdao"%>
<%@page import="pds.ipdsdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pdslist.jsp</title>
</head>
<body>
<%
ipdsdao dao = pdsdao.getInstance();
List<pdsdto> list = dao.getPdsList();
%>
<h3>자료실</h3>

<table border="1">
<col width="50"><col width="100"><col width="400"><col width="50">
<col width="50"><col width="50"><col width="100">

<tr bgcolor="#09bbaa" align="center">
	<td>번호</td><td>작성자</td><td>제목</td><td>다운로드</td>
	<td>조회수</td><td>다운수</td><td>작성일</td>
</tr>

<%
for(int i = 0;i < list.size(); i++){
	pdsdto pds = list.get(i);
	String bgcolor = "";
	if(i%2 == 0){
		bgcolor = "#ddeebb";
	}else{
		bgcolor = "#ddddcc";
	}
	%>
	<tr bgcolor="<%=bgcolor %>" align="center" height="5">
		<td><%=i+1 %></td>
		<td><%=pds.getId() %></td>
		<td align="left">
			<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>">
				<%=pds.getTitle() %>
			</a>
		</td> 
		<td>
			<input type="button" name="btnDown" value="파일"
			onclick="location.href='filedown?filename=<%=pds.getFilename()%>&seq=<%=pds.getSeq()%>'">			
		</td>
		<td><%=pds.getReadcount() %> </td>
		<td><%=pds.getDowncount() %> </td>
		<td><%=pds.getRegdate() %> </td>	
	</tr>	
	<%
}
%>
</table>

<a href='pdswrite.jsp'>자료올리기</a>
<br><br>

<a href='bbslist.jsp'>Home</a>
</body>
</html>