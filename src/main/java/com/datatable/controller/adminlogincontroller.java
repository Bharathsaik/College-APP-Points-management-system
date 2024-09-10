package com.datatable.controller;

import java.io.IOException;

import com.datatable.dao.adminlogindao;
import com.datatable.data.adminlogindata;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class adminlogincontroller extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		adminlogindata aldata = new adminlogindata();
		
		aldata.setUsername(username);
		aldata.setPassword(password);
		
		adminlogindao aldao = new adminlogindao();
		
		if(aldao.check(aldata)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", aldata.getUsername());
			
			response.sendRedirect("admin.jsp");
			
		}
		else {
			response.sendRedirect("adminlogin.jsp");
		}
		
		
	}

}
