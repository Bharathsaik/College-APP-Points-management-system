package com.datatable.controller;

import java.io.IOException;

import com.datatable.dao.querydao;
import com.datatable.data.querydata;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class querycontroller extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			String rollno=request.getParameter("rollno");
			String year=request.getParameter("year");
			String sem=request.getParameter("semester");
			String query=request.getParameter("query");
			
			querydata data = new querydata();
			data.setName(name);
			data.setRollno(rollno);
			data.setYear(year);
			data.setSemester(sem);
			data.setQuery(query);
			
			querydao.setdata(data);
			response.sendRedirect("query.jsp");
		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
		
	}

}
