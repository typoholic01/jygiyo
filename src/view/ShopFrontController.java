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

@WebServlet("/shop/*")
/*
 * mapping url pattern
 *  "/*" : 모든 요청
 * "*.do" : 확장자가 do인 요청
 * "/board/*" : /board/로 시작하는 요청
 */
public class ShopFrontController extends HttpServlet {
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
		
		String boss_id,category,title,content,address,img_url;		//param
		List<BbsDto> bbsList;
		FoodStoreDto shop;
		int seq_store, cur_page;
		
		switch (command) {
		case "/shop/list":
			//변수 준비
			List<FoodStoreDto> shopList = new ArrayList<>();
			
			//세션 받아오기
			HttpSession session = req.getSession(true);			
			BossDto boss = (BossDto) session.getAttribute("blogin");			
			
			//DB로부터  가게 데이터를 받아온다
			shopList = d.foodStoreCtrl.getBossFoodStoreList(boss.getBoss_id());

			//데이터를 집어넣는다
			req.setAttribute("shopList", shopList);	
			
			dispatch("/boss/shoplist.jsp", req, resp);				
			break;
		case "/shop/detail":
			bbsList = new ArrayList<>();
			
			//임시로 집어넣을 데이터
			seq_store = Integer.parseInt(req.getParameter("seq"));
			cur_page = 1;
			
			//DB로부터 bbs데이터를 가져온다
			bbsList = d.bbsCtrl.getBbsList(seq_store, cur_page);

			//데이터를 집어넣는다
			req.setAttribute("bbsList", bbsList);	
						
			dispatch("/bbs/bbsview.jsp", req, resp);				
			break;
			
		case "/shop/insert":
			//변수 받아오기
			boss_id = req.getParameter("boss_id");
			category = req.getParameter("category");
			title = req.getParameter("title");
			content = req.getParameter("content");
			address = req.getParameter("address");
			img_url = req.getParameter("img_url");
			
			//객체 준비
			shop = new FoodStoreDto();
			
			shop.setBoss_id(boss_id);
			shop.setCategory(category);
			shop.setTitle(title);
			shop.setContent(content);
			shop.setAddress(address);
			shop.setImg_url(img_url);
			
			//삽입
			d.foodStoreCtrl.insertFoodStore(shop);
			
			//보내기
			dispatch("/boss/bossmain.jsp", req, resp);		
			break;
			
		case "/shop/delete":
			//변수 받아오기
			seq_store = Integer.parseInt(req.getParameter("seq_store"));
			
			//객체 준비
			shop = new FoodStoreDto();
			
			shop.setSeq_store(seq_store);
			
			//삽입
			d.foodStoreCtrl.deleteFoodStore(shop);
			
			//보내기
			dispatch("/boss/bossmain.jsp", req, resp);		
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
