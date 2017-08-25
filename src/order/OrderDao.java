package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class OrderDao {
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


	public List<OrderDto> getOrderList(OrderDto dto) {
		List<OrderDto> list = new ArrayList<>();
		
		String sql = "SELECT * FROM JUGIYO_ORDER WHERE SEQ_ORDER = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		System.out.println(sql);
			
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getSeq_order());
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				OrderDto order = new OrderDto();
				order.setSeq_order(rs.getInt(i++));
				order.setSeq_food(rs.getInt(i++));
				order.setSeq_store(rs.getInt(i++));
				order.setCustomer_id(rs.getString(i++));
				order.setCreate_at(rs.getString(i++));
				order.setStatus(rs.getString(i++));
				order.setFood_name(rs.getString(i++));
				order.setFood_price(rs.getInt(i++));
				order.setFood_size(rs.getString(i++));
				order.setFood_count(rs.getInt(i++));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, psmt, rs);
		}
			
		return list;
	}


	public boolean deleteOrder(int seq_store) {
		String sql = "UPDATE BBS SET "
					+ " STATUS = 'delete', "
					+ " WHERE SEQ = ? ";
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(seq_store);
		
		return DBConnection.executeUpdates(sql, queryList);
	}
	

}
