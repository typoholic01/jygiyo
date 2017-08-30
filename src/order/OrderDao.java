package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import foodStore.FoodStoreDto;
import jdbc.DBConn;

public class OrderDao implements IOrderDao {
	private static OrderDao single = null;
	
	OrderDao() {
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
		/*
		queryList.add(dto.getSeq_food());
		queryList.add(dto.getCustomer_id());
		queryList.add(dto.getStatus());
		queryList.add(dto.getFood_count());*/
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	@Override
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

	@Override
	public boolean deleteOrder(int seq_store) {
		String sql = "UPDATE BBS SET "
					+ " STATUS = 'delete', "
					+ " WHERE SEQ = ? ";
		
		List<Object> queryList = new ArrayList<>();
		
		queryList.add(seq_store);
		
		return DBConnection.executeUpdates(sql, queryList);
	}

	@Override
	public boolean order_final(List<OrderDto> orderlist) {
	int count = 0;
	for(int i=0; i<orderlist.size(); i++){
		OrderDto dto = new OrderDto(orderlist.get(i).getStore_name(),
				orderlist.get(i).getFood_name(),
				orderlist.get(i).getFood_price(),
				orderlist.get(i).getFood_count(),
				orderlist.get(i).getSeq_food(),
				orderlist.get(i).getSeq_store(),
				orderlist.get(i).getCustomer_id(),
				orderlist.get(i).getCreate_at(),
				orderlist.get(i).getStatus(),
				orderlist.get(i).getFood_size());
		String sql = " INSERT INTO JUGIYO_ORDER "
				+" (SEQ_ORDER, SEQ_FOOD, SEQ_STORE, CUSTOMER_ID, CREATE_AT, "
				+" STATUS, FOOD_NAME, FOOD_PRICE, FOOD_SIZE, FOOD_COUNT) "
				+" values(SEQ_JUGIYO_ORDER.nextval, ?, "
				+" ?, ?, sysdate, '주문완료', ?, ?, ?, ?) ";
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	try {
		conn = DBConn.getConnection();
		System.out.println("2/6 S order_final");
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, dto.getSeq_food());
		psmt.setInt(2, dto.getSeq_store());
		psmt.setString(3, dto.getCustomer_id());
		psmt.setString(4, dto.getFood_name());
		psmt.setInt(5, dto.getFood_price());
		psmt.setString(6, dto.getFood_size());
		psmt.setInt(7, dto.getFood_count());
		System.out.println("3/6 S order_final");
		count = psmt.executeUpdate();
		System.out.println("4/6 S order_final");
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		DBConn.close(rs, psmt, conn);
		System.out.println("5/6 S order_final");
	}
	
	}
	return count>0?true:false;
	}

	@Override
	public List<OrderDto> getcustorderlist(String customer_id) {
		List<OrderDto> list = new ArrayList<>();
		
		String sql = "SELECT SEQ_FOOD, SEQ_STORE, CUSTOMER_ID, CREATE_AT, "
				+" STATUS, FOOD_NAME, FOOD_PRICE, FOOD_SIZE, FOOD_COUNT "
				+ " FROM JUGIYO_ORDER "
				+ " WHERE CUSTOMER_ID = '"+customer_id+"' ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getcustorderlist");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getcustorderlist");
			rs = psmt.executeQuery();
			while(rs.next()){
				if (rs.getString("STATUS").equals("주문완료")) {
				int i = 1;				
				OrderDto dto = new OrderDto();
				dto.setSeq_food(rs.getInt(i++));
				dto.setSeq_store(rs.getInt(i++));
				dto.setCustomer_id(rs.getString(i++));
				dto.setCreate_at(rs.getString(i++));
				dto.setStatus(rs.getString(i++));
				dto.setFood_name(rs.getString(i++));
				dto.setFood_price(rs.getInt(i++));
				dto.setFood_size(rs.getString(i++));
				dto.setFood_count(rs.getInt(i++));
				dto.setStore_name("님네 가게");
				list.add(dto);
				}
			}
			System.out.println("5/6 S getcustorderlist");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getcustorderlist");
		}
		return list;
	}

	@Override
	public List<OrderDto> getOrderList_boss(int seq_store) {
		List<OrderDto> list = new ArrayList<>();
		
		String sql = "SELECT food_name, food_price, food_count, "
				+" seq_food, seq_store, customer_id, create_at, "
				+" status, seq_order, food_size "
				+ " FROM JUGIYO_ORDER "
				+ " WHERE SEQ_STORE = '"+seq_store+"' ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getOrderList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getOrderList");
			rs = psmt.executeQuery();
			while(rs.next()){
				if (rs.getString("STATUS").equals("주문완료")) {
				int i = 1;				
				OrderDto dto = new OrderDto();
				dto.setFood_name(rs.getString(i++));
				dto.setFood_price(rs.getInt(i++));
				dto.setFood_count(rs.getInt(i++));
				dto.setSeq_food(rs.getInt(i++));
				dto.setSeq_store(rs.getInt(i++));
				dto.setCustomer_id(rs.getString(i++));
				dto.setCreate_at(rs.getString(i++));
				dto.setStatus(rs.getString(i++));
				dto.setSeq_order(rs.getInt(i++));
				dto.setFood_size(rs.getString(i++));
				dto.setStore_name("님네가게");
				list.add(dto);
				}
			}
			System.out.println("5/6 S getcustorderlist");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getcustorderlist");
		}
		return list;
	}

	@Override
	public List<OrderDto> getOrderList(int seq_order) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
