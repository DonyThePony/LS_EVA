package de.gso;

public class Schüler extends User{

	private String userKreis;
	
	public Schüler(String vorname, String nachname, String email, String userKreis) {
		super(vorname, nachname, email);
		this.userKreis = userKreis;
	}

	public String getUserKreis() {
		return userKreis;
	}
	
}
