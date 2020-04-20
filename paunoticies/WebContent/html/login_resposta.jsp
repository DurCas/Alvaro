<%@ page import = "java.util.regex.Pattern" %>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FORM RESPOSTA</title>
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
				<a class="nav-item nav-link active" href="../Portada">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<i class="fas fa-arrow-right navawe"></i></a>
				<a class="nav-item nav-link" href="#">EXPERIÈNCIES ONLINE<i class="fas fa-arrow-right navawe"></i></a>
			</div>
		</div>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/login.jsp">LOGUEJA'T</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="/paunoticies/html/form.jsp">REGISTRA'T</a>
		</span>
	</nav>
<%
	String usuari=(String)request.getParameter("usuari");
	String contra=(String)request.getParameter("contra");
	String mail=(String)request.getParameter("mail");
	Pattern pat_usu = Pattern.compile("[A-Za-z0-9]{8,}");
	Matcher mat_usu = pat_usu.matcher(usuari);
	Pattern pat_cntr = Pattern.compile("[A-Za-z0-9]{8,}");
	Matcher mat_cntr = pat_cntr.matcher(contra);
	Pattern pat_mail = Pattern.compile("^[a-zA-Z0-9.!#$%&'*+\\=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
	Matcher mat_mail = pat_mail.matcher(mail);
	if (!mat_usu.find()){
		%><h1>El nick no cumpleix els requisits</h1><%
	} else{
		%><h1><%= usuari %></h1><%
		if (!mat_cntr.find()){
			%><h1>La contrasenya no cumpleix els requisits</h1>
			<div><%= usuari %></div><%
		} else{
			%><h1><%= contra %></h1><%	
			if (!mat_mail.find()){
				%><h1>No és un email correcte</h1><%
			} else{
				%><h1><%= mail %></h1><%	
				try {
					Class.forName("org.sqlite.JDBC");
					Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Asus\\eclipse-workspace\\paunoticies\\WebContent\\WEB-INF\\lib\\basedades.db");
					Statement st=conn.createStatement();
					String j="SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
					ResultSet rs = st.executeQuery(j);
					String Countrow="";
					%><div><%=rs %></div><div><%=usuari %></div><%
					while(rs.next()){
						Countrow=rs.getString(1);
						%>
						<div><%=Countrow %></div><%
						if(Countrow.equals("0")){
							int i=st.executeUpdate("insert into users_2(nick, pass, email)values('"+usuari+"','"+contra+"','"+mail+"')");
							%>
							<p>Informació insertada amb èxit</p>
							<div class="container">
  								<div class="row">
  		    						<div class="col-sm">
  		    							<a href="login.jsp">LOGUEJA'T ARA</a>
    								</div>
  								</div>
  								<div class="row">
  		    						<div class="col-sm">
  		    							<a href="portada.jsp">TORNAR A LA PORTADA</a>
    								</div>
  								</div>
							</div>
							<%
						} else {
							%>
							<p>Aquest usuari ja existeix</p>
							<div class="container">
  								<div class="row">
  		    						<div class="col-sm">
  		    							<a href="form.jsp">TORNAR AL FORMULARI DE REGISTRE</a>
    								</div>
  								</div>
  								<div class="row">
  		    						<div class="col-sm">
  		    							<a href="portada.jsp">TORNAR A LA PORTADA</a>
    								</div>
  								</div>
							</div>
							<%
						}							
					}
				} catch(Exception e) {
					System.out.print(e);
					e.printStackTrace();
				}				
			} 
		} 		
	} 	
%>
</body>
</html>