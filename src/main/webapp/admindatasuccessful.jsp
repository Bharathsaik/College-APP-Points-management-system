<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Success</title>
<style>
  body {
    background-color: #98FB98; /* Light green background */
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; /* Center content vertically */
    height: 100vh; /* Full viewport height */
    margin: 0;
  }
  .centered {
    text-align: center;
  }
  .buttons {
    margin-top: 20px; /* Space between text and buttons */
    display: flex;
    justify-content: center; /* Center buttons horizontally */
  }
  .button {
    padding: 10px 20px; /* Padding around button */
    color: white; /* White text */
    border: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s; /* Smooth transition for hover */
    margin-right: 10px; /* Space between buttons */
  }
  .button:last-child {
    margin-right: 0; /* Remove extra space after last button */
  }
  .queries-button {
    background-color: #4CAF50; /* Green color for Queries */
  }
  .logout-button {
    background-color: #FF6347; /* Red color for Logout */
  }
  .button:hover {
    background-color: #45a049; /* Hover effect for Queries */
  }
  .logout-button:hover {
    background-color: #FF4500; /* Hover effect for Logout (darker red) */
  }
</style>
</head>
<body>

<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");
   
   if(session.getAttribute("username") == null) {
   	response.sendRedirect("adminlogin.jsp");
   }
%>

  <div class="centered">
    <h1>Hey! Admin</h1>
    <h2>Data is Successfully Uploaded</h2>

    <!-- Container for buttons -->
    <div class="buttons">
      <!-- Logout form -->
      <form action="adminlogoutcontroller" method="post" style="display:inline;">
        <button type="submit" class="button logout-button">Logout</button>
      </form>

      <!-- Queries form -->
      <form action="admingetquerycontroller" method="get" style="display:inline;">
        <button type="submit" class="button queries-button">Queries</button>
      </form>
    </div>
  </div>
</body>
</html>
