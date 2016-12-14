<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
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
	var oldPassword = myForm.oldPassword;
	var newPassword = myForm.newPassword;
	var reType = myForm.reType;
		if (oldPassword.value==null || oldPassword.value=="")
		  {
		  alert("Old Password must be filled out");
		  oldPassword.focus();
		  return false;
		  }
		  
		if (newPassword.value==null || newPassword.value=="")
		{
		alert("New Password must be filled out");
		newPassword.focus();
		return false;
		}
		if (reType.value==null || reType.value=="")
		{
		alert("Re-Type must be filled out");
		reType.focus();
		return false;
		}
		if (newPassword.value!=reType.value)
		{
		alert("Re-Type password is not same");
		reType.focus();
		return false;
		}
		
	}
	</script>
<form action="../changePassword.do">		
			<table width="700px" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Change Password</font>
					<hr/>
						<table align="center">
				<tr>
					<td>
						Old Password <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="password" size="12" id="oldPassword" name="oldPassword" style="width: 225px;"/>						
					</td>
				</tr>
				<tr>
					<td>
						New Password <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="password" name="newPassword" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td>
						Re-Type <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="password" name="reType" style="width: 225px"/>
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