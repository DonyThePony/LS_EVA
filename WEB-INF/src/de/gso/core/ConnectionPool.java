package de.gso.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Driver;
/*
 * Der ConnectionPool ist nach einem Singleton-Muster aufgebaut.
 * Der Vorteil hier ist dass nur mit einer Connection zur Datenbank gearbeitet wird.
 * Das hat den Effekt dass der Datenverkehr hier um einiges Verringert wird,
 * ohne einen groﬂen Abstrich in der Performance zu machen.
 * 
 */
public class ConnectionPool {
	
	private static ConnectionPool instance = null;
	private String host = "";
	private String user = "";
	private String pw = "";
	private Connection con = null;
	
	public ConnectionPool() throws Exception{
		try {
			dbConnect("jdbc:sqlserver://"+host, user, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void dbConnect(String db_connect_string, String db_userid, String db_password) throws Exception{

        try { 
      	    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
        try { 
		    String url = "jdbc:mysql://localhost:3306/eva";
		    con = DriverManager.getConnection(url, "root", "Dr20075Plyr"); 	    
        } 
        catch (SQLException sqle) { 
            sqle.printStackTrace(); 
        } 
	}

	public static ConnectionPool getInstance() throws Exception{
		if(instance == null){
			instance = new ConnectionPool();
		}
		return instance;
	}
	
	public Connection getCon(){
		return con;
	}
}
