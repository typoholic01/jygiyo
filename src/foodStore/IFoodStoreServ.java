package foodStore;

import java.util.List;

public interface IFoodStoreServ {

	public boolean insertFoodStore(FoodStoreDto dto);
	
	public List<FoodStoreDto> getBossFoodStoreList(String boss_id);

	public List<FoodStoreDto> getAddressFoodStoreList(String address, int serchpage, String category);
	
	public int getallcount(String category);
	public FoodStoreDto getFoodStore(int seq_store);
	public boolean deleteFoodStore(FoodStoreDto shop);
}
