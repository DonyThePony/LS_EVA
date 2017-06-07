package de.gso;

import de.gso.core.Holder;

/*
 * Die Frage. Ein Bestandteil eines Fragebogens.
 * Einem Fragebogen können X Fragen zugeordnet sein.
 */
public class Question {

	private int id;
	private String questionText;
	private String question_type;
	private boolean isPrivate;
	private int creatorId;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the questionText
	 */
	public String getQuestionText() {
		return questionText;
	}
	/**
	 * @param questionText the questionText to set
	 */
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	/**
	 * @return the question_type
	 */
	public String getQuestion_type() {
		return question_type;
	}
	/**
	 * @param question_type the question_type to set
	 */
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	/**
	 * @return the isPrivate
	 */
	public boolean isPrivate() {
		return isPrivate;
	}
	/**
	 * @param isPrivate the isPrivate to set
	 */
	public void setPrivate(boolean isPrivate) {
		this.isPrivate = isPrivate;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId= creatorId;
	}
	public int getCreatorId(){
		return creatorId;
	}
	/**
	 * Gibt eine Instanz von Question zurück.
	 * @param qId
	 * @return
	 */
	public static Question getQuestion(int qId) {
		Question q = null;
		for(Question qTemp : Holder.questionList){
			if(qTemp.getId() == qId){
				q = qTemp; 
			}
		}
		if(q == null){
			for(Question qTemp : Holder.privateQuestionList){
				if(qTemp.getId() == qId){
					q = qTemp;
				}
			}
		}
		return q;
	}
}
