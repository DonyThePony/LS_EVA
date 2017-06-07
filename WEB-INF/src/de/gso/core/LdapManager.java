package de.gso.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LdapManager {
	
private Connection con = null;
private Statement st = null;
private ResultSet rs = null;
private ConnectionPool cP;

	public LdapManager() throws Exception{
		cP =  ConnectionPool.getInstance();
		con = cP.getCon();
	}
	
	public boolean logIn(String email, String pw){
		boolean login = false;
		
		if(email.equals("test") && pw.equals("test")){
			login = true;
		}
		
		return login;
	}
	
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
