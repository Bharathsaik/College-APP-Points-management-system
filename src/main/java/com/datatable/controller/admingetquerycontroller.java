package com.datatable.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.datatable.dao.admingetquerydao;
import com.datatable.data.admingetquerydata;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class admingetquerycontroller extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			ArrayList<admingetquerydata> querydata=admingetquerydao.getdata();
			
			HttpSession session = request.getSession();
			session.setAttribute("studentquerydata", querydata);
			
			response.sendRedirect("querydisplay.jsp");
		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
		
	}

}
