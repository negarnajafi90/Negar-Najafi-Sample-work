 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="CSS/Login.css" type="text/css">

	<link rel="stylesheet" type="text/css" href="CSS/Fonts.css">

	

	<title>Login - Masterre</title>
	<link rel="icon" type="image/png" sizes="16x16" href="favicon-16.png">
</head>

<body>

	<div style="margin-top: 100px;">

		<!-- The following form is to collect the email and password which users has been registered by  -->

		<form name="ProBrokerLogin" action="Login" id="ProBrokerLogin" method="post" enctype="multipart">


			<div class="masterDiv">
                  <div class="MasterDivOne">
                      <img class="LoginMarterRe" src="ImagesUsed/MasterRe.png" alt="">
                  </div>
                  <div class="MasterDivTwo">
                      <img class="img2logo" src="ImagesUsed/MasterRe3.png" alt="">
                  </div>
            </div>

			
			<div class="ColumnFlex" style="margin-top: 70px;" >

				<div style="flex: 1;">
					<input type="text" class="inlineInput" id="Email" name="Email" placeholder="Username" autocomplete="email">
					<p style="visibility: hidden;" class="WarningLogin"></p>
				</div>
	
				<div style="flex: 1; ">
					<input type="password" class="inlineInput" id="password" name="password" placeholder="Password" autocomplete="current-password">
					<p class="WarningLogin"  style="visibility:hidden">Your username or password is incorrect</p>
				</div>

				<div style="flex: 1;  margin-bottom: 20px;">
					
					<!-- when the users click on the following button , it will check their credentials and direct them to the dash board if validated  -->
					<input class="LoginInput LoginRegister" id="Login" type="submit" value="Sign In">
					<!-- The following link is to used and direct the users if they forgot their password to recover -->

					<div class="forgotPassDiv"><a href="Login/ForgotPassword.jsp">Forgot Password? </a></div>
				</div>
				
			</div>
			


			<!-- The following label and input are to collect from users their Password  -->

		

			<!-- The following link is to direct users to sign up if they do not have an account -->
<!-- 
			<p style="margin-top:30px; font-size:25px; color:black;"> Don't have account? <a
					href="Login/Signup.jsp">Sign Up</a></p> -->

		</form>


	</div>



	<script>



	</script>

</body>

</html>