<%@ page import="java.sql.*" %>
<%
	Class.forName("org.sqlite.JDBC");
	Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:c:\\Usuarios\\Asus\\eclipse-workspace\\paunoticies\\WebContent\\WEB-INF\\lib\\basedades.db");
	Statement stat = conn.createStatement();
	ResultSet rs = stat.executeQuery("select * from users_2;");
	while (rs.next()) {
		out.println("<tr>");
        out.println("<td>" + rs.getString("id") + "</td>");
        out.println("<td>" + rs.getString("title") + "</td>");
        out.println("<td>" + rs.getString("price") + " kr.</td>");
        out.println("<td>" + rs.getString("description") + "</td>");
        out.println("</tr>");
    }
	rs.close();
	conn.close();
%>