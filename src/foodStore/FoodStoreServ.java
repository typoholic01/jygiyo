package foodStore;

import java.util.List;

public class FoodStoreServ implements IFoodStoreServ {
	IFoodStoreDao dao = new FoodStoreDao();

	public boolean insertFoodStore(FoodStoreDto dto) {
		return dao.insertFoodStore(dto);
	}

	@Override
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id) {
		return dao.getBossFoodStoreList(boss_id);
	}

	@Override
	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category) {
		return dao.getAddressFoodStoreList(address, serchpage, category);
	}

	@Override
	public int getallcount(String category) {
		return dao.getallcount(category);
	}

	@Override
	public FoodStoreDto getFoodStore(int seq_store) {
		FoodStoreDto dto = dao.getFoodStore(seq_store);
		return dto;
	}
	
}
