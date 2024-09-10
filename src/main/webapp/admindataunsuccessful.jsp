<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Error</title>
<style>
  body {
    background-color: #FF6347; /* Tomato red */
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; /* Vertical alignment */
    height: 100vh; /* Full viewport height */
    margin: 0;
  }
  .centered {
    text-align: center;
  }
  .buttons {
    display: flex;
    justify-content: center; /* Center horizontally */
    margin-top: 20px; /* Space between text and buttons */
  }
  .button {
    padding: 10px 20px; /* Padding around button */
    color: white; /* White text */
    border: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s; /* Smooth hover transition */
    margin-right: 10px; /* Space between buttons */
  }
  .button:last-child {
    margin-right: 0; /* Remove extra margin for last button */
  }
  .button-retry {
    background-color: #FFA500; /* Orange for Retry */
  }
  .button-queries {
    background-color: #4CAF50; /* Green for Queries */
  }
  .button-logout {
    background-color: #FF4500; /* Red for Logout */
  }
  .button:hover {
    opacity: 0.8; /* Slight dimming on hover */
  }
</style>
</head>
<body>
  <%-- Redirect if not logged in --%>
  <%
     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
     response.setHeader("Pragma", "no-cache");
     response.setHeader("Expires", "0");

     if (session.getAttribute("username") == null) {
       response.sendRedirect("adminlogin.jsp");
     }
  %>

  <div class="centered">
    <h1>Error In Data Uploading</h1>
    <h2>Read the Instructions Carefully</h2>

    <!-- Buttons for retry, queries, and logout -->
    <div class="buttons">
      <!-- Retry button -->
      <form action="admin.jsp" method="post" style="display:inline;">
        <button type="submit" class="button button-retry">Retry</button>
      </form>

      <!-- Queries button -->
      <form action="admingetquerycontroller" method="post" style="display:inline;">
        <button type="submit" class="button button-queries">Queries</button>
      </form>

      <!-- Logout button -->
      <form action="adminlogoutcontroller" method="post" style="display:inline;">
        <button type="submit" class="button button-logout">Logout</button>
      </form>
    </div>
  </div>
</body>
</html>