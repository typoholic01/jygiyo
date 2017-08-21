package bbs;

import java.io.Serializable;

public class BbsDto implements Serializable {
	private int seq_bbs;
	private int seq_store;
	private String comment_id;
	private String id_category;
	private String comments;
	private int comments_group_no;
	private String comments_reply;
	private String img_url;
	private String create_at;
	private String update_at;
	private String status;
	private int store_rating;
	
	public BbsDto(int seq_bbs, int seq_store, String comment_id, String id_category, String comments,
			int comments_group_no, String comments_reply, String img_url, String create_at, String update_at,
			String status, int store_rating) {
		super();
		this.seq_bbs = seq_bbs;
		this.seq_store = seq_store;
		this.comment_id = comment_id;
		this.id_category = id_category;
		this.comments = comments;
		this.comments_group_no = comments_group_no;
		this.comments_reply = comments_reply;
		this.img_url = img_url;
		this.create_at = create_at;
		this.update_at = update_at;
		this.status = status;
		this.store_rating = store_rating;
	}
	public BbsDto() {
	}
	@Override
	public String toString() {
		return "BbsDto [seq_bbs=" + seq_bbs + ", seq_store=" + seq_store + ", comment_id=" + comment_id
				+ ", id_category=" + id_category + ", comments=" + comments + ", comments_group_no=" + comments_group_no
				+ ", comments_reply=" + comments_reply + ", img_url=" + img_url + ", create_at=" + create_at
				+ ", update_at=" + update_at + ", status=" + status + ", store_rating=" + store_rating + "]";
	}
	public int getSeq_bbs() {
		return seq_bbs;
	}
	public void setSeq_bbs(int seq_bbs) {
		this.seq_bbs = seq_bbs;
	}
	public int getSeq_store() {
		return seq_store;
	}
	public void setSeq_store(int seq_store) {
		this.seq_store = seq_store;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getId_category() {
		return id_category;
	}
	public void setId_category(String id_category) {
		this.id_category = id_category;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getComments_group_no() {
		return comments_group_no;
	}
	public void setComments_group_no(int comments_group_no) {
		this.comments_group_no = comments_group_no;
	}
	public String getComments_reply() {
		return comments_reply;
	}
	public void setComments_reply(String comments_reply) {
		this.comments_reply = comments_reply;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getStore_rating() {
		return store_rating;
	}
	public void setStore_rating(int store_rating) {
		this.store_rating = store_rating;
	}
	

}