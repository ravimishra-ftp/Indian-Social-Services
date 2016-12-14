<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="style/style.css" rel="stylesheet" type="text/css" />
	<body>
		<form>
		<table width="800px">
		<tr>
			<td align="right">
			<a href="Template/home.jsp">Home</a>&nbsp;||
			<a href="${path }">Back</a>&nbsp;||
			<input type="button" value="Print Report" onClick="window.print()"> 		
			</td>
		</tr>
		<tr>
			<td align="center">
			<font style="font-size: 24px; font-style:inherit">Village Wise Report</font>
			<hr>
			</td>			
		</tr>
		<c:if test="${ not empty village}">
		<tr>
			<td>
			<table border="1" width="800px">				
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
					Gender
					</th>
					<th>
					Age
					</th>
					<th>
						Father
					</th>
					<th>
						Contact No
					</th>
				</tr>
			<c:forEach items="${village}" var="panch" varStatus="sn">
				<tr>
				
				<td>
					${sn.count }
				</td>
				<td>
					${panch.DateTime }
				</td>
				<td>
					${panch.FirstName } &nbsp; ${panch.LastName }
				</td>
				<td>
					${panch.Gender }
				</td>
				<td>
					${panch.Age }
				</td>
				<td>
					${panch.FatherName }
				</td>
				<td>
					${panch.Contact }
				</td>
								
			</tr>
		</c:forEach>	
			</table>
			
			
			</td>
		</tr>		
		</c:if>	
			<c:if test="${empty village}">
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