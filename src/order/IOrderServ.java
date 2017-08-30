package order;

import java.util.List;

public interface IOrderServ {
	public boolean order_final(List<OrderDto> orderlist);
	public List<OrderDto> getcustorderlist(String customer_id);
	public List<OrderDto> getOrderList_boss(int seq_store);
	public boolean deleteOrder(int seq_order);

}
