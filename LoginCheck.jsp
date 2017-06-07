<%@page import="de.gso.core.LdapManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LdapManager ldpM = new LdapManager();
		if (ldpM.logIn(username, password)) {
			session.setAttribute("username", username);
			response.sendRedirect("Home.jsp");
		} else
			response.sendRedirect("Error.jsp");
	%>
</body>
</html>