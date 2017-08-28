package food;

import java.util.List;

public class FoodCtrl {
	iFoodServ foodServ = new FoodServ();
	
	public boolean insertFood(FoodDto dto) {
		boolean b = foodServ.insertFood(dto);
		return b;
	}
	public List<FoodDto> getFoodList(int seq_store) {
		List<FoodDto> list = foodServ.getFoodList(seq_store);
		return list;
	}

}
