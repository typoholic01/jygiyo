package order;

import java.util.List;

public class OrderCtrl {
	OrderDao dao = OrderDao.getInstance();
	
	public List<OrderDto> getOrderList(int seq_order) {
		OrderDto dto = new OrderDto();
		
		dto.setSeq_order(seq_order);
		
		return dao.getOrderList(dto);

	}
	IOrderServ serv = new OrderServ();
	
	public boolean order_final(List<OrderDto> orderlist) {
		boolean b = serv.order_final(orderlist);
		return b;
	}
	public List<OrderDto> getcustorderlist(String customer_id){
		List<OrderDto> list = serv.getcustorderlist(customer_id);
		return list;
	}
	public List<OrderDto> getOrderList_boss(int seq_store) {
		List<OrderDto> list = serv.getOrderList_boss(seq_store);
		return list;
	}
	public boolean deleteOrder(int seq_order) {
		boolean b = serv.deleteOrder(seq_order);
		return b;
	}

}
