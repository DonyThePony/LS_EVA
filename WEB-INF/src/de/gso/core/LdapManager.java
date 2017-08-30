package de.gso.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/*
 * Unser LDAP Simulator.
 * GGf. kann hier eine zukünftige LDAP-Anbindung reallisiert werden.
 */
public class LdapManager {
	
private Connection con = null;
private Statement st = null;
private ResultSet rs = null;
private ConnectionPool cP;

	public LdapManager() throws Exception{
		//Hier wird eine Instanz der Connection angefordert um mit der Datenbank zu kommunizieren.
		cP =  ConnectionPool.getInstance();
		con = cP.getCon();
	}
	
	public boolean logIn(String email, String pw){
		boolean login = false;
		
		//Aktuell gibt es nur einen Log-In zugang.
		//Dieser wird hier simuliert.
		if(email.equals("fia5bsaracino@gso-koeln.de") && pw.equals("test")){
			login = true;
		}
		
		return login;
	}
	
	//Dient zu identifizierung ob ein User ein Lehrer ist.
	public boolean isTeacher(String email) throws SQLException{
		boolean isTeacher = false;
		String sql = "SELECT isTeacher FROM USERS WHERE email = '" + email+"'";
		try{
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				isTeacher = rs.getBoolean("isTeacher");
			}
		} catch(SQLException ex){
			ex.printStackTrace();
			isTeacher = false;
		}
		return isTeacher;
	}
}
