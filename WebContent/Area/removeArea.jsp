<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Area</title>
</head>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  table tr td, table tr th{
  	padding:0px;
  	margin:0px;
  }
</style>
<body>
<script type="text/javascript">
	function validate()
	{
	var myForm = document.forms[0];
	var panchayatName = myForm.panchayatName;
	var villageName = myForm.villageName;
		if (panchayatName.value==null || panchayatName.value=="")
		  {
		  alert("Panchayat Name must be filled out");
		  panchayatName.focus();
		  return false;
		  }
		  
		if (villageName.value==null || villageName.value=="")
		{
		alert("Village Name must be filled out");
		villageName.focus();
		return false;
		}
		
	}
	</script>
<form action="../serviceEnquiry.do">		
			<table width="700px" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Remove Service Area</font>
					<hr/>
						<table align="center">
				<tr>
					<td>
						Panchayat Name <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" size="12" id="panchayatName" name="panchayatName" style="width: 225px;"/>						
					</td>
					<td>
						Village Name <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="villageName" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="6" align="right">
						<input class="submit" type="submit" value="Submit" onclick="return validate()"/>
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