<%@page import="de.gso.core.ConnectionPool"%>
<%@page import="de.gso.Questionnaire"%>
<%@page import="de.gso.Question"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.LinkedList" %>
<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
<%@page import="java.sql.*" %>
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
Questionnaire qA = new Questionnaire();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
LocalDateTime now = LocalDateTime.now();
LinkedList<Question> qL = null;
if(session.getAttribute("qA") == null){
	qA.setCreationDate(dtf.format(now));
	qA.setCreatorID(user.getId());
	qA.setLastEdit(dtf.format(now));
	LinkedList<Question> qList = new LinkedList<>();
 	qA.setQuestions(qList);
	session.setAttribute("qA", qA);
} else {
	qA = (Questionnaire)session.getAttribute("qA");
	qA.setTitle(String.valueOf(session.getAttribute("questionaireTitle")));
}
if(request.getParameter("question") != null){
	int qID = Integer.parseInt(String.valueOf(request.getParameter("question")));
	qL = (LinkedList<Question>)Holder.questionList.clone();
	qL.addAll((LinkedList<Question>)Holder.privateQuestionList.clone());
	for(Question q : qL){
		if(qID == q.getId()){
			qA.getQuestions().add(q);			
		}
	}
}
%>
<body>	
	<%
		if(user.isTeacher()){
			if("speichern".equals(request.getParameter("submit"))){
				Holder.questionnaireList.add(qA);
				try{
					//Fragebogen erstellen.
					Statement st = ConnectionPool.getInstance().getCon().createStatement();
					String sqlInsertQuestionnaire = "INSERT INTO questionnaire (questionnaire_id, creator_id, create_date, last_edited, question_title)"
							+" VALUES("
									+"null,"
									+user.getId()+","
									+"'"+qA.getCreationDate()+"',"
									+"'"+qA.getLastEdit()+"',"
									+"'"+qA.getTitle()+"')";
					st.execute(sqlInsertQuestionnaire);
					//Antworten mit Fragebogen verknüpfen.
					ResultSet rs = st.getGeneratedKeys();
					if(rs.next()){
						int qID = rs.getInt(1);
						for(Question q : qA.getQuestions()){
							String sqlInsetQuestionQuestionnaire = "INSERT INTO questionquestionnaire (questionnaire_id, question_id)"
									+" VALUES("
											+qID+", "
											+q.getId()+")";
							st.execute(sqlInsetQuestionQuestionnaire);
						}
						qA.setId(qID);
					}
					session.removeAttribute("qA");
					session.removeAttribute("questionaireTitle");
					response.sendRedirect("Home.jsp");
				} catch(Exception ex){
					ex.printStackTrace();	
				}
				session.setAttribute("questionaireTitle", request.getParameter("questionaireTitle"));
				response.sendRedirect("CreateQuestionnaireCheck.jsp");
			}
		%>
			<div class="login_container">
				<div class="login_form">
					<form action="CreateQuestionnaireCheck.jsp" method="post">
					<%
						if(qA.getTitle() != null){
							%>
								Fragebogen Titel<input type="text" name="questionaireTitle" value="<%=qA.getTitle()%>">							
							<%
						} else {
							%>
								Fragebogen Titel<input type="text" name="questionaireTitle">							
							<%
						}
						int i = 1;
						for(Question q : qA.getQuestions()){
							%>
								Frage <%=i%>: <p><%=q.getQuestionText()%></p>							
							<%
							i++;
						}
					%>	
					<input type="submit" name="submit" value="speichern">
					</form>
				</div>
			</div>
		<%
		} else {
			%>
				<script>
					alert("Du bist kein Lehrer.");
				</script>
			<%
			response.sendRedirect("Home.jsp");
		}
	 	%>
	
	<p><a href="Home.jsp">Home</a></p>
	<p><a href="LogOut.jsp">Logout</a></p>
	
</body>
</html>