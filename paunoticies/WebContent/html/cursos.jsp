<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
<meta charset="ISO-8859-1">
<title>OFERTA DE CURSOS</title>
<link rel="stylesheet" href="../css/estils.css" type="text/css"></link>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
				<a class="nav-item nav-link" href="../Portada">INICI</a>
				<a class="nav-item nav-link active" href="#">IDIOMES<em class="fas fa-arrow-right navawe"> <span class="sr-only">(current)</span></em></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>		
		<%
		if (session != null) { %>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal">${sessionScope.usuari}</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="../Logout">SORTIR</a>
		</span>
		<% } else { %>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/login.jsp">LOGUEJA'T</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/form.jsp">REGISTRA'T</a>
		</span>
		<% }
		%>
	</nav>
	
	<form method="POST" action="../Curs">
		<div class="container">
		  <div class="row">
			<div class="col-sm">
			  <img src="../media/Anglès.png" alt="GB" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Francès.png" alt="FRA" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Alemany.png" alt="ALE" class="bandera">
			</div>
			<div class="col-sm">
			  <img src="../media/Italià.png" alt="IT" class="bandera">
			</div>    
			<div class="col-sm">
			  <img src="../media/Portuguès.png" alt="POR" class="bandera">
			</div>
		  </div>
		  <div class="row">
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma1" name="idioma" value="Anglès">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma2" name="idioma" value="Francès">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma3" name="idioma" value="Alemany">
			</div>
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma4" name="idioma" value="Italià">
			</div>    
			<div class="col-sm checkbandera">
			  <input type="checkbox" id="idioma5" name="idioma" value="Portuguès">
			</div>
		  </div>
		</div>

		<div class="container containermetode">
			<div class="row">
				<div class="col-sm metode">
					Mètode de pagament
				</div>
			</div>
			<div class="row rowmetode">
				<div class="col-sm-2">
				</div>
				<div class="col-sm-2">
					Metàlic
				</div>
				<div class="col-sm-1">
					<input type="radio" id="Metàlic" name="pagar" value="Metàlic">
				</div>
				<div class="col-sm-2">
					Tarjeta de crèdit
				</div>
				<div class="col-sm-1">
					<input type="radio" id="Tarjeta de crèdit" name="pagar" value="Tarjeta de crèdit">
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
			if (session != null) { %>
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

	<form method="GET" action="../Curs">
		<div class="container">
			<div class="row rowform">
				<%
				if (session != null) { %>
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