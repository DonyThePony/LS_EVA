package de.gso;

public class Student extends User{

	private String userKreis;
	
	public Student(String vorname, String nachname, String email, String userKreis) {
		super(vorname, nachname, email);
		this.userKreis = userKreis;
	}

	public String getUserKreis() {
		return userKreis;
	}
	
}
