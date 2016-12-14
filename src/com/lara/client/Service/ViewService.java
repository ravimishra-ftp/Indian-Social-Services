package com.lara.client.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.lara.db.util.DbUtil;
import com.lara.model.Action;
import com.lara.model.Bean;

public class ViewService extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ServiceBean serviceBean = (ServiceBean) bean;		
		String id = serviceBean.getId();
		Statement stmt = null;
		ResultSet rs = null;
		
		try 
		{			
			ArrayList list = new ArrayList();
			String sqlQry="";
			stmt = con.createStatement();
			sqlQry =  "SELECT ServiceID, DateTime, to_char(datetime,'dd-MM-yyyy')dt,ServiceName, Description from SOCIALSERVICE where ServiceID='" + id + "'";
			rs = stmt.executeQuery(sqlQry);	
			if(rs.next())
			{				
				list.add(rs.getString("dt"));
				list.add(rs.getString("ServiceName"));
				list.add(rs.getString("Description"));
				list.add(rs.getInt("ServiceID"));
				request.setAttribute("image", rs.getString("ServiceId"));
			}
			request.setAttribute("path", "serviceEnquiry.do");
			request.setAttribute("list", list);
			return "success";
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DbUtil.closeResultSet(rs);
			DbUtil.closeStatement(stmt);
		}
		return null;
		
	}
}
