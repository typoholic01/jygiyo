package foodStore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bbs.PaginationBeans;
import db.DBConnection;

public class FoodStoreDao implements IFoodStoreDao {

	@Override
	public boolean insertFoodStore(FoodStoreDto dto) {
		//쿼리문 준비
		String columnSql = "SEQ_STORE, BOSS_ID, CATEGORY, "
				+ "TITLE, CONTENT, address, IMG_URL";
		String sql = "INSERT INTO JUGIYO_FOOD_STORE("+columnSql+") "
			+ " VALUES(SEQ_JUGIYO_FOOD_STORE.NEXTVAL, ?, ?, "
			+ " ?, ?, ?, ?) ";
		
		System.out.println(sql);
		
		//질의 준비
		List<Object> queryList = new ArrayList<Object>();
		
		queryList.add(dto.getBoss_id());
		queryList.add(dto.getCategory());
		queryList.add(dto.getTitle());
		queryList.add(dto.getContent());
		queryList.add(dto.getAddress());
		queryList.add(dto.getImg_url());		
		
		//쿼리 실행&리턴
		return DBConnection.executeUpdates(sql, queryList);		
	}

	@Override
	public FoodStoreDto getFoodStore(int seq_store) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id) {
		//쿼리문 준비
		String columnSql = "SEQ_STORE, BOSS_ID, CATEGORY, "
				+ "TITLE, CONTENT, address, IMG_URL";
		String sql = " SELECT "+columnSql+" FROM JUGIYO_FOOD_STORE "
					+ "	WHERE BOSS_ID = ? ";
		
		List<FoodStoreDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("2/6 getBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 getBbsList Success");
			psmt.setString(1, boss_id);
			System.out.println(sql);
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getBbsList Success");
			
			while(rs.next())
			{
				int i = 1;		
				FoodStoreDto shop = new FoodStoreDto();
				
				shop.setSeq_store(rs.getInt(1));
				shop.setBoss_id(rs.getString(2));
				shop.setCategory(rs.getString(3));
				shop.setTitle(rs.getString(4));
				shop.setContent(rs.getString(5));
				shop.setAddress(rs.getString(6));
				shop.setImg_url(rs.getString(7));
				
				list.add(shop);
			}		
			System.out.println("5/6 getBbsList Success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
		} finally{
			DBConnection.close(conn, psmt, rs);
			System.out.println("6/6 getBbsList Success");
		}
		
		return list;
	}

	@Override
	public List<FoodStoreDto> getCategoryFoodStoreList(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifyFoodStore(int seq_store) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteFoodStore(int seq_store) {
		// TODO Auto-generated method stub
		return false;
	}

}
