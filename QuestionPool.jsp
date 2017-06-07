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
String username = session.getAttribute("username").toString();
User user = new User(username);
%>
<body>		
	<table style = float:left;>
		<tr>
			<th>Öffentliche Fragen</th>
		</tr>
		<tr>
		<%
			for(Question q : Holder.questionList){
				String questionString = "["+q.getId()+"]"+q.getQuestionText()+"[CreatorID: "+q.getCreatorId()+"]";
				%>
					<td><%=questionString%></td>
				<%	
			}
		%>
		</tr>
	</table>
	<table style = float:Center;>
		<tr>
			<th>Deine Privaten Fragen</th>
		</tr>
		<tr>
		<%
			for(Question q : Holder.privateQuestionList){
				if(q.getCreatorId() == user.getId()){
				String questionString = "["+q.getId()+"]"+q.getQuestionText()+"[CreatorID: "+q.getCreatorId()+"]";
				%>
					<td><%=questionString%></td>
				<%	
				}
			}
		%>
		</tr>
	</table>
<br>
<p><a href="LogOut.jsp">Logout</a></p>
</body>
</html>