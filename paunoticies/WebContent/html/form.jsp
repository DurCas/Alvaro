<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
<meta charset="ISO-8859-1">
<title>FORM</title>
	<link rel="stylesheet" href="../css/estils.css" type="text/css"></link>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="include/imatge.jsp" />  
	<nav class="navbar navbar-expand-lg navbar-light sticky-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="../Portada">INICI</a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<em class="fas fa-arrow-right navawe"></em></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<jsp:include page="include/sessioiniciada.jsp" />  
	</nav>
    
    <div class="container">
            <form action="../Form_resposta" method="post">    
                <div class="row">
                  <div class="col-sm-2">Usuari: </div>
                  <div class="col-sm-2 filamodal"><input type="text" name="usuari" required></div>
                </div>
                <div class="row">
                   <div class="col-sm-2"></div>
                   <div class="col-sm-10 filainfo">Lletres i números. Mínim 8 caràcters i màxim 20.</div>
                </div>
                <div class="row">
                  <div class="col-sm-2">Contrasenya: </div>
                  <div class="col-sm-1 filamodal"><input type="password" name="contra" required></div>
                </div>
                <div class="row">
                   <div class="col-sm-2"></div>
                   <div class="col-sm-10 filainfo">Lletres i números. Mínim 8 caràcters i màxim 20.</div>
                </div>
                <div class="row">
                  <div class="col-sm-2">Adreça electrònica: </div>
                  <div class="col-sm-1 filamodal"><input type="text" name="mail" required></div>
                </div>
                <div class="row filaregis">
                  <div class="col-sm-2"><button type="submit" class="btn btn-warning btn-modal btn-modal-enviar">Enviar</button></div>
                  <div class="col-sm-2"><button type="reset" class="btn btn-danger btn-modal">Esborrar</button></div>
                </div>  
            </form>          
        </div>
</body>
</html>