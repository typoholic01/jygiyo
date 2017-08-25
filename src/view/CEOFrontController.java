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
import bbs.PaginationBeans;
import order.OrderDto;
import singleton.Delegate;

@WebServlet("/ceo/*")
/*
 * mapping url pattern
 *  "/*" : 모든 요청
 * "*.do" : 확장자가 do인 요청
 * "/board/*" : /board/로 시작하는 요청
 */
public class CEOFrontController extends HttpServlet {
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
		
		List<OrderDto> orderList;
		
		switch (command) {		
		case "/ceo/statistics":
			orderList = new ArrayList<>();
			
			//임시로 집어넣을 데이터
			int seq_order = 1;
						
			//DB로부터 bbs데이터를 가져온다
			orderList = d.orderCtrl.getOrderList(seq_order);
			
			for (OrderDto orderDto : orderList) {
				System.out.println(orderDto.toString());
			}

			//데이터를 집어넣는다
			req.setAttribute("orderList", orderList);
						
			dispatch("/boss/statistics.jsp", req, resp);				
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
