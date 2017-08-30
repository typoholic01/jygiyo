package foodStore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bbs.PaginationBeans;
import db.DBConnection;
import jdbc.DBConn;

public class FoodStoreDao implements IFoodStoreDao {
private static FoodStoreDao foodStoreDao = null;
	
	public FoodStoreDao() {}
	
	public static FoodStoreDao getInstance() {
		if(foodStoreDao == null){
			foodStoreDao = new FoodStoreDao();
		}
		return foodStoreDao;
	}
	
	@Override
	public boolean insertFoodStore(FoodStoreDto dto) {
		//쿼리문 준비
		String columnSql = "SEQ_STORE, BOSS_ID, CATEGORY, "
				+ "TITLE, CONTENT, address, IMG_URL, STATUS";
		String sql = "INSERT INTO JUGIYO_FOOD_STORE("+columnSql+") "
			+ " VALUES(SEQ_JUGIYO_FOOD_STORE.NEXTVAL, ?, ?, "
			+ " ?, ?, ?, ?, 'open') ";
		
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
	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, "
		//+" CONTENT, IMG_URL, address
		String sql = "";
		
		
		if(category.equals("전체매뉴")){
			sql = " SELECT SEQ_STORE, BOSS_ID, CATEGORY, TITLE, CONTENT, "
				+" address, IMG_URL "
				+" from JUGIYO_FOOD_STORE "
				+ " WHERE STATUS != 'delete' "
				//+" WHERE ADDRESS = '"+address+"' "
				+" order by seq_store desc";
		}else{
			sql = " SELECT SEQ_STORE, BOSS_ID, CATEGORY, TITLE, CONTENT, "
					+" address, IMG_URL "
					+" from JUGIYO_FOOD_STORE "
					+" WHERE category = '"+category+"' "
					+ " AND STATUS != 'delete' "
					//+" WHERE ADDRESS = '"+address+"' "
					//+" and category = '"+category+"' "
					+" order by seq_store desc";
		}
		
		System.out.println("sql" + sql);
		List<FoodStoreDto> list = new ArrayList<>();
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getAddressFoodStoreList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getAddressFoodStoreList");
			rs = psmt.executeQuery();
			int temp = (serchpage*12) -11;
			int temp_last = temp +11;
			int count = 1;
			while(rs.next()){
				if (count >= temp && count <= temp_last) {
					int i = 1;
										
				FoodStoreDto dto = new FoodStoreDto();
				
				dto.setSeq_store(rs.getInt(i++));
				dto.setBoss_id(rs.getString(i++));
				dto.setCategory(rs.getString(i++));
				dto.setTitle(rs.getString(i++));
				dto.setContent(rs.getString(i++));
				dto.setAddress(rs.getString(i++));
				dto.setImg_url(rs.getString(i++));
				if(!address.equals("all")){
				String addressNode[] = address.split(" ");
				String addressNode2[] = dto.getAddress().split(" ");
				int addresscount = 0;
				for (int j = 0; j < addressNode.length; j++) {
					for (int j2 = 0; j2 < addressNode2.length; j2++) {
						if (addressNode[j].equals(addressNode2[j2])) {
							addresscount++;
						}
					}
				}
				if (addresscount >= 3) {
					
					list.add(dto);
					
				}
				
				}else{
					
						list.add(dto);
						
				}
				}
				count ++;
			}
			System.out.println("5/6 S getAddressFoodStoreList");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getAddressFoodStoreList");
		}
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list = " + list.get(i).toString());
		}
		return list;
	}
	
	@Override
	public int getallcount(String category) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, "
		//+" CONTENT, IMG_URL, address
		String sql = "";
		if (category.equals("전체매뉴")) {
			sql = " SELECT count(*) "
				+" from JUGIYO_FOOD_STORE ";
		}else{
			sql = " SELECT count(*) "
					+" from JUGIYO_FOOD_STORE "
					+" where category = '"+category+"' ";
		}
		
		
		int count = 0;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getallcount");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getallcount");
			rs = psmt.executeQuery();
			while(rs.next()){
				count = rs.getInt("count(*)");
			}
			System.out.println("5/6 S getallcount");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getallcount");
		}
		return count;
	}

	@Override
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id) {
		//쿼리문 준비
		String columnSql = "SEQ_STORE, BOSS_ID, CATEGORY, "
				+ "TITLE, CONTENT, address, IMG_URL";
		String sql = " SELECT "+columnSql+" FROM JUGIYO_FOOD_STORE "
				+ "	WHERE BOSS_ID = ? "
				+ "	AND status != 'delete'";
		
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
	public FoodStoreDto getFoodStore(int seq_store) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT SEQ_STORE, BOSS_ID, CATEGORY, TITLE, "
				+" CONTENT, ADDRESS, IMG_URL"
				+" from JUGIYO_FOOD_STORE "
				+" where SEQ_STORE = '"+seq_store+"' ";
		FoodStoreDto dto = null;
		
		try {
			conn = DBConn.getConnection();
			System.out.println("2/6 S getallcount");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 S getallcount");
			rs = psmt.executeQuery();
			while(rs.next()){
				dto = new FoodStoreDto(rs.getString("BOSS_ID"), rs.getString("CATEGORY"), rs.getString("TITLE"),
						rs.getString("CONTENT"), rs.getString("ADDRESS"), rs.getString("IMG_URL"));
			}
			System.out.println("5/6 S getallcount");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.close(rs, psmt, conn);
			System.out.println("6/6 S getallcount");
		}
		return dto;
	}

	public List<FoodStoreDto> getCategoryFoodStoreList(String address, String category, int serchpage) {
		List<FoodStoreDto> foodStoreaddresslist = getAddressFoodStoreList(address, serchpage, category);
		List<FoodStoreDto> list = new ArrayList<>();
		for (int i = 0; i < foodStoreaddresslist.size(); i++) {
			if (foodStoreaddresslist.get(i).getCategory().equals(category)) {
				FoodStoreDto dto = new FoodStoreDto(
						foodStoreaddresslist.get(i).getSeq_store(), 
						foodStoreaddresslist.get(i).getBoss_id(), 
						foodStoreaddresslist.get(i).getCategory(),
						foodStoreaddresslist.get(i).getTitle(), 
						foodStoreaddresslist.get(i).getContent(), 
						foodStoreaddresslist.get(i).getImg_url(),
						address);
				list.add(dto);
			}
			
		}
		return list;
	}

	@Override
	public boolean modifyFoodStore(int seq_store) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteFoodStore(FoodStoreDto shop) {
		String sql = "UPDATE JUGIYO_FOOD_STORE "
				+ " SET STATUS = 'delete'"
				+ "	WHERE SEQ_STORE = ?";
		
		Object query = shop.getSeq_store();
		
		return DBConnection.executeUpdate(sql, query);
	}

}
