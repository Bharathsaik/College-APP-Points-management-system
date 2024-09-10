package com.datatable.data;

public class querydata {
    
	private String name;
	private String rollno;
	private String year;
	private String semester;
	private String query;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}

	@Override
	public String toString() {
		return "querydata [name=" + name + ", rollno=" + rollno + ", year=" + year + ", semester=" + semester
				+ ", query=" + query + "]";
	}
	
}
