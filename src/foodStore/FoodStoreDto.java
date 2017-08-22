package foodStore;

import java.io.Serializable;

public class FoodStoreDto implements Serializable {
	private static final long serialVersionUID = 1009970148851557910L;
	
	private int seq_store;
	private String boss_id;
	private String category;
	private String title;
	private String content;
	private String address;
	private String img_url;
		
	public FoodStoreDto() {
	}

	public FoodStoreDto(int seq_store, String boss_id, String category, String title, String content, String address,
			String img_url) {
		super();
		this.seq_store = seq_store;
		this.boss_id = boss_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.address = address;
		this.img_url = img_url;
	}

	public int getSeq_store() {
		return seq_store;
	}

	public void setSeq_store(int seq_store) {
		this.seq_store = seq_store;
	}

	public String getBoss_id() {
		return boss_id;
	}

	public void setBoss_id(String boss_id) {
		this.boss_id = boss_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

}
