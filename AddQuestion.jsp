<%@page import="de.gso.Answer"%>
<%@page import="de.gso.Question"%>
<%@page import="de.gso.core.ConnectionPool"%>
<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="Error.jsp"%>
<link rel="stylesheet" href="Styles/Main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Umfragetool EVA Projekt</title>
</head>
<%
String email = session.getAttribute("email").toString();
User user = new User(email);
String questionType = String.valueOf(session.getAttribute("questionType"));
String questionTitle = String.valueOf(session.getAttribute("questionTitle"));
String questionPublicState = String.valueOf(session.getAttribute("questionPublicState"));
int questionPrivate = 1;
if("on".equals(questionPublicState)){
	questionPrivate = 0;
}
int questionID = 0;
Question q = new Question();
%>
<body>	
	<%
		try{
		//Frage in Datenbank hinzufügen
		Statement st = ConnectionPool.getInstance().getCon().createStatement();
		//Sql für die Frage
		String sqlInsertQuestion = "INSERT INTO questions (question_id, question, question_type, private, user_id)"
		+" VALUES(null,"
		+"'"+questionTitle+"'"+","
		+"'"+questionType+"'"+","
		+questionPrivate+","
		+user.getId()+")";
		st.execute(sqlInsertQuestion);
		ResultSet rs = st.getGeneratedKeys();
		if(rs.next()){
			q.setId(rs.getInt(1));
			q.setCreatorId(user.getId());
			if(questionPrivate == 1){
				q.setPrivate(true);				
			} else{
				q.setPrivate(false);
			}
			q.setQuestion_type(questionType);
			q.setQuestionText(questionTitle);
			questionID = q.getId();
		}
		} catch(Exception ex){
			ex.printStackTrace();
		}
		//Antworten in Datenbank hinzufügen
		if("M".equals(questionType)){//Wenn MultiplyChoice
			try{
				String[] answeres = (String[])(session.getAttribute("answeres"));
				//Create SQL for Answeres
				
				for(int i = 0; i < answeres.length; i++){
					String sqlInsertAnsweres = "INSERT INTO answers (answer_id, question_id, answer_text)"
							+" VALUES("
							+" null,"
							+questionID+","
							+"'"+answeres[i]+"')";
					Statement st = ConnectionPool.getInstance().getCon().createStatement();
					st.execute(sqlInsertAnsweres);
					ResultSet rs = st.getGeneratedKeys();
					if(rs.next()){
						Answer a = new Answer();
						a.setId(rs.getInt(1));
						a.setQuestion(q);
						a.setText(answeres[i]);
						q.answerList.add(a);
						Holder.answerList.add(a);
					}
				}
				if(q.isPrivate()){
					Holder.privateQuestionList.add(q);
				} else {
					Holder.questionList.add(q);
				}
			} catch(Exception ex){
				ex.printStackTrace();
			}
		}
	%>
</body>
</html>
