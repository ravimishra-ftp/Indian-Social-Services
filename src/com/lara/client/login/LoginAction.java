package com.lara.client.login;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lara.db.util.DbUtil;
import com.lara.model.Action;
import com.lara.model.Bean;

public class LoginAction extends Action {
	public String process(HttpServletRequest request, Bean bean)
	{
		Connection con = (Connection)request.getAttribute("con");
		LoginBean loginBean = (LoginBean) bean;
		String username = loginBean.getUsername();
		String password = loginBean.getPassword();
		String msg="";
		Statement stmt = null;
		ResultSet rs = null;
		
		try 
		{
			HttpSession userSession = request.getSession();
			userSession.setAttribute("UserName", username);
			String sqlQry="";
			stmt = con.createStatement();
			sqlQry = "Select Password from USERMASTER where Username='" + username + "'";
			rs = stmt.executeQuery(sqlQry);			
			if(rs.next())
			{									
				if(password.equals(rs.getString("Password")))
					{	//create session											
						return "success";
					}	
				else
				{
					request.setAttribute("username", username);
					msg = "Password not mached..";
					request.setAttribute("msg", msg);
					return "failure";
				}
			}
			else
			{
				request.setAttribute("username", username);
				msg = "Username or password not mached..";
				request.setAttribute("msg", msg);
				return "failure";
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
