package com.lara.client.Person;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.lara.client.common.Common;
import com.lara.model.Action;
import com.lara.model.Bean;

public class FillCombo extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ResultSet rs = null;
		Common cmn = new Common();
		rs = cmn.getData(con, "PANCHAYAT", "PANCHAYATID,PANCHAYATNAME");
		HashMap map =null;
		ArrayList list = new ArrayList();
		ArrayList list1 = new ArrayList();
		
		try {
			while(rs.next())
			{
				map = new HashMap();
				map.put("id", rs.getInt("PANCHAYATID"));
				map.put("name", rs.getString("PANCHAYATNAME"));
				list.add(map);				
			}
			request.setAttribute("panchayat", list);
			
			rs = cmn.getData(con, "SOCIALSERVICE", "SERVICEID,SERVICENAME");
			
			
				while(rs.next())
				{
					map = new HashMap();
					map.put("id", rs.getInt("SERVICEID"));
					map.put("name", rs.getString("SERVICENAME"));
					list1.add(map);				
				}
				request.setAttribute("service", list1);
			return "success";	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "success";
	}
}
