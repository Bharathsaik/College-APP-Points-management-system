<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Student Dashboard</title>
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
        justify-content: space-evenly;
        width: 40%; /* Adjusted width */
    }

    .nav-links a {
        text-decoration: none;
        color: white;
        padding: 10px;
        font-size: 1em; /* Consistent font size for nav links */
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

    .dropdown a {
        text-decoration: none;
        color: #333;
        padding: 10px;
        display: block;
        font-size: 1em; /* Consistent font size */
    }

    .dropdown a:hover {
        background-color: #f0f0f0; /* Hover effect for dropdown links */
    }

    /* Images styling */
    .images {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    .images img {
        margin-right: 20px; /* Adds space between images */
    }

    /* Main section styling */
    .main {
        text-align: center;
        margin-top: 20px; /* Space between navbar and main content */
    }

    .main input {
        border: 1px solid #ddd;
        padding: 10px;
        width: 200px;
        border-radius: 5px;
        transition: all 0.3s ease; /* Smooth hover effect */
    }

    .main input:hover {
        border-color: #30cfd0; /* Hover effect */
    }

    .main button {
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .main button:hover {
        background-image: linear-gradient(to top, #330867 0%, #30cfd0 100%);
    }

    /* Table styling */
    .table {
        width: 60%; /* Adjusted table width */
        border-collapse: collapse; /* No gaps in borders */
        margin: 20px auto; /* Center the table */
        border: 1px solid #ddd; /* Border for the table */
    }

    .table th, .table td {
        padding: 10px; /* Padding for cells */
        text-align: center; /* Centered text */
    }

    .table th {
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%); /* Gradient background */
        color: white; /* White text */
    }

    .table tr:nth-child(even) {
        background-color: #f2f2f2; /* Alternating row colors */
    }

    .table tr:hover {
        background-color: #ddd; /* Hover effect */
    }

    .table .available {
        color: green; /* Green color for available status */
    }

    .table .unavailable {
        color: red; /* Red color for unavailable status */
    }

    /* Heading styling */
    .table-heading {
        text-align: center;
        font-size: 1.5em; /* Font size for table heading */
        padding: 10px 0; /* Padding for heading */
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

        .images {
            flex-direction: column; /* Stack images vertically */
        }

        .images img {
            margin-right: 0;
            margin-bottom: 20px; /* Adjusts spacing between images */
        }

        .main {
            margin-top: 10px; /* Adjusts margin for responsive design */
        }

        .table {
            width: 90%; /* Adjusted table width for smaller screens */
        }
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
    
    if (session.getAttribute("rollno") == null) {
        response.sendRedirect("studentloginandsignup.jsp");
    }
%>

<nav>
    <span class="nav-title">Narayana Engineering College</span>
    <div class="nav-links">
        <a href="#">Events Participated</a>
        <a href="query.jsp">Query</a>
        <a href="#">About</a>
        <form action="studentlogoutcontroller" method="post" style="margin: 0;"> <!-- Logout form -->
            <button type="submit" style="background: none; border: none; padding: 10px; font-size: 1em; color: white; text-align: left;">Logout</button>
        </form>
    </div>
    <div class="hamburger" onclick="toggleDropdown()">
        <div></div>
        <div></div>
        <div></div>
    </div>
</nav>

<div class="dropdown" id="dropdownMenu">
    <a href="#">Events Participated</a>
    <a href="query.jsp">Query</a>
    <a href="#">About</a>
    <form action="studentlogoutcontroller" method="post" style="margin: 0;">
        <button type="submit" style="background: none; border: none; padding: 10px; font-size: 1em; text-align: left;">Logout</button>
    </form>
</div>

<div class="images">
    <img src="images/narayana.png" alt="Narayana image">
    <img src="images/tags.png" alt="Logos">
</div>

<div class="main">
    <form action="getdatacontroller" method="post"> 
        <input type="text" name="rollno" placeholder="Enter Your RollNo">
        <button type="submit">Submit</button>
    </form>

    <!-- Heading for 3rd Year Table -->
    <div class="table-heading">3rd Year Data Availability</div>
    <table class="table">
        <tr>
            <th>Year</th>
            <th>Semester</th>
            <th>Status</th>
        </tr>
        <tr>
            <td>1st Year</td>
            <td>1st Semester</td>
            <td class="unavailable">Unavailable</td> <!-- Available -->
        </tr>
        <tr>
            <td>1st Year</td>
            <td>2nd Semester</td>
            <td class="unavailable">Unavailable</td>
        </tr>
        <tr>
            <td>2nd Year</td>
            <td>1st Semester</td>
            <td class="unavailable">Unavailable</td> <!-- Available -->
        </tr>
        <tr>
            <td>2nd Year</td>
            <td>2nd Semester</td>
            <td class="unavailable">Unavailable</td>
        </tr>
        <tr>
            <td>3rd Year</td>
            <td>1st Semester</td>
            <td class="available">Available</td> <!-- Available -->
        </tr>
        <tr>
            <td>3rd Year</td>
            <td>2nd Semester</td>
            <td class="unavailable">Unavailable</td>
        </tr>
    </table>

    <!-- Heading for 2nd Year Table -->
    <div class="table-heading">2nd Year Data Availability</div>
    <table class="table">
        <tr>
            <th>Year</th>
            <th>Semester</th>
            <th>Status</th>
        </tr>
        <tr>
            <td>1st Year</td>
            <td>1st Semester</td>
            <td class="unavailable">Unavailable</td> <!-- Available -->
        </tr>
        <tr>
            <td>1st Year</td>
            <td>2nd Semester</td>
            <td class="unavailable">Unavailable</td>
        </tr>
        <tr>
            <td>2nd Year</td>
            <td>1st Semester</td>
            <td class="available">Available</td> <!-- Available -->
        </tr>
        <tr>
            <td>2nd Year</td>
            <td>2nd Semester</td>
            <td class="unavailable">Unavailable</td>
        </tr>
    </table>

</div>

</body>
</html>