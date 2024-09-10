package com.datatable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.datatable.data.adminlogindata;

public class adminlogindao {

	public boolean check(adminlogindata aldata) {
			
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";
		
		String sql = "select * from admin where username=? and password=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, aldata.getUsername());
			pst.setString(2, aldata.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			
		}
		catch(Exception e) {
			System.out.println("Exception : " + e);
		}
		
		return false;
	}

}
