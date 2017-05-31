package de.gso;

public class User {
	private String vorname;
	private String nachname;
	private String email;
	
	
	/*
	 * User Klasse mit simplen Getter Methoden. Dient als Datencontainer.
	 * 
	 */
	public User(String vorname, String nachname, String email){
		this.vorname = vorname;
		this.nachname = nachname;
		this.email = email;
	}

	public String getVorname() {
		return vorname;
	}

	public String getNachname() {
		return nachname;
	}

	public String getEmail() {
		return email;
	}
}
