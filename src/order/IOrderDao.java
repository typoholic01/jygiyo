package order;

import java.util.List;

public interface IOrderDao {

	public boolean insertOrder(OrderDto dto);
	
	public List<OrderDto> getOrderList(int seq_order);

	public boolean deleteOrder(int seq_store);
	
	public boolean order_final(List<OrderDto> orderlist);
	
	public List<OrderDto> getcustorderlist(String customer_id);

	List<OrderDto> getOrderList(OrderDto dto);

}
