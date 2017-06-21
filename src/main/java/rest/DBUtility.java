package rest;

import java.io.*;
import java.sql.*;
import java.util.Properties;
 
public class DBUtility{
 private static Connection connection=null;
	public static Connection getConnection(){
		if(connection!=null)
			return connection;
		else{
		   try{
			Properties prop=new Properties();
			InputStream inputStream=DBUtility.class.getClassLoader().getResourceAsStream("/config.properties");
			prop.load(inputStream);
			String driver=prop.getProperty("driver");
			String url=prop.getProperty("url");
			Class.forName(driver);
			connection=DriverManager.getConnection(url);
		     }
		    catch(Exception e){
			e.printStackTrace();
		    }
			return connection;
		}
	}	
}						