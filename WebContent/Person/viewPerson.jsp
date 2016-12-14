<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%><html>
<link rel="stylesheet" type="text/css" href="style/style.css" title="style" />
	<head>
	</head>
	<body>
	<form>
			<table width="100%" align="center">
				<tr>
					<td align="right">
					<a href="Template/home.jsp">Home</a>&nbsp;||&nbsp;
					<a href="${path }">Back</a>&nbsp;||&nbsp;
					<input type="button" value="Print" onclick="window.print()">
					</td>
				</tr>
				<tr>
				<tr>
					<td align="center">
						<font style="font-size: 24px; font-style:inherit">Person Details</font>
			<hr>		
			<table align="center">
			
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
		</tr>
		<tr>
		<td>
			Name
		</td>
		<td>
			:
		</td>
		<td>
			${list[1] }&nbsp;${list[2] }
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
		${list[3] }			
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
		${list[4] }			
		</td>
	</tr>
	<tr>
		<td>
			Father's Name
		</td>
		<td>
			:
		</td>
		<td>
		${list[5] }			
		</td>
	</tr>
	<tr>
		<td>
			Contact
		</td>
		<td>
			:
		</td>
		<td>
		${list[6] }			
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
		${list[8] }			
		</td>
	</tr>
	<tr>
		<td>
			Village
		</td>
		<td>
			:
		</td>
		<td>
		${list[10] }			
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
		${list[11] }			
		</td>
	</tr>
	<tr>
		<td valign="top">
			Service
		</td>
		<td valign="top">
			: 
		</td>
		<td>
			<c:forEach items="${list1}" var="service" varStatus="status">
				${status.count }&nbsp;${service.service }<br/>
			</c:forEach>
		</td>
	</tr>
</table>
					

					</td>
				</tr>
			</table>	
			</form>		
</body>
</html>
		