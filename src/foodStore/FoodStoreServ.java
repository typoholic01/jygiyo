package foodStore;

public class FoodStoreServ implements IFoodStoreServ {
	IFoodStoreDao dao = new FoodStoreDao();

	public boolean insertFoodStore(FoodStoreDto dto) {
		return dao.insertFoodStore(dto);
	}
}
