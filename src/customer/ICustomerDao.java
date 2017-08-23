package customer;

public interface ICustomerDao {
	
	public boolean sign(CustomerDto dto);
	
	public CustomerDto getCustomer(String customer_id)throws Exception;

	public boolean IdCheck(String id);
	public CustomerDto checkLogin(CustomerDto dto);
	public boolean modifyInfomation(String customer_id, String password, String phone_number, String address);
	public boolean deleteInfomation(String customer_id);
	public int userCheck(String customer_id, String password)throws Exception;

}
