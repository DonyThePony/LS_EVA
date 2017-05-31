<html>
<head>
	<title>Lernsituation Eva</title>
</head>
<body>
	<h1>Login</h1>
	<form action = "index.jsp" method="post">
		Email: <input type="text" name="user" id="user"></input>
		Password: <input type="password" name="password"></input>
		<input type="submit" value="Submit">
	</form>
	
	<%
		if(request.getParameter("user") != null && request.getParameter("password") != null){
			response.sendRedirect("home.jsp");
		}
	%>
</body>
</html>