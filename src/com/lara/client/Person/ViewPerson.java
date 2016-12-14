package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.Service.ServiceBean;
import com.lara.db.util.DbUtil;
import com.lara.model.Action;
import com.lara.model.Bean;

public class ViewPerson extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		PersonBean personBean = (PersonBean) bean;
		String id = personBean.getId();
		Statement stmt = null;
		ResultSet rs = null;
		
		try 
		{			
			ArrayList list = new ArrayList();
			String sqlQry="";
			stmt = con.createStatement();
			sqlQry =  "SELECT PersonMaster.PersonId,PersonMaster.PanchayatId,PersonMaster.VillageId, to_char(datetime,'dd/MM/yyyy') dt,FIRSTNAME, LASTNAME,Gender,Age,FatherName,Contact, PanchayatName," +
			"VillageName, Address from PersonMaster Inner join Village on PersonMaster.VillageId=Village.VillageId Inner join Panchayat on PersonMaster.PanchayatId = Panchayat.PanchayatId where PersonMaster.PersonId ='" + id + "'";
			rs = stmt.executeQuery(sqlQry);	
			int image;
			if(rs.next())
			{				
				list.add(rs.getString("dt"));
				list.add(rs.getString("FirstName"));
				list.add(rs.getString("LastName"));
				list.add(rs.getString("Gender"));
				list.add(rs.getString("Age"));
				list.add(rs.getString("FatherName"));
				list.add(rs.getString("Contact"));
				list.add(rs.getString("PanchayatId"));
				list.add(rs.getString("PanchayatName"));
				list.add(rs.getString("VillageId"));
				list.add(rs.getString("VillageName"));
				list.add(rs.getString("Address"));
				list.add(rs.getString("PersonId"));
				image = rs.getInt("PersonId");
				request.setAttribute("image", image);
			}
			request.setAttribute("list", list);
			
			
			sqlQry =  "SELECT SocialService.ServiceId, ServiceName from PersonChild Inner join SocialService on PersonChild.ServiceId = SocialService.ServiceId Inner join PersonMaster on PersonMaster.PersonId = PersonChild.PersonId where PersonMaster.PersonId ='" + id + "'";
			rs = stmt.executeQuery(sqlQry);	
			ArrayList list1 = new ArrayList();
			HashMap map = null;
			while(rs.next())
			{				
				map = new HashMap();
				map.put("id", rs.getInt("ServiceId"));
				map.put("service", rs.getString("ServiceName"));
				list1.add(map);
			}
			request.setAttribute("list1", list1);
			request.setAttribute("path", "personEnquiry.do");
			request.setAttribute("prsnId", id);
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
