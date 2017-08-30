package de.gso.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*
 * Der ConnectionPool ist nach einem Singleton-Muster aufgebaut.
 * Der Vorteil hier ist dass nur mit einer Connection zur Datenbank gearbeitet wird.
 * Das hat den Effekt dass der Datenverkehr hier um einiges Verringert wird,
 * ohne einen großen Abstrich in der Performance zu machen.
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
	
	// Baut die Connection auf. Aktuell Hard kodiert. Möglichkeit besteht dies in eine Config-Datei auszulagern
	private void dbConnect(String db_connect_string, String db_userid, String db_password) throws Exception{

        try {
      	    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        } //Klasse instanziieren für den DB-Driver
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
        try { 
		    String url = "jdbc:mysql://localhost:3306/eva_ls";
		    con = DriverManager.getConnection(url, "root", ""); 	    
        } 
        catch (SQLException sqle) { 
            sqle.printStackTrace(); 
        } 
	}

	//Singelton pattern wird verwendet dass nur eine Instanz von Connection aktuell existiert.
	//Dies hat den Vorteil das die Zugriffe auf die Datenbank beschränkt werden.
	//Bei bedarf kann dies auch ausgelagert werden dass eine Maximale anzahl von X Connections
	//Allen Usern zur verfügung stehen.
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
