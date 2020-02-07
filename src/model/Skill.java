package model;

import java.io.Serializable;

public class Skill implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int userId;
	private String name;
	private String period;
	private String content;
    
    public Skill(int userId, String name, String period, String content) {
    	this.userId = userId;
    	this.name = name;
    	this.period = period;
    	this.content = content;
    }
    
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
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
