package de.gso;

public class Sch�ler extends User{

	private String userKreis;
	
	public Sch�ler(String vorname, String nachname, String email, String userKreis) {
		super(vorname, nachname, email);
		this.userKreis = userKreis;
	}

	public String getUserKreis() {
		return userKreis;
	}
	
}
