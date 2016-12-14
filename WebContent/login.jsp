
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="html" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Social Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style/style.css" rel="stylesheet" type="text/css" />
<link href="style/login-box.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
history.forward();
function check()
{
	var myForm = document.forms[0];
	var name = myForm.username;
	var pass = myForm.password;
	if (name.value==null || name.value=="")
	  {
	  alert("Username must be filled out");
	  name.focus();
	  return false;
	  }
	  
	if (pass.value==null || pass.value=="")
	{
	alert("Password must be filled out");
	pass.focus();
	return false;
	}
}
setTimeout("disableBackButton()", 0);
</script>
</head>
<%
session.invalidate();
%>
<body onload="document.forms[0].username.focus()" style="vertical-align: middle;">
<form action="Index.do" method="post">
	<center>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<table width="700px" border="10">
		<tr>
			<td align="center" >
			<font style="font-size: 24px; font-style:inherit">Login</font>
			<hr/><hr/>
				<table align="center">
					<tr>
						<td>
							<font style="font-size: 14px; font-weight: bold">User Name</font>
						</td>
						<td>
							<font style="font-size: 14px; font-weight: bold">:</font>
						</td>
						<td>
							<input type="text" name="username" value="${username }"/>
						</td>
					</tr>
					<tr>
						<td>
							<font style="font-size: 14px; font-weight: bold">Password</font>
						</td>
						<td>
							<font style="font-size: 14px; font-weight: bold">:</font>
						</td>
						<td>
							<input type="password" name="password"/>
						</td>
					</tr>
					<tr>
						<td class="form_settings" colspan="3" align="right">
							<input class="submit" type="submit" value="Log In" onclick="return check()"/>
						</td>
					</tr>					
					<tr>
						<td colspan="3">
							<font style="font-size: 14px; color:red; font-style:inherit">${msg }</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</center>	
</form>
</body>
</html>