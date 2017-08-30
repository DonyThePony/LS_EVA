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
String questionType = String.valueOf(session.getAttribute("questionType"));
String questionTitle = String.valueOf(session.getAttribute("questionTitle"));
String questionPublicState = String.valueOf(session.getAttribute("questionPublicState"));

%>
<body>	
	<%
		if("M".equals(questionType)){ //Multiplychoice
			if(request.getParameter("target") != null){ //Übergabe an AddQuestion.jsp
				String[] answeres = new String[Integer.parseInt(request.getParameter("amount")) - 1];
				int j = 1;
				for(int i = 0; i < answeres.length; i++){
					answeres[i] = request.getParameter("answereText"+j);
					j++;
				}
				session.setAttribute("answeres", answeres);
				response.sendRedirect("AddQuestion.jsp");
			} else {
			// Aufbereitung des Forms für die Antworten des Multiplichoice.
				if(request.getParameter("answereText1") != null){
					//Prüfen wieviele Felder aufgebaut werden müssen
					int amount = 2;
					if(request.getParameter("amount") != null){
						amount = Integer.parseInt(request.getParameter("amount"));
					}
					if(amount < 2) amount = 2;
					%>
					<form action= "AddAnswersToQuestion.jsp" method="post">
					<%
					for(int i = 1; i <= amount; i++){
						if(request.getParameter("answereText"+i) != null){ //Wenn Antwort schon Wert zugewiesen bekommen hat
							%>
								Antwort:<input type="text" name="answereText<%=i%>" value="<%=request.getParameter("answereText"+i)%>"><br>
							<%
						} else {
							%>
								Antwort:<input type="text" name="answereText<%=i%>"><br>
							<%
						}
					}
					amount = amount+1;
					%>
					<input type="hidden" name="amount" value="<%=amount%>">
					<input type="submit" value="Weitere Antwort hinzufügen">
					<input type="submit" name="target" value="Fertig">
					</form>
					<%
				} else {
				%>
					<form action= "AddAnswersToQuestion.jsp" method="post">
						Antwort:<input type="text" name="answereText1"><br>
						<input type="hidden" name="amount" value="1">
						<input type="submit" value="Weitere Antwort hinzufügen">
					</form>
					
					<form action="AddQuestion.jsp" method="post">
							<input type="submit" value="Fertig">
					</form>
				<%
				}
			}
		}
	%>
</body>
</html>
