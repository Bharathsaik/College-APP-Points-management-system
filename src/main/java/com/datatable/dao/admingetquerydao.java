package com.datatable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.datatable.data.admingetquerydata;
import com.datatable.data.data;

public class admingetquerydao {
	
	public static ArrayList<admingetquerydata> getdata() {
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";

		String sql="select * from query";
		
		ArrayList<admingetquerydata> studentinfo = new ArrayList<>();
		
		try {
			//Class.forName("org.postgresql.Driver");       //for postgresql
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, username, password);
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				String name=rs.getString("name");
				String studentrollno=rs.getString("rollno");
				String year=rs.getString("year");
				String semester=rs.getString("semester");
				String query=rs.getString("query");
				admingetquerydata studentdata=new admingetquerydata(name,studentrollno,year,semester,query);
				studentinfo.add(studentdata);
 			}

		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
		return studentinfo;
		
	}

}
