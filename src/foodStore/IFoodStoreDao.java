package foodStore;

import java.util.List;

public interface IFoodStoreDao {
	
	public boolean insertFoodStore(FoodStoreDto dto);
	
	public FoodStoreDto getFoodStore(int seq_store);
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id);
	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category);
	public int getallcount(String category);
	public List<FoodStoreDto> getCategoryFoodStoreList(String category);
	public boolean modifyFoodStore(int seq_store);

	boolean deleteFoodStore(FoodStoreDto shop);
	

}
