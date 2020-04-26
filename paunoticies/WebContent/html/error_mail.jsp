<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>FORMULARI: EMAIL ERROR</title>
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
				<a class="nav-item nav-link active" href="Portada">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<em class="fas fa-arrow-right navawe"></em></a>
				<a class="nav-item nav-link" href="#">EXPERI�NCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<jsp:include page="include/sessioiniciada.jsp" /> 
	</nav>

	<h1>Email introdu�t incorrecte</h1>
	<div class="container">
		<div class="row">
  			<div class="col-sm">
  		    	<p>Assegura't que l'email escrit segueix un format correcte</p>
    		</div>
  		</div>
  		<div class="row">
  			<div class="col-sm">
  		    	<a href="/paunoticies/html/form.jsp">TORNAR AL FORMULARI DE REGISTRE</a>
    		</div>
  		</div>
  		<div class="row">
  		    <div class="col-sm">
  		    	<a href="../Portada">TORNAR A LA PORTADA</a>
    		</div>
  		</div>
	</div>

</body>
</html>