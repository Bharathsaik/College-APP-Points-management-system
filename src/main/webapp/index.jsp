<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
     <div id="main_div">
         <div id="firstdiv">
              <img src="images/logo_college.png" alt="college_logo">
         </div>
         <div id="seconddiv">
            
                <div id="studentmain">
					<div id="student">
					    <div id="studentname">
					        Student
					    </div>
					    <div id="login">
					        <form action="studentloginandsignup.jsp" method="post">
					            <button>Login</button>
					        </form>
					    </div>
					    <div id="register">
					    <form action="studentloginandsignup.jsp" method="post">
					            <button>register</button>
					        </form>
					    </div>					    
					</div>
                </div>
                
                <div id="adminmain">
                    <div id="admin">
					    <div id="adminame">
					        Admin
					    </div>
					    <div id="login">
					        <form action="adminlogin.jsp" method="post">
					            <button>Login</button>
					        </form>
					    </div>
					    <div id="register">
					    <form action="adminloginandsignup.jsp" method="post">
					            <button>register</button>
					        </form>
					    </div>					    
					</div>					
                </div>                         
         </div> 
     </div>
</body>
</html>