<%@page import="de.gso.core.ConnectionPool"%>
<%@page import="de.gso.Questionnaire"%>
<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
<%@page import="de.gso.Question" %>
<%@page import="java.util.LinkedList" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.*"%>
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
%>
<body>	
	<%
		if(user.isTeacher()){
			//Prüfung und Sicherung auf der Datenbank
			int sID = Integer.parseInt(String.valueOf(request.getParameter("questionnaire")));
			Survey s = null;
			for(Questionnaire q : Holder.questionnaireList){
				if(s == null){
					if(q.getId() == sID){
						s = new Survey();
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
						LocalDateTime now = LocalDateTime.now();
						s.setCreationDate(dtf.format(now));
						s.setCompleted(new LinkedList<User>());
						s.setCreatorID(user.getId());
						s.setLastEdit(s.getCreationDate());
						s.setPublicState(true);
						s.setQuestionnaire(q);
						s.setQuestions(q.getQuestions());
						s.setTitle(q.getTitle());
						s.setUserGroup(request.getParameter("usergroup"));
						s.setUncompleted(new LinkedList<User>());
						Holder.openSurverys.add(s);
					}
				}
			}
			if(s != null){
				String state = "O";
				if(!s.isPublicState()){
					state = "C";
				}
				//Umfrage wird in Datenbank gesichert.
				String sqlInserSurvey= "INSERT INTO surveys (survey_id, questionnaire_id, status, user_group)"
						+ " VALUES("
								+"null, "
								+s.getQuestionnaire().getId()+", "
								+"'"+state+"', "
								+"'"+s.getUserGroup()+"')";
				try{
					Statement st = ConnectionPool.getInstance().getCon().createStatement();
					st.execute(sqlInserSurvey);
					ResultSet rs = st.getGeneratedKeys();
					if(rs.next()){
						s.setId(rs.getInt(1));
					}
					response.sendRedirect("Home.jsp");
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
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