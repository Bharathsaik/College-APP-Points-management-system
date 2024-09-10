package com.datatable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.datatable.data.studentlogindata;

public class studentlogindao {

	public boolean check(studentlogindata sldata) {
		
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";
		
		String sql = "select * from studentlogin where rollno=? and password=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sldata.getRollno());
			pst.setString(2, sldata.getPassword());
			
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
