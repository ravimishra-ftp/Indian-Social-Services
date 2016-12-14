package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.Service.ServiceBean;
import com.lara.model.Action;
import com.lara.model.Bean;

public class PersonEnquiry extends Action
{
	String sqlQry="";
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		PersonBean personBean = (PersonBean) bean;
		String date = personBean.getDate();
		String firstName = personBean.getFirstName();
		String lastName = personBean.getLastName();
		String gender = personBean.getGender();
		String age = personBean.getAge();
		String father = personBean.getFatherName();
		String panchayat = personBean.getPanchayat();
		String village = personBean.getVillage();
		String service = personBean.getService();
		Statement stmt = null;
		ResultSet rs = null;
		
		try 		
		{
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			sqlQry =  "SELECT distinct PersonMaster.PERSONID, to_char(PersonMaster.datetime,'dd/MM/yyyy') dt,FIRSTNAME,PanchayatName, LASTNAME, " +
					"VillageName from PersonMaster Inner join Village on PersonMaster.VillageId=Village.VillageId Inner join Panchayat on " +
					"PersonMaster.PanchayatId = Panchayat.PanchayatId Inner join PersonChild on PersonMaster.personId = PersonChild.PersonId " +
					"Inner join SocialService on Personchild.ServiceId = SocialService.serviceId where PersonMaster.PersonId !='0'";	
			criteria(date, firstName,lastName,gender,age,father,panchayat,village,service);
			rs = stmt.executeQuery(sqlQry);
			HashMap map =null;
			ArrayList list = new ArrayList();
			
				while(rs.next())
				{
					map = new HashMap();
					map.put("PersonId", rs.getInt("PersonID"));
					map.put("DateTime", rs.getString("dt"));
					map.put("FirstName", rs.getString("FirstName"));
					map.put("LastName", rs.getString("LastName"));
					map.put("PanchayatName", rs.getString("PanchayatName"));
					map.put("VillageName", rs.getString("VillageName"));
					list.add(map);				
				}
				request.setAttribute("path", "Person/PersonEnquiry.jsp");
				request.setAttribute("list", list);
				return "success";
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return "success";
	}
	public void criteria(String date, String firstName,String lastName,String gender,String age,String father,String panchayat,String village,String service)
	{		
		if(date != null && date != "")
			sqlQry += " and to_char(PersonMaster.datetime,'dd/MM/yyyy') = '" + date + "'";
		
		if(firstName != null && firstName != "")
			sqlQry += " and FirstName like '%" + firstName + "%'";
		
		if(lastName != null && lastName != "")
			sqlQry += " and LastName like '%" + lastName + "%'";
		
		if(gender != null && ! "0".equals(gender))
			sqlQry += " and Gender = '" + gender + "'";
		
		if(age != null && age != "")
			sqlQry += " and Age = '" + age + "'";
		
		if(father != null && father != "")
			sqlQry += " and FatherName like '%" + father + "%'";
		
		if(panchayat != null &&  ! "0".equals(panchayat))
			sqlQry += " and PersonMaster.PanchayatId = '" + panchayat + "'";
		
		if(village != null && ! "0".equals(village))
			sqlQry += " and PersonMaster.VillageId= '" + village + "'";
		
		if(service != null && ! "0".equals(service))
			sqlQry += " and PersonChild.ServiceId= '" + service + "'";
		
		sqlQry += " Order by PanchayatName";
	}
}
