package ch09;

import java.sql.Date;

// 엔티티클래스는 데이터베이스와 대응된다. DO

public class Student {
	private int id;
	private String username;
	private String univ;
	private Date birth; // DB 연결한 날짜관련 -> java.sql.Date를 import한다
	private String email;
	
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
