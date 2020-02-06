package model;

import java.io.Serializable;

public class Post implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userId;
	private String author;
	private String title;
	private String content;
	
	public int getId() {
		return id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
}
