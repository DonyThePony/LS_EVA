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
	private Questionnaire questionnaire;
	private int id;
	private int creatorID;
	
	public Survey(){
		
	}
	
	public void close(){
		
	}
	
	public void delete(){
		
	}
	
	public void evaluate(){
		
	}

	public String getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(String userGroup) {
		this.userGroup = userGroup;
	}

	public boolean isPublicState() {
		return publicState;
	}

	public void setPublicState(boolean publicState) {
		this.publicState = publicState;
	}

	public LinkedList<User> getCompleted() {
		return completed;
	}

	public void setCompleted(LinkedList<User> completed) {
		this.completed = completed;
	}

	public LinkedList<User> getUncompleted() {
		return uncompleted;
	}

	public void setUncompleted(LinkedList<User> uncompleted) {
		this.uncompleted = uncompleted;
	}

	public Questionnaire getQuestionnaire() {
		return questionnaire;
	}

	public void setQuestionnaire(Questionnaire questionnaire) {
		this.questionnaire = questionnaire;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the creatorID
	 */
	public int getCreatorID() {
		return creatorID;
	}

	/**
	 * @param creatorID the creatorID to set
	 */
	public void setCreatorID(int creatorID) {
		this.creatorID = creatorID;
	}
}
