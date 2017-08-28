package order;

import java.io.Serializable;

public class OrderDto implements Serializable {
	private String store_name;
	private String food_name;
	private int food_price;
	private int food_count;
	private int seq_food;
	private int seq_store;
	private int seq_order;
	private String customer_id;
	private String create_at;
	private String status;
	private String food_size;
	
	public OrderDto() {
	}
	
	public OrderDto(String store_name, String food_name, int food_price, int food_count) {
		super();
		this.store_name = store_name;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
	}

	public OrderDto(String store_name, String food_name, int food_price, int food_count, int seq_food, int seq_store,
			String customer_id, String create_at, String status, String food_size) {
		super();
		this.store_name = store_name;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_count = food_count;
		this.seq_food = seq_food;
		this.seq_store = seq_store;
		this.customer_id = customer_id;
		this.create_at = create_at;
		this.status = status;
		this.food_size = food_size;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
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

	public int getFood_count() {
		return food_count;
	}

	public void setFood_count(int food_count) {
		this.food_count = food_count;
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

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCreate_at() {
		return create_at;
	}

	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFood_size() {
		return food_size;
	}

	public void setFood_size(String food_size) {
		this.food_size = food_size;
	}	

	public int getSeq_order() {
		return seq_order;
	}

	public void setSeq_order(int seq_order) {
		this.seq_order = seq_order;
	}

	@Override
	public String toString() {
		return "OrderDto [store_name=" + store_name + ", food_name=" + food_name + ", food_price=" + food_price
				+ ", food_count=" + food_count + ", seq_food=" + seq_food + ", seq_store=" + seq_store
				+ ", customer_id=" + customer_id + ", create_at=" + create_at + ", status=" + status + ", food_size="
				+ food_size + "]";
	}
	
	
	
	
	
	

	
}
