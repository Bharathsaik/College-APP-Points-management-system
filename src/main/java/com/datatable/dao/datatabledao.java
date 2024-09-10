package com.datatable.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.datatable.data.data;

import jakarta.servlet.http.HttpSession;

public class datatabledao {
	
	public static List<data> getdatafrombd(String rollno) throws SQLException{
		
		
//		String username="postgres";   //for postgresql
//		String url="jdbc:postgresql://localhost:5432/studentevents";   //for postgresql
//		String password="1204";       //for postgresql
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";
//		String sql="select * from event where rollno=?";      //for postgresql
		String sql="select * from app where rollno=?";
		ArrayList<data> studentinfo = new ArrayList<>();
		
		try {
			//Class.forName("org.postgresql.Driver");       //for postgresql
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url, username, password);
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, rollno);//--------------------------------------------------------------------
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				String cno=rs.getString("cno");
				String name=rs.getString("name");
				String studentrollno=rs.getString("rollno");
				String program=rs.getString("program");
				String year=rs.getString("year");
				String semester=rs.getString("semester");
				String event=rs.getString("event");
				String under=rs.getString("under");
				String date=rs.getString("date");
				String academicyear=rs.getString("academicyear");
				String participation=rs.getString("participationwin");
				int points=rs.getInt("points");
				data studentdata=new data(cno,name,studentrollno,program,year,semester,event,under,date,academicyear,participation,points);
				studentinfo.add(studentdata);
 			}

		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
		return studentinfo;
		
	}
	public static String getimage(String rollno,HttpSession session) {
		String username="root";
		String url="jdbc:mysql://localhost:3306/app_db";
		String password="";
		
		String sql="select * from studentimages where rollno=?";
		
		String enteredrollno = (String)session.getAttribute("enteredrollno");
		
		System.out.println(rollno+" "+enteredrollno);
		
		if(rollno.equals(enteredrollno)) {
				try {
					//Class.forName("org.postgresql.Driver");       //for postgresql
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection(url, username, password);
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setString(1, rollno);//--------------------------------------------------------------------
					ResultSet rs=pst.executeQuery();
					if(rs.next()) {
						String srcofstudentimage=rs.getString("imagesrc");
						return srcofstudentimage;
					}
				
				}
				catch(Exception e) {
					System.out.println("Exception : "+e);
				}
		}
		
		return "images/studentimage.jpg";
	}

}
