<html>
<link href="style/style.css" rel="stylesheet" type="text/css" />
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
	</script>
		<form action="editService.do">
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>&nbsp;||
					<a href="${path }">Back</a>		
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Edit Service</font>
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
						<input type="text" id="date" name="date" value="${list[0] }" style="width: 225px"/>
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
						<input type="text" onkeypress="return noNumbers(event)" name="name" value="${list[1] }" style="width: 225px"/>
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
						<textarea rows="5" name="desc" cols="" style="width: 225px">${list[2] }</textarea>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="3" align="right">
						<input class="submit" type="submit" value="Submit"/>
						<input type="hidden" name="hidden" value="${list[3] }""/>
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