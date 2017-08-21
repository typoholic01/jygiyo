package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConn {
	
	public static void initConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");			
			System.out.println("Driver Loading Success!!");			
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.14:1521:xe", "hr", "hr");
		System.out.println("DB Connection Success!!");
		return conn;		
	}
	
	public static void close(PreparedStatement psmt, Connection conn) {		
		try {
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement psmt, Connection conn) {		
		try {
			if(rs != null)
				rs.close();
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

}
