<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="de.gso.*" %>
<%@page import="de.gso.core.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="Styles/Main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%
	Survey s = null;
	int sID = Integer.parseInt(String.valueOf(request.getParameter("sId")));
	for(Survey sTemp : Holder.openSurverys){
		if(sTemp.getId() == sID){
			s = sTemp;
		}
	}
%>
<h1><%=s.getTitle()%></h1>			
<div class="login_container">	
	<div class="login_form">
		<form action="CheckSurvey.jsp" method="post">
			<%
				for(Question q : s.getQuestionnaire().getQuestions()){
					if(q.getQuestion_type().equals("M")) // Wenn MultiplyChoice Frage
					%>
						<label><%=q.getQuestionText()%>:
					    <select name="questionType">
				      	  <%
				      	  	for(Answer a : Holder.answerList){
				      	  		if(a.getQuestionId() == q.getId()){
						     	%>
							      <option value="<%=a.getId()%>"><%=a.getText()%></option>
			      	  			<%
				      	  		}
				      	  	}
				      	  %>
					    </select>
					<%
				}
			%>
			<input type="submit" class="btn btn-primary" value="absenden">
		</form>
	</div>
</div>
</body>
</html>
