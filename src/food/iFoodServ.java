package food;

import java.util.List;

public interface iFoodServ {
	public boolean insertFood(FoodDto dto);
	public List<FoodDto> getFoodList(int seq_store);

}
