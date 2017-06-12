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
String email = session.getAttribute("email").toString();
User user = new User(email);
%>
<body>		
	<p>Wilkommen <%=user.getFirstname() + " " +  user.getLastname()%></p>
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
</body>
</html>