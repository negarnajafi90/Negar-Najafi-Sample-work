<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/Login.css" type="text/css">
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16.png">

<link rel="stylesheet" type="text/css" href="CSS/Fonts.css">
<title>Log Out - Masterre</title>
</head>
<body>

<%
    session.invalidate(); 
   
%>
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

        
        <div class="ColumnFlex" style="margin-top: 70px;">


            <div class="unactiveLogout">
                <p class="pHead">System logout</p>
                <p>You have been logged out of the Masterre due to inactivity for security purposes</p>
            </div>
            

            <div style="flex: 1;  margin-bottom: 20px;">
            
            <a href="index.jsp">
            
                <input class="LoginInput LoginRegister" id="Login" type="button" value="Back to login" style="margin-bottom: 5px;">
                
                </a>
            </div>
            
        </div>
    
        <!-- The following label and input are to collect from users their Password  -->

    

        <!-- The following link is to direct users to sign up if they do not have an account -->
<!-- 
        <p style="margin-top:30px; font-size:25px; color:black;"> Don't have account? <a
                href="Login/Signup.jsp">Sign Up</a></p> -->

    </form>


</div>

</body>
</html>