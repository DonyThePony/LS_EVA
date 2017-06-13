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
String questionType = request.getParameter("questionType");
String questionTitle = request.getParameter("questionTitle");
String questionPublicState = (request.getParameter("questionPublicState"));

%>
<body>	
	<%
		if("M".equals(questionType)){
			// Wenn Multiply Choice Typ. Dann müssen noch mögliche Antworten hinzugefügt werden.
			session.setAttribute("questionType", questionType);
			session.setAttribute("questionTitle", questionTitle);
			session.setAttribute("questionPublicState", questionPublicState);
			response.sendRedirect("AddAnswersToQuestion.jsp");			
		}
	%>
</body>
</html>
