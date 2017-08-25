package order;

import java.util.List;

public class OrderCtrl {
	OrderDao dao = OrderDao.getInstance();
	
	public List<OrderDto> getOrderList(int seq_order) {
		OrderDto dto = new OrderDto();
		
		dto.setSeq_order(seq_order);
		
		return dao.getOrderList(dto);

	}

}
