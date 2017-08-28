package view;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bbs.BbsDto;
import bbs.PaginationBeans;
import boss.BossDto;
import food.FoodDto;
import foodStore.FoodStoreDto;
import singleton.Delegate;

@WebServlet("/shop/food/*")
/*
 * mapping url pattern
 *  "/*" : 모든 요청
 * "*.do" : 확장자가 do인 요청
 * "/board/*" : /board/로 시작하는 요청
 */
public class ShopFoodFrontController extends HttpServlet {
	private static final long serialVersionUID = 3286113481968426199L;
	private Delegate d = Delegate.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String contextPath = req.getContextPath();				//프로젝트 url을 가져온다
		String url = req.getRequestURI();						//전체 url을 가져온다
		String command = url.substring(contextPath.length());	//전체 url에서 프로젝트 url만큼 자른다
        
		req.setCharacterEncoding("utf-8");						//utf-8 설정
		resp.setContentType("text/html; charset=UTF-8");
		
		List<FoodDto> foods = new ArrayList<>();
		
		switch (command) {		
		case "/shop/food/list":
			//파라미터를 받는다
			int seq_store = Integer.parseInt(req.getParameter("seq"));
			
			//음식을 받는다
			foods = d.foodCtrl.getFoodList(seq_store);
			
			for (FoodDto foodDto : foods) {
				System.out.println(foodDto.toString());
			}
			
			req.setAttribute("foods", foods);
									
			dispatch("/foodstore/foodview.jsp", req, resp);				
			break;
			
		default:
			
			break;
		}
				
		
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
	private String processUploadedFile(FileItem fileItem, String dir)throws IOException{
		
		String fileName = fileItem.getName();
		long sizeInBytes = fileItem.getSize();
		
		// 업로드한 파일 정상일 경우
		if(sizeInBytes > 0){	// c:\\temp\abc.jpg		c:\\temp/abc.jpg
			int idx = fileName.lastIndexOf("\\");	// abc.jpg
			if(idx == -1){	//  '\' 못찾음
				idx = fileName.lastIndexOf("/");	// 못찾았으면 '/' 찾아!	
			}
			fileName = fileName.substring( idx+1 );	// abc.jpg
			
			//같은 이름 체크
			boolean loop = true;
			int i = 1;
			while (loop) {
				if (!d.bbsCtrl.checkSameImage(fileName)) {
					loop = false;
				} else {
					fileName = "("+i+")"+fileName;
					i++;
				}
			}
			
			try{
				File uploadedFile = new File(dir, fileName);
				fileItem.write(uploadedFile);
			}catch(Exception e){			
			}		
		}
		return fileName;
	}
}
