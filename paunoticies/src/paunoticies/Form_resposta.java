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
@WebServlet("/Form_resposta")
public class Form_resposta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * Els noms de les taules són users_2 i purchases_2 (DE MOMENT prova1) i purchases_3 (DE MOMENT PROVA3)
	 * Crear la taula purchases
	 * @author Pau
	 * create table purchases_2(
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
    public Form_resposta() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public boolean connect(){
		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Asus\\eclipse-workspace\\paunoticies\\WebContent\\WEB-INF\\lib\\basedades.db");
			Statement st=conn.createStatement();		
		} catch(Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
		return true;	
	}

	public int check_regex(HttpServletRequest request){		
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
			return 1;
		} else if (!mat_cntr.find()){
			return 2;
		} else if (!mat_mail.find()) {
			return 3;
		} else {
			return 4;
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int check=check_regex(request);
		if(check==4) {
			connect();			
			getServletContext().getRequestDispatcher("/html/form_resposta.jsp").forward(request, response);				
		} else if(check==1 || check==3){
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
