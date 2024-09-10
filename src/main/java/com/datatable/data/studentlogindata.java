package com.datatable.data;

public class studentlogindata {

	private String rollno;
	private String password;
	
	
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return "studentlogindata [rollno=" + rollno + ", password=" + password + "]";
	}

	
	
	
}
