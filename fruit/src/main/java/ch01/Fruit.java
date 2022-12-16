package ch01;

import java.sql.Date;

public class Fruit {
	private int id;
	private String name;
	private Date fruitDate;
	
	
	
	public int getNumber() {
		return id;
	}
	public void setNumber(int number) {
		this.id = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return fruitDate;
	}
	public void setDate(Date date) {
		this.fruitDate = date;
	}
	
	
	
	
}
