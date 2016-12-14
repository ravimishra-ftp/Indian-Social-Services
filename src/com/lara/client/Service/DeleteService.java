package com.lara.client.Service;

import java.io.File;
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

public class DeleteService extends Action 
{
	public String process(HttpServletRequest request, Bean bean)
	{
		String sqlQry="";
		
		ResultSet rs = null;
		Connection con = (Connection)request.getAttribute("con");
		Statement stmt = null;
		ServiceBean serviceBean = (ServiceBean) bean;		
		String id = serviceBean.getId();
		Common cmn = new Common();
		int count =cmn.deleteData(con, "SOCIALSERVICE", "SERVICEID",id);
		if(count>0)
		{
			File file = new File("F:/Lara/Lara/Project/SocialService/WebContent/serviceimages/" + id + ".jpg");
			file.delete();
		}
			try {
			stmt = con.createStatement();
			sqlQry =  "SELECT ServiceID, ServiceName, to_char(datetime,'dd/MM/yyyy') dt, Description from SOCIALSERVICE where ServiceID !='0' order by ServiceName asc";	
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
				request.setAttribute("path", "Service/ServiceEnquiry.jsp");
				request.setAttribute("list", list);
				return "success";
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
				
		return "failure";		
	}
}
