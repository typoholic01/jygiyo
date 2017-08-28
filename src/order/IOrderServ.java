package order;

import java.util.List;

public interface IOrderServ {
	public boolean order_final(List<OrderDto> orderlist);
	public List<OrderDto> getcustorderlist(String customer_id);

}
