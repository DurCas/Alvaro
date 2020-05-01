package paunoticies;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.*;
import java.sql.*;

/**
 * Servlet implementation class Form_resposta
 */
@WebServlet("/FormResposta")
public class FormResposta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger("paunoticies.FormResposta");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public FormResposta() {
        super();
    }
    
    @SuppressWarnings("squid:S2115")
	public Statement connect() throws NullPointerException{
		Statement st=null;
		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Asus\\eclipse-workspace\\paunoticies\\WebContent\\WEB-INF\\lib\\basedades.db");
			st=conn.createStatement();		
		} catch(Exception e) {
			LOGGER.log(Level.SEVERE, e.getMessage());
		}
		return st;	
	}		

	public int checkRegex(String usuari, String contra, String mail){	
		Pattern patroUsu	= Pattern.compile("[A-Za-z0-9]{8,}");
		Matcher matUsu		= patroUsu.matcher(usuari);
		Matcher matCntr 	= patroUsu.matcher(contra);
		Pattern patMail 	= Pattern.compile("^[a-zA-Z0-9.!#$%&'*+\\=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
		Matcher matMail 	= patMail.matcher(mail);
		if (!matUsu.find()){
			return 1;
		} else if (!matCntr.find()){
			return 2;
		} else if (!matMail.find()) {
			return 3;
		} else {
			return 4;
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuari	= (String)request.getParameter("usuari");
		String contra	= (String)request.getParameter("contra");
		String mail		= (String)request.getParameter("mail");
		int check		= checkRegex(usuari, contra, mail);
		if(check==4) {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
				ResultSet rs 	= 	st.executeQuery(j);
				while(rs.next()){
					String countRow=rs.getString(1);
					if(countRow.equals("0")){
						st.executeUpdate("insert into users_2(nick, pass, email) values('"+usuari+"','"+contra+"','"+mail+"')");
						getServletContext().getRequestDispatcher("/html/form_resposta.jsp").forward(request, response);	
					} else {
						getServletContext().getRequestDispatcher("/html/form_resposta_error.jsp").forward(request, response);		
					}
				}
			} catch(Exception e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			} 
		} else if(check==1){
			try {
				connect();
			} catch (NullPointerException e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			}	
			getServletContext().getRequestDispatcher("/html/error_usu.jsp").forward(request, response);
		} else if(check==2) {
			try {
				connect();
			} catch (NullPointerException e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			}	
			getServletContext().getRequestDispatcher("/html/error_cntr.jsp").forward(request, response);
		} else if(check==3) {
			try {
				connect();
			} catch (NullPointerException e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			}	
			getServletContext().getRequestDispatcher("/html/error_mail.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}