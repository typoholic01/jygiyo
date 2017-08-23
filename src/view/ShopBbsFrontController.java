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
import javax.servlet.http.HttpSession;

import bbs.BbsDto;
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
		String comment_id,comments,comments_reply;
		int seqBbs,comments_group_no;
		List<BbsDto> bbsList;
		FoodStoreDto shop;
		BbsDto bbs;
		int seq_store;
		
		switch (command) {		
		case "/shop/bbs/list":
			bbsList = new ArrayList<>();
			
			//임시로 집어넣을 데이터
			int seq = Integer.parseInt(req.getParameter("seq"));
			int currPage = Integer.parseInt(req.getParameter("currPage"));
			
			System.out.println(currPage);
			
			//DB로부터 bbs데이터를 가져온다
			bbsList = d.bbsCtrl.getBbsList(seq, currPage);

			//데이터를 집어넣는다
			req.setAttribute("bbsList", bbsList);	
						
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
}
