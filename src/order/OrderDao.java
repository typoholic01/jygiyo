package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class OrderDao implements IOrderDao {
	private static OrderDao single = null;
	
	private OrderDao() {
		DBConnection.initConnect();
	}
	
	public static OrderDao getInstance() {
		if (single == null) {
			single = new OrderDao();
		}
		return single;
	}
	@Override
	public boolean insertOrder(OrderDto dto) {
		String columnSql = "SEQ_ORDER, SEQ_FOOD, CUSTOMER_ID, CREATE_AT, "
						+ "STATUS, FOOD_COUNT";
		String sql = "INSERT INTO JUGIYO_ORDER("+columnSql+") "
					+ " VALUES(SEQ_JUGIYO_ORDER.NEXTVAL, ?, ?, SYSDATE, "
					+ " ?, ?) ";
		
		System.out.println("OrderDao: "+dto.toString());
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(dto.getSeq_food());
		queryList.add(dto.getCustomer_id());
		queryList.add(dto.getStatus());
		queryList.add(dto.getFood_count());
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	@Override
	public List<OrderDto> getOrderList(int seq_order) {
		List<OrderDto> list = new ArrayList<>();
		
		String sql = "SELECT * FROM BBS WHERE SEQ = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq_order);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				OrderDto order = new OrderDto(
						rs.getInt(i++),		//	seq_order, 
						rs.getInt(i++),			//	seq_food, 
						rs.getString(i++),			//	customer_id, 
						rs.getString(i++),			//	create_at, 
						rs.getString(i++),			//	status, 
						rs.getInt(i++)			//	food_count
				);
				list.add(order);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmt, rs);
		}		
		return list;
	}

	@Override
	public boolean deleteOrder(int seq_store) {
		String sql = "UPDATE BBS SET "
					+ " STATUS = 'delete', "
					+ " WHERE SEQ = ? ";
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(seq_store);
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	

}
