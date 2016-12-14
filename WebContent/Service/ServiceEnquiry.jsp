
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%><html>
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
		<form action="../serviceEnquiry.do">		
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
					<font style="font-size: 24px; font-style:inherit">Search Services</font>
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
						<input type="text" size="12" id="date" name="date" style="width: 225px;"/>						
					</td>
					<td>
						Service Name
					</td>
					<td>
						:
					</td>
					<td>
						<input type="text" name="name" style="width: 225px"/>
					</td>
				</tr>
				<tr>
					<td class="form_settings" colspan="6" align="right">
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