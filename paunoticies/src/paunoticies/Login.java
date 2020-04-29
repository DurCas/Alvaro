package paunoticies;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Login() {
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
	
	public int checkRegex(String usuari, String contra){	
		Pattern patUsu = Pattern.compile("[A-Za-z0-9]{8,}");
		Matcher matUsu = patUsu.matcher(usuari);
		Pattern patCntr = Pattern.compile("[A-Za-z0-9]{8,}");
		Matcher matCntr = patCntr.matcher(contra);
		if (!matUsu.find()){
			return 1;
		} else if (!matCntr.find()){
			return 2;
		} else {
			return 3;
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuari=(String)request.getParameter("usuari");
		String contra=(String)request.getParameter("contra");
		int check=checkRegex(usuari, contra);
		if(check==3) {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"' AND pass='"+contra+"'";
				ResultSet rs 	= 	st.executeQuery(j);
				while(rs.next()){
					String Countrow=rs.getString(1);
					if(Countrow.equals("1")){
						HttpSession sesion = request.getSession(true);
						sesion.setAttribute("usuari", usuari);
						getServletContext().getRequestDispatcher("/html/login_resposta.jsp").forward(request, response);		
					} else {
						getServletContext().getRequestDispatcher("/html/login_resposta_error.jsp").forward(request, response);		
					}
				}
			} catch(Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		} else if(check==1){
			connect();	
			getServletContext().getRequestDispatcher("/html/login_error_usu.jsp").forward(request, response);
		} else if(check==2) {
			connect();	
			getServletContext().getRequestDispatcher("/html/login_error_cntr.jsp").forward(request, response);
		} 
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}