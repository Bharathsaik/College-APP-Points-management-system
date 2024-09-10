<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
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
        justify-content: space-between; /* Keeps elements evenly spaced */
        align-items: center;
        padding: 10px 20px;
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
        color: white;
    }

    /* Navigation links styling */
    .nav-links {
        display: flex;
        justify-content: flex-start; /* Aligns links to start with minimal gap */
        gap: 15px; /* Controls spacing between elements */
    }

    .nav-links form, .nav-links a {
        text-decoration: none;
        color: white;
        padding: 10px;
        font-size: 1em; /* Consistent font size for links */
    }

    .nav-links a:hover {
        color: #e0ebeb; /* Hover effect for links */
    }

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

    .images {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    .images img {
        margin-right: 20px;
    }

    .main {
        text-align: center;
        margin-top: 20px;
    }

    .main input {
        border: 1px solid #ddd;
        padding: 10px;
        width: 200px;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .main input:hover {
        border-color: #30cfd0; 
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
        width: 60%; 
        border-collapse: collapse; 
        margin: 20px auto; 
        border: 1px solid #ddd; 
    }

    .table th, .table td {
        padding: 10px; 
        text-align: center; 
    }

    .table th {
        background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%); 
        color: white; 
    }

    .table tr:nth-child(even) {
        background-color: #f2f2f2; 
    }

    .table tr:hover {
        background-color: #ddd; 
    }

    .table .available {
        color: green; 
    }

    .table .unavailable {
        color: red; 
    }

    /* Table heading */
    .table-heading {
        text-align: center;
        font-size: 1.5em; 
        padding: 10px; 
    }

    /* Responsive design adjustments */
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

        .images {
            flex-direction: column; 
        }

        .images img {
            margin-right: 0;
            margin-bottom: 20px; 
        }

        .main {
            margin-top: 10px; 
        }

        .table {
            width: 90%; 
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

    if (session.getAttribute("username") == null) {
        response.sendRedirect("adminlogin.jsp");
    }
    String uploadStatus = request.getParameter("uploadStatus");
%>
<nav>
   <span class="nav-title">Narayana Engineering College</span>
   <div class="nav-links">
     <a href="studentacecheck.jsp">Home</a>
     <form action="admingetquerycontroller" method="post" style="margin: 0;">
       <button style="background: none; border: none; color: white; font-size: 1em;">Get Student Queries</button>
     </form>
     <a href="#">About</a>
     <form action="adminlogoutcontroller" method="post" style="margin: 0;">
       <button style="background: none; border: none; padding: 10px; color: white; font-size: 1em;">Logout</button>
     </form>
   </div>
   <div class="hamburger" onclick="toggleDropdown()">
     <div></div>
     <div></div>
     <div></div>
   </div>
</nav>

<div class="dropdown" id="dropdownMenu"> 
  <a href="studentacecheck.jsp">Home</a>
  <form action="admingetquerycontroller" method="post" style="margin: 0;">
    <button style="background: none; border: none; padding: 10px; font-size: 1em;">Get Student Queries</button>
  </form>
  <a href="#">About</a>
  <form action="adminlogoutcontroller" method="post" style="margin: 0;">
    <button style="background: none; border: none; padding: 10px; font-size: 1em;">Logout</button>
  </form>
</div>

<div class="images">
    <img src="images/narayana.png" alt="Narayana image">
    <img src="images/tags.png" alt="Logos">
</div>

<div class="rules">
  <h2>Hey! Admin</h2>
  <ul>
    <li>The Excel file should be in CSV format.</li>
    <li>The date format should be YYYY-MM-DD.</li>
    <li>The lengths of the data should be accordingly set.</li>
    <li>Certificate numbers should be unique.</li>
  </ul>
</div>

<div class="main">
 <%-- Show message based on upload status --%>
    <% if ("success".equals(uploadStatus)) { %>
        <div style="color: green; text-align: center;">
            Data upload was successful!
        </div>
    <% } else if ("failure".equals(uploadStatus)) { %>
        <div style="color: red; text-align: center;">
            Data upload was unsuccessful. Please try again.
        </div>
    <% } %>
  <form action="admincontroller" method="post" enctype="multipart/form-data"> 
    <label for="csvFile">Choose the CSV file:</label>
    <input type="file" name="csvFile">
    <button type="submit">Upload</button>
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
         <td class="unavailable">Unavailable</td>
      </tr>
      <tr>
          <td>1st Year</td>
          <td>2nd Semester</td>
          <td class="unavailable">Unavailable</td>
      </tr>
      <tr>
          <td>2nd Year</td>
         <td>1st Semester</td>
         <td class="unavailable">Unavailable</td>
      </tr>
      <tr>
          <td>2nd Year</td>
         <td>2nd Semester</td>
          <td class="unavailable">Unavailable</td>
      </tr>
      <tr>
          <td>3rd Year</td>
          <td>1st Semester</td>
          <td class="available">Available</td>
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
          <td class="available">Available</td>
      </tr>
      <tr>
          <td>1st Year</td>
         <td>2nd Semester</td>
         <td class="unavailable">Unavailable</td>
      </tr>
      <tr>
          <td>2nd Year</td>
          <td>1st Semester</td>
          <td class="available">Available</td>
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