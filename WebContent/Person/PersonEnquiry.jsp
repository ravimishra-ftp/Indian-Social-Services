<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.lara.client.common.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%><html>
<script type="text/javascript" src="../datepicker/jquery.js"></script>
<script type="text/javascript" src="../datepicker/ui.datepicker.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../datepicker/ui.datepicker.css" />
<link href="../style/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(function(){
		date_pic();
	});
	function date_pic(){
		$('#date').datepick({dateFormat:'dd/mm/yy'});
	}
</script>
<style type="text/css">
  table tr td, table tr th{
  	padding:0px;
  	margin:0px;
  }
</style>
	<body>
	<script type="text/javascript">	
	function noNumbers(e)
	{
	var keynum;
	var keychar;
	var numcheck;

	if(window.event) // IE
	{
	keynum = e.keyCode;
	}
	else if(e.which) // Netscape/Firefox/Opera
	{
	keynum = e.which;
	}
	keychar = String.fromCharCode(keynum);
	numcheck = /\d/;
	return !numcheck.test(keychar);
	}
	
	function isNumberKey(evt)
	{
	   var charCode = (evt.which) ? evt.which : event.keyCode
	   if (charCode > 31 && (charCode < 48 || charCode > 57))
	      return false;

	   return true;
	}
	</script>
		<form action="../personEnquiry.do">
		<%	SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");
	Date currentDate = new Date();
	String strDate = frmt.format(currentDate);
	%>
	<%
		//String panchayatId=request.getParameter("panchayatId");
		ArrayList list = new ArrayList();
		ArrayList list1 = new ArrayList();
		ArrayList list2 = new ArrayList();
		HashMap map = null;
		
		//if(panchayatId==null)
		//{
		//	panchayatId="";
		//}
		
		//if(!panchayatId.equals("0"))
		//{
			DB db = new DB();
			Statement stmt = null;
			Connection con  = db.getConnection();
			ResultSet rs=null;
			try
			{
				stmt = con.createStatement();
				String sql = "select VillageId, VillageName from Village ";//WHERE PanchayatId="+panchayatId;  
				 rs = stmt.executeQuery(sql);	
				while(rs.next())
	   			{
					map = new HashMap();
					map.put("id",rs.getInt("VillageId"));
					map.put("name",rs.getString("VillageName"));
					list.add(map);
	   			}				
				request.setAttribute("village",list);
				
				
				
				 sql = "select ServiceId, ServiceName from SOCIALSERVICE";//WHERE PanchayatId="+panchayatId;  
				 rs = stmt.executeQuery(sql);	
				while(rs.next())
	   			{
					map = new HashMap();
					map.put("id",rs.getInt("ServiceId"));
					map.put("name",rs.getString("ServiceName"));
					list2.add(map);
	   			}	
				request.setAttribute("service",list2);
				
				 sql = "select PanchayatId, PanchayatName from Panchayat";//WHERE PanchayatId="+panchayatId;  
				 rs = stmt.executeQuery(sql);	
				while(rs.next())
	   			{
					map = new HashMap();
					map.put("id",rs.getInt("PanchayatId"));
					map.put("name",rs.getString("PanchayatName"));
					list1.add(map);
	   			}	
				request.setAttribute("panchayat",list1);
			}
			catch(SQLException e)
			{
				
			}		
		//}
		
	%>	
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Search Person</font>
					<hr/>
						<table align="center">						
				<tr>
					<td>
						Date
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" size="12" id="date" name="date" style="width: 200px;"/>
					</td>
					<td>
						First Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" onkeypress="return noNumbers(event)" name="firstName" style="width: 200px"/>
					</td>
				</tr>
				<tr>
					<td>
						Last Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" onkeypress="return noNumbers(event)" name="lastName" style="width: 200px"/>
					</td>
					<td>
						Gender
					</td>
					<td>
						:
					</td>
					<td>
						<select name="gender" style="width: 200px">
							<option value="0">All</option>
							<option value="Male" >Male</option>
							<option value="Female">Female</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						Age
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" maxlength="3" onkeypress="return isNumberKey(event)" name="age" style="width: 200px"/>
					</td>
					<td>
						Father's Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" onkeypress="return noNumbers(event)" name="fatherName" style="width: 200px"/>
					</td>
				</tr>
				<tr>
					<td>
						Panchayat
					</td>
					<td>
						:
					</td>
					<td>
						<select name="panchayat" style="width: 200px">
						<option value="0">All</option>
						<c:forEach items="${panchayat}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>						
					</select>
					</td>
					<td>
						Village
					</td>
					<td>
						:
					</td>
					<td>
						<select name="village" style="width: 200px">
						<option value="0">All</option>
						<c:forEach items="${village}" var="student">
						<option value="${student.id }">${student.name}</option>
						</c:forEach>						
					</select>
					</td>
				</tr>
				<tr>
					<td>
						Service
					</td>
					<td>
						:
					</td>
					<td>
						<select name="service" style="width: 200px">
						<option value="0">All</option>
						<c:forEach items="${service}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>						
					</select>
					</td>
					<td class="form_settings" colspan="3" align="right">
						<input class="submit" type="submit" value="Search"/>
					</td>
				</tr>					
				<tr>
					<td colspan="6">
						<font style="font-size: 14px; color:red; font-style:inherit">${msg }</font>
					</td>
				</tr>
			</table>
					</td>
				</tr>
			</table>			
		</form>
	</body>
</html>