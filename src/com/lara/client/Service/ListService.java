package com.lara.client.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.model.Action;
import com.lara.model.Bean;

public class ListService extends Action
{	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String process(HttpServletRequest request, Bean bean)
	{
		String sqlQry="";
		
		ResultSet rs = null;
		Connection con = (Connection)request.getAttribute("con");
		Statement stmt = null;
		//ServiceBean ServiceBean = (ServiceBean) bean;		
				try {
				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				sqlQry =  "SELECT SERVICEID, to_char(datetime,'dd/MM/yyyy') dt,SERVICENAME from SOCIALSERVICE";
				rs = stmt.executeQuery(sqlQry);
				HashMap map =null;
				ArrayList list = new ArrayList();
				//int count=0;
					while(rs.next())
					{
						//count++;
						map = new HashMap();
						map.put("ServiceId", rs.getInt("ServiceID"));
						map.put("DateTime", rs.getString("dt"));
						map.put("ServiceName", rs.getString("ServiceName"));
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
