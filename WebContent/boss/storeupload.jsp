
<%@page import="food.FoodDao"%>
<%@page import="food.IFoodDao"%>
<%@page import="foodStore.FoodStoreDto"%>
<%@page import="singleton.Delegate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
public String processUploadedFile(FileItem fileItem, String dir, JspWriter out)throws IOException{
	
	String fileName = fileItem.getName();
	long sizeInBytes = fileItem.getSize();
	
	// 업로드한 파일 정상일 경우
	if(sizeInBytes > 0){	// c:\\temp\abc.jpg		c:\\temp/abc.jpg
		int idx = fileName.lastIndexOf("\\");	// abc.jpg
		if(idx == -1){	//  '\' 못찾음
			idx = fileName.lastIndexOf("/");	// 못찾았으면 '/' 찾아!	
		}
		fileName = fileName.substring( idx+1 );	// abc.jpg
		
		try{
			File uploadedFile = new File(dir, fileName);
			fileItem.write(uploadedFile);
		}catch(Exception e){			
		}		
	}
	return fileName;
}
%>

<%
// tomcat에 배포
String fupload = application.getRealPath("/upload/img");

// 개인폴더에 배포
// String fupload = "f:\\upload";
//String fupload = "F:/Dev/Programming/Semi3/jugiyo/WebContent/upload/img";


System.out.println("fupload:" + fupload);

String yourTempDirectory = fupload;

int yourMaxRequestSize = 100*1024*1024;	// 1M
int yourMaxMemorySize = 100*1024;

// form field의 데이터
String boss_id = "";
String category = "";
String title = "";
String content = "";
String address = "";

// file 데이터
String filename = "";

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart){	// Multipart로 전송되었는지
	
	// FileItem 오브젝트를 생성하는 클래스
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// 한번에 메모리 위에 저장할 크기를 설정. 1M가 넘지 않으면 바로 사용한다 
	factory.setSizeThreshold(yourMaxMemorySize);
	factory.setRepository(new File(yourTempDirectory));		// Repository : 저장소	
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(yourMaxRequestSize);	// 파일 업로드 최대 크기
	
	List<FileItem> items = upload.parseRequest(request);
	
	Iterator<FileItem> it = items.iterator(); 
	
	while(it.hasNext()){
		FileItem item = it.next();		
		if(item.isFormField()){		// id, title, content 파일이 아닌 text형태면 이 조건으로 들어 온다
			if(item.getFieldName().equals("boss_id")){
				boss_id = item.getString("utf-8");	
			}else if(item.getFieldName().equals("category")){
				category = item.getString("utf-8");
			}else if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");
			}else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");
			}else if(item.getFieldName().equals("address")){
				address = item.getString("utf-8");
			}		
			
		}else{	// file			
			if(item.getFieldName().equals("fileload")){
				filename = processUploadedFile(item, fupload, out);
			}		
		}		
	}	
}else{
	System.out.println("Multipart가 아닙니다");
}

// DB에 저장
Delegate d = Delegate.getInstance();
boolean isS = d.foodStoreCtrl.insertFoodStore(new FoodStoreDto(boss_id, category, title, content, address, filename));
if(isS){
	%>
	<script type="text/javascript">
	alert("파일 업로드 성공!");
	location.href = './bossmain.jsp';
	</script>	
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("파일 업로드 실패");
	location.href = './bossmain.jsp';
	</script>
	<%
}
%>

</body>
</html>