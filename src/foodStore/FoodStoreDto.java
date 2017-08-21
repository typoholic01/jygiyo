package foodStore;

import java.io.Serializable;

public class FoodStoreDto implements Serializable {
	private int seq_store;
	private String boss_id;
	private String name;
	private String category;
	private String title;
	private String content;
	private String img_url;
	
	public FoodStoreDto(int seq_store, String boss_id, String name, String category, String title, String content,
			String img_url) {
		super();
		this.seq_store = seq_store;
		this.boss_id = boss_id;
		this.name = name;
		this.category = category;
		this.title = title;
		this.content = content;
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "FoodStoreDto [seq_store=" + seq_store + ", boss_id=" + boss_id + ", name=" + name + ", category="
				+ category + ", title=" + title + ", content=" + content + ", img_url=" + img_url + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
	

}
