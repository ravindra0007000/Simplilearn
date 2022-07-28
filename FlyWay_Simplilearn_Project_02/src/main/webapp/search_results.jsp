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
	<table style="text-align:center ;width: 100%"><tr><td style="height:600px"><img src="images/plantrip.jpg" style="width: 100%; height:100%"></td>
	
	<td style="width:60%;background-color:#f4feff;height: 590px;"> 
	<h2 style="text-align:center;font-size:20px"><b>Available Flight's Choose to Book</b> </h2>
	<div style="margin-bottom:400px"><table align="center" border="2" style="height:170px;padding:2px;width:90%;">
		<tr style="background-color:orange;color:black"><th>Flight NAME</th><th>DAY</th><th>DEPARTURE TIME</th><th>PRICE</th></tr>
		<%Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe") ;
			
			PreparedStatement ps=con.prepareStatement("SELECT FLIGHTNAME,DAY,DEPARTURE,PRICE,ID FROM FLY_AVAILABLE_FLIGHTS WHERE DAYS=?");
			ps.setInt(1, (Integer)request.getAttribute("day"));
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				String url="registration.jsp?id="+rs.getInt(5);
		 %>     
				<tr style="background-color:#FFF176" >
					<td><a href=<%=url%>><%=rs.getString(1) %></a></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getInt(4) %></td>
				</tr>
				
		 <%} %>
	</table></div>
	</td></tr></table>
<footer><header><center style="height: 130px; "><table style="width: 100%; background:#0054A4;"><tr><td style="text-align:center; color:white; height: 15px"><b>All Copy Rights Reserved 2022</b> </td></tr></table></center></header><br></footer>
</body>

</html>