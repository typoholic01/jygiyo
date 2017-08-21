package boss;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.DBConn;

public class BossDao implements IBossDao {

	private boolean isS = true;
	
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
	
	@Override
	public boolean sign(BossDto Dto) {
		
		String sql = " INSERT INTO JUGIYO_BOSS "
				+ " (BOSS_ID, USER_NAME, PASSWORD, PHONE_NUMBER, STATUS)"
				+ " VALUES(?, ?, ?, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			log("2/6 S signBoss");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Dto.getBoss_id());
			psmt.setString(2, Dto.getUser_name());
			psmt.setString(3, Dto.getPassword());
			psmt.setString(4, Dto.getPhone_number());
			
						
			log("3/6 S signBoss");
			
			count = psmt.executeUpdate();
			log("4/6 S signBoss");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			
		} finally{
			DBConn.close(psmt, conn);			
			log("5/6 S signBoss");
		}		
		
		return count>0?true:false;
	}

	@Override
	public BossDto getBoss(int boss_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkLogin(int boss_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyInfomation(int boss_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteInfomation(int boss_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
