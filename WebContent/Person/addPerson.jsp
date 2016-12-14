<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lara.client.common.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%><html>
<script type="text/javascript" src="datepicker/jquery.js"></script>
<script type="text/javascript" src="datepicker/ui.datepicker.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="datepicker/ui.datepicker.css" />
<link href="style/style.css" rel="stylesheet" type="text/css" />
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
	<script type="text/javascript">
	function showVillage(str)
	{
	var xmlhttp;  
	
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  	xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
		xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("data").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","Village?q="+str,true);
	xmlhttp.send();
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
		if (service.value==null || service.value=="")
		{
		alert("Select Service..");
		service.focus();
		return false;
		}
	}
	</script>
	<body>
<%	SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");
	Date currentDate = new Date();
	String strDate = frmt.format(currentDate);
	%>
		
		<form action="addPerson.do">
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Add Person</font>
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
					    <input type="text" id="date" value="<%=strDate %>" name="date" style="width: 225px;"/>
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
						<input type="text" onkeypress="return noNumbers(event)" name="firstName" style="width: 225px"/>
					</td>
					<td width="30px"></td>
					<td>
						Last Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="lastName" onkeypress="return noNumbers(event)" style="width: 225px"/>
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
						<select name="gender" class="gen"  style="width: 225px;">
							<option value="Male" selected="selected">Male</option>
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
					
						<input type="text" onkeypress="return isNumberKey(event)" maxlength="3" name="age" style="width: 225px"/>
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
						<input type="text" onkeypress="return noNumbers(event)" name="fatherName" style="width: 225px"/>
					</td>
					<td width="30px"></td>
					<td>
						Contact
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="contact" style="width: 225px"/>
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
						<select name="panchayat" style="width: 225px" onchange="showVillage(this.value)">
						<option value="0">--Select--</option>
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
					<div id="data">
						<select name="village" id="village" style="width: 225px">
						<option value="0">--Select--</option>
						<c:forEach items="${aaa}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>						
					</select>
					</div>
					</td>
				</tr>
				<tr>					
					<td>
						Address
					</td>
					<td>
						:
					</td>
					<td>
						<textarea rows="4" name="address" cols=""  style="width: 225px"></textarea>
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
						<c:forEach items="${service}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="7" align="right">
						<input class="submit" type="submit" onclick="return validate()" value="Submit"/>
						<input type="reset" class="submit" value="Reset"/>
						<input type="hidden" name="serviceHidden"/>
						<input type="hidden" name="vId" value="1"/>
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