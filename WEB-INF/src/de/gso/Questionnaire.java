package de.gso;

import java.util.LinkedList;

/*
 * Fragebogen Klasse. Entspricht:
 * Lehrer kann einen Fragebogen erstellen.
 * Lehrer kann Fragebogen bearbeiten.
 * Lehrer kann Fragebogen veröffentlichen an einen bestimmten Userkreis => Umfrage (Survey)
 */
public class Questionnaire {
	private int id;
	private String title;
	private String creator;
	private LinkedList<Question> questions;
	private String creationDate;
	private String lastEdit;
	
	public Questionnaire(){
		
	}
	
	public boolean publish(String userGroup){
		return true;
	}
	
	public void edit(){
		
	}
	
	public void delete(){
		
	}
}
