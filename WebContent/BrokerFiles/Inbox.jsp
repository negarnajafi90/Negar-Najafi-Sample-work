<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="RDS.RDSFunctions"  %> 

<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<script>

window.onpageshow = function (event) {
	  if (event.persisted) {
	    window.location.reload(); //reload page if it has been loaded from cache
	  }
	};

</script>


<%


int UserID=0;//(int)session.getAttribute("Userid") ;

int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
   
String Type="0";//(String)session.getAttribute("Type") ;

String Email="";//(String)session.getAttribute("Email") ;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../index.jsp");



}

else{
	
	 UserID=(int)session.getAttribute("Userid"); 
	
	 BrokerID=(int)session.getAttribute("Brokerid") ;
			   	   
     Type=(String)session.getAttribute("Type") ;
     
     Email=(String)session.getAttribute("Email") ;

}

%>

 <%

//This part is to keep track of the maximum time a user can be in active on the system and after that direct the user to the login page

//int timeout = session.getMaxInactiveInterval(); // Get the time has been set 

//response.setHeader("Refresh", timeout + "; URL =../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%> 

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

<!-- <link rel="stylesheet" href="../CSS/ProBroker.css" type="text/css"> -->
<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">


<title>Messages - Masterre</title>

</head>

<header>


</header>

<body>

      <div id="left-Nav-bar-Menu" class="leftcolumn navBar">

		<!-- <div class="logo" style="padding-bottom: 35px;">

			<img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"
				style="width:19px;  margin-left:16px; margin-bottom:5px;">

			<span class="navText"><img src="../ImagesUsed/MasterRe2.png" alt="MasterBroker"
					style="width:150px;height: 12px;  margin-left:6px; margin-bottom:7px;"></span>

		</div> -->

		<div class="logo">

			<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

			<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

		</div>
		
		<div class="dropdown" id="forhov">
			<a><button id="createDrop" class="dropbtn" onclick="showOptions()">+</button></a>
			<!-- <div class="dropdown-content">
						<a 	class="menubartext"  href="NewDeal.jsp"><button class="tablinks"><span class="navText">+ New Deal</span></button></a>
						  
						   <a   class="menubartext"  href="AddNewUser.jsp"><button class="tablinks"><span class="navText">+ New User</span></button></a>
					</div> -->

		</div>



		<a class="menubartext" href="Dashboard.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Dashboard.png" alt="YesOrNo" style="margin-bottom: 0px;"><span
					class="navText">Dashboard</span></button></a>

		<a class="menubartext" href="CommissionCalculator.jsp"><button class="tablinks"> <img
					class="dashboardIcons accept" src="../ImagesUsed/Commission Calculator.png" alt="YesOrNo"><span
					class="navText">Commissions Calculator</span></button></a>

		<a class="menubartext" href="Reports.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Reports.png" alt="YesOrNo" style="margin-bottom: -3px;"><span
					class="navText">Deals</span></button></a>

		<a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span class="navText">Personal
					Profile</span></button></a>

		<a class="menubartext forBOR" href="CompanyProfile.jsp" ><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;" alt="YesOrNo"><span
					class="navText">Company Profile</span></button></a>

		<a class="menubartext" href="Contacts.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span class="navText">Contacts</span></button></a>

		<a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks active"><img class="dashboardIcons accept"
					src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span class="navText">Inbox</span></button></a>
					
		        <a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/logOut.png" alt="YesOrNo"><span class="navText">Log Out</span></button></a>			

		<button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
				class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

		<button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
				class="dashboardIcons accept rotate180 openClose " src="../ImagesUsed/collapse.png"
				alt="YesOrNo"></button>
	
		 
	</div><!-- Closing left-Nav-bar-Menu -->
	
<div id="Transaction's Detail Information" class="Rightcolumn marginBody navBarMovable" style="float: left;"> 
	<div class="dropdown1 dispNone" id="newDealAgentDropdown">
		<i class="arrow"></i>
		<div class="dropdown-content1">
			<a class="menubartext" href="NewDeal.jsp"><button class="tablinks"><span class="">+ New
						Deal</span></button></a>

			<a class="menubartext" href="AddNewContact.jsp"><button class="tablinks"><span class="">+ New
				Contact</span></button></a>

			<a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span class="">+ New
						User</span></button></a>
		</div>
	</div>

	<div class="HeaderDashboard flexibleContainer" style='margin-top: 14px;'>

		<label class="DealsHeader flexible">Inbox</label>

	</div>

</div>

				
<script>
checkNavBar();
BORhideShow(1);
</script>


</body>

</html>