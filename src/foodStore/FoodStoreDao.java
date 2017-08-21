package foodStore;

import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

public class FoodStoreDao implements IFoodStoreDao {

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
