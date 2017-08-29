package foodStore;

import java.util.List;

public class FoodStoreCtrl {
	IFoodStoreServ foodStoreServ = new FoodStoreServ();
	
	public boolean insertFoodStore(FoodStoreDto dto) {
		return foodStoreServ.insertFoodStore(dto);
	}

	public List<FoodStoreDto> getBossFoodStoreList(String boss_id) {
		return foodStoreServ.getBossFoodStoreList(boss_id);
	}
	

	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category) {
		
		return foodStoreServ.getAddressFoodStoreList(address,serchpage,category);
	}
	public int getallcount(String category) {
		
		return foodStoreServ.getallcount(category);
	}
	public FoodStoreDto getFoodStore(int seq_store) {
		FoodStoreDto dto = foodStoreServ.getFoodStore(seq_store);
		return dto;
	}

	public boolean deleteFoodStore(FoodStoreDto shop) {
		return foodStoreServ.deleteFoodStore(shop);
		
	}
}
