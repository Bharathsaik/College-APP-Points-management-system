<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Query Display</title>
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
        justify-content: space-between; /* Distributes space evenly */
        align-items: center;
        padding: 10px 20px; /* Padding for the navbar */
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        color: white; /* White text color */
    }

    /* Navigation title styling */
    .nav-title {
        font-weight: bold;
        font-size: 1.5em; /* Size for nav title */
    }

    /* Navigation links styling */
    .nav-links {
        display: flex;
        justify-content: flex-start; /* Aligns links at the start */
        gap: 15px; /* Space between elements */
        align-items: center; /* Aligns vertically */
    }

    .nav-links a, .nav-links form {
        text-decoration: none;
        color: white;
        padding: 10px; /* Padding for links and forms */
        font-size: 1em; /* Consistent font size */
    }

    .nav-links a:hover {
        color: #e0ebeb; /* Hover effect for links */
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
        z-index: 100; /* Ensures dropdown appears on top */
    }

    .dropdown form, .dropdown a {
        text-decoration: none;
        color: #333;
        padding: 10px;
        font-size: 1em; /* Consistent font size */
    }

    .dropdown a:hover, .dropdown form button:hover {
        background-color: #f0f0f0; /* Hover effect for dropdown links */
    }

    /* Table styling */
    table {
        width: 100%; /* Full width */
        border-collapse: collapse; /* No gaps in borders */
    }

    th, td {
        border: 1px solid #ddd; /* Border for cells */
        padding: 10px; /* Padding for cells */
        text-align: center; /* Centered text */
    }

    th {
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%); /* Gradient background */
        color: white; /* White text */
    }

    tr:nth-child(even) {
        background-color: #f2f2f2; /* Alternating row colors */
    }

    tr:hover {
        background-color: #ddd; /* Hover effect */
    }

    /* Responsive design adjustments */
    @media (max-width: 900px) {
        .nav-links {
            display: none; /* Hide nav links when screen is small */
        }

        .hamburger {
            display: flex; /* Show hamburger menu on small screens */
        }

        .dropdown {
            display: none; /* Hide dropdown initially */
        }
    }

    /* Extra space below navbar for heading */
    .content-heading {
        text-align: center;
        font-size: 1.8em; /* Font size for heading */
        padding: 15px 0; /* Padding above and below heading */
        color: #333; /* Dark text color */
    }

    </style>
    <script>
    function toggleDropdown() {
        const dropdown = document.getElementById("dropdownMenu");
        dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
    }
    </script>
</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if (session.getAttribute("username") == null) {
        response.sendRedirect("adminlogin.jsp");
    }
%>

<!-- Navigation Bar -->
<nav>
   <span class="nav-title">Narayana Engineering College</span>
   <div class="nav-links">
     <a href="studentacecheck.jsp">Events Participated</a>
     <a href="#">Get Student Queries</a>
     <a href="#">About</a>
     <form action="adminlogoutcontroller" method="post" style="margin: 0;"> <!-- Logout form -->
       <button style="background: none; border: none; padding: 10px; font-size: 1em; color: white;">Logout</button>
     </form>
   </div>
   <div class="hamburger" onclick="toggleDropdown()">
     <div></div>
     <div></div>
     <div></div>
   </div>
   <div class="dropdown" id="dropdownMenu"> 
     <a href="studentacecheck.jsp">Events Participated</a>
     <a href="query.jsp">Query</a>
     <a href="#">About</a>
     <form action="adminlogoutcontroller" method="post" style="margin: 0;">
       <button style="background: none; border: none; padding: 10px; font-size: 1em;">Logout</button>
     </form>
   </div>
</nav>

<!-- Heading for Students Queries -->
<div class="content-heading">
   Students Queries
</div>

<!-- Main Content -->
<c:choose>
    <c:when test="${empty studentquerydata}">
        <p>No records found</p> 
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Name</th>
                <th>Roll No</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Query</th>
            </tr>
            <c:forEach items="${studentquerydata}" var="sdata"> 
                <tr>
                    <td>${sdata.name}</td>
                    <td>${sdata.rollno}</td>
                    <td>${sdata.year}</td>
                    <td>${sdata.semester}</td>
                    <td>${sdata.query}</td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
