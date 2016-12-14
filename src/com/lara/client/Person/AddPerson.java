package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.common.Common;
import com.lara.db.util.DbUtil;
import com.lara.model.Action;
import com.lara.model.Bean;

public class AddPerson extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		PersonBean personBean = (PersonBean) bean;
		String date = personBean.getDate();
		String firstName = personBean.getFirstName();
		String lastName = personBean.getLastName();
		String gender = personBean.getGender();
		String age = personBean.getAge();
		String fatherName = personBean.getFatherName();
		String contact = personBean.getContact();
		String panchyat = personBean.getPanchayat();
		String village = personBean.getVillage();
		String address = personBean.getAddress();
		String serviceHidden = personBean.getServiceHidden();
		String personId = personBean.getEditHidden();
		Statement stmt = null;
		ResultSet rs = null;
		String []service = serviceHidden.split(",");
		try 
		{			
			String sqlQry="";
			stmt = con.createStatement();
			Common cmn = new Common();
			if(personId!=null)
			{
				sqlQry = "Update PersonMaster Set DateTime = to_date('" + date + "','dd/MM/yyyy'), FirstName ='" + firstName + "', LastName = '" + lastName + "', Gender = '" + gender + "', Age = '" + age + "',FatherName = '" + fatherName + "',Contact = '" + contact + "',PanchayatId = '" + panchyat + "',VillageId = '" + village + "',Address = '" + address + "' where PersonId='" + personId + "'";
				stmt = con.createStatement();
				if(stmt.executeUpdate(sqlQry) > 0)
				{

						
					int status = cmn.deleteData(con, "PersonChild", "PersonId", personId);
					if(status>0)
					{
						for(String i : service)
						{
						
						sqlQry = "Insert into PersonChild values(PersonChild_SEQ.nextval,'" + personId + "','" + i + "')";
						stmt.executeUpdate(sqlQry);
						}
						request.setAttribute("path", "personEnquiry.do");
						request.setAttribute("msg", "Record Updated Successfully..");
						return "success";	
					}
				}
					
			}
			else {				
					sqlQry = "Insert into PersonMaster values(PersonMaster_SEQ.nextval,to_date('" + date + "','dd/MM/yyyy'),'" + firstName + "'," +
							"'" + lastName + "','" + gender + "','" + age + "','" + fatherName + "','" + contact + "','" + panchyat + "'," +
									"'" + village + "','" + address + "')";
					
					if(stmt.executeUpdate(sqlQry) > 0)
					{
						int maxId = cmn.getMax(con, "PersonMaster", "PERSONID");

						for(String i : service)
						{
						
						sqlQry = "Insert into PersonChild values(PersonChild_SEQ.nextval,'" + maxId + "','" + i + "')";
						stmt.executeUpdate(sqlQry);
						}
						request.setAttribute("path", "fillCombo.do");
						request.setAttribute("msg", "Record Saved Successfully..");
						return "success";		
						
					}
					else {
						request.setAttribute("msg", "Error..");
						return "failure";		
					}
				}						
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
