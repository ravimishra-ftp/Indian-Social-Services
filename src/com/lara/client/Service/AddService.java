package com.lara.client.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import com.lara.db.util.DbUtil;
import com.lara.model.Action;
import com.lara.model.Bean;

public class AddService extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ServiceBean serviceBean = (ServiceBean) bean;
		String date = serviceBean.getDate();
		String desc = serviceBean.getDesc();
		String name = serviceBean.getServiceName();
		String hidden = serviceBean.getHidden();
				
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{	
			
			String sqlQry="";
			stmt = con.createStatement();
			if(hidden!=null)
			{
				sqlQry = "Update SOCIALSERVICE Set DateTime = to_date('" + date + "','dd/MM/yyyy'), ServiceName ='" + name + "', Description = '" + desc + "' where ServiceId='" + hidden + "'";
				stmt = con.createStatement();
				if(stmt.executeUpdate(sqlQry) > 0)
				{
					request.setAttribute("path", "serviceEnquiry.do");
					request.setAttribute("msg", "Record Updated Successfully..");
					return "success";	
				}
					
			}
			else {
				sqlQry =  "SELECT * from SOCIALSERVICE where SERVICENAME ='" + name + "'";	
				rs = stmt.executeQuery(sqlQry);
				if(!rs.next())
				{
					sqlQry = "Insert into SOCIALSERVICE (SERVICEID, DATETIME, SERVICENAME, DESCRIPTION) values(SOCIALSERVICE_SEQ.nextval,to_date('" + date + "','dd/MM/yyyy'),'" + name + "','" + desc + "')";
					if(stmt.executeUpdate(sqlQry) > 0)
					{
						request.setAttribute("path", "Service/addService.jsp");
						request.setAttribute("msg", "Record Saved Successfully..");
						return "success";			
					}
					else {
						request.setAttribute("msg", "Error..");
						return "failure";		
					}
				}
				else
				{
					request.setAttribute("msg", "Record Already Exist..");
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
