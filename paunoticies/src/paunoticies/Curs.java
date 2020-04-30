package paunoticies;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * Servlet implementation class Curs
 */
@WebServlet("/Curs")
public class Curs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger("paunoticies.Curs");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * Els noms de les taules són:
	 * 	· users_2
	 *  · purchases_2 (DE MOMENT prova4)
	 *  · purchases_3 (DE MOMENT PROVA3)
	 *   
	 * Crear la taula purchases
	 * @author Pau
	 * create table prova4(
	    ref integer primary key AUTOINCREMENT,
	    nick varchar(20),
	    curs varchar(100),
	    pagament varchar(10),
	    quantity int(1),
	    amount int(1),
	    CONSTRAINT FK_nick FOREIGN KEY (nick)
	    REFERENCES users_2(nick)
		);
		
		create table purchases_3(
	    ref integer primary key AUTOINCREMENT,
	    nick varchar(20),
	    comments varchar(200),
	    CONSTRAINT FK_nick FOREIGN KEY (nick)
	    REFERENCES users_2(nick)
		);
	 */
	
    public Curs() {
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
			LOGGER.log(Level.SEVERE, e.getMessage());
		}
		return st;	
	}	
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuari		= (String)request.getParameter("usuget");
		String comentaris	= (String)request.getParameter("comment");
		if (usuari.equals("") || comentaris.equals("")){		
			String redirectURL = "http://localhost:8080/paunoticies/html/cursos.jsp";
			response.sendRedirect(redirectURL);		
		} else {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
				ResultSet rs	= 	st.executeQuery(j);
				while(rs.next()){
					String countRow = rs.getString(1);
					if(countRow.equals("1")){
						st.executeQuery("insert into PROVA3(nick, comments) values('"+usuari+"','"+comentaris+"')");
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
		String usuari	= (String)request.getParameter("usupost");
		String curs		= (String)request.getParameter("curs");
		Integer c 		= Integer.parseInt(curs);
		String pagar	= (String)request.getParameter("pagar");
		String select[] = request.getParameterValues("idioma");
		if (usuari.equals("") || curs.equals("") || pagar.equals("")){		
			String redirectURL = "http://localhost:8080/paunoticies/html/cursos.jsp";
			response.sendRedirect(redirectURL);		
		} else {			
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
				ResultSet rs	= 	st.executeQuery(j);
				while(rs.next()){
					String countRow = rs.getString(1);
					if(countRow.equals("1")){
						int k=0;
			      		if (select != null && select.length != 0) {
			      			for (int i = 0; i < select.length; i++) {
			      				k++;
			      			}
			      		} try {	
							st.executeQuery("insert into prova4(nick, curs, pagament, quantity, amount)values('"+usuari+"','"+c+"','"+pagar+"','"+k+"', '"+0+"')");
			      			getServletContext().getRequestDispatcher("/html/curs.jsp").forward(request, response);	
						} catch(Exception e) {
							System.out.print(e);
							e.printStackTrace();
						}
						getServletContext().getRequestDispatcher("/html/curs.jsp").forward(request, response);		
					} else {
						getServletContext().getRequestDispatcher("/html/curs_error.jsp").forward(request, response);		
					}
				}
			} catch(Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		}	
	}
}