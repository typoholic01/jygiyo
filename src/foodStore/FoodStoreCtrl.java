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
}
