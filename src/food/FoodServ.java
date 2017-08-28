package food;

import java.util.List;

public class FoodServ implements iFoodServ {
	IFoodDao dao = new FoodDao();
	@Override
	public boolean insertFood(FoodDto dto) {
		boolean b = dao.insertFood(dto);
		return b;
	}
	@Override
	public List<FoodDto> getFoodList(int seq_store) {
		List<FoodDto> list = dao.getFoodList(seq_store);
		return list;
	}
	
	

}
