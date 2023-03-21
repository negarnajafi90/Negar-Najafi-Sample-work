<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="java.text.NumberFormat" %>

<%@ page import="java.util.Locale" %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="java.util.Date"  %>

<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.sql.Connection" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<script>

window.onpageshow = function (event) {
	  if (event.persisted){
	    window.location.reload(); //reload page if it has been loaded from cache
	  }
	};




</script>


<%

SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
SimpleDateFormat sdf2 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
int UserID=0;//(int)session.getAttribute("Userid") ;
int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
String Type="0";//(String)session.getAttribute("Type") ;
String Email=""; //(String)session.getAttribute("Email") ;
String isBroker = "1";
String FirstName = "";
String LastName = "";
Connection con=null;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../index.jsp");
  
  return;

}

else{
	
	 UserID=(int)session.getAttribute("Userid"); 
	 BrokerID=(int)session.getAttribute("Brokerid") ;	   	   
     Type=(String)session.getAttribute("Type") ;
     Email=(String)session.getAttribute("Email") ;
     FirstName =(String)session.getAttribute("UserFirstname") ;
     LastName =(String)session.getAttribute("UserLastname") ;
      con=(Connection) session.getAttribute("Connection");

}

%>

<%
	//int timeout = session.getMaxInactiveInterval();

	//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp");

	NumberFormat nf = NumberFormat.getInstance(new Locale("en", "US"));
	nf.setMinimumFractionDigits(2);
	nf.setMaximumFractionDigits(2);
	int Counter=0;

%>


<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">
	
	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0-rc"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<title>Dashboard - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">


	<style>

		.doughnutChart {
			width: 200px;
			height: 200px;
			max-width: 100%;
			max-height: 100%;
		}
		.avatar {
			font-size: 14px;
			width: 2.3em;
			height: 2.3em;
			border-radius: 50%;
			background: #555555;
			display: inline-flex;
			align-items: center;
			justify-content: center;
			margin-top: 0px;
   			margin-left: 11px;
		}

		.avatar::after {
			content: attr(data-label);
			font-weight: bold;
			/* font-family: "Readex Pro", sans-serif; */
			color: #ffffff;
		}

		#DbdDealsTable tr th:first-child, #DbdDealsTable2 tr th:first-child{
			text-align: left;
			padding-left: 10px;
		}
		#DbdDealsTable tr td:first-child input{
			text-align: left;
			padding-left: 6px;
			text-overflow: ellipsis;
		}

		#DbdDealsTable .priceCompD{
			text-align: right; 
			font-variant-numeric: tabular-nums;
		}

		#DbdDealsTable2 tr td:first-child input{
			padding-left: 0px;
		}

		#DbdDealsTable2 .priceCompD{
			text-align: right; 
			padding-right: 9px;
			font-variant-numeric: tabular-nums;
		}
		
	</style>

</head>



<body onresize="drawGraph()">
	<div style='display: flex'>
		<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

			<div class="logo">

				<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

				<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

			</div>
			<%-- <div class="logo">
						<img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"  class="masterre1">
						<label class="masterre2" for="">MASTERRE</label>
			</div> --%>

			<div class="dropdown" id="forhov">
				<a><button id="createDrop" class="dropbtn" onclick="showOptions();">+</button></a>
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

			<a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;"
						alt="YesOrNo"><span class="navText">Company Profile</span></button></a>

			<a class="menubartext" href="Contacts.jsp"><button class="tablinks"><img class="dashboardIcons accept"
						src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span class="navText">Contacts</span></button></a>

			<a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span
						class="navText">Inbox</span></button></a>

			<a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img
						class="dashboardIcons accept extrasize" src="../ImagesUsed/logOut.png" alt="YesOrNo"><span
						class="navText">Log Out</span></button></a>

			<button onclick="openNav(); wideContent();" id="navOpenBtn" class="floatDataRightSide"
				style="display: none;"><img class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>

			<button onclick="closeNav(); wideContent();" id="navCloseBtn" class="floatDataRightSide"><img
					class="dashboardIcons accept rotate180 openClose" src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>


			<%

				//RDSFunctions myRDS=new  RDSFunctions();
				//
				////Users MyBrokerInfo=new Users();
//
				////MyBrokerInfo=myRDS.GetAnyUserById(BrokerID);
//
				//ArrayList<Transaction> AllPendingMyDeals = new ArrayList<Transaction>();
				//
				//ArrayList<Transaction> AllCompleteDeals = new ArrayList<Transaction>();
