package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class pdsdao implements ipdsdao {
private static pdsdao pdsDao = null;
	
	private pdsdao() {}
	
	public static pdsdao getInstance() {
		if(pdsDao == null){
			pdsDao = new pdsdao();			
		}
		return pdsDao;
	}

	@Override
	public boolean writePds(pdsdto pds) {
		String sql = " INSERT INTO PDS( "
				+ " SEQ, ID, TITLE, CONTENT, FILENAME, "
				+ " READCOUNT, DOWNCOUNT, REGDATE) "
				+ " VALUES(SEQ_PDS.NEXTVAL, "
				+ " ?, ?, ?, ?, 0, 0, SYSDATE) ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("2/6 S writePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getTitle());
			psmt.setString(3, pds.getContent());
			psmt.setString(4, pds.getFilename());
			System.out.println("3/6 S writePds");
			
			count = psmt.executeUpdate(); 
			System.out.println("4/6 S writePds");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBConnection.close(conn, psmt);
			System.out.println("5/6 S writePds");
		}		
		
		return count>0?true:false;
	}

	@Override
	public List<pdsdto> getPdsList() {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, "
				+ " READCOUNT, DOWNCOUNT, REGDATE "
				+ " FROM PDS "
				+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<pdsdto> list = new ArrayList<pdsdto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("2/6 S getPdsList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getPdsList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 S getPdsList");
			
			while(rs.next()){
				pdsdto dto = new pdsdto(rs.getInt(1), // seq, 
										rs.getString(2),	// id, 
										rs.getString(3),	// title, 
										rs.getString(4),	// content, 
										rs.getString(5),	// filename, 
										rs.getInt(6),		// readcount, 
										rs.getInt(7),		// downcount, 
										rs.getString(8)); 	//regdate)						
				list.add(dto);
			}
			System.out.println("5/6 S getPdsList");
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBConnection.close(conn, psmt, rs);
			System.out.println("6/6 S getPdsList");
		}
		
		return list;
	}

	@Override
	public boolean downloadcount(int seq) {
		String sql = " UPDATE PDS SET "
				+ " DOWNCOUNT=DOWNCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("2/6 S downloadcount");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3/6 S downloadcount");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S downloadcount");				
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			DBConnection.close(conn, psmt);
			System.out.println("6/6 S downloadcount");
		}		
		
		return count>0?true:false;
	}
}
