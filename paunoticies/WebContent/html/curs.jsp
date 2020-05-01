<%@ page import = "java.util.regex.Pattern" %>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>CURS: REGISTRA'T</title>
	<jsp:include page="include/linksjava.jsp" />
</head>
<body>
	<div class="container-head">
  		<div class="row">
  		    <div class="col-sm-1">
    		</div>
    		<div class="col-sm-2">
      			<img src="media/JDA.png" alt="JDA">
    		</div>
    		<div class="col-sm-4">
      			<h1>ESCOLA D'IDIOMES JOAN D'ÀUSTRIA</h1>
    		</div>
    		
  		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light sticky-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="../Portada">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<em class="fas fa-arrow-right navawe"></em></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<% if (session.getAttribute("usuari") != null) { 
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
	String curs		= (String)request.getParameter("curs");
	Integer c 		= Integer.parseInt(curs);
	String pagar	= (String)request.getParameter("pagar");
	String select[] = request.getParameterValues("idioma");
	if (session.getAttribute("usuari") != null) { 
		String usuari = (String)session.getAttribute("usuari");
%>
	<div class="container">
  		<div class="row">
    		<div class="col-sm">
				Benvingut <%=usuari %>! Ja t'has matriculat correctament 
			</div> 
		</div>
<% 	} else {
		String usuari		= (String)request.getParameter("usupost");
%>
	<div class="container">
  		<div class="row">
    		<div class="col-sm">
				Benvingut <%=usuari %>! Ja t'has matriculat correctament 
			</div> 
		</div>
<% 	}
%>
		<div class="row">
    		<div class="col-sm">
      			El mètode escollit de pagament és: <%=pagar %>
    		</div>    		
  		</div>
  	</div>
</body>
</html>