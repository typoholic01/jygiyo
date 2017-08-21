package foodStore;

public class FoodStoreCtrl {
	IFoodStoreServ foodStoreServ = new FoodStoreServ();
	
	public boolean insertFoodStore(FoodStoreDto dto) {
		return foodStoreServ.insertFoodStore(dto);
	}

}
