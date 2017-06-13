package de.gso.core;

import java.util.LinkedList;

import de.gso.Answer;
import de.gso.Question;
import de.gso.Questionnaire;
import de.gso.Survey;
import de.gso.User;
/*
 * Die Holder Klasse ist eine Hilfsklasse welche statisch aufgebaut ist.
 * Sie Erlaubt es mir Instanzen von Listen etc. zu sichern.
 * Und ermöglicht so einen geringen Transaktion-Verkehr zwischen Tomcatserverapplikation und Datenbankserver.
 */
public class Holder {

	public static LinkedList<Question> questionList = new LinkedList<>();
	public static LinkedList<Question> privateQuestionList = new LinkedList<>();
	public static LinkedList<User> userList = new LinkedList<>();
	public static LinkedList<Survey> openSurverys = new LinkedList<>();
	public static LinkedList<Questionnaire> questionnaireList = new LinkedList<>();
	public static LinkedList<Answer> answerList = new LinkedList<>();
}
