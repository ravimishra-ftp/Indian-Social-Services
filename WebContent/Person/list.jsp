<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function show_confirm()
{
var r=confirm("Are you sure you want to delete this record?");
if (r==true)
  {
  return true;
  }
return false;
}
</script>
<body>
	<form action="">
	<table width="100%">
		<tr>		
			<td align="right">
			<a href="Template/home.jsp">Home</a>&nbsp;||&nbsp;
			<a href="${path }">Back</a>&nbsp;||&nbsp;
			<input type="button" value="Print" onclick="window.print()">
			</td>
		</tr>
		<tr>
			<td align="center">
			<font style="font-size: 24px; font-style:inherit">Person List</font>
			<hr>
			</td>			
		</tr>
		<c:if test="${ not empty list}">
		<tr>
		
			<td>
		<table border="1" align="center" width="100%">
			<tr>
				<th>
				SN
				</th>
				<th>
				Date
				</th>
				<th>
				Person Name
				</th>
				<th>
				Father Name
				</th>
				<th>
				Gender
				</th>
				<th>
				Contact
				</th>				
			</tr>
			<c:forEach items="${list}" var="service" varStatus="status">
				<tr>
					<td>
					${status.count }
					</td>					
					<td>
					${service.DateTime }
					</td>
					<td>
					${service.FirstName } ${service.LastName }
					</td>	
					<td>
					${service.FatherName }
					</td>	
					<td>
					${service.Gender }
					</td>	
					<td>
					${service.Contact }
					</td>	
				</tr>
			</c:forEach>	
		</table>
		
			</td>
		</tr>		
		</c:if>	
			<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					<font style="font-size: 18px; color: red;">Record not found for your search..</font>
				</td>
			</tr>			
			</c:if>
	</table>		
	</form>
</body>
</html>