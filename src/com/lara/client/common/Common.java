package com.lara.client.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Common 
{
	public ResultSet getData(Connection con, String tableName, String column)
	{
		ResultSet rs=null;
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String sqlQry = "Select " + column + " from " + tableName;
			rs = stmt.executeQuery(sqlQry);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet getDataCriteria(Connection con, String criteria, String tableName, String column)
	{
		ResultSet rs=null;
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String sqlQry = "Select " + column + " from " + tableName + " where " + criteria;
			rs = stmt.executeQuery(sqlQry);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public int insertData(Connection con, String tableName, String values)
	{
		int status =0;
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			String sqlQry = "Insert into " + tableName + " values(" + values + ")";
			status = stmt.executeUpdate(sqlQry);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return status;
	}
	public ResultSet fillCombo(Connection con, String tableName, int id, String name)
	{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String sqlQry = "Select " + id + "," + name + " from " + tableName;
			rs = stmt.executeQuery(sqlQry);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return rs;
	}
	public int deleteData(Connection con, String tableName, String columnCriteria, String value)
	{
		int status =0;
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			String sqlQry = "Delete from " + tableName + " where " + columnCriteria + "=" + "'" + value + "'";
			status = stmt.executeUpdate(sqlQry);
		} 
		catch (Exception e) 
		{
			String st="Can't delete this record! It has child records!";
			JOptionPane.showMessageDialog(null,st);
		}
		
		return status;
	}
	public int getMax(Connection con, String tableName, String column)
	{
		ResultSet rs=null;
		Statement stmt = null;
		int id=0;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String sqlQry = "Select max(" + column + ")id from " + tableName;
			rs = stmt.executeQuery(sqlQry);
			if(rs.next())
			{
				id = rs.getInt("id");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return id;
	}

}
