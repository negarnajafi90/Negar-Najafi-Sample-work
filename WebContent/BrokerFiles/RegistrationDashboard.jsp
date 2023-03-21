 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%-- <%@ page import="FULLBackendPart.Users"  %>

<%@ page import="RDS.RDSFunctions"  %> --%> 

<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">


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
	//int timeout = session.getMaxInactiveInterval();

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp");
%>


<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<!-- <link rel="stylesheet" href="../CSS/ProBroker.css" type="text/css"> -->

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<title>Dashboard - Masterre</title>

</head>

<header>


</header>
<!-- 
<%
	//RDSFunctions RDS=new RDSFunctions();
 
 //int id=0;

 //id=(int)session.getAttribute("Broker_id") ;
 
// System.out.println(id);

 //ArrayList<Users> agent=RDS.GetAgents(id);
%> -->

<body>




	<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

		<div class="logo" style="padding-bottom: 35px;">

			<img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"
				style="width:19px;  margin-left:16px; margin-bottom:5px;">

			<span class="navText"><img src="../ImagesUsed/MasterRe2.png" alt="MasterBroker"
					style="width:150px;height: 12px;  margin-left:6px; margin-bottom:7px;"></span>

		</div>

		<div class="dropdown" id="forhov">
			<a><button id="createDrop" class="dropbtn" onclick="showOptions()">+</button></a>
		</div>

		<a class="menubartext" href="Dashboard.jsp"><button class="tablinks active"><img class="dashboardIcons accept"
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

		<a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span class="navText">Inbox</span></button></a>

		<a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img class="dashboardIcons accept extrasize"
					src="../ImagesUsed/logOut.png" alt="YesOrNo"><span class="navText">Log Out</span></button></a>

		<button onclick="openNav(); wideContent();" id="navOpenBtn" class="tablinks floatDataRightSide" style="display: none;"><img
				class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

		<button onclick="closeNav(); wideContent();" id="navCloseBtn" class="tablinks openClose"><img
				class="dashboardIcons accept rotate180 openClose floatDataRightSide" src="../ImagesUsed/collapse.png"
				alt="YesOrNo"></button>



	</div><!-- Closing left-Nav-bar-Menu -->

	<div id="Right" class="Rightcolumn marginBody navBarMovable">
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

		<div id="MainDashboard" class="DashboardPage">
			<div class="HeaderDashboard flexibleContainer">

				<label class="DealsHeader flexible">My Brokerage</label>

				<span class="flexible" style="max-width: 50px; margin-right: -5px;">

					<img class="DashboardImgUser" src="../ImagesUsed/JB.jpg" alt="">
					<img class="UserStatus" src="../ImagesUsed/Online.png" alt="">
				</span>

				<label class="UserName flexible" for=""> James&nbsp;Bond </label>

				<span class="ringImg  flexible"><img class="" src="../ImagesUsed/Ring.png" alt=""></span>

			</div>

			<div class="ContentDashboard flexibleContainer">
				<div class="MainConent flexible">

					<div id="DbdDeals" class="Deals">
						<label class="DealsSecondHeader">Deals Requiring Your Review</label>
						<button class="ShowAllbtn">Show all</button>

						<div class="tableDiv">
							<img src="../ImagesUsed/LineCaught.png" class="noDealsTopImg" alt="" style="display: none;">
							<label class="noDealsTopLabel"  style="display: none;">You are all caught up</label>
						</div>

						

					</div>

					<div class="flexibleContainer">

						<div id="DbdCommissions" class="Deals flexible" style="text-transform: uppercase; margin-right: 6px;">
							<label class="DealsSecondHeader">Commissions</label>
							<img src="../ImagesUsed/Settings.png" style="float: right; width: 15px;  margin-top: 16px; margin-right: 15px;" alt="O">
							
							<div class="tableDiv">
								<!-- <img src="../ImagesUsed/NoDeals.png" alt="" style="width: 100%; padding: 20px; padding-top: 60px; padding-bottom: 60px; box-sizing: border-box; height: fit-content;"> -->
								<label class="noDealsLabel">There are no deals to display</label>
							</div>

							<!-- <div class="CommissionDiv flexibleContainer" >
								<label style="    font-size: 7vh;
								color: lightgrey;
								text-align: center;
								margin: auto;
								width: 100%;">You are all caught up</label>
							</div> -->
						</div>

						<div id="DbdNewDeals" class="Deals flexible" style="margin-left: 6px;">
							<label class="DealsSecondHeader">New Deals</label>
							<button class="ShowAllbtn">Show all</button>
							<div class="tableDiv">
								<!-- <img src="../ImagesUsed/NoDeals.png" alt="" style="width: 100%; padding: 20px; padding-top: 60px; padding-bottom: 60px; box-sizing: border-box; height: fit-content;"> -->
								<label  class="noDealsLabel">There are no deals to display</label>
							</div>
						</div>

					</div>

				</div>

				<div class="chatDashboard flexible" style="flex-direction: column; margin-bottom: 10px; margin-top: 8px; display: flex; flex: 1 1 0%;" id="chatBox">
					
					<label class="DealsSecondHeaderChat" id="chtHead"><span id="chtHeadtxt">Recent Comments</span><img src="../ImagesUsed/chat3.PNG" id="chatClosed" onclick="HideChat()" style="display: none; width: 20px;" alt=""><img onclick="HideChat()" class="hideChatBtn" id="chtOpenbtn" src="../ImagesUsed/OpenChat.png" alt=""></label>

					<div class="messagesSection scroll " onscroll="DisplayScroll();" id="MsgSection" >


						<label  class="noDealsChatLabel">There are no messages to display</label>

						<!-- <img src="../ImagesUsed/NoComments.png" alt="" style="width:100%; padding: 23px; padding-top: 67%;box-sizing: border-box; height: fit-content;"> -->
						

						<script>
							// alert(1)
							// window = document.getElementById("MsgSection");
							window.addEventListener('scroll', this.handleScroll, true);
							// alert(1)
							handleScroll = (e) => {
								
							}
							// alert(1)
							scrollDown();
						</script>
					</div>

					
					

					<div class="SendMessage " style=" margin-top: auto; margin-bottom: 10px;" id="sendMsg">

						<div class="flexibleContainer">
							<label class="flexible" for="" style="text-transform: uppercase;
							font-size: 10px;
							margin-top: 11px;
							margin-bottom: 8px;
							margin-left: 1px;">New Message</label>
							<div class="custom-select flexible" style="margin-top: 6px;
							flex: 0.7;
							height: 20px;
							margin-bottom: 0;
							margin-right: 0;" id="AgentChose" >
	
								<select class="inputSelection" id="" name="">
	
								  <option value="">Select Users</option>
								  <option value="All">All</option>
			  
								  <option value="1">Agent1</option>
								  <option value="2">Agent2</option>
								  <option value="3">Agent3</option>
			  
								</select>
			  
							</div>
						</div>

						<textarea name="" id="" style="    resize: none;
						padding: 7px;
						height: 110px;
						width: calc(100% - 2px);
						margin-left: 1px;
						border: none;
						box-sizing: border-box;"></textarea>
						<img src="../ImagesUsed/send.png" style="position: relative;
						width: 24px;
						top: -12px;
						left: 82%;
						margin-bottom: -14px;
						cursor: pointer;
						border: none;" alt="">
						<!-- <button>Send</button> -->
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
		checkNavBar();
		forSelects();

		BORhideShow(1);
	</script>

</body>



</html>