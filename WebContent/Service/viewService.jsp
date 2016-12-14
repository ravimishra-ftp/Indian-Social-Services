
<%@page import="java.sql.ResultSet"%><html>
<link rel="stylesheet" type="text/css" href="style/style.css" title="style" />
	<head>
	</head>
	<body>
	<form>
			<table align="center" width="100%">
			<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>&nbsp;||<a href="${path }">Back</a>
					<input type="button" value="Print" onclick="window.print()">
					</td>
				</tr>
				<tr>
					<td align="center">
						<font style="font-size: 24px; font-style:inherit">Service Details</font>
			<hr>		
			<table>
			<%--<tr>		
				<td colspan="6">
				<% 
				String userImage = request.getAttribute("image") + ".jpg";				
				%>
				<img alt="" src="serviceimages\<%=userImage %>" width="400px" height="130px"><br>				
				</td>
			</tr>--%>
			<tr>
		<td>
			Date 
		</td>		
		<td>
			:
		</td>
		<td>
			${list[0] }
		</td>
		<td colspan="3">
		
		</td>
		</tr>
		<tr>
		<td>
			Service Name
		</td>
		<td>
			:
		</td>
		<td>
			${list[1] }
		</td>
		<td colspan="3">
		
		</td>
	</tr>
	
	<tr >
		<td>
			Desc
		</td>
		<td>
			:
		</td>
		<td>
		${list[2] }			
		</td>
		<td colspan="3">
		
		</td>
		</tr>
</table>
					

					</td>
				</tr>
			</table>	
			</form>		
</body>
</html>
		