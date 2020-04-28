<%@ page import = "java.util.regex.Pattern" %>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import="java.sql.*" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>COMENTARI: REGISTRAT</title>
	<jsp:include page="include/linksjava.jsp" />
</head>
<body>
	<jsp:include page="include/imatgejava.jsp" />
	<nav class="navbar navbar-expand-lg navbar-light sticky-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="paunoticies/Portada.java">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<em class="fas fa-arrow-right navawe"></em></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<% if (session != null) { 
		%>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal">${sessionScope.usuari}</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="../Logout">SORTIR</a>
		</span>
		<% } else { 
		%>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/login.jsp">LOGUEJA'T</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/form.jsp">REGISTRA'T</a>
		</span>
		<% }
		%>
	</nav>

<%
	String usuari		= (String)request.getParameter("usuget");
	String comentaris	= (String)request.getParameter("comment");
%>
	<div class="container">
  		<div class="row">
    		<div class="col-sm">
      			Usuari: <%=usuari %>Usuari: <%=usuari %>
    		</div>    					
  		</div>
  		<div class="row">
    		<div class="col-sm">
      			Comentari: <%=comentaris %>
    		</div>  
  		</div>
  	</div>
  	
</body>
</html>