<%@page import="de.gso.User"%>
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
		out.print(user.getEmail());
	%>
	<a href="LogOut.jsp">Logout</a>
</body>
</html>