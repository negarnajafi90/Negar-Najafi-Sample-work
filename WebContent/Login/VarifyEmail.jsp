<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../CSS/Login.css" type="text/css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<title>Verify Email - Masterre</title>

</head>


<header>

</header>

<body>

<!-- The following form is to receive the code users get through their email to register and direct to Varifucation JSP -->

<div style="margin-top: 100px;">

    <form name="ProBrokerVarification" method="post" action="../Varifucation" enctype="multipart"> 

		<a href="../index.jsp"><button  type="button" class="backButton"> Back to Login</button></a>

		<div class="masterDiv">
            <div class="MasterDivOne">
                <img class="LoginMarterRe" src="../ImagesUsed/MasterRe.png" alt="">
            </div>
            <div class="MasterDivTwo">
                <img class="img2logo" src="../ImagesUsed/MasterRe3.png" alt="">
            </div>
        </div>

		
		<div class="ColumnFlex" style="margin-top: 70px;">

				<p class="WarningLogin" style="color: grey;">Verification code has been sent to your inbox. Please enter it to the input box below.</p>

				<p style="display: none;" class="WarningLogin" id="fieldcheck">Please fill all the fields!</p>

				<div style="flex: 1; margin-bottom: 20px;">
				   
					<input class="LoginInput" type="text" id="code" name="code" placeholder="Verification Code">
					         
					<p style="visibility: hidden;" class="WarningLogin"> </p>
				</div>

				<div class="twoButtonFlex">

				    <button style="margin-left: 31px;" class="LoginInput LoginRegister" id="Login" type="submit" >Verify code</button>

					<button style="margin-right: 27px;" type="submit" id="Resend" class="LoginInput LoginRegister" name="Resend" >Send new code</button>
 				      
				</div>
				
		      </div>
				
	    </div>
	   
		
	    
	</form>
	
</div>


</body>

</html>