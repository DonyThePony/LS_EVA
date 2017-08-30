<%@page import="de.gso.core.LdapManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
		//Prüfung der Log-In Daten
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		LdapManager ldpM = new LdapManager();
		if (ldpM.logIn(email, password)) {
			session.setAttribute("email", email);
			response.sendRedirect("Home.jsp");
		} else
			response.sendRedirect("Error.jsp");
	%>
</body>
</html>