<%@ page import="java.sql.*,javax.servlet.http.*" isELIgnored="false"   language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
	
<body>
<script>
    function preventBack() {
        window.history.forward();
    }

    setTimeout("preventBack()", 0);
    window.onunload = function() {
        null
    };
</script>
<header><center style="height: 74px; "><table style="color:white;width: 100%; background:#0054A4;; height: 65px"><tr><td style="font-size:200%;text-align:center; height: 38px"><b>FlyWay Ticket Booking</b> </td></tr></table></center></header>
	<table style="width: 100%"><tr><td style="height:600px"><img src="images/plantrip.jpg" style="width: 100%; height:100%"></td>
	
	<td style="width:60%;background-color:yellow;height: 590px;"> 
	<h2 style="text-align:center;"><b>Admistrator Login Page</b> </h2>
	<form action="loginservlet" method="post">
		<table align="center" style="height:200px">
			<tr><td><b>Email</b></td><td style="width: 178px; "><input type="email" name="email"required ></td></tr>
			<tr><td><b>Password</b></td><td><input type="password" name="password" required></td></tr>
			<tr style="height: 20px; "><br><br></tr>
			<tr><td align="center" colspan="2";><input type="submit" value="Login" style="width: 80px; height: 28px"></td></tr>
		</table>
	</form>	
	</td></tr></table><br>
	
<footer><header><center style="height: 130px; "><table style="color:white;width: 100%; background:#0054A4;;"><tr><td style="text-align:center; height: 15px"><b>All Copy Rights Reserved 2022</b> </td></tr></table></center></header><br></footer>
</body>

</html>