<%@ page import="de.gso.core.LdapManager" %>
<html>
<head>
	<title>Lernsituation Eva</title>
</head>
<body>
	<h1>Login</h1>
	<form action = "login.jsp" method="post">
		Email: <input type="text" name="user" id="user"></input>
		Password: <input type="password" name="password"></input>
		<input type="submit" value="Submit">
	</form>
	
	<%
		if(request.getParameter("user") != null && request.getParameter("password") != null){
			String user = request.getParameter("user");
			String pw = request.getParameter("password");
			LdapManager ldpm = new LdapManager();
			if(ldpm.logIn(user, pw)){
				response.sendRedirect("home.jsp");				
			} else {
				%>
				<p> User oder Passwort nicht korrekt! </p>
				<%		
			}
		} else {
			%>
			<p> Bitte User und Passwort eingeben! </p>
			<%
		}
	%>
</body>
</html>