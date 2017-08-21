package food;

import java.util.List;

public interface IFoodDao {
	
	public boolean insertFood(FoodDto dto);
	
	public FoodDto getFood(int seq_food);
	public List<FoodDto> getFoodList(int seq_store);

	public boolean modifyFood(int seq_food);
	public boolean deleteFood(int seq_food);
	

}
