package com.datatable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.datatable.data.querydata;

public class querydao {
	
	public static void setdata(querydata data) {
		
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";

		String sql="insert into query (name,rollno,year,semester,query) values(?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, username, password);
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, data.getName());
			pst.setString(2, data.getRollno());
			pst.setString(3,data.getYear());
			pst.setString(4, data.getSemester());
			pst.setString(5, data.getQuery());
			pst.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
	}
	

}
