package paunoticies;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Portada
 */
@WebServlet("/Curs")
public class Curs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Curs() {
        super();
        // TODO Auto-generated constructor stub
    }
    
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String usuari		= (String)request.getParameter("usuget");
				String comentaris	= (String)request.getParameter("comment");
				if (usuari=="" || comentaris==""){		
					String redirectURL = "http://localhost:8080/paunoticies/html/cursos.jsp";
			        response.sendRedirect(redirectURL);		
				} else {
					try {
						Statement st	=	connect();
						String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
						ResultSet rs 	= 	st.executeQuery(j);
						String Countrow	=	"";
						while(rs.next()){
							Countrow=rs.getString(1);
							if(Countrow.equals("1")){
								int i=st.executeUpdate("insert into PROVA3(nick, comments)values('"+usuari+"','"+comentaris+"')");
								getServletContext().getRequestDispatcher("/html/comentari.jsp").forward(request, response);		
							} else {
								getServletContext().getRequestDispatcher("/html/comentari_error.jsp").forward(request, response);		
							}
						}
					} catch(Exception e) {
						System.out.print(e);
						e.printStackTrace();
					}
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletContext().getRequestDispatcher("/html/curs.jsp").forward(request, response);
	}
}