<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../CSS/Login.css" type="text/css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<title>Reset Password - Masterre</title>

<script>

var passwordmatched=0;

function CheckPasswords(){
	
	 var password = document.forms["ProBrokerResetPassword"]["password"].value;
	 
	 var confirmpassword = document.forms["ProBrokerResetPassword"]["ConfirmPassword"].value;
	 
	 var btnSubmit = document.getElementById("resetpass");
	 
	 //alert(password);
	 
	 //alert(confirmpassword);
	 
	 if(password==confirmpassword){
	   
		  
		 document.getElementById("passcheck").style.visibility ="hidden";

	 	 btnSubmit.disabled =false;
	     
	     passwordmatched=1;	
	     
	     //alert("HEre33");

	 }
	 
	 else
	 {
		  
	        document.getElementById("passcheck").style.visibility = "visible"; 
	        
		    btnSubmit.disabled = true;
		   
		    passwordmatched=0;
		    
		    //alert("HEre");
		   
	 }
	 
	}
	 

</script>

</head>

<body>
	

<div style="margin-top: 100px;">

    <form name="ProBrokerResetPassword" method="post" action="../ChangePassword" enctype="multipart">

		<a href="../index.jsp"><button  type="button" class="backButton"> Back to Login</button></a>

		<div class="masterDiv">
            <div class="MasterDivOne">
                <img class="LoginMarterRe" src="../ImagesUsed/MasterRe.png" alt="">
            </div>
            <div class="MasterDivTwo">
                <img class="img2logo" src="../ImagesUsed/MasterRe3.png" alt="">
            </div>
        </div>
	
		<div>
			<div class="ColumnFlex"  style="margin-top: 70px;">

				<div>
				
					<input class="inlineInput" type="password" id="password" name="password" placeholder="New Password" oninput="CheckPasswords();" autocomplete="new-password">
					
					<p style="visibility:hidden; margin-bottom: 0" class="WarningLogin">Warning message</p>
					
				</div>

				<div>
				
					<input class="inlineInput" placeholder="Confirm New Password" type="password" id="ConfirmPassword" name="ConfirmPassword" oninput="CheckPasswords();"  autocomplete="new-password">
					
					<p class="WarningLogin" style="visibility:hidden;" id="passcheck">Your Passwords are not matched </p>
					
				</div>

				<div style="margin-bottom: 20px;">

					<input disabled="disabled"  class="LoginInput LoginRegister" style="margin-bottom: 5px;" id="resetpass" type="submit" value="Reset">
					
					<!-- <input class="LoginInput LoginRegister" id="Login" type="submit" value="Sign In" style="margin-bottom: 5px;"> -->
					
					<!-- <a style="text-align: center; width: 100%; text-decoration: none; color: grey; font-weight: 100; margin-top: 5px;" href="ForgotPassword.jsp">Forgot Password? </a> -->
				</div>
				
			</div>
		</div>

	</form>
	

  </div>


</body>

</html>