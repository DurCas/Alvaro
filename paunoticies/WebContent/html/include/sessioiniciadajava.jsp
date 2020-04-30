		<% if (session.getAttribute("usuari") != null) { 
		%>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal">${sessionScope.usuari}</a>
		</span>
		<span class="navbar-text">
			<a class="nav-item nav-link"  data-toggle="modal" href="Logout">SORTIR</a>
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