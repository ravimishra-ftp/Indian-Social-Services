package com.lara.client.account;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lara.model.Action;
import com.lara.model.Bean;

public class ChangePasswordAction extends Action
{
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		ChangePasswordBean settingBean = (ChangePasswordBean) bean;
		String oldPass = settingBean.getOldPassword();
		String newPass = settingBean.getNewPassword();
				
		String msg="";
		Statement stmt = null;
		ResultSet rs = null;
		
		try 
		{			
			HttpSession userSession = request.getSession();
			String username = (String) userSession.getAttribute("UserName");			
			String sqlQry="";
			stmt = con.createStatement();
			sqlQry = "Select Password from UserMaster where Username='" + username + "'";
			rs = stmt.executeQuery(sqlQry);
			if(rs.next())
			{
				if(rs.getString("Password").equals(oldPass))
				{
				sqlQry = "Update UserMaster set Password ='" + newPass + "' where UserName = '" + username + "'";
				stmt.executeUpdate(sqlQry);				
				msg = "Password sucessfully changed...";
				request.setAttribute("msg", msg);	
				return "success";
				}
				else
				{
					msg = "Old password not matched...";
					request.setAttribute("msg", msg);	
					return "failure";
				}
			}				
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
		
	}
}
