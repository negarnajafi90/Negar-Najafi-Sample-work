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

            <div class="logoutIcon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-check2-circle" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z"/>
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z"/>
                </svg>
                <p>Logout successful</p>
            </div>

            <div class="unactiveLogout" style='display: none'>
                <p class="pHead">System logout</p>
                <p>You have been logged out of the Masterre due to inactivity for security purposes</p>
            </div>
            

            <div style="flex: 1;  margin-bottom: 20px;">
                <a href="index.jsp"><input class="LoginInput LoginRegister" id="Login" type="button" value="Back to login" style="margin-bottom: 5px;"></a>
            </div>
            
        </div>
    
    </form>


</div>

</body>
</html>