package foodStore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String columnSql = "SEQ_STORE, BOSS_ID, NAME, CATEGORY, "
				+ "TITLE, CONTENT, address, IMG_URL";
		String sql = "INSERT INTO JUGIYO_FOOD_STORE("+columnSql+") "
			+ " VALUES(SEQ_JUGIYO_FOOD_STORE.NEXTVAL, ?, ?, ?, "
			+ " ?, ?, ?, ?) ";
		
		System.out.println(sql);
		
		//질의 준비
		List<Object> queryList = new ArrayList<Object>();
		
		queryList.add(dto.getBoss_id());
		queryList.add(dto.getName());
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
		// TODO Auto-generated method stub
		return null;
	}

	public List<FoodStoreDto> getCategoryFoodStoreList(String address, String category, int serchpage) {
		List<FoodStoreDto> foodStoreaddresslist = getAddressFoodStoreList(address, serchpage, category);
		List<FoodStoreDto> list = new ArrayList<>();
		for (int i = 0; i < foodStoreaddresslist.size(); i++) {
			if (foodStoreaddresslist.get(i).getCategory().equals(category)) {
				FoodStoreDto dto = new FoodStoreDto(
						foodStoreaddresslist.get(i).getSeq_store(), 
						foodStoreaddresslist.get(i).getBoss_id(), 
						foodStoreaddresslist.get(i).getName(), 
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
	public boolean deleteFoodStore(int seq_store) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, "
		//+" CONTENT, IMG_URL, address
		String sql = "";
		if(category.equals("��ü�Ŵ�")){
			sql = " SELECT SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, CONTENT, "
				+" IMG_URL, ADDRESS "
				+" from JUGIYO_FOOD_STORE "
				//+" WHERE ADDRESS = '"+address+"' "
				+" order by seq_store desc";
		}else{
			sql = " SELECT SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, CONTENT, "
					+" IMG_URL, ADDRESS "
					+" from JUGIYO_FOOD_STORE "
					+" WHERE category = '"+category+"' "
					//+" WHERE ADDRESS = '"+address+"' "
					//+" and category = '"+category+"' "
					+" order by seq_store desc";
		}
		
		
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
				FoodStoreDto dto = new FoodStoreDto(
						rs.getInt(i++),
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++));
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


	public int getallcount(String category) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// SEQ_STORE, BOSS_ID, NAME, CATEGORY, TITLE, "
		//+" CONTENT, IMG_URL, address
		String sql = "";
		if (category.equals("��ü�Ŵ�")) {
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

}
