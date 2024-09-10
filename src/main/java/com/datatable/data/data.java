package com.datatable.data;

public class data {
	private String cno;
	private String name;
	private String rollno;
	private String program;
	private String year;
	private String semester;
	private String event;
	private String under;
	private String date;
	private String academicyear;
	private String participationwin;
	private int points;
	
	public data(String cno, String name, String rollno, String program, String year, String semester, String event,
			String under, String date, String academicyear, String participationwin, int points) {
		this.cno = cno;
		this.name = name;
		this.rollno = rollno;
		this.program = program;
		this.year = year;
		this.semester = semester;
		this.event = event;
		this.under = under;
		this.date = date;
		this.academicyear = academicyear;
		this.participationwin = participationwin;
		this.points = points;
	}
	
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
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
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
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
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getUnder() {
		return under;
	}
	public void setUnder(String under) {
		this.under = under;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAcademicyear() {
		return academicyear;
	}
	public void setAcademicyear(String academicyear) {
		this.academicyear = academicyear;
	}
	public String getParticipationwin() {
		return participationwin;
	}
	public void setParticipationwin(String participationwin) {
		this.participationwin = participationwin;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	
	
	@Override
	public String toString() {
		return "data [cno=" + cno + ", name=" + name + ", rollno=" + rollno + ", program=" + program + ", year=" + year
				+ ", semester=" + semester + ", event=" + event + ", under=" + under + ", date=" + date
				+ ", academicyear=" + academicyear + ", participationwin=" + participationwin + ", points=" + points
				+ "]";
	}
	

}
