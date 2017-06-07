<%@page import="de.gso.User"%>
<%@page import="de.gso.core.Holder" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
		//Remove User from Userlist.
		User u = null;
		String email = String.valueOf(session.getAttribute("email"));
		for(User uTemp : Holder.userList){
			if(uTemp.getEmail().equals(email)){
				u = uTemp;
			}
		}
		Holder.userList.remove(u);
		session.removeAttribute("email");
		session.removeAttribute("password");
		session.invalidate();
	%>
	<h1>Erfolgreich ausgeloggt.</h1>
</body>
</html>