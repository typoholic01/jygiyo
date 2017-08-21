package order;

import java.util.List;

public interface IOrderDao {

	public boolean insertOrder(OrderDto dto);
	
	public List<OrderDto> getOrderList(int seq_order);

	public boolean deleteOrder(int seq_store);

}
