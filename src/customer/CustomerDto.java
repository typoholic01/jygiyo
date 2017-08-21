package customer;

import java.io.Serializable;

/*
CREATE TABLE JUGIYO_CUSTOMER (
	    CUSTOMER_ID VARCHAR2(100) PRIMARY KEY,
	    USER_NAME VARCHAR2(100) NOT NULL,
	    PASSWORD VARCHAR2(100) NOT NULL,
	    PHONE_NUMBER VARCHAR2(100) NOT NULL,
	    ADDRESS VARCHAR2(100) NOT NULL,
	    STATUS VARCHAR2(100) NOT NULL
	);
*/

public class CustomerDto implements Serializable {
	private String customer_id;
	private String user_name;
	private String password;
	private String phone_number;
	private String address;
	private String status;
	
	
	public CustomerDto() {}
	
	public CustomerDto(String customer_id, String user_name, String password, String phone_number, String address,
			String status) {
		this.customer_id = customer_id;
		this.user_name = user_name;
		this.password = password;
		this.phone_number = phone_number;
		this.address = address;
		this.status = status;
	}

	@Override
	public String toString() {
		return "CustomerDto [customer_id=" + customer_id + ", user_name=" + user_name + ", password=" + password
				+ ", phone_number=" + phone_number + ", address=" + address + ", status=" + status + "]";
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
