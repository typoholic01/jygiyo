package order;

import java.util.List;

public interface IOrderDao {

	public boolean insertOrder(OrderDto dto);
	
	public List<OrderDto> getOrderList_boss(int seq_store);

	public boolean deleteOrder(int seq_order);
	
	public boolean order_final(List<OrderDto> orderlist);
	
	public List<OrderDto> getcustorderlist(String customer_id);

	List<OrderDto> getOrderList(OrderDto dto);

	List<OrderDto> getOrderListRevenue(int seq_store);

}
