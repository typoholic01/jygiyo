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
import foodStore.FoodStoreDto;
import singleton.Delegate;

@WebServlet("/shop/bbs/*")
/*
 * mapping url pattern
 *  "/*" : 모든 요청
 * "*.do" : 확장자가 do인 요청
 * "/board/*" : /board/로 시작하는 요청
 */
public class ShopBbsFrontController extends HttpServlet {
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
		
		String boss_id,name,category,title,content,address,img_url;		//param
		String comment_id = "";
		String comments = "";
		String comments_reply;
		int seqBbs, seq_store = -1;
		int comments_group_no;
		List<BbsDto> bbsList;
		FoodStoreDto shop;
		BbsDto bbs;
		
		switch (command) {		
		case "/shop/bbs/list":
			bbsList = new ArrayList<>();
			
			//임시로 집어넣을 데이터
			int seq = Integer.parseInt(req.getParameter("seq"));
			int currPage = Integer.parseInt(req.getParameter("currPage"));
			
			System.out.println(currPage);
			
			//DB로부터 bbs데이터를 가져온다
			bbsList = d.bbsCtrl.getBbsList(seq, currPage);
			PaginationBeans paging = PaginationBeans.getInstance();

			//데이터를 집어넣는다
			req.setAttribute("bbsList", bbsList);	
			req.setAttribute("paging", paging);				
						
			dispatch("/foodstore/bbs_view.jsp", req, resp);				
			break;
		
		case "/shop/bbs/reply/insert":
			//변수 받아오기
			seqBbs = Integer.parseInt(req.getParameter("seq_bbs"));
			seq_store = Integer.parseInt(req.getParameter("seq_store"));
			comment_id = req.getParameter("comment_id");
			comments = req.getParameter("comments");
			comments_reply = req.getParameter("comments_reply");
			comments_group_no = Integer.parseInt(req.getParameter("comments_group_no"));
			
			//객체 준비
			bbs = new BbsDto();
			
			bbs.setSeq_bbs(seqBbs);
			bbs.setSeq_store(seq_store);
			bbs.setId_category("고객");
			bbs.setComment_id(comment_id);
			bbs.setComments(comments);
			bbs.setComments_reply(comments_reply);
			bbs.setComments_group_no(comments_group_no);
			bbs.setStatus("published");
			
			//삽입
			d.bbsCtrl.insertReply(bbs);
			
			//보내기
			dispatch("/foodstore/bbs_view.jsp", req, resp);	
			break;
			
		case "/shop/bbs/comment/insert":			
			// file 데이터
			String fupload = "F:/Dev/Programming/Semi3/jugiyo/WebContent/upload/img";
			String filename = "";
			
			
			//multipart 체크
			boolean isMultipart = ServletFileUpload.isMultipartContent(req);
			
			if(isMultipart){	// Multipart로 전송되었는지
				try {
				//////객체에 담을 변수 준비
				String yourTempDirectory = fupload;
	
				int yourMaxRequestSize = 100*1024*1024;	// 1M
				int yourMaxMemorySize = 100*1024;
				
				////파일을 받아올 객체 준비
				// FileItem 오브젝트를 생성하는 클래스
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				// 한번에 메모리 위에 저장할 크기를 설정. 1M가 넘지 않으면 바로 사용한다 
				factory.setSizeThreshold(yourMaxMemorySize);
				factory.setRepository(new File(yourTempDirectory));		// Repository : 저장소	
				
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				//변수 받아오기
				List<FileItem> items = upload.parseRequest(req);
				

				Iterator<FileItem> it = items.iterator(); 
				
				while(it.hasNext()){
					FileItem item = it.next();		
					if(item.isFormField()){		// id, title, content 파일이 아닌 text형태면 이 조건으로 들어 온다
						if(item.getFieldName().equals("seq_store")){
							seq_store = Integer.parseInt(item.getString("utf-8"));	
						}else if(item.getFieldName().equals("comment_id")){
							comment_id = item.getString("utf-8");
						}else if(item.getFieldName().equals("comments")){
							comments = item.getString("utf-8");
						}		
						
					}else{	// file			
						if(item.getFieldName().equals("fileload")){
							filename = processUploadedFile(item, fupload);
						}		
					}
				}					
				} catch (FileUploadException e) {
					e.printStackTrace();
				} finally {
					//Dto 준비
					bbs = new BbsDto();
					bbs.setSeq_store(seq_store);
					bbs.setComment_id(comment_id);
					bbs.setId_category("customer");
					bbs.setComments(comments);
					bbs.setComments_reply("-1");
					bbs.setImg_url(filename);
					bbs.setStatus("published");	
					
					//삽입
					d.bbsCtrl.insertBbs(bbs);

				}
			}else{
				System.out.println("Multipart가 아닙니다");
			}			
			
			//보내기
			break;
			
		case "/shop/bbs/comment/delete":
			//변수 받아오기
			seqBbs = Integer.parseInt(req.getParameter("seq_bbs"));
			seq_store = Integer.parseInt(req.getParameter("seq_store"));
			comment_id = req.getParameter("comment_id");
			comments = req.getParameter("comments");
			comments_reply = req.getParameter("comments_reply");
			comments_group_no = Integer.parseInt(req.getParameter("comments_group_no"));
			
			//객체 준비
			bbs = new BbsDto();
			
			bbs.setSeq_bbs(seqBbs);
			bbs.setSeq_store(seq_store);
			bbs.setId_category("고객");
			bbs.setComment_id(comment_id);
			bbs.setComments(comments);
			bbs.setComments_reply(comments_reply);
			bbs.setComments_group_no(comments_group_no);
			bbs.setStatus("published");
			
			//삽입
			d.bbsCtrl.deleteComment(bbs);
			
			//보내기
			dispatch("/foodstore/bbs_view.jsp", req, resp);	
			break;
			
		case "/shop/bbs/comment/modify":
			//변수 받아오기
			seqBbs = Integer.parseInt(req.getParameter("seq_bbs"));
			comments = req.getParameter("comments");
			
			//객체 준비
			bbs = new BbsDto();
			
			bbs.setSeq_bbs(seqBbs);
			bbs.setComments(comments);
			
			//삽입
			d.bbsCtrl.modifyComment(bbs);
			
			//보내기
			dispatch("/foodstore/bbs_view.jsp", req, resp);	
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
