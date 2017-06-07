package de.gso;

import java.sql.SQLException;

public class Student extends User{

	private String userKreis;
	
	public Student(String email, String userKreis) throws Exception {
		super(email);
		this.userKreis = userKreis;
	}

	public String getUserKreis() {
		return userKreis;
	}
	
}
