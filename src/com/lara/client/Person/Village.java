package com.lara.client.Person;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lara.client.common.DB;

/**
 * Servlet implementation class Village
 */
public class Village extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Village() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String panchayatId=request.getParameter("q");
		ArrayList list = new ArrayList();
		HashMap map = null;

		if(panchayatId==null)
		{
			panchayatId="0";
		}
		 PrintWriter out = response.getWriter();
		if(!panchayatId.equals("0"))
		{
			DB db = new DB();
			Statement stmt = null;
			Connection con  = db.getConnection();
			ResultSet rs=null;
			try
			{
				stmt = con.createStatement();
				String sql = "select VillageId, VillageName from Village WHERE PanchayatId="+panchayatId;  
				 rs = stmt.executeQuery(sql);	
				
				 out.println("<select name='village' style='width: 225px'>");
				 out.println("<option value='0'>--Select--</option>");
				while(rs.next())
					{
					 out.println("<option value='" + rs.getInt("VillageId") + "'> " + rs.getString("VillageName") + "</option>");
//					map = new HashMap();
//					map.put("id",rs.getInt("VillageId"));
//					map.put("name",rs.getString("VillageName"));
//					list.add(map);
					}			
				out.println("</select>");
//				request.setAttribute("aaa",list);
			}			
			catch(SQLException e)
			{
				
			}		
		}
		else
		{
			 out.println("<select name='village' style='width: 225px'>");
			 out.println("<option value='0'>--Select--</option>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
