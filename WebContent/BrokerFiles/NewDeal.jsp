 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<script>

window.onpageshow = function (event) {
	  if (event.persisted) {
	    window.location.reload(); //reload page if it has been loaded from cache
	  }
	};

</script>


<!-- <%


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

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%> -->

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<!-- <script type="text/javascript" src="../Scripts/TRS.js"></script> -->

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>
	
	<!-- <script type="text/javascript" src="../Scripts/TRS.js"></script> -->

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

	<title>New Deal - Masterre</title>

</head>

<body>

	<div id="Main Body" style="display:flex; height: 100vh;">

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

			<a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span
						class="navText">Personal
						Profile</span></button></a>

			<a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Company Profile.png"
						style="margin-bottom: -3px;" alt="YesOrNo"><span class="navText">Company
						Profile</span></button></a>

			<a class="menubartext" href="Contacts.jsp"><button class="tablinks"><img class="dashboardIcons accept"
						src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span
						class="navText">Contacts</span></button></a>

			<a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span
						class="navText">Inbox</span></button></a>

			<a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img
						class="dashboardIcons accept extrasize" src="../ImagesUsed/logOut.png" alt="YesOrNo"><span
						class="navText">Log Out</span></button></a>

			<button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
					class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

			<button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
					class="dashboardIcons accept rotate180 openClose "
					src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>


		</div><!-- Closing left-Nav-bar-Menu -->

		<!------------------------------------------------------------------------------------------------------------------------>

		<div id="Selection" class="Rightcolumn marginBody navBarMovable">

			<div class="dropdown1 dispNone" id="newDealAgentDropdown">
				<i class="arrow"></i>
				<div class="dropdown-content1">
					<a class="menubartext" href="NewDeal.jsp"><button class="tablinks"><span class="">+ New
								Deal</span></button></a>

					<a class="menubartext" href="AddNewContact.jsp"><button class="tablinks"><span class="">+ New
								Contact</span></button></a>

					<a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span
								class="">+ New
								User</span></button></a>
				</div>
			</div>


			<div id="MainRightContent"
				style="float: left; width: 100%; max-width: 700px; background-color: #eef3f6; height: 350px; min-height: 350px;    margin-top: 30px;   filter: drop-shadow(0px 2px 3px grey);">

				<style>
					.newDealButton div{
						/* margin: auto; */
						margin-left: 20px;
						width: max-content;
						display: block;
						margin-top: 17px;
						font-size: 16px;
						/* font-weight: 600; */

					}
					.newDealButton img{
						height: 60px;
						margin: auto;
						display: block;
						padding: 10px;
						margin-top: 20px;
						filter: invert(48%) sepia(79%) saturate(2730%) hue-rotate(190deg) brightness(170%) contrast(59%);
						display: none;
					}
					.newDealButton{
						padding: 0;
						background-color: white;
						border: 1px solid #c8c8c8;
						height: 50px;
						border-radius: 10px;
						margin-bottom: 10px;
						width: 280px;
						filter: drop-shadow(0px 0px 0px grey);
						color: #484848;

					}
					.newDealButton:hover img{
						filter: invert(100%) sepia(222%) saturate(0%) hue-rotate(86deg) brightness(118%) contrast(119%);

						
					}
					.newDealButton:hover{
						background-color: #29c1e1;
						color: white;
						font-weight: 800;
						border-color: #29c1e1;
						filter: drop-shadow(0px 0px 0px grey);
					}

					
				</style>
				<div class="flexibleContainer" style=" margin-top: 10px; ">
					<!-- border: 1px solid grey; box-shadow: 10px 5px 5px lightgray; border-radius: 20px; -->
					<div id="LeftContent" class="DashboardLeft flexible"
						style="flex: 1;padding: 45px; padding-left: 45px;      padding-right: 0;  padding-top: 0px;">

						<p style="color:#054d6a; font-weight:bold; font-size: 30px; margin-top: 22px; margin-bottom: 38px;">Select new deal type</p>
						<div class="flexibleContainer" style="flex-direction: column;">
							<button style='background: none; border: none;' onclick='window.location.href = "../Forms/TRS.jsp";'><div class="newDealButton"><img src="../ImagesUsed/CalendarSVG.svg"><div>Trade in real estate</div></div></button><br>
							<button style='background: none; border: none;' onclick='window.location.href = "../Forms/ReferralFee.jsp";'><div class="newDealButton"><img src="../ImagesUsed/RemoveSVG.svg" alt=""><div>Referral fee receipt</div></div></button><br>
							<button style='background: none; border: none;' onclick='window.location.href = "../Forms/Appraisal.jsp";'><div class="newDealButton" style="margin: 0"><img src="../ImagesUsed/AddSVG.svg" alt=""><div>Other</div></div></button>
						</div>

					</div><!-- Closing LeftContent -->

					<div id="RightContent" class="DashboardRight flexible"
						style="padding-top: 40px;">

						<img src="../ImagesUsed/Render 1000.png" alt="MasterBroker" style="max-width: 365px; width: auto;">
					
					</div><!-- Closing RightContent -->
				</div>
			</div><!-- Closing MainRightContent -->

		</div><!-- Closing Selection -->

	</div><!-- Closing Main Body -->


	<script>
		checkNavBar();
		BORhideShow(1);

		function DealType(SelectedOption) {


		if (SelectedOption === "TradeInrealEstate") {

			document.getElementById("ReferralFreeReceipt").checked = false;

			document.getElementById("Appraisal").checked = false;
		} else if (SelectedOption === "ReferralFreeReceipt") {

			document.getElementById("TradeInrealEstate").checked = false;

			document.getElementById("Appraisal").checked = false;
		} else {
			document.getElementById("TradeInrealEstate").checked = false;

			document.getElementById("ReferralFreeReceipt").checked = false;
		}

		document.getElementById('NewDealProceed').style.pointerEvents = '';
		}
	</script>

</body>

</html>