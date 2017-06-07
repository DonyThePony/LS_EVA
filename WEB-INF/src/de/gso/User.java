package de.gso;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import de.gso.core.ConnectionPool;

public class User {
	private String firstname;
	private String lastname;
	private String email;
	private String userGroup;
	private int id;
	private boolean isTeacher;
	
	public User(String email) throws Exception{
		this.email = email;
		initUser();
	}

	/*
	 * Initialisierung des Users. Anhand der Emailadresse.
	 */
	private void initUser(){
		try{
			Connection con = ConnectionPool.getInstance().getCon();
			String getUserSql = "SELECT * FROM USER WHERE email ='"+email+"'";
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery(getUserSql);
			if(rs.next()){
				this.firstname = rs.getString("firstname");
				this.lastname = rs.getString("lastname");
				this.isTeacher = rs.getBoolean("isTeacher"); // Wichtiges Kennzeichen.
				this.email = rs.getString("email");
				this.userGroup = rs.getString("class");
				this.id = rs.getInt("user_id");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public String getEmail() {
		return email;
	}
	
	public int getId(){
		return id;
	}

	public String getFirstname() {
		return firstname;
	}
	
	public String getLastname() {
		return lastname;
	}

	public String getUserGroup() {
		return userGroup;
	}

	public boolean isTeacher() {
		return isTeacher;
	}
}
