package com.lara.db.pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Vector;

public class ConnectionPool 
{
	private String driverClass;
	private String url;
	private String username;
	private String password;
	private int poolSize;
	private Vector<Connection> pool = new Vector<Connection>();
		
	public ConnectionPool(String driverClass, String url, String username, String password, int poolSize)
	{
		this.driverClass = driverClass;
		this.url = url;
		this.username = username;
		this.password = password;
		this.poolSize = poolSize;
	}
	
	public void init()
	{
		try
		{
			Class.forName(driverClass);
		}
		catch(ClassNotFoundException ex)
		{
			ex.printStackTrace();
		}
		Connection con;
		for(int i = 0; i < poolSize; i++)		
		{
			con = getConnection();
			pool.add(con);
		}
	}
	private Connection getConnection()
	{
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(url, username, password);
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		return con;
	}
	public Connection checkOut()
	{
		Connection con = null;
		if(pool.size() > 0)
		{
			con = pool.remove(0);
		}
		else
		{
			con = getConnection();
		}
		return con;
	}
	public void checkIn(Connection con)
	{
		if(con != null)
		{
			if(pool.size() < poolSize)
			{
				pool.add(con);
			}
			else
			{
				closeConnection(con);
			}
		}
	}
	private void closeConnection(Connection con)
	{
		try
		{
			con.close();
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	}
	public void release()
	{
		Connection con = null;
		for(int i = 0; i < pool.size();)
		{
			con = pool.remove(0);
			closeConnection(con);
		}
	}	
}
