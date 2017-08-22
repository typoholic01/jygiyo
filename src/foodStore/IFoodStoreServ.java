package foodStore;

import java.util.List;

public interface IFoodStoreServ {

	public boolean insertFoodStore(FoodStoreDto dto);
	
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id);
}
