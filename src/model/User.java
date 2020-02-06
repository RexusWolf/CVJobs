package model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;

    private int id;
	private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String email;
    private String biography;
    private String gender;
    private String country;
    private String city;

    public int getId() {
    	return id;
    }
    public void setId(int id) {
    	this.id = id;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getBiography() {
    	return biography;
    }
    public void setBiograpy(String biography) {
    	this.biography = biography;
    }
    public String getGender() {
    	return gender;
    }
    public void setGender(String gender) {
    	this.gender = gender;
    }
    public String getCountry() {
    	return country;
    }
    public void setCountry(String country) {
    	this.country = country;
    }
    public String getCity() {
    	return city;
    }
    public void setCity(String city) {
    	this.city = city;
    }

    public String getFullName() {
    	return this.firstName + this.lastName;
    }
    
	public boolean checkPassword(String password) {
		if(this.password.equals(password)) {
			return true;
		}
		return false;
	}
}
