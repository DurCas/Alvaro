package paunoticies;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.logging.Logger;
import org.junit.Test;
import javax.servlet.http.HttpServlet;

public class FormTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger("paunoticies.FormTest.java");
	
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

	String usuari;
	String contrasenya;
	String mail;
	String esperat;
	
	Pattern patroUsu	= Pattern.compile("[A-Za-z0-9]{8,}");
	Pattern patMail 	= Pattern.compile("^[a-zA-Z0-9.!#$%&'*+\\=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$");
	
	
	@Test
	public void testFomCorrecte() {
		usuari 			= "paupaupau11";
		contrasenya 	= "paupaupau11";
		mail 			= "paupaupau11@gmail.com";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		Matcher matMail = patMail.matcher(mail);
		if (!matUsu.find() || !matCntr.find() || !matMail.find()){
			esperat = "Incorrecte";
		} else {
			esperat = "Correcte";
		}
		assertEquals(esperat, "Correcte");
	}
	
	@Test
	public void testFormUsuari() {
		usuari 			= "p";
		contrasenya 	= "paupaupau11";
		mail 			= "paupaupau11@gmail.com";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		Matcher matMail = patMail.matcher(mail);
		if (!matUsu.find() || !matCntr.find() || !matMail.find()){
			esperat = "Incorrecte";
		} else {
			esperat = "Correcte";
		}
		assertEquals(esperat, "Correcte");
	}		
	
	@Test
	public void testFormContrasenya() {
		usuari 			= "paupaupau11";
		contrasenya 	= "p";
		mail 			= "paupaupau11@gmail.com";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		Matcher matMail = patMail.matcher(mail);
		if (!matUsu.find() || !matCntr.find() || !matMail.find()){
			esperat = "Incorrecte";
		} else {
			esperat = "Correcte";
		}
		assertEquals(esperat, "Correcte");
	}
	
	@Test 
	public void testFormMail() {
		usuari 			= "paupaupau11";
		contrasenya 	= "paupaupau11";
		mail 			= "paupaupau11";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		Matcher matMail = patMail.matcher(mail);
		if (!matUsu.find() || !matCntr.find() || !matMail.find()){
			esperat = "Incorrecte";
		} else {
			esperat = "Correcte";
		}
		assertEquals(esperat, "Correcte");
	}
	
	@Test 
	public void testFormUsuariRepetit() {
		usuari 			= "paupaupau11";
		contrasenya 	= "paupaupau11";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		if (!matUsu.find() || !matCntr.find()){
			esperat = "Incorrecte";
		} else {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"'";
				ResultSet rs 	= 	st.executeQuery(j);
				while(rs.next()){
					String countRow=rs.getString(1);
					if(countRow.equals("0")){
						esperat = "Correcte";
					} else {
						esperat = "Incorrecte";	
					}
				}
			} catch(Exception e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			}
		}
		assertEquals(esperat, "Correcte");
	}
	
	@Test 
	public void testLoginUsuari() {
		usuari 			= "paupaupau11";
		contrasenya 	= "paupaupau11";
		Matcher matUsu	= patroUsu.matcher(usuari);
		Matcher matCntr = patroUsu.matcher(contrasenya);
		if (!matUsu.find() || !matCntr.find()){
			esperat = "Incorrecte";
		} else {
			try {
				Statement st	=	connect();
				String j		=	"SELECT count(nick) FROM users_2 WHERE nick='"+usuari+"' AND pass='"+contrasenya+"'";
				ResultSet rs 	= 	st.executeQuery(j);
				while(rs.next()){
					String countRow=rs.getString(1);
					if(countRow.equals("1")){	
						esperat = "Correcte";
					} else {
						esperat = "Incorrecte";	
					}
				}
			} catch(Exception e) {
				LOGGER.log(Level.SEVERE, e.getMessage());
			}
		}
		assertEquals(esperat, "Correcte");
	}
}