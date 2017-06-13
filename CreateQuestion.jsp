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
//Html aufbereitung zur übergabe an CheckNewQuestion.jsp
%>
<body>	
<h1> Umfragetool - Frage hinzufügen </h1>
<div class="login_container">	
	<div class="login_form">
		<form action="CheckNewQuestion.jsp" method="post">
			Fragetitel<input type="text" name="questionTitle">
			<label>Fragentyp:
		    <select name="questionType">
		      <option value="M">Multiply Choice</option>
		      <option value="F">Freier Text</option>
		      <option value="C">Choose between</option>
		    </select>
		  </label><br>
			Öffentlich<input type="checkbox" name="questionPublicState"><br>
			<br><input type="submit" name="submit" value="Frage hinzufügen">
		</form>
	</div>
</div>
</body>
</html>
