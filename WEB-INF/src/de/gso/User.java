package de.gso;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import de.gso.core.ConnectionPool;

public class User {
	private String vorname;
	private String nachname;
	private String email;
	private int id;
	
	public User(String email) throws Exception{
		this.email = email;
		initUser();
	}

	private void initUser() throws Exception {
		Connection con = ConnectionPool.getInstance().getCon();
		String getUserSql = "SELECT * FROM USERS WHERE email ='"+email+"'";
		Statement st = null;
		ResultSet rs = null;
		st = con.createStatement();
		rs = st.executeQuery(getUserSql);
		if(rs.next()){
			this.vorname = rs.getString("vorname");
			this.nachname = rs.getString("nachname");
			this.id = rs.getInt("idUser");
		}
	}

	public String getVorname() {
		return vorname;
	}

	public String getNachname() {
		return nachname;
	}

	public String getEmail() {
		return email;
	}
	
	public int getId(){
		return id;
	}
}
