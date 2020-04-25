<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="ca">
<head>
	<meta charset="ISO-8859-1">
	<title>PORTADA</title>
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
				<a class="nav-item nav-link active" href="#">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<em class="fas fa-arrow-right navawe"></em></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<em class="fas fa-arrow-right navawe"></em></a>
			</div>
		</div>
		<jsp:include page="include/sessioiniciadajava.jsp" />  
	</nav>
	<div class="container">
  		<div class="row">
  		    <div class="col-sm-3 textportada">
  		    	<p class="noticia_titol">Noticia 1</p>
  		    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce malesuada tempor augue, eget dapibus purus rutrum sit amet. 
  		    	Proin blandit elit mi, at accumsan dolor dapibus in. Aliquam sit amet sem et nulla pellentesque bibendum non lobortis est. Aliquam id iaculis diam.</p>
    		</div>
    		<div class="col-sm-3 textportada">
    			<p class="noticia_titol">Noticia 2</p>
      			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce malesuada tempor augue, eget dapibus purus rutrum sit amet. 
      			Proin blandit elit mi, at accumsan dolor dapibus in. Aliquam sit amet sem et nulla pellentesque bibendum non lobortis est. Aliquam id iaculis diam.</p>
    		</div>
    		<div class="col-sm-3 textportada">
    			<p class="noticia_titol">Noticia 3</p>
      			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce malesuada tempor augue, eget dapibus purus rutrum sit amet. 
      			Proin blandit elit mi, at accumsan dolor dapibus in. Aliquam sit amet sem et nulla pellentesque bibendum non lobortis est. Aliquam id iaculis diam.</p>
    		</div>    		
  		</div>
  		<div class="row">
  		    <div class="col-sm-6 textportada">
  		    	<p class="noticia_titol">Agenda<em class="fas fa-calendar-alt portadaagenda"></em></p>
  		    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce malesuada tempor augue, eget dapibus purus rutrum sit amet. 
  		    	Proin blandit elit mi, at accumsan dolor dapibus in. Aliquam sit amet sem et nulla pellentesque bibendum non lobortis est. Aliquam id iaculis diam. 
  		    	Ut volutpat, orci in tempus dictum, neque lectus euismod massa, nec eleifend sapien tellus non mauris. 
  		    	Integer dictum arcu in magna tincidunt, at tincidunt ex lacinia. Aliquam non lacinia tortor. In at tortor eu nisi dapibus dictum. 
  		    	Nullam maximus congue pretium. Aenean a rhoncus tellus. In interdum ut tellus facilisis sagittis. Aenean tincidunt risus magna, non vulputate ipsum.</p>
    		</div>		
  		</div>
	</div>
</body>
</html>