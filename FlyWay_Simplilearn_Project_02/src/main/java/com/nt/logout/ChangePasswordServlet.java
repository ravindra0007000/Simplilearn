package com.nt.logout;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changepassword")
public class ChangePasswordServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		HttpSession session1=req.getSession(false);
		if(session1!=null) {
		
		String Pass1=req.getParameter("pass1");
		String Pass2=req.getParameter("pass2");
		if(!(Pass1.equals(Pass2))) {
			pw.print("<h3 style='color:red'>Password Does Not Match , Try Again !!!</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("/changepassword.jsp");
			rd.include(req, res);
		}else {
				
					try {
							
							Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","xe","xe") ;
							PreparedStatement ps=con.prepareStatement("UPDATE FLYWAY_ADMIN_LOGIN SET PASSWORD=? where SNO=101");
							ps.setString(1,Pass1);
							int rs=ps.executeUpdate();
							pw.print("<h3 style='color:red'>Password Changed Succesfully,Login to Continue!!!</h3>");
							RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
							rd.include(req, res);
						
			         }//else
					catch(Exception e) {
						e.printStackTrace();
						}
			}
		}
		else {
			res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			res.setDateHeader("Expires", 0);
			res.setDateHeader("Expires", 0);
			pw.print("<h3 style='color:red'>Please Login First !!!</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
			rd.include(req, res);
			
		}
	}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doPost(req, resp);
	}
	
	


}
