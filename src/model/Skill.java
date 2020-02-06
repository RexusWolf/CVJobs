package model;

import java.io.Serializable;

public class Skill implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userId;
	private String name;
	
	public int getId() {
		return id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
