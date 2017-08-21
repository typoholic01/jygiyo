package customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBConn;

public class CustomerDao implements ICustomerDao {

	private boolean isS = true;
	private static CustomerDao customerDao = null;
	
	private CustomerDao() {
		DBConn.initConnect();
	}
	
	public static CustomerDao getInstance(){
		if(customerDao == null){
			customerDao = new CustomerDao();
		}
		return customerDao;
	}
	
	
	

	public void log(String msg) {
		if(isS){
			System.out.println(getClass() + ": " + msg);
		}
	}
	
	public void log(String msg, Exception e) {
		if(isS){
			System.out.println(e + ": " + getClass() + ": " + msg);
		}
	}
	
	
	// Override 시작
	@Override
	public boolean sign(CustomerDto dto) {
		
		String sql = " INSERT INTO JUGIYO_CUSTOMER "
				+ " (CUSTOMER_ID, USER_NAME, PASSWORD, PHONE_NUMBER, ADDRESS, STATUS) "
				+ " VALUES(?, ?, ?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			log("2/6 S signCustomer");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCustomer_id());
			psmt.setString(2, dto.getUser_name());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getPhone_number());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getStatus());			
			log("3/6 S signCustomer");
			
			count = psmt.executeUpdate();
			log("4/6 S signCustomer");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			/*log("SQL F signCustomer", e);*/
		} finally{
			DBConn.close(psmt, conn);			
			log("5/6 S signCustomer");
		}		
		
		return count>0?true:false;
	}
	
	
	@Override
	public CustomerDto getCustomer(int customer_id) {
		
		return null;
	}

	@Override
	public CustomerDto checkLogin(CustomerDto dto) {
		
		String sql = " SELECT CUSTOMER_ID, USER_NAME, PHONE_NUMBER, ADDRESS, STATUS "
				+ " FROM JUGIYO_CUSTOMER "
				+ " WHERE CUSTOMER_ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CustomerDto cus = null;
		
		try {
			conn = DBConn.getConnection();
			log("2/6 S login");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCustomer_id());
			psmt.setString(2, dto.getPassword());
			log("3/6 S login");
			
			rs = psmt.executeQuery();
			log("4/6 S login");
			
			while(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String address	= rs.getString(4);
				String status = rs.getString(5);
				
				cus = new CustomerDto(id, null, name, phone, address, status);
			}
			log("5/6 S login");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(rs, psmt, conn);
			log("6/6 S login");
		}				
		return cus;
	}

	@Override
	public boolean modifyInfomation(int customer_id) {
		
		return false;
	}

	@Override
	public boolean deleteInfomation(int customer_id) {
		
		return false;
	}

}
