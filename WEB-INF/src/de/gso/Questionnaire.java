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
	private LinkedList<Question> questions;
	private String creationDate;
	private String lastEdit;
	private int creatorID;
	
	public Questionnaire(){
		
	}
	
	public boolean publish(String userGroup){
		return true;
	}
	
	public void edit(){
		
	}
	
	public void delete(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LinkedList<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(LinkedList<Question> questions) {
		this.questions = questions;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getLastEdit() {
		return lastEdit;
	}

	public void setLastEdit(String lastEdit) {
		this.lastEdit = lastEdit;
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
