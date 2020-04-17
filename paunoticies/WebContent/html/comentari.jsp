<%@ page import = "java.util.regex.Pattern" %>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import="java.sql.*" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
				<a class="nav-item nav-link active" href="paunoticies/Portada.java">INICI <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="/paunoticies/html/cursos.jsp">CURSOS<i class="fas fa-arrow-right navawe"></i></a>
				<a class="nav-item nav-link" href="#">EXPERI�NCIES ONLINE<i class="fas fa-arrow-right navawe"></i></a>
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
	String usuari		= (String)request.getParameter("usuget");
	String comentaris	= (String)request.getParameter("comment");
	if (usuari=="" || comentaris==""){		
		String redirectURL = "http://localhost:8080/paunoticies/html/cursos.jsp";
        response.sendRedirect(redirectURL);		
	}
	
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
			<div><%=Countrow %></div>
			<%
			if(Countrow.equals("1")){
				try {
					int i=st.executeUpdate("insert into PROVA3(nick, comments)values('"+usuari+"','"+comentaris+"')");		
				} catch(Exception e) {
					System.out.print(e);
					e.printStackTrace();
				}
			%>
				<div class="container">
  					<div class="row">
    					<div class="col-sm">
      						Usuari: <%=usuari %>
    					</div>    					
  					</div>
  					<div class="row">
    					<div class="col-sm">
      						Comentari: <%=comentaris %>
    					</div>  
  					</div>
  				</div>
  			<%
			} else {
			%>
				<p>Aquest usuari no existeix</p>
			<%
			}							
		}
	} catch(Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
</body>
</html>