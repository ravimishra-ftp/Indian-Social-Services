<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.lara.client.common.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%><html>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="datepicker/jquery.js"></script>
<script type="text/javascript" src="datepicker/ui.datepicker.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="datepicker/ui.datepicker.css" />

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
		<form action="editPerson.do">
		<script type="text/javascript">
	function refreshPage(panchayatId)
	{
		window.location="Person/addPerson.jsp?panchayatId="+panchayatId;
	}
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
	
	function validate()
	{
	var myForm = document.forms[0];
	var date = myForm.date;
	var firstName = myForm.firstName;
	var age = myForm.age;
	var fatherName = myForm.fatherName;
	var panchayat = myForm.panchayat;
	var village = myForm.village;
	var service = myForm.service;
	var hidden = myForm.serviceHidden;
	var values="";

	for(var i=0; i<service.length; i++)
	 {				
		if(service[i].selected == true)
		{
			check = true;
			values += service[i].value + ",";	
		}
	 } 
	 hidden.value=values;
		if (date.value==null || date.value=="")
		  {
		  alert("Date must be filled out");
		  date.focus();
		  return false;
		  }
		  
		if (firstName.value==null || firstName.value=="")
		{
		alert("Name must be filled out");
		firstName.focus();
		return false;
		}
		
		if (age.value==null || age.value=="")
		{
		alert("Age must be filled out");
		age.focus();
		return false;
		}
		if (fatherName.value==null || fatherName.value=="")
		{
		alert("Father's Name must be filled out");
		fatherName.focus();
		return false;
		}
		if (panchayat.value==null || panchayat.value=="0")
		{
		alert("Select Panchayat..");
		panchayat.focus();
		return false;
		}
		if (village.value==null || village.value=="0")
		{
		alert("Select Village..");
		village.focus();
		return false;
		}
		if (service.value==null || service.value=="0")
		{
		alert("Select Service..");
		service.focus();
		return false;
		}
	}
	</script>
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
				
				
				
				 sql = "select ServiceId, ServiceName from SOCIALSERVICE where ServiceId not in (Select ServiceId from PersonChild where PersonId = '" + request.getAttribute("prsnId") + "')";//WHERE PanchayatId="+panchayatId;  
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
					<a href="../Template/home.jsp">Home</a>&nbsp;||
					<a href="${path }">Back</a>		
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Edit Person</font>
					<hr/>
						<table align="center">
				<tr>
					<td>
						Date <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" id="date" value="${list[0] }" name="date" style="width: 225px"/>
					</td>
					<td width="30px"></td>
					
				</tr>
				<tr>
					<td>
						First Name <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="firstName"  value="${list[1] }" style="width: 225px"/>
					</td>
					<td width="30px"></td>
					<td>
						Last Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text"  value="${list[2] }" name="lastName" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td>
						Gender
					</td>
					<td>
						:
					</td>
					<td>
						<select name="gender" style="width: 225px">
							<option value="${list[3] }"> ${list[3] } </option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</td>
					<td width="30px"></td>
					<td>
						Age <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text"  value="${list[4] }" name="age" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td>
						Father's Name <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text"  value="${list[5] }" name="fatherName" style="width: 225px"/>
					</td>
					<td width="30px"></td>
					<td>
						Contact
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text"  value="${list[6] }" name="contact" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td>
						Panchayat <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<select name="panchayat" style="width: 225px">
						<option  value="${list[7] }">${list[8] }</option>
						<c:forEach items="${panchayat}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>							
					</select>
					</td>
					<td width="30px"></td>
					<td>
						Village <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<select name="village" style="width: 225px">
						<option  value="${list[9] }">${list[10] }</option>
						<c:forEach items="${village}" var="student">
						<option value="${student.id }">${student.name}</option>
						</c:forEach>						
					</select>
					</td>
				</tr>
				<tr>					
					<td>
						Address <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<textarea rows="4" name="address" cols=""  style="width: 225px">${list[11] }</textarea>
					</td>
					<td width="30px"></td>
					<td>
						Service <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<select name="service" multiple="multiple" style="width: 225px">
						<c:forEach items="${list1}" var="service">
						<option value="${service.id }" selected="selected">${service.service }</option>
						</c:forEach>
						<c:forEach items="${service}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="7" align="right">
						<input class="submit" type="submit" value="Submit" onclick="return validate()"/>
						<input type="hidden" name="serviceHidden"/>
						<input type="hidden" name="editHidden" value="${list[12] }"/>
					</td>
				</tr>					
				<tr>
					<td colspan="7">
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