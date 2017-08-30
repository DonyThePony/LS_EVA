<%@page import="de.gso.User"%>
<%@page import="de.gso.Questionnaire"%>
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
			<th>Meine Fragebögen</th>
		</tr>
		<%
			//Umfragen Laden. Aus einer Liste.
			for(Questionnaire q : Holder.questionnaireList){
				if(q.getCreatorID() == user.getId()){
					String questionString = "["+q.getId()+"]"+q.getTitle()+"[CreatorID: "+q.getCreatorID()+"]";
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