package boss;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import jdbc.DBConn;

public class BossDao implements IBossDao {

	private boolean isS = true;
	private static BossDao bossDao = null;
	
	private BossDao(){
		DBConn.initConnect();
	}
	
	public static BossDao getInstance(){
		if(bossDao == null){
			bossDao = new BossDao();
		}
		return bossDao;
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

	public BossDto checkLogin(BossDto dto) {
		
		String sql = " SELECT BOSS_ID, USER_NAME, PHONE_NUMBER, STATUS "
				+ " FROM JUGIYO_BOSS "
				+ " WHERE BOSS_ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BossDto bto = null;
		
		try {
			conn = DBConn.getConnection();
			log("2/6 S login");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getBoss_id());
			psmt.setString(2, dto.getPassword());
			log("3/6 S login");
			
			rs = psmt.executeQuery();
			log("4/6 S login");
			
			while(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String phone = rs.getString(3);
				String status = rs.getString(4);
				
				bto = new BossDto(id, name, null, phone, status);
			}
			log("5/6 S login");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(rs, psmt, conn);
			log("6/6 S login");
		}				
		return bto;
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
