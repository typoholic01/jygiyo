package boss;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bbs.BbsDto;
import customer.CustomerDao;
import customer.CustomerDto;
import jdbc.DBConn;

public class BossDao implements IBossDao{

	private boolean isS = true;
	private static BossDao bossDao = null;
	
	private BossDao() {
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
		return null;
	}

	public BossDto checkLogin(BossDto dto) {
			
			String sql = " SELECT BOSS_ID, USER_NAME, PASSWORD, PHONE_NUMBER, STATUS "
					+ " FROM JUGIYO_BOSS "
					+ " WHERE BOSS_ID=? AND PASSWORD=? AND STATUS=0 ";
			
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
					String pwd = rs.getString(3);
					
					String phone = rs.getString(4);
					String status = rs.getString(5);
					
					bto = new BossDto(id, name, pwd, phone, status);
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
	public boolean IdCheck(String id) {
		boolean findId = false;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT BOSS_ID FROM JUGIYO_BOSS " 
				+ " WHERE BOSS_ID = '" 
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

	@Override
	public boolean modifyInfomation(String boss_id, String phone_number, String password) {
		
		String sql = " UPDATE JUGIYO_BOSS SET "
				+ " PASSWORD=?, PHONE_NUMBER=? "
				+ " WHERE BOSS_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			psmt = conn.prepareStatement(sql);
			log("2/6 S modifyInfomation");
			
			psmt.setString(1, password.trim());
			psmt.setString(2, phone_number.trim());
			psmt.setString(3, boss_id.trim());
			
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


	@Override
	public boolean deleteInfomation(String boss_id) {
		String sql = " UPDATE JUGIYO_BOSS SET "
				+ " STATUS=1 "
				+ " WHERE BOSS_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S delete user");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, boss_id);
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
	
	public BossDto getDetail(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT BOSS_ID, USER_NAME,PASSWORD,PHONE_NUMBER,STATUS "
				+ " FROM JUGIYO_BOSS"
				+ " WHERE BOSS_ID=? ";
		
		BossDto dto = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getDetail");

			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getDetail");
			
			psmt.setString(1, id);
			rs= psmt.executeQuery();
			System.out.println("4/6 S getDetail");

			while (rs.next()) {
				int i = 1;
				dto = new BossDto(
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++),
						rs.getString(i++));
			}
			System.out.println("5/6 S getDetail");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConn.close(rs, psmt, conn);
		}
		return dto;
	}

	@Override
	public int userCheck(String boss_id, String password) throws Exception {
		String sql = " SELECT PASSWORD FROM JUGIYO_BOSS "
				+ " WHERE BOSS_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int x = -1;
		String dbpasswd="";
		try{
		conn = DBConn.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, boss_id);
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
