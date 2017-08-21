package customer;

public interface ICustomerDao {
	
	public boolean sign(CustomerDto dto);
	
	public CustomerDto getCustomer(int customer_id);

	public CustomerDto checkLogin(CustomerDto dto);
	public boolean modifyInfomation(int customer_id);
	public boolean deleteInfomation(int customer_id);
	
}
