<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Styles/Main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Login Eva</title>
</head>
<body>
<h1> Umfragetool - Login </h1>
<%// Login Page HTML aufbau.%>
<div class="login_container">	
	<div class="login_form">
		<form action="LoginCheck.jsp" method="post">
			<span class="mail"> E-Mail </span><br>
			<input type="text" name="email"> <br />
			<span class="password"> Passwort </span><br>
			<input type="password" name="password"> <br />
			<input type="submit" class="btn btn-primary" value="Einloggen">
		</form>
	</div>
</div>
</body>
</html>
