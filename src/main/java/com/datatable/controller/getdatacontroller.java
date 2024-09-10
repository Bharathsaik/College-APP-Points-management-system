package com.datatable.controller;

import java.io.IOException;

import java.util.List;

import com.datatable.dao.datatabledao;
import com.datatable.data.data;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class getdatacontroller extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rollno=request.getParameter("rollno");
		

		try {
			List<data> studentdataaccrollno = datatabledao.getdatafrombd(rollno);
			
//			request.setAttribute("studentdata", studentdataaccrollno);
			HttpSession session = request.getSession();
			session.setAttribute("studentdata", studentdataaccrollno);
			session.setAttribute("enteredrollno", rollno);//for image purpose
			
			
			response.sendRedirect("eventsdisplay.jsp");
			
//			RequestDispatcher rd = request.getRequestDispatcher("eventsdisplay.jsp");
//			rd.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("Exception : "+e);
		}
		
	}

}
