package foodStore;

import java.util.List;

public interface IFoodStoreDao {
	
	public boolean insertFoodStore(FoodStoreDto dto);
	
	public FoodStoreDto getFoodStore(int seq_store);
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id);
	public List<FoodStoreDto> getCategoryFoodStoreList(String category);

	public boolean modifyFoodStore(int seq_store);
	public boolean deleteFoodStore(int seq_store);
	

}