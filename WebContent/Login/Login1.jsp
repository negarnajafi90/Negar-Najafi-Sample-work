<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../CSS/Login.css" type="text/css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<title>Login - Masterre</title>

<style>


	form{
	   padding-bottom: 30px;
	}
</style>

</head>

<header>

</header>

<body>

<div style="margin-top: 100px">

    <form name="ProBrokerLogin" method="post" action="../Login" enctype="multipart">
     
		<div class="masterDiv">
            <div class="MasterDivOne">
                <img class="LoginMarterRe" src="../ImagesUsed/MasterRe.png" alt="">
            </div>
            <div class="MasterDivTwo">
                <img class="img2logo" src="../ImagesUsed/MasterRe3.png" alt="">
            </div>
        </div>
		
		<div class="ColumnFlex"  style="margin-top: 70px;">

			
			<div style="flex: 1; ">
				<input type="text" class="inlineInput" id="fname" name="Email" placeholder="Username" autocomplete="email">
				<p style="visibility: hidden;" class="WarningLogin"></p>
			</div>

			<div style="flex: 1;">
				<input type="password" class="inlineInput" id="pass" name="password" placeholder="Password" autocomplete="current-password">
				<p class="WarningLogin">Your username or password is incorrect</p>
				<!-- The username and password do not match our records. Please double check and try again. -->
			</div>

			<div style="flex: 1;  margin-bottom: 20px;">
				
				<input class="LoginInput LoginRegister" id="login" type="submit" value="Login">

				<div class="forgotPassDiv"><a href="ForgotPassword.jsp">Forgot Password?</a></div>

				<!-- <div style="text-align: center; margin-top: 10px; width: 100%; ">Don't have account? <a style="text-align: center; width: 100%; text-decoration: none; color: grey; " href="Signup.jsp">Sign Up</a></div>

				<p style="float:left; margin-top:30px; font-size:25px; color:black;">  <a href=".jsp"></a></p> -->
			</div>
			
		</div>
		

	</form>
	

	
  </div>








</body>
</html>