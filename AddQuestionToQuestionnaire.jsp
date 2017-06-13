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
				<p>Frage hinzufügen</p>
				<form action="CreateQuestionnaire.jsp" method="post">
				    <select name="question">
				    <%
						LinkedList<Question> qList = new LinkedList<>();
				    	qList.addAll((LinkedList<Question>)Holder.privateQuestionList.clone());
				    	qList.addAll((LinkedList<Question>)Holder.questionList.clone());
				    	for(Question q : qList){
				    		if(q.isPrivate()){
				    			if(q.getCreatorId() == user.getId()){
				    				%>
								      <option value="<%=q.getId()%>"><%=q.getQuestionText()%></option>				    				
				    				<%
				    			}
				    		} else {
				    			%>
							      <option value="<%=q.getId()%>"><%=q.getQuestionText()%></option>				    				
			    				<%
				    		}
				    	}
			      	%>
			      	</select>
					<br><input type="submit" name="submit" value="weiter">
				</form>
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