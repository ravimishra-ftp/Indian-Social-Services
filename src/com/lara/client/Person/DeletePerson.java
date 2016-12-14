package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.common.Common;
import com.lara.model.Action;
import com.lara.model.Bean;

public class DeletePerson extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		String sqlQry="";
		
		ResultSet rs = null;
		Connection con = (Connection)request.getAttribute("con");
		Statement stmt = null;
		PersonBean personBean = (PersonBean) bean;		
		String id = personBean.getId();
		Common cmn = new Common();
		int status = cmn.deleteData(con, "PersonChild", "PersonId",id);
		if(status>0)
		{			
			status = cmn.deleteData(con, "PersonMaster", "PersonId",id);
			if(status>0)
			{
				try {
				stmt = con.createStatement();
				sqlQry =  "SELECT PersonMaster.PERSONID, to_char(datetime,'dd/MM/yyyy') dt,FIRSTNAME,PanchayatName, LASTNAME, " +
				"VillageName from PersonMaster Inner join Village on PersonMaster.VillageId=Village.VillageId Inner join Panchayat on PersonMaster.PanchayatId = Panchayat.PanchayatId where PersonMaster.PersonId !='0' Order by PanchayatName";
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
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}		
		return "failure";		
	}
}
