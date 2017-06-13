<%@page import="de.gso.Questionnaire"%>
<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
<%@page import="de.gso.Question" %>
<%@page import="java.util.LinkedList" %>
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
			%>
	<div class="login_container">	
		<div class="login_form">
				<p>Frage hinzufügen</p>
				<form action="CreateSurveyCheck.jsp" method="post">
					<p>Wählen Sie eine Umfrage
				    <select name="questionnaire">
				    <%
						for(Questionnaire q : Holder.questionnaireList){
							if(q.getCreatorID() == user.getId()){
								%>
							      <option value="<%=q.getId()%>"><%=q.getTitle()%></option>				    												
								<%								
							}
						}
			      	%>
			      	</select>
					<br>
			      	UserGroup:<input type="text" name="usergroup">
					<br><input type="submit" name="submit" value="Umfrage erstellen">
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