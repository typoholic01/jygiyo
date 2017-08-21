package food;

import java.io.Serializable;

public class FoodDto implements Serializable {
	private int seq_food;
	private int seq_store;
	private String food_category;
	private String food_name;
	private int food_price;
	private String food_size;
	private String img_url;
	
	public FoodDto(int seq_food, int seq_store, String food_category, String food_name, int food_price,
			String food_size, String img_url) {
		super();
		this.seq_food = seq_food;
		this.seq_store = seq_store;
		this.food_category = food_category;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_size = food_size;
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "FoodDto [seq_food=" + seq_food + ", seq_store=" + seq_store + ", food_category=" + food_category
				+ ", food_name=" + food_name + ", food_price=" + food_price + ", food_size=" + food_size + ", img_url="
				+ img_url + "]";
	}

	public int getSeq_food() {
		return seq_food;
	}

	public void setSeq_food(int seq_food) {
		this.seq_food = seq_food;
	}

	public int getSeq_store() {
		return seq_store;
	}

	public void setSeq_store(int seq_store) {
		this.seq_store = seq_store;
	}

	public String getFood_category() {
		return food_category;
	}

	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public String getFood_size() {
		return food_size;
	}

	public void setFood_size(String food_size) {
		this.food_size = food_size;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	

}
