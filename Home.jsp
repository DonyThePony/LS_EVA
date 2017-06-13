<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
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
	<p>Wilkommen <%=user.getFirstname() + " " +  user.getLastname()%></p>
<body>	
	<%
		if(user.isTeacher()){
			//Show open Surveys
			%>
			<table>
				<tr>
					<th>Offene Umfrage</th>
				</tr>
				<tr>
			<%
			for(Survey s : Holder.openSurverys){
				//TODO: If Creator ID = Surver.CreatorId
				%>
					<td><%=s.getTitle()+"[ID:"+s.getId()+"]"%></td>
				<%
			}
			%>
				</tr>
			</table>
		<%
		}
	 	%>
	
	<p><a href="LogOut.jsp">Logout</a></p>
	<p><a href="QuestionPool.jsp">Fragepool anzeigen</a></p>	
	<p><a href="CreateQuestionnaire.jsp">Fragebogen erstellen</a></p>
	
</body>
</html>