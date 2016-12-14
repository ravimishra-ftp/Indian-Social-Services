<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.lara.client.common.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%><html>
<head>
</head>
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
		$('#fromDate').datepick({dateFormat:'dd/mm/yy'});
		$('#toDate').datepick({dateFormat:'dd/mm/yy'});
	}
</script>
<style type="text/css">
  table tr td, table tr th{
  	padding:0px;
  	margin:0px;
  }
</style>
<body>
	<form action="../villageWiseReport.do">
	<%
		ArrayList list = new ArrayList();
		HashMap map = null;

			DB db = new DB();
			Statement stmt = null;
			Connection con  = db.getConnection();
			ResultSet rs=null;
			try
			{
				String sql="";
				stmt = con.createStatement();
				
				 sql = "select villageId, villageName from village";  
				 rs = stmt.executeQuery(sql);	
				while(rs.next())
	   			{
					map = new HashMap();
					map.put("id",rs.getInt("villageId"));
					map.put("name",rs.getString("villageName"));
					list.add(map);
	   			}	
				request.setAttribute("village",list);
			}
			catch(SQLException e)
			{
				
			}		
	%>	
	<%	SimpleDateFormat frmt = new SimpleDateFormat("dd/MM/yyyy");
	Date currentDate = new Date();
	String strDate = frmt.format(currentDate);
	%>
		<table width="700px" align="center">
				<tr>
					<td align="right">
					<a href="../Template/home.jsp">Home</a>
					</td>
				</tr>
				<tr>
					<td align="center">
						<font style="font-size: 24px; font-style:inherit">Village Wise Report</font>
					<hr/>
						<table align="center">
				<tr>
					<td>
				From
				</td>
				<td>
				:
				</td>
				<td>
				<input type="text" id="fromDate" value="" name="from""/>
				</td>
				<td>
				
				</td>
				<td>
				To
				</td>
				<td>
				:
				</td>
				<td>
				<input type="text" id="toDate" name="to" value="">
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
					<select name="name" style="width: 145px">
					<option value="0">--Select--</option>
						<c:forEach items="${village}" var="student">
						<option value="${student.id }">${student.name }</option>
						</c:forEach>
						</select>
				</td>
				<td>
				
				</td>
				<td class="form_settings" colspan="3" align="right">
						<input class="submit" type="submit" value="Search"/>
					</td>
			</tr>			
		</table>
		</td>
				</tr>
			</table>
	</form>
</body>
</html>