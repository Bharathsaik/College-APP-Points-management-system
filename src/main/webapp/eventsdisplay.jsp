<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.datatable.dao.datatabledao" %> 
<%@ page import="com.datatable.data.data" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Events Display</title>
<style>
/* General styling */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

/* Navigation bar styling */
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
  color: white;
}

/* Navigation bar title styling */
.nav-title {
  font-weight: bold;
  font-size: 1.5em;
}

/* Navigation links styling */
.nav-links {
  display: flex;
  justify-content: space-evenly; /* Adjusted to evenly distribute links */
  width: 40%; /* Reduced width to pull links closer together */
}

.nav-links a {
  text-decoration: none;
  color: white;
  padding: 10px;
  font-size: 1em;
}

.nav-links a:hover {
  color: #e0ebeb;
}

/* Hamburger menu styling */
.hamburger {
  display: none;
  flex-direction: column;
  cursor: pointer;
}

.hamburger div {
  background-color: white;
  height: 3px;
  width: 25px;
  margin: 4px 0;
}

/* Dropdown menu styling */
.dropdown {
  display: none;
  position: absolute;
  top: 50px;
  right: 20px;
  background-color: white;
  color: #333;
  border: 1px solid #ddd;
  padding: 10px;
  z-index: 100;
}

.dropdown a {
  text-decoration: none;
  color: #333;
  padding: 10px;
  display: block;
}

.dropdown a:hover {
  background-color: #f0f0f0;
}

/* Table styling */
.secondpart table {
  width: 100%; 
  border-collapse: collapse; 
}

.secondpart th, .secondpart td {
  border: 1px solid #ddd; 
  padding: 10px; 
  text-align: center; 
}

.secondpart th {
  background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
  color: white;
}

.secondpart tr:nth-child(even) {
  background-color: #e0e0e0; 
}

@media (max-width: 900px) {
  .nav-links {
    display: none;
  }

  .hamburger {
    display: flex;
  }

  .dropdown {
    display: none; 
  }

  /* Adjust position of logout button */
  .logout {
    margin-top: 20px; 
  }
}

/* Main container */
.container {
  display: flex; 
  justify-content: space-between; 
}

/* Firstpart */
.firstpart {
  flex: 1;
  max-width: 25%; 
  padding: 20px; 
  background-color: #f0f0f0; 
  display: flex; 
  flex-direction: column; 
  align-items: center; 
}

/* Image styling */
.image img {
  width: 150px; 
  height: 150px; 
  border-radius: 50%; 
  object-fit: cover; 
  margin-bottom: 15px;
}

/* Details */
.sdetails {
  font-size: 18px; 
  font-family: 'Comic Sans MS', cursive; 
  text-align: center; 
  margin-bottom: 20px;
}

/* Logout */
.logout {
  margin-top: 20px; 
}

.logout button {
  background-color: red; 
  color: white; 
  border: none; 
  padding: 10px 20px; 
  cursor: pointer; 
  transition: background-color 0.3s ease; 
}

.logout button:hover {
  background-color: darkred; 
}

/* Secondpart */
.secondpart {
  flex: 3; 
  padding: 20px; 
}

/* Secondpart heading */
.secondpart h1 {
  font-family: Algerian; 
  font-size: 30px; 
  color: #333; 
  text-align: center; 
}

</style>

<script>
  /* Toggle dropdown when hamburger is clicked */
  function toggleDropdown() {
    const dropdown = document.getElementById("dropdownMenu");
    const isDropdownVisible = dropdown.style.display === 'block';
    dropdown.style.display = isDropdownVisible ? 'none' : 'block';
  }
</script>
</head>
<body>

<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");
   
   if(session.getAttribute("rollno") == null) {
   	response.sendRedirect("studentloginandsignup.jsp");
   }
%>

<!-- Navigation Bar -->
<nav>
   <span class="nav-title">Narayana Engineering College</span>
   <div class="nav-links">
     <a href="studentacecheck.jsp">Events Participated</a>
     <a href="query.jsp">Query</a>
     <a href="#">About</a>
     <a href="#">Help</a>
   </div>
   <div class="hamburger" onclick="toggleDropdown()">
     <div></div>
     <div></div>
     <div></div>
   </div>
   <div class="dropdown" id="dropdownMenu">
     <a href="studentacecheck.jsp">Events Participated</a>
     <a href="#">Query</a>
     <a href="#">About</a>
     <a href="#">Help</a>
   </div>
</nav>

<!-- Main Content -->
<div class="container"> 
  <div class="firstpart">
    <c:choose>
      <c:when test="${empty studentdata}">
          <p>No records found for the given rollno</p> 
      </c:when>
      <c:otherwise>
          <c:set var="firstStudent" value="${studentdata[0]}" /> 
      <%
      HttpSession httpsession = request.getSession();
      String rollno=(String)httpsession.getAttribute("rollno");
      String source= datatabledao.getimage(rollno,httpsession);
      %>
        <div class="image">
          <img src="<%=source %>" alt="studentimage">
        </div>
        <div class="sdetails">
          <%-- <c:set var="firstStudent" value="${studentdata[0]}" /> --%>
          <p>Name: <c:out value="${firstStudent.name}" /></p> 
          <p>Roll No: <c:out value="${firstStudent.rollno}" /></p>
          <p>Department: <c:out value="${firstStudent.program}" /></p>
          <p>Year: <c:out value="${firstStudent.year}" /></p>
          <p>Semester: <c:out value="${firstStudent.semester}" /></p>
        </div>
        <div class="logout">
          <form action="studentlogoutcontroller" method="post">
            <button>Log out</button>
          </form>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
  
  <div class="secondpart">
    <h1>Ace Activities Participated Events</h1>
    <c:choose>
      <c:when test="${empty studentdata}">
        <p>No records found for the given rollno</p> 
      </c:when>
      <c:otherwise>
        <table>
          <tr>
            <th>Cno</th>
           <th>Program</th>
           <th>Year</th>
           <th>Semester</th>
           <th>Event</th>
           <th>Under</th>
           <th>Date</th>
           <th>Academicyear</th>
           <th>Participation/Win</th>
           <th>Points</th>
          </tr>
          <c:forEach items="${studentdata}" var="sdata"> 
            <tr>
              <td>${sdata.cno}</td>
              <td>${sdata.program}</td>
              <td>${sdata.year}</td>
              <td>${sdata.semester}</td>
              <td>${sdata.event}</td>
              <td>${sdata.under}</td>
              <td>${sdata.date}</td>
              <td>${sdata.academicyear}</td>
              <td>${sdata.participationwin}</td>
              <td>${sdata.points}</td>
            </tr>
          </c:forEach>
        </table>
      </c:otherwise>
    </c:choose>
  </div>
</div>

</body>
</html>