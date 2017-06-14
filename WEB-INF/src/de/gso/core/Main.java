package de.gso.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import de.gso.Answer;
import de.gso.Question;
import de.gso.Questionnaire;
import de.gso.Survey;


public class Main {

	/* run() wird nach Tomcat Server Start ausgeführt.
	 * Und dient als Startschuss für die Applikation.
	 */
	public void run() throws SQLException {
		loadQuestions();
		loadAnswers();
		loadQuestionnaries();
		loadSurveys();
	}
	//Generiert Fragebögen aus der Datebank
	private void loadQuestionnaries() throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		Questionnaire q = null;
		String surveySQL = "SELECT * FROM QUESTIONNAIRE";
		try{
			st = ConnectionPool.getInstance().getCon().createStatement();
			rs = st.executeQuery(surveySQL);
			while(rs.next()){
				q = new Questionnaire();
				q.setId(rs.getInt("questionnaire_id"));
				q.setCreatorID(rs.getInt("creator_id"));
				q.setCreationDate(rs.getString("create_date"));
				q.setLastEdit(rs.getString("last_edited"));
				q.setTitle(rs.getString("question_title"));
				
				//Create Questionlist for Questionnaire
				String sql = "SELECT question_id FROM questionquestionnaire WHERE questionnaire_id = "+q.getId();
				LinkedList<Question> qList = new LinkedList<>();
				Statement st2 = ConnectionPool.getInstance().getCon().createStatement();
				ResultSet rs2 = st2.executeQuery(sql);
				while(rs2.next()){
					for(Question qT : Holder.questionList){
						if(qT.getId() == rs2.getInt("question_id")){
							qList.add(qT);
						}
					}
					for(Question qT : Holder.privateQuestionList){
						if(qT.getId() == rs2.getInt("question_id")){
							qList.add(qT);
						}
					}
				}
				q.setQuestions(qList);
				Holder.questionnaireList.add(q);
			}
	
		}catch(Exception ex){
			ex.printStackTrace();
		} finally{
			if(st != null){
				st.close();
			}
			if(rs != null){
				rs.close();
			}
		}
	}
	//Generation einer Liste mit noch offenen Umfragen
	private void loadSurveys() throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		Survey s = null;
		String surveySQL = "SELECT * FROM SURVEYS";
		try{
			st = ConnectionPool.getInstance().getCon().createStatement();
			rs = st.executeQuery(surveySQL);
			while (rs.next()){
				s = new Survey();
				if("O".equals(rs.getString("status"))){
					s.setPublicState(true);					
				} else {
					s.setPublicState(false);
				}
				s.setUserGroup(rs.getString("user_group"));
				Questionnaire q = null;
				for(Questionnaire qTemp : Holder.questionnaireList){
					if(qTemp.getId() == rs.getInt("questionnaire_id")){
						q = qTemp;
					}
				}
				s.setQuestionnaire(q);					
				s.setId(rs.getInt("survey_id"));
				s.setTitle(q.getTitle());
				if(s != null){
					if(s.isPublicState()){
						Holder.openSurverys.add(s);
					}
				}
			}
		} catch(Exception ex){
			ex.printStackTrace();
		} finally{
			if(st != null){
				st.close();
			}
			if(rs != null){
				rs.close();
			}
		}
	}
	//Generiert eine Liste mit Antworten Welche zu Fragen gehören
	private void loadAnswers() throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		String answersSql = "SELECT * FROM ANSWERS";
		try{
			st = ConnectionPool.getInstance().getCon().createStatement();
			rs = st.executeQuery(answersSql);
			while(rs.next()){
				Answer a = new Answer();
				a.setId(rs.getInt("answer_id"));
				a.setQuestion(Question.getQuestion(rs.getInt("question_id")));
				a.setText(rs.getString("answer_text"));
				Holder.answerList.add(a);
			}
		} catch(Exception ex){
			ex.printStackTrace();
		} finally{
			if(st != null){
				st.close();
			}
			if(rs != null){
				rs.close();
			}
		}
	}
	//Generiert eine Liste von Fragen.
	private void loadQuestions() throws SQLException {
		Statement st = null;
		ResultSet rs = null;
		try {
			String questionsSQL = "SELECT * FROM QUESTIONS";
			Connection con = ConnectionPool.getInstance().getCon();
			st = con.createStatement();
			rs = st.executeQuery(questionsSQL);
			//Generiert Instanzen von verfügbaren Fragen.
			while(rs.next()){
				Question q =  new Question();
				q.setId(rs.getInt("question_id"));
				q.setCreatorId(rs.getInt("user_id"));
				q.setQuestionText(rs.getString("question"));
				q.setQuestion_type(rs.getString("question_type"));
				q.setPrivate(rs.getBoolean("private"));
				if(!q.isPrivate()){
					Holder.questionList.add(q);
				} else {
					Holder.privateQuestionList.add(q);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(st != null){
				st.close();
			}
			if(rs != null){
				rs.close();
			}
		}
		
	}
}