//
				//ArrayList<Transaction> AllDeals = new ArrayList<Transaction>();
				//
				//AllDeals=myRDS.GetAllPendingBrokerDeals( 1,BrokerID, BrokerID ,"", con);
				//
				//
				//for (int counter=0 ; counter<AllDeals.size() ; counter++ ){
	//
				//	if( AllDeals.get(counter).Permanent.equals("0") ){  AllPendingMyDeals.add( AllDeals.get(counter)); }
				//	
				//	else{   AllCompleteDeals.add( AllDeals.get(counter));	 }
				//	
				//	
				//	
				//}


				
				%>


		</div><!-- Closing left-Nav-bar-Menu -->
		
		<div id="Right" class="Rightcolumn marginBody navBarMovable">

		<div id="myModalSave" class="modal" >
			<div class="modal-content" style='max-width: 300px;border-color: red;height: 25px; padding-top: 15px;'>
				<img src="../ImagesUsed/Redalert.png" style="width: 28px; float: left; " alt="" loading="lazy"><label style='width: 250px; margin-top: -1px;'>Oops! Something went wrong. Please reload the page or try again</label>
			</div>
		</div>

			<div id="GraphSetup" class="modal">

				<div class="modal-content">

					<div class="modalHeader">Chart Settings<span class="close"><i class="bi bi-x-lg"></i></span></div>
					
					<div id="optionsComm" style="padding-top: 10px;">
						<div class="flexibleContainer" style="border-bottom: 1px solid lightgrey;">
							<div class='flexible'><label for="" style="float: left;">Display by</label></div>
							<div class='custom-select flexible' style='width: 150px; display: inline-block; float: left;'>
								<select name="" id="AmountType">
									<option value="Numberofdeals">Number of Deals</option>
									<option value="Numberofdeals">Number of Deals</option>
									<option value="Price">Price</option>
									<option value="Commissions">My Commissions</option>
								</select>
							</div>
						</div>
						<div class="flexibleContainer">
							<div class='flexible'>
								<label class="container" style="    margin-bottom: 2px;">
									<input class="checkbox" id="CompletedOnly" type="checkbox">
									<span class="checkmark" style="top: 6px;"></span>
								</label>
								<label for="CompletedOnly" style=" margin-left: 12px;">Display completed only</label>
							</div>	
							<div class='flexible'></div>
						</div>
										
					</div>

					<div class="popUpContainer" style="margin-top: 20px;">
						<button class="submitButton" type="submit" id="DrawGraphb" name="DrawGraphb">Accept</button>
					</div>
				</div>

			</div>

			<div id="myModalDelete" class="modal">
                <div class="modal-content">
                    <div class="modalHeader">Delete</div>
                    <p>Do you want to delete this deal?</p>
                    <div class="popUpContainer">
                    	<span class="close">No</span>
                    	<button class="submitButton" type="button" name="Delete" id="Delete">Yes</button>
                    </div>
                </div>
            </div>

			<div id="myModalReopen" class="modal" >
                <div class="modal-content">
                    <div class="modalHeader">Reopen deal</div>
                    <p>Do you want to reopen the deal?</p>
                    <div class="popUpContainer">
                        <span class="close">No</span>
                        <button class="submitButton" type="button" id="reopenDeal" name="reopenDeal">Yes</button>
                    </div>
                </div>
            </div>

			<div class="dropdown1 dispNone" id="newDealAgentDropdown">
				<i class="arrow"></i>
				<div class="dropdown-content1">

					<a class="menubartext" href="NewDeal.jsp"><button class="tablinks"><span>+ New
								Deal</span></button></a>

					<a class="menubartext" href="AddNewContact.jsp"><button class="tablinks"><span>+ New
								Contact</span></button></a>
					<a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span>+ New
								User</span></button></a>
				</div>
			</div>

			<span id="dashboardTablesBody"></span>

			<div class="loadingmodal"></div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			getDashboardTables();
			checkNavBar();
			forSelects();

			let doit;
			window.onresize = function () {
			clearTimeout(doit);
			doit = setTimeout(drawGraph, 200);
			};
			
		})
	</script>

	<script>



		document.onclick = function (event) {
			if (event.target == document.getElementById("GraphSetup")) {
				document.getElementById("GraphSetup").style.display = "none";
			}else if(event.target == document.getElementById('myModalReopen')){
				document.getElementById('myModalReopen').style.display = "none";
			}else if(event.target == document.getElementById('myModalDelete')){
				document.getElementById('myModalDelete').style.display = "none";
			}else if(!(event.target.className == 'editDealImg')){
				closeOptions();
			}
			event.stopPropagation();
		}
	</script>


</body>



</html>