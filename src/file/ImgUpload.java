package file;

import java.io.File;
import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.apache.tomcat.util.http.fileupload.FileItem;

public class ImgUpload {
	
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

}
