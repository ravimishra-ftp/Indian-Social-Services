package com.lara.client.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.model.Action;
import com.lara.model.Bean;

public class ServiceEnquiry extends Action{
	String sqlQry="";
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ServiceBean serviceBean = (ServiceBean) bean;
		String date = serviceBean.getDate();
		String name = serviceBean.getServiceName();
		Statement stmt = null;
		ResultSet rs = null;
		
		try 		
		{
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			sqlQry =  "SELECT ServiceID, DateTime, to_char(datetime,'dd/MM/yyyy') dt,ServiceName, Description from SOCIALSERVICE where ServiceID !='0'";	
			criteria(date, name);
			rs = stmt.executeQuery(sqlQry);
			HashMap map =null;
			ArrayList list = new ArrayList();
			
				while(rs.next())
				{
					map = new HashMap();
					map.put("ServiceID", rs.getInt("ServiceID"));
					map.put("DateTime", rs.getString("dt"));
					map.put("ServiceName", rs.getString("ServiceName"));
					map.put("Description", rs.getString("Description"));
					list.add(map);				
				}
				request.setAttribute("list", list);
				request.setAttribute("path", "Service/ServiceEnquiry.jsp");
				return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return "success";
	}
	public void criteria(String date, String name)
	{		
		if(date != null && date != "")
			sqlQry += " and to_char(datetime,'dd/MM/yyyy') = '" + date + "'";
		
		if(name != null && name != "")
			sqlQry += " and ServiceName like '%" + name + "%'";
		
		sqlQry += " Order by ServiceName asc";
	}
}
