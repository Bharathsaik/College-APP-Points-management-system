package com.datatable.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
	    maxFileSize = 1024 * 1024 * 50,       // 50 MB
	    maxRequestSize = 1024 * 1024 * 100    // 100 MB
	)
	public class admincontroller extends HttpServlet {

	    private Connection getConnection() throws SQLException, ClassNotFoundException {
	        // Load the JDBC driver
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // Configure JDBC connection string, user, and password
	        String jdbcUrl = "jdbc:mysql://localhost:3306/app_db"; // database name
	        String jdbcUser = "root"; // user
	        String jdbcPassword = ""; // password

	        return DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	        Part filePart = request.getPart("csvFile"); // Get the uploaded CSV file

	        if (filePart != null) {
	            // Read the CSV file content
	            try (BufferedReader br = new BufferedReader(new InputStreamReader(filePart.getInputStream()))) {
	                String line;
	                List<String[]> csvData = new ArrayList<>();

	                // Read each line from the CSV and split by commas
	                while ((line = br.readLine()) != null) {
	                    csvData.add(line.split(",")); // Adjust if needed
	                }

	                // Insert CSV data into the database
	                try (Connection connection = getConnection()) {
	                    String insertQuery = "INSERT INTO demo (cno, name, rollno, program, year, semester, event, under, date, academicyear, participationwin, points) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	                    PreparedStatement pstmt = connection.prepareStatement(insertQuery);

	                    // Loop through CSV data and insert into the database
	                    for (String[] row : csvData) {
	                        for (int i = 0; i < row.length; i++) {
	                            pstmt.setString(i + 1, row[i].trim()); // Trim whitespace
	                        }
	                        pstmt.executeUpdate(); // Insert row into the database
	                    }
//	                    HttpSession session = request.getSession();
//	                    session.setAttribute("uploadstatus", 1);
	                    response.sendRedirect("admin.jsp?uploadStatus=success");
	                } catch (Exception ex) {
//	                	HttpSession session = request.getSession();
//	                	session.setAttribute("uploadstatus", 0);
	                	response.sendRedirect("admin.jsp?uploadStatus=failure");
	                } 
	            }
	        } else {
	        	response.sendRedirect("admin.jsp?uploadStatus=failure");
	        }
	    }
	}