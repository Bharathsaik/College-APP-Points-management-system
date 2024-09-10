<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link rel="stylesheet" href="studentloginandsignup.css">
</head>
<body>
<h2>Student</h2>
<div class="container" id="container">
	
	<div class="form-container sign-in-container">
		<form action="studentlogincontroller" method="post">
			<h1>Log In</h1>

			<input type="text" placeholder="RollNo" name="rollno"/>
			<input type="password" placeholder="Password" name="password"/>
			<a href="#">Forgot your password?</a>
			<button>Log In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>Hello, Student!</h1>
				<p>Enter your details to Login into Ace Activities Portal</p>
			</div>
		</div>
	</div>
</div>

<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
</script>


</body>
</html>