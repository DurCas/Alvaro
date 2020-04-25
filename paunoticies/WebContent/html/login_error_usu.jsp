<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
<meta charset="ISO-8859-1">
<title>FORM RESPOSTA</title>
	<link rel="stylesheet" href="css/estils.css" type="text/css"></link>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
	<jsp:include page="include/sessioiniciadajava.jsp" /> 
	</nav>

	<h1>Nom d'usuari introdu�t de manera incorrecta</h1>
	<div class="container">
	  	<div class="row">
  			<div class="col-sm">
  		    	<p>Assegura't que nom�s cont� n�meros i lletres. M�nim 8 car�cters, m�xim 20</p>
    		</div>
  		</div>
  		<div class="row">
  			<div class="col-sm">
  		    	<a href="/paunoticies/html/login.jsp">TORNAR AL FORMULARI DE LOGIN</a>
    		</div>
  		</div>
  		<div class="row">
  		    <div class="col-sm">
  		    	<a href="Portada">TORNAR A LA PORTADA</a>
    		</div>
  		</div>
	</div>
</body>
</html>