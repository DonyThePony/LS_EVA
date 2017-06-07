<%@page import="de.gso.User"%>
<%@page import="de.gso.Survey"%>
<%@page import="de.gso.core.Holder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="Error.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<%
String username = session.getAttribute("username").toString();
User user = new User(username);
%>
<body>		
	<%
		out.print(user.getFirstname());
		//Check wenn User offene Umfragen hat:
		for(Survey s : Holder.openSurverys){
			if(s.isPublicState()){
				if(s.getUserGroup().equals(user.getUserGroup())){
					//TODO: Table. Answered Surveys From User
					%>
						<p>Umfrage[<%=s.getId()%>]: <%=s.getTitle()%></p>
					<%
				}
			}
		}
	%>
	
	<p><a href="LogOut.jsp">Logout</a></p>
	<p><a href="QuestionPool.jsp">Fragepool anzeigen</a></p>
</body>
</html>