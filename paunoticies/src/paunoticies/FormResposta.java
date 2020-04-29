package paunoticies;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.regex.*;
import java.sql.*;

/**
 * Servlet implementation class Form_resposta
 */
@WebServlet("/FormResposta")
public class FormResposta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public FormResposta() {
        super();
    }
    
    @SuppressWarnings("squid:S2115")
	public Statement connect(){
		Statement st=null;
		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Asus\\eclipse-workspace\\paunoticies\\WebContent\\WEB-INF\\lib\\basedades.db");
			st=conn.createStatement();		
		} catch(Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
		return st;	
	}	

	public int check_Regex(String usuari, String contra, String mail){	
		Pattern patro_usu	= Pattern.compile("[A-Za-z0-9]{8,}");
		Matcher mat_Usu		= patro_usu.matcher(usuari);
		Matcher mat_Cntr 	= patro_usu.matcher(contra);
		Pattern pat_Mail 	= Pattern.compile("^[a-zA-Z0-9.!#$%&'*+\\=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
		Matcher mat_Mail 	= pat_Mail.matcher(mail);
		if (!mat_Usu.find()){
			return 1;
		} else if (!mat_Cntr.find()){
			return 2;
		} else if (!mat_Mail.find()) {
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
		int check		= check_Regex(usuari, contra, mail);
		if(check==4) {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
				ResultSet rs 				= 	st.executeQuery(j);
				while(rs.next()){
					String countRow=rs.getString(1);
					if(countRow.equals("0")){
						st.executeQuery("insert into users_2(nick, pass, email)values('"+usuari+"','"+contra+"','"+mail+"')");
						getServletContext().getRequestDispatcher("/html/form_resposta.jsp").forward(request, response);	
					} else {
						getServletContext().getRequestDispatcher("/html/form_resposta_error.jsp").forward(request, response);		
					}
				}
			} catch(Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		} else if(check==1){
			connect();	
			getServletContext().getRequestDispatcher("/html/error_usu.jsp").forward(request, response);
		} else if(check==2) {
			connect();	
			getServletContext().getRequestDispatcher("/html/error_cntr.jsp").forward(request, response);
		} else if(check==3) {
			connect();	
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