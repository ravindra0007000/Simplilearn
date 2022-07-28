package com.nt.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/search")
public class search_servlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		HttpSession session=req.getSession();
		String date=req.getParameter("date");
		
		String source=req.getParameter("source");
		String destination=req.getParameter("destination");
		int persons=Integer.parseInt(req.getParameter("persons"));
		session.setAttribute("persons", persons);
		SimpleDateFormat sdf=new SimpleDateFormat("yyy-MM-dd");
		Date receiveddate=null;
		try {
			receiveddate = sdf.parse(date);
			req.setAttribute("day", receiveddate.getDay());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date todaysdate=new Date();
		if(!(todaysdate.getYear()==receiveddate.getYear() && todaysdate.getMonth()<=receiveddate.getMonth() && receiveddate.getDate()>=todaysdate.getDate())) {
			
			pw.print("<h2 style='color:red'>Invalid date , Try again</h2>");
			RequestDispatcher rd=req.getRequestDispatcher("search_page_01.jsp");
			rd.include(req, res);
		}
		else {
			
			if(source.equals(destination)) {
				
				pw.print("<h2 style='color:red'>Source and Destination can not be same, Try again</h2>");
				RequestDispatcher rd=req.getRequestDispatcher("search_page_01.jsp");
				rd.include(req, res);
				
			}
			else {
				
				RequestDispatcher rd=req.getRequestDispatcher("search_results.jsp");
				rd.include(req, res);
			}
				
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req,res);
	}

}
