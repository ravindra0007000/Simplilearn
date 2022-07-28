package com.nt.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/loginservlet")
public class login_servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		res.setDateHeader("Expires", 0);
		
		String DB_Email=null;
		String DB_Password=null;
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		String Email=req.getParameter("email");
		String Password=req.getParameter("password");
		try {
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe") ;
			PreparedStatement ps=con.prepareStatement("SELECT EMAIL,PASSWORD FROM FLYWAY_ADMIN_LOGIN where SNO=101");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				DB_Email=rs.getString(1);
				DB_Password=rs.getString(2);
			}
			
			if(DB_Email.equals(Email)&& DB_Password.equals(Password)) {
				HttpSession session1=req.getSession(true);
				session1.setAttribute("name", "admin");
				RequestDispatcher rd=req.getRequestDispatcher("/changepassword.jsp");
				rd.forward(req, res);
			}
			else {
				pw.print("<h3 style='color:red'>Invalid Username Or Password!!!</h3>");
				RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
				rd.include(req, res);
			}//else
     }
	catch(Exception e) {
		e.printStackTrace();
		}
		
	}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doPost(req, resp);
	}
}
