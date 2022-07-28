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

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		HttpSession session1=req.getSession(false);
		System.out.println(session1);
		if(session1.getAttribute("name")!=null) {
			session1.setAttribute("name", null);
			session1.invalidate();
		
			pw.print("<h3 style='color:red'> Logout Succesfully !!!<h3>");
			
		} else {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setDateHeader("Expires", 0);
		
			 pw.print("<h3 style='color:red'> Please Login First !!!<h3>");
		}
		
		RequestDispatcher rd=req.getRequestDispatcher("/main.jsp");
		rd.include(req, response);
		
		
		
	}
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doPost(req, resp);
	}
	
	


}
