<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="Error.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Umfragetool EVA Projekt</title>
</head>
<body>	
	<%
		String a = session.getAttribute("username").toString();
		out.println("Hello " + a);
	%>
	<a href="logout.jsp">Logout</a>
</body>
</html>