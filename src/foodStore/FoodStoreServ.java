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
}
