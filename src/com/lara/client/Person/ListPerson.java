package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.model.Action;
import com.lara.model.Bean;

public class ListPerson extends Action
{	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String process(HttpServletRequest request, Bean bean)
	{
		String sqlQry="";
		
		ResultSet rs = null;
		Connection con = (Connection)request.getAttribute("con");
		Statement stmt = null;
		//PersonBean personBean = (PersonBean) bean;		
				try {
				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				sqlQry =  "SELECT PERSONID, to_char(datetime,'dd/MM/yyyy') dt,FIRSTNAME,LASTNAME, CONTACT, GENDER, FATHERNAME from PersonMaster";
				rs = stmt.executeQuery(sqlQry);
				HashMap map =null;
				ArrayList list = new ArrayList();
				//int count=0;
					while(rs.next())
					{
						//count++;
						map = new HashMap();
						map.put("PersonId", rs.getInt("PersonID"));
						map.put("DateTime", rs.getString("dt"));
						map.put("FirstName", rs.getString("FirstName"));
						map.put("LastName", rs.getString("LastName"));
						map.put("Gender", rs.getString("Gender"));
						map.put("FatherName", rs.getString("FatherName"));
						map.put("Contact", rs.getString("Contact"));
						list.add(map);	
						//if(count==10)
							//break;
					}
					request.setAttribute("list", list);
					return "success";
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("msg", "Some Error Ocurred, We are Sorry for Inconvenience");
		return "failure";		
	}
}
