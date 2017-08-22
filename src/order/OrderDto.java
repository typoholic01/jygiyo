package order;

import java.io.Serializable;

public class OrderDto implements Serializable {
	private int seq_order;
	private int seq_food;
	private String customer_id;
	private String create_at;
	private String status;
	private int food_count;
	
	@Override
	public String toString() {
		return "OrderDto [seq_order=" + seq_order + ", seq_food=" + seq_food + ", customer_id=" + customer_id
				+ ", create_at=" + create_at + ", status=" + status + ", food_count=" + food_count + "]";
	}

	public OrderDto(int seq_order, int seq_food, String customer_id, String create_at, String status, int food_count) {
		super();
		this.seq_order = seq_order;
		this.seq_food = seq_food;
		this.customer_id = customer_id;
		this.create_at = create_at;
		this.status = status;
		this.food_count = food_count;
	}

	public int getSeq_order() {
		return seq_order;
	}

	public void setSeq_order(int seq_order) {
		this.seq_order = seq_order;
	}

	public int getSeq_food() {
		return seq_food;
	}

	public void setSeq_food(int seq_food) {
		this.seq_food = seq_food;
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

	public int getFood_count() {
		return food_count;
	}

	public void setFood_count(int food_count) {
		this.food_count = food_count;
	}
	
	

	
}