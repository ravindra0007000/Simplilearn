<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 style="background-color:#0054A4;color:white;text-align:center; height: 54px"> FlyWay Flight Booker Registration Form</h1>
	
		<table  align="center" style="width:52%;">
			<tr><td style="width:50%;height:500px;background-color:#EFEFF0">
			<% int ids=Integer.parseInt(request.getParameter("id"));

				%>
			<form action="payment.jsp"  method="GET" >
			<div style= "margin-bottom:90px;margin-left:50px;">
			
				<input type="hidden" name="flight" value=<%=ids%>>
				<span >First Name</span><br>
					<input  type="text" required><br><br>
					<span >Last Name</span><br>
					<input  type="text" required><br><br>
					<span>Mobile</span><br>
					<input  type="tel" required><br><br>
					<span>Email</span><br>
					<input  type="email" required><br><br>
					<span >Address</span><br>
					<input type="text" required style="width: 159px; "><br><br>
				
				<span  >Number of Bags</span><br>
				<input type="number" min="0" max="3" required><br><br><br>
				<input type="reset" border="0" style="color:white;background-color:grey;width: 85px; height: 30px; "/><input type="submit" border="0"style= "color:white;background-color:grey;margin-left:20px; width: 85px; height: 30px" value="Register"/>
			
				
			</div>
			</form>
			</td> <td style="width:50%"><img style="width:90%;height:550px"src="images/Airlines.jpg"></td>></tr>
		</table>
	
	</form><br><br>
	<footer><header><center style="height: 130px; "><table style="width: 100%; background:#0054A4;"><tr><td style="text-align:center; color:white; height: 15px"><b>All Copy Rights Reserved 2022</b> </td></tr></table></center></header><br></footer>
</body>
</html>