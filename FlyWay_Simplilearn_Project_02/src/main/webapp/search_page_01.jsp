<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<header><center style="height: 74px; "><table style="width: 100%; background:#0054A4; height: 65px"><tr><td style="font-size:200%;text-align:center;color:white; height: 38px"><b>FlyWay Ticket Booking</b> </td></tr></table></center></header>
	<table style="width: 100%"><tr><td style="height:600px"><img src="images/plantrip.jpg" style="width: 100%; height:100%"></td>
	
	<td style="width:60%;background-color:#f4feff;height: 590px;"> 
	<h2 style="margin-left:280px;"><b>Search Upcoming Flight's </b> </h2>
	<form action="search" method="post">
		<div style="margin-bottom:150px"><table align="center" style="height:200px">
			<tr><td><b>Date of Travel</b></td><td style="width: 178px; "><input type="date" name="date" required></td></tr>
			<tr><td><b>Source</b></td><td style="width: 178px; ">
				<select id="source" name="source" required>
				 <option value="">--Select--</option>
				 <%Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe") ;
				 	PreparedStatement ps=con.prepareStatement("SELECT SOURCE FROM FLY_SOURCE");
				 	ResultSet rs=ps.executeQuery();
				 	while(rs.next()){
				 %>
				  <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
				  <%} %>
				</select>
			</td></tr>
			<tr><td><b>Destination</b></td><td style="width: 178px; ">
			<select id="destination" name="destination" required>
			<option value="">--Select--</option>
			<% PreparedStatement ps2=con.prepareStatement("SELECT DESTINATION FROM FLY_DESTINATION");
				 	ResultSet rs2=ps2.executeQuery();
				 	while(rs2.next()){
				 %>
				  <option value=<%=rs2.getString(1)%>><%=rs2.getString(1)%></option>
				  <%} %>
				
			</select>
			</td></tr>
			<tr><td><b>No. of person</b></td><td style="width: 178px; "><input type="number"  name="persons" min="1" max="5" required></td></tr>
			<tr style="height: 20px; "><br><br></tr>
			<tr><td align="center" colspan="2";><input type="submit" value="Search" style="width: 80px; height: 28px"></td></tr>
		</table></div>
	</form>	
	</td></tr></table>
	
<footer><header><center style="height: 130px; "><table style="width: 100%; background:#0054A4;"><tr><td style="text-align:center; color:white; height: 15px"><b>All Copy Rights Reserved 2022</b> </td></tr></table></center></header><br></footer>
</body>

</html>