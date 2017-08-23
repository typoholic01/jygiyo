package customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.DBConn;

public class CustomerDao implements ICustomerDao{

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
	
	public boolean sign(CustomerDto dto) {
			
			String sql = " INSERT INTO JUGIYO_CUSTOMER "
					+ " (CUSTOMER_ID, USER_NAME, PASSWORD, PHONE_NUMBER, ADDRESS, STATUS) "
					+ " VALUES(?, ?, ?, ?, ?, 0) ";
			
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

	public CustomerDto getCustomer(String customer_id)throws Exception {

		String sql = " CUSTOMER_ID, USER_NAME, PHONE_NUMBER, ADDRESS, STATUS "
				+ " FROM JUGIYO_CUSTOMER "
				+ " WHERE CUSTOMER_ID=? ";	
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CustomerDto dto = null;
		
		try {
			conn = DBConn.getConnection();
			log("2/6 S getCustomer");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id.trim());
			
			rs = psmt.executeQuery();
			log("3/6 S getCustomer");
			
			while(rs.next()){
				dto = new CustomerDto();
				dto.setCustomer_id(rs.getString("id"));
				dto.setUser_name(rs.getString("name"));
				dto.setPhone_number(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setStatus(rs.getString("status"));
			}
			log("4/6 S getCustomer");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
			log("5/6 S getCustomer");
		}
		return dto;
	}

	public CustomerDto checkLogin(CustomerDto dto) {
		
		String sql = " SELECT CUSTOMER_ID,PASSWORD, USER_NAME, PHONE_NUMBER, ADDRESS, STATUS "
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
				String pass = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String address	= rs.getString(5);
				String status = rs.getString(6);
				
				cus = new CustomerDto(id,pass, name, phone, address, status);
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

	public boolean modifyInfomation(String customer_id, String password, String phone_number, String address) {
		
		String sql = " UPDATE JUGIYO_CUSTOMER SET "
				+ " PASSWORD=?, PHONE_NUMBER=?, ADDRESS=? "
				+ " WHERE CUSTOMER_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			psmt = conn.prepareStatement(sql);
			log("2/6 S modifyInfomation");
			
			psmt.setString(1, password.trim());
			psmt.setString(2, phone_number.trim());
			psmt.setString(3, address.trim());
			psmt.setString(4, customer_id.trim());
			log("3/6 S modifyInfomation");
			
			count = psmt.executeUpdate();	
			log("4/6 S modifyInfomation");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt, conn);
			log("5/6 S modifyInfomation");
		}	
		
		return count>0?true:false;
	}

	public boolean deleteInfomation(String customer_id) {
		
		String sql = " DELETE from JUGIYO_CUSTOMER "
				+ " WHERE CUSTOMER_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S delete user");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, customer_id);
			System.out.println("3/6 S delete user");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S delete user");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(psmt, conn);
			System.out.println("5/6 S delete user");
		}
		return count>0?true:false;
	}

	@Override
	public boolean IdCheck(String id) {
		boolean findId = false;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " SELECT CUSTOMER_ID FROM JUGIYO_CUSTOMER " 
				+ " WHERE CUSTOMER_ID = '" 
				+ id + "'";

		try {
			conn = DBConn.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(sql);
				while (rs.next()) {
				findId = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
		}
		return findId;
	}

	public int userCheck(String customer_id, String password)throws Exception {
		
		String sql = " SELECT PASSWORD FROM JUGIYO_CUSTOMER "
				+ " WHERE CUSTOMER_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int x = -1;
		String dbpasswd="";
		try{
		conn = DBConn.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, customer_id);
		rs = psmt.executeQuery();
		
		if(rs.next()){
			dbpasswd = rs.getString("password");
			if(dbpasswd.equals(password))
				x=1;	// 인증성공
			else
				x=0;	// 비밀번호 틀림
		} else
			x=-1;		// 해당아이디없음
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			DBConn.close(rs, psmt, conn);
		}
		return x;
	}

}
