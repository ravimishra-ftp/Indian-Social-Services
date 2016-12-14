package com.lara.client.report;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.Service.ServiceBean;
import com.lara.model.Action;
import com.lara.model.Bean;

public class VillageWise extends Action
{
	String sqlQry="";
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ServiceBean serviceBean = (ServiceBean) bean;
		String toDate = serviceBean.getTo();
		String fromDate = serviceBean.getFrom();
		String village = serviceBean.getServiceName();
		Statement stmt = null;
		ResultSet rs = null;
		
		try 		
		{
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			sqlQry =  "Select distinct to_char(PersonMaster.datetime,'dd/MM/yyyy')dt,firstName,LastName,Gender,Age," +
					"FatherName,Contact from PersonMaster " +
					"inner join Village on PersonMaster.VillageId = Village.VillageId  inner join PersonChild on " +
					"PersonMaster.PersonId = PersonChild.PersonId inner join SocialService on " +
					"PersonChild.ServiceId = PersonChild.ServiceId where PersonMaster.Villageid = '" + village + "'";
			criteria(fromDate,toDate);
			rs = stmt.executeQuery(sqlQry);
			HashMap map =null;
			ArrayList villageList = new ArrayList();
			
				while(rs.next())
				{
					map = new HashMap();
					map.put("DateTime", rs.getString("dt"));
					map.put("FirstName", rs.getString("firstName"));
					map.put("LastName", rs.getString("LastName"));
					map.put("Gender", rs.getString("Gender"));
					map.put("Age", rs.getString("Age"));
					map.put("FatherName", rs.getString("FatherName"));
					map.put("Contact", rs.getString("Contact"));
					villageList.add(map);				
				}		
				request.setAttribute("path", "Report/villageWise.jsp");
				request.setAttribute("village", villageList);								
				
				return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return "success";
	}
	public void criteria(String from, String to)
	{
		if(from!=null && !"".equals(from))
		sqlQry += " and  to_char(PersonMaster.datetime,'dd/MM/yyyy') >= '" + from + "' ";
		
		if(to!=null && !"".equals(to))
			sqlQry += " and  to_char(PersonMaster.datetime,'dd/MM/yyyy') <= '" + to + "' ";
		
		sqlQry +=  " order by FirstName asc";
	}
}
