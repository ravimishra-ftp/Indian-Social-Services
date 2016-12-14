<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="style/style.css" rel="stylesheet" type="text/css" />
	<body>
		<form>
		<table width="100%">
		<tr>
			<td align="right">
			<a href="Template/home.jsp">Home</a>&nbsp;||
			<a href="${path }">Back</a>&nbsp;||
			<input type="button" value="Print Report" onClick="window.print()"> 
			<%--<a href="javascript:window.print()"><img src="../images/print.jpg"></a>--%>		
			</td>
		</tr>
		<tr>
			<td align="center">
			<font style="font-size: 24px; font-style:inherit">Service Wise Report</font>
			<hr>
			</td>			
		</tr>
		<c:if test="${ not empty service}">
		<tr>
			<td>
			<table border="1" width="100%">				
				<tr>
					<th>
					SN
					</th>
					<th>
					Panchayat
					</th>
					<th>
					Village
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
			<c:forEach items="${service}" var="panch" varStatus="sn">
				<tr>
				
				<td>
					${sn.count }
				</td>
				<td>
					${panch.PanchayatName }
				</td>
				<td>
					${panch.VillageName }
				</td>
				<td>
					${panch.DateTime }
				</td>
				<td>
					${panch.FirstName }&nbsp;${panch.LastName }
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
			<c:if test="${empty service}">
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