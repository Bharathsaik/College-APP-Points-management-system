package com.datatable.controller;

import java.io.IOException;

import com.datatable.dao.studentlogindao;
import com.datatable.data.studentlogindata;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class studentlogincontroller extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rollno=request.getParameter("rollno");
		String password=request.getParameter("password");
		
		studentlogindata sldata = new studentlogindata();
		
		sldata.setRollno(rollno);
		sldata.setPassword(password);
		
		studentlogindao sldao = new studentlogindao();
		
		if(sldao.check(sldata)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("rollno", sldata.getRollno()); //or rollno
			
			response.sendRedirect("studentacecheck.jsp");
			
		}
		else {
			response.sendRedirect("studentloginandsignup.jsp");
		}
		
	}

}
