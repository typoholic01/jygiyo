package boss;

import java.io.Serializable;

public class BossDto implements Serializable {
	private String boss_id;
	private String user_name;
	private String password;
	private String phone_number;
	private String status;
	
	public BossDto(String boss_id, String user_name, String password, String phone_number, String status) {
		super();
		this.boss_id = boss_id;
		this.user_name = user_name;
		this.password = password;
		this.phone_number = phone_number;
		this.status = status;
	}

	@Override
	public String toString() {
		return "BossDto [boss_id=" + boss_id + ", user_name=" + user_name + ", password=" + password + ", phone_number="
				+ phone_number + ", status=" + status + "]";
	}

	public String getBoss_id() {
		return boss_id;
	}

	public void setBoss_id(String boss_id) {
		this.boss_id = boss_id;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
