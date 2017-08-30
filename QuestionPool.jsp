<%@page import="de.gso.User"%>
<%@page import="de.gso.Question"%>
<%@page import="de.gso.core.Holder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="Error.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Frage-Pool</title>
</head>
<%
String email = session.getAttribute("email").toString();
User user = new User(email);
%>
<body>		
	<table style = float:left;>
		<tr>
			<th>Öffentliche Fragen</th>
		</tr>
		<%
			//Alle Öffentlichen Fragen werden für den Fragen-Pool geladen.
			for(Question q : Holder.questionList){
				String questionString = "["+q.getId()+"]"+q.getQuestionText()+"[CreatorID: "+q.getCreatorId()+"]";
				%>
				<tr>
					<td><%=questionString%></td>
				</tr>
				<%	
			}
		%>
	</table>
	<table style = float:Center;>
		<tr>
			<th>Deine Privaten Fragen</th>
		</tr>
		<%
			//Laden der Privaten Fragen des Users
			for(Question q : Holder.privateQuestionList){
				if(q.getCreatorId() == user.getId()){
				String questionString = "["+q.getId()+"]"+q.getQuestionText()+"[CreatorID: "+q.getCreatorId()+"]";
				%>
				<tr>
					<td><%=questionString%></td>
				</tr>
				<%	
				}
			}
		%>
	</table>
<br>
<br>
<p><a href="CreateQuestion.jsp">Frage hinzufügen</a></p>
<p><a href="Home.jsp">Home</a></p>
<p><a href="LogOut.jsp">Logout</a></p>
</body>
</html>