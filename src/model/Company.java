package model;

import java.io.Serializable;

public class Company implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
    public int id;
    public String name;
    public String activity;
    
    public Company(String name, String activity) {
    	this.name = name;
    	this.activity = activity;
    }
    
}