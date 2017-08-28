package order;

import java.util.List;

import foodStore.FoodStoreDao;

public class OrderServ implements IOrderServ {
	IOrderDao dao = new OrderDao();
	@Override
	public boolean order_final(List<OrderDto> orderlist) {
		boolean b = dao.order_final(orderlist);
		return b;
	}
	@Override
	public List<OrderDto> getcustorderlist(String customer_id) {
		List<OrderDto> list = dao.getcustorderlist(customer_id);
		return list;
	}
	
	
	

}
