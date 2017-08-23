package foodStore;

import java.util.List;

public class FoodStoreCtrl {
	IFoodStoreServ serv = new FoodStoreServ();
	
	public boolean insertFoodStore(FoodStoreDto dto) {
		return serv.insertFoodStore(dto);
	}

	public FoodStoreDto getFoodStore(int seq_store) {
		return serv.getFoodStore(seq_store);
	}

	public List<FoodStoreDto> getBossFoodStoreList(String boss_id) {
		return serv.getBossFoodStoreList(boss_id);
	}

	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category) {
		return serv.getAddressFoodStoreList(address, serchpage, category);
	}

	public List<FoodStoreDto> getCategoryFoodStoreList(String address, String category, int serchpage) {
		return serv.getCategoryFoodStoreList(address, category, serchpage);
	}

	public int getallcount(String category) {
		return serv.getallcount(category);
	}

	public boolean modifyFoodStore(int seq_store) {
		return serv.modifyFoodStore(seq_store);
	}

	public boolean deleteFoodStore(int seq_store) {
		return serv.deleteFoodStore(seq_store);
	}

}
