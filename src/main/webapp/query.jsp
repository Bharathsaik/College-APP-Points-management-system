<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Query Form</title>
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
        font-size: 1em; /* Consistent font size */
    }

    .dropdown a:hover {
        background-color: #f0f0f0; /* Hover effect for dropdown links */
    }

    /* Form styling */
    .form-container {
        max-width: 600px; /* Max width of the form container */
        padding: 20px;
        margin: 40px auto; /* Center the form horizontally */
        border: 1px solid #ddd;
        border-radius: 10px; /* Rounded corners */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        background-color: #f9f9f9; /* Light background color */
    }

    .form-container h2 {
        font-size: 1.5em;
        color: #333;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px; /* Space between form groups */
    }

    .form-group label {
        display: block; /* Labels on separate lines */
        font-weight: bold; /* Make labels bold */
        margin-bottom: 5px; /* Space between label and input */
    }

    .form-group input,
    .form-group textarea {
        width: 100%; /* Make inputs full width */
        padding: 10px; /* Padding within inputs */
        border: 1px solid #ccc; /* Border color */
        border-radius: 5px; /* Rounded corners */
        transition: all 0.3s ease; /* Smooth transition */
    }

    .form-group input:focus,
    .form-group textarea:focus {
        border-color: #30cfd0; /* Change border color on focus */
        box-shadow: 0 0 5px rgba(48, 207, 208, 0.5); /* Add glow effect */
    }

    .form-container button {
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .form-container button:hover {
        background-image: linear-gradient(to top, #330867 0%, #30cfd0 100%);
    }

    /* Responsive design adjustments */
    @media (max-width: 900px) {
        .nav-links {
            display: none; /* Hide navigation links when screen is small */
        }

        .hamburger {
            display: flex; /* Show hamburger menu on small screens */
        }

        .dropdown {
            display: none; /* Hide dropdown initially */
        }

        .form-container {
            margin-top: 10px; /* Adjusts spacing for responsive design */
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
        <a href="studentacecheck.jsp">Events Participated</a>
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
    <a href="studentacecheck.jsp">Events Participated</a>
    <a href="query.jsp">Query</a>
    <a href="#">About</a>
    <form action="studentlogoutcontroller" method="post" style="margin: 0;">
        <button type="submit" style="background: none; border: none; padding: 10px; text-align: left;">Logout</button>
    </form>
</div>

<div class="form-container">
    <h2>Submit Your Query</h2> <!-- Form heading -->
    <form action="querycontroller" method="post">
      <div class="form-content"> <!-- Flex-based layout -->
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" name="name" id="name">
        </div>
        <div class="form-group">
          <label for="rollno">RollNo:</label>
          <input type="text" name="rollno" id="rollno">
        </div>
        <div class="form-group">
          <label for="year">Year:</label>
          <input type="text" name="year">
        </div>
        <div class="form-group">
          <label for="semester">Semester:</label>
          <input type="text" name="semester" id="semester">
        </div>
        <div class="form-group">
          <label for="query">Query:</label>
          <textarea rows="5" name="query"></textarea>
        </div>
        <button type="submit">Submit</button>
      </div>
    </form>
</div>

</body>
</html>