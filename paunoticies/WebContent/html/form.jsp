<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>FORMULARI</title>
	<jsp:include page="include/links.jsp" />
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
				<a class="nav-item nav-link" href="#">EXPERI�NCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<jsp:include page="include/sessioiniciada.jsp" />  
	</nav>
    
    <div class="container">
            <form action="../FormResposta" method="post">    
                <div class="row">
                  <div class="col-sm-2">Usuari: </div>
                  <div class="col-sm-2 filamodal"><input type="text" name="usuari" required></div>
                </div>
                <div class="row">
                   <div class="col-sm-2"></div>
                   <div class="col-sm-10 filainfo">Lletres i n�meros. M�nim 8 car�cters i m�xim 20.</div>
                </div>
                <div class="row">
                  <div class="col-sm-2">Contrasenya: </div>
                  <div class="col-sm-1 filamodal"><input type="password" name="contra" required></div>
                </div>
                <div class="row">
                   <div class="col-sm-2"></div>
                   <div class="col-sm-10 filainfo">Lletres i n�meros. M�nim 8 car�cters i m�xim 20.</div>
                </div>
                <div class="row">
                  <div class="col-sm-2">Adre�a electr�nica: </div>
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