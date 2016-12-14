
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<script type="text/javascript" src="../datepicker/jquery.js"></script>
<script type="text/javascript" src="../datepicker/ui.datepicker.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../datepicker/ui.datepicker.css" />
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
	
	function validate()
	{
	var myForm = document.forms[0];
	var date = myForm.date;
	var name = myForm.name;
	var desc = myForm.desc;
		if (date.value==null || date.value=="")
		  {
		  alert("Date must be filled out");
		  date.focus();
		  return false;
		  }
		  
		if (name.value==null || name.value=="")
		{
		alert("Service Name must be filled out");
		name.focus();
		return false;
		}
		
		if (desc.value==null || desc.value=="")
		{
		alert("Description must be filled out");
		desc.focus();
		return false;
		}
	}
	</script>
<%	SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");
	Date currentDate = new Date();
	String strDate = frmt.format(currentDate);
	%>
		<form action="../addService.do">
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Add Service</font>
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
					<input type="text" size="12" id="date" value="<%=strDate %>" name="date" style="width: 225px;"/>
					</td>
				</tr>
				<tr>
					<td>
						Service Name <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="name" value="${name }" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td>
						Description <font style="font-size: 12px; color: red;">*</font>
					</td>
					<td>
						:
					</td>
					<td>
						<textarea name="desc" rows="5" cols="" style="width: 225px">${desc }</textarea>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="3" align="right">
						<input class="submit" type="submit" value="Submit" onclick="return validate()"/>&nbsp;
						<input type="reset" class="submit" value="Reset"/>
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
		</form>
	</body>
</html>