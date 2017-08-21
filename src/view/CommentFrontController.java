package view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BbsDto;
import foodStore.FoodStoreDto;
import singleton.Delegate;

@WebServlet("/comment/*")
/*
 * mapping url pattern
 *  "/*" : 모든 요청
 * "*.do" : 확장자가 do인 요청
 * "/board/*" : /board/로 시작하는 요청
 */
public class CommentFrontController extends HttpServlet {
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
		
		String seq_store,comment_id,id_category,comments,COMMENTS_GROUP_NO,COMMENTS_REPLY,STATUS;		//param
		
		switch (command) {		
		case "/comment/insert":
			//변수 받아오기
			seq_store = req.getParameter("seq_store");
			comment_id = req.getParameter("comment_id");
			comments = req.getParameter("comments");
			
			//객체 준비
			BbsDto bbs = new BbsDto();
			bbs.setSeq_store(Integer.parseInt(seq_store));
			bbs.setComment_id(comment_id);
			bbs.setId_category("고객");
			bbs.setComments(comments);
			bbs.setComments_reply("0");
			bbs.setStatus("0");			
			
			//삽입
			d.bbsCtrl.insertBbs(bbs);
			
			//보내기
			/*dispatch("/test.jsp", req, resp);		*/
			break;
		/*	
		case "/account/register":
			dispatch("/member/register.jsp", req, resp);		
			break;
			
		case "/account/registerAf":
			email = req.getParameter("email");
			pw = req.getParameter("pw");
			auth = "general";
			
			d.memCtrl.addMember(email, pw, null, null, auth);
			
			dispatch("/member/login.jsp", req, resp);		
			break;*/
			
		default:
			break;
		}
		
		
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
}
