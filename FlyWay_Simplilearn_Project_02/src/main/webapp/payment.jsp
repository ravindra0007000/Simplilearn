
<%@ page import="java.sql.*,javax.servlet.http.*" isELIgnored="false"   language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 style="background-color:#0054A4;color:white;text-align:center; height: 54px"> FlyWay Payment</h1>
	<form action="success.jsp" method="post">
		<table  align="center" style="margin-top:65px;margin-bottom:70px;width:52%;">
			<tr>
			
			<td style="width:80%;height:500px;background-color:#EFEFF0">
					<%
					String id=request.getParameter("flight");
					Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe") ;
			
					PreparedStatement ps=con.prepareStatement("SELECT FLIGHTNAME,DAY,DEPARTURE,PRICE FROM FLY_AVAILABLE_FLIGHTS WHERE ID=?");
					ps.setInt(1,(Integer.parseInt(request.getParameter("flight"))));
					ResultSet rs=ps.executeQuery();
					HttpSession sess=request.getSession(false);
			
					if(rs.next()){
						session.setAttribute("price", rs.getInt(4));
						
				 %>     
		 <table align="center" border="1" style="text-align:center;margin-bottom:150px;height:60px;width:70%"><tr><th>FLIGHT</th><th>DAY</th><th>DEPARTURE</th><th>PERSON</th><th>TOTAL PRICE</th></tr>
		 	<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=sess.getAttribute("persons") %></td><td><%=rs.getInt(4) %> &nbsp;*&nbsp;<%=sess.getAttribute("persons") %>&nbsp;=&nbsp;${(sessionScope.persons * sessionScope.price )}</td></tr>
		
		 </table>
		 
		 <input  type="submit" style="background-color:brown;color:white;margin-left:320px;margin-bottom:100px; width: 137px; height: 38px" value="Make Payment">
		 
		 <%} %><br>
			</td>
		</table>
	
	</form>
	<footer><header><center style="height: 130px; "><table style="width: 100%; background:#0054A4;"><tr><td style="text-align:center; color:white; height: 15px"><b>All Copy Rights Reserved 2022</b> </td></tr></table></center></header><br></footer>
</body>
</html>

