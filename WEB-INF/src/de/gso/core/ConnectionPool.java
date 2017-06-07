package de.gso.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionPool {
	
	private static ConnectionPool instance = null;
	private String host = "";
	private String user = "";
	private String pw = "";
	private Connection con = null;
	public ConnectionPool(){
		try {
			dbConnect("jdbc:sqlserver://"+host, user, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void dbConnect(String db_connect_string, String db_userid, String db_password) throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.con = DriverManager.getConnection("jdbc:mysql://"+db_connect_string+":port",db_userid, db_password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ConnectionPool getInstance(){
		if(instance == null){
			instance = new ConnectionPool();
		}
		return instance;
	}
	
	public Connection getCon(){
		return con;
	}
}
