<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>OFERTA DE CURSOS</title>
	<jsp:include page="include/links.jsp" />
</head>
<body>
<div class="container-head">
  		<div class="row">
  		    <div class="col-sm-1">
    		</div>
    		<div class="col-sm-2">
      			<img src="../media/JDA.png" alt="JDA">
    		</div>
    		<div class="col-sm-4">
      			<h1>ESCOLA D'IDIOMES JOAN D'�USTRIA</h1>
    		</div>
    		
  		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light sticky-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="../Portada">INICI</a>
				<a class="nav-item nav-link active" href="#">IDIOMES<em class="fas fa-arrow-right navawe"> <span class="sr-only">(current)</span></em></a>
				<a class="nav-item nav-link" href="#">EXPERI�NCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>		
		<jsp:include page="include/sessioiniciada.jsp" /> 
	</nav>
	
	<%
	if (session.getAttribute("usuari") != null) { %>
	<form method="POST" action="../Curs">
	<% 
	} else {
	%>
	<form method="POST" action="../CursNoSessio">
	<%
	}
	%>
		<div class="container">
		  <div class="row">
			<div class="col-sm">
			  <img src="../media/Angl�s.png" alt="GB" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Franc�s.png" alt="FRA" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Alemany.png" alt="ALE" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Itali�.png" alt="IT" class="bandera">
			</div>    
			<div class="col-sm">
			  <img src="../media/Portugu�s.png" alt="POR" class="bandera">
			</div>
		  </div>
		  <div class="row">
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma1" name="idioma" value="Angl�s">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma2" name="idioma" value="Franc�s">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma3" name="idioma" value="Alemany">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma4" name="idioma" value="Itali�">
			</div>    
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma5" name="idioma" value="Portugu�s">
			</div>
		  </div>
		</div>

		<div class="container containermetode">
			<div class="row">
				<div class="col-sm metode">
					M�tode de pagament
				</div>
			</div>
			<div class="row rowmetode">
				<div class="col-sm-2">
				</div>
				<div class="col-sm-2">
					Met�lic
				</div>
				<div class="col-sm-1">
					<input type="radio" id="Met�lic" name="pagar" value="Met�lic">
				</div>
				<div class="col-sm-2">
					Tarjeta de cr�dit
				</div>
				<div class="col-sm-1">
					<input type="radio" id="Tarjeta de cr�dit" name="pagar" value="Tarjeta de cr�dit">
				</div>
				<div class="col-sm-2">
					Paypal
				</div>
				<div class="col-sm-1">
					<input type="radio" id="Paypal" name="pagar" value="Paypal">
				</div>	
				<div class="col-sm-2">
				</div>				
			</div>
		</div>

		<div class="container containerusu">
		  <div class="row">
			<%
			if (session.getAttribute("usuari") != null) { %>
			<div class="col-sm-2">
				Usuari: ${sessionScope.usuari}
			</div>	
			<% } else { %>
			<div class="col-sm-2">
				Nom d'usuari:
			</div>	
			<div class="col-sm">			
				<input type="text" id="usupost" name="usupost">
			</div>	
			<% }
			%>	

			<div class="col-sm-2">
				Curs:
			</div>	
			<div class="col-sm">
				<select name="curs">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
			</div>
			<div class="col-sm">
				<div class="col-sm-2"><button type="submit" class="btn btn-warning btn-modal btn-modal-enviar">Enviar</button></div>
			</div>	
		  </div>
		</div>
	</form>

	<%
	if (session.getAttribute("usuari") != null) { %>
	<form method="GET" action="../Curs">
	<% 
	} else {
	%>
	<form method="GET" action="../CursNoSessio">
	<%
	}
	%>
		<div class="container">
			<div class="row rowform">				
				<%
				if (session.getAttribute("usuari") != null) { %>
				<div class="col-sm-2">
					Usuari: ${sessionScope.usuari}
				</div>	
				<% } else { %>
				<div class="col-sm-2">
					Nom d'usuari:
				</div>	
				<div class="col-sm">			
					<input type="text" id="usupost" name="usuget">
				</div>	
				<% }
				%>
				<div class="col-sm-2">
					Comentaris:
				</div>
				<div class="col-sm">
					<input type="text" id="comment" name="comment" class="comentaris">
				</div>	
			</div>
			<div class="row">
				<div class="col-sm-2">
					<div class="col-sm-2"><button type="submit" class="btn btn-warning btn-modal btn-modal-enviar">Enviar</button></div>
				</div>
				<div class="col-sm-2">
					<div class="col-sm-2"><button type="reset" class="btn btn-danger btn-modal">Esborrar</button></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>