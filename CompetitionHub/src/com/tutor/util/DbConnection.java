package com.tutor.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DbConnection {
	static Properties prop;
	Connection con=null;
	static {
		prop = new Properties();
		// loading properties from db.properties file
		// using classpath
		try {
			InputStream in = DbConnection.class.getResourceAsStream("/db.properties");
			prop.load(in);
			System.out.println("properties loaded.");
		} catch (Exception e) {
			System.out.println("Internal System Error");
		}
	}

	public Connection getConnection() throws Exception {
		Class.forName(prop.getProperty("driverClass"));
		if(con!=null)
		{
		return con;
		}
		else
	    {
		con = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"),prop.getProperty("password"));
		return con;
	    }
	}
	
	public void closeConnection() throws Exception {
		if(con!=null)
		{
		 con.close();
		}
	}
}