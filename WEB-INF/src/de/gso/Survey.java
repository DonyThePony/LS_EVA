package de.gso;

import java.util.LinkedList;

/*
 * Umfrage. Entsteht nachdem ein Lehrer einen Fragebogen für einen bestimmten Userkreis veröffentlicht hat.
 */
public class Survey extends Questionnaire {

	private String userGroup;
	private boolean publicState;
	private LinkedList<User> completed; // Liste von Usern welche die Umfrage erfolgreich abgeschlossen haben.
	private LinkedList<User> uncompleted;
	
	public Survey(){
		
	}
	
	public void close(){
		
	}
	
	public void delete(){
		
	}
	
	public void evaluate(){
		
	}
}
