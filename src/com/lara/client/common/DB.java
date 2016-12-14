package com.lara.client.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



public class DB 
{
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	static
	{
		try 
		{
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.driver.OracleDriver");
				
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
	}
	public Connection getConnection()
	{
		try 
		{
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","great123");
			
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
		return con;
	}
}
