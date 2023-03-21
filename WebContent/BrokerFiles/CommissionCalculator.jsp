<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="java.sql.Connection" %>

<%@ page import="ProMasterClasses.Companies"  %>

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

Connection con=null;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../NoPermission.jsp");



}

else{
	
	 UserID=(int)session.getAttribute("Userid"); 
	
	 BrokerID=(int)session.getAttribute("Brokerid") ;
			   	   
     Type=(String)session.getAttribute("Type") ;
     
     Email=(String)session.getAttribute("Email") ;
     
     con=(Connection) session.getAttribute("Connection");

}

%>


<%
//int timeout = session.getMaxInactiveInterval();
//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp");
%>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

	<!-- <link rel="stylesheet" href="../CSS/AddForms.css" type="text/css"> -->

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<title>Commission Calculator - Masterre</title>

	<style>
		.SplitData {
			position: relative;
			border-radius: 5px;
			margin-top: 10px;
			padding-top: 31px;
		}

		.SplitData label {
			padding-top: 4px;
			color: white;
			margin-bottom: 0px;
			margin-top: 0px;
			height: 12px;
		}

		#LeftSide .manualInput {
			width: 100px;
			flex: 0.4;
			position: relative;
			padding: 0px;
			padding-left: 6px;
			padding-right: 6px;
			margin-right: 20px;
			border: 1px solid lightgray;
			border-radius: 6px;
			height: 16px;
			float: left;
		}

		.manualInput span {
			position: absolute;
			left: 0;
			top: 2px;
			padding-left: 5px;
			color: grey;
		}

		.containerForInput {
			margin-top: 18px;
		}

		.containerForInput label {
			color: grey;
			font-weight: bold;
			margin-left: 6px;
			padding: 5px;
			padding: 0;
		}

		.manualInput input {
			width: 100px;
			float: right;
			text-align: right;
			border: none;
			padding: 0px;
			background: none;
			height: 16px;
		}

		.valueSpan {
			position: absolute;
			min-width: 35px;
			border-radius: 4px;
			text-align: center;
			color: #29c1e1;
		}

		.valueSpan span{
			font-weight: bold;
		}

		.comissionLabel .manualInput span,
		.comissionLabel .manualInput input {
			color: black;
		}

		.comissionLabel:nth-child(1) {
			margin-top: 0px;
		}

		.comissionLabel {
			margin-top: 5px;
		}

		.comissionLabel .manualInput {
			position: relative;
			padding-right: 6px;
			border: 1px solid lightgray;
			border-radius: 8px;
			flex: 1.05;
			background: white;
		}

		.comissionLabel .flexibleContainer {
			margin-top: 0;
		}

		.totals {
			flex-direction: column;
		}

		.totals .flexibleContainer {
			flex-direction: row;
			padding-left: 10px;
			padding-right: 15px;
			box-sizing: border-box;
		}

		.totals label {
			padding: 0px;
			padding-top: 9px;
			font-weight: bold;
		}

		.totals input {
			border: none;
			background: none;
			text-align: right;
			color: white;
			margin: 0;
			margin-top: 8px;
			padding: 0px;
			flex: 2;
		}

		.totals .flexibleContainer label, .totals .flexibleContainer input{
			color: black;
			font-weight: bold;
		}

		.totals .flexibleContainer:nth-child(5) label, .totals .flexibleContainer:nth-child(5) input {
			color: white;
		}

		.totals .flexibleContainer label:nth-child(5) {
			flex: 0.1;
		}

	

		.totals .flexibleContainer:nth-child(5) {
			height: 40px;
			border-radius: 8px;
			width: calc(100% - 10px);
			margin-left: 5px;
			padding-right: 10px;
			margin-right: 5px;
			box-sizing: border-box;
			background: #29c1e1;
			margin-top: 10px;
		}

		.tooltipHelp svg * {
			color: white;
		}

		.tooltipHelp .tooltiptext {
			width: 163px;

		}
		
		.topGrey{
			background-color: white;
			border: 1px solid grey;
			color: Grey;
			font-weight: 600;
		}

		.activeButton{
			background-color: #054d6a;
			color: white;
		}

		.extraLabelCalculator{
			background-color: #eef3f6;
		}

		.extraLabelCalculator label{
			font-size: 13px !important; 
			flex: 4 !important; 
			font-weight: 100 !important; 
			padding-top: 6px !important;  
			color: black !important;
		}
		.extraLabelCalculator input{
			margin: 0;  
			color: black;
			padding: 0;
			font-weight: normal !important;
		}

		.topbutton{
			border-radius: 8px;
			height: 30px;
			font-size: 13px;
		}

		.topbutton:hover{
			background-color: #054d6a;
			border-color: #29c1e1;
			color: white;
		}

		/* @media screen and (max-width: 1020px) {
			.inlineInput {
				height: 24px;
			}
		} */
	</style>

</head>

<header>

</header>

<%


//Geting the user's information 

Users MyInformation=new Users();

RDSFunctions myRDS=new RDSFunctions();

MyInformation=myRDS.GetAnyUserById(UserID,con);

Companies mycompany=new Companies();

mycompany= myRDS.GetaCompanyBuyBrokerID(BrokerID,con);

%>


<body>


	<div style='display: flex'>
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

			<a class="menubartext" href="CommissionCalculator.jsp"><button class="tablinks active"> <img
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

			<button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
					class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

			<button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
					class="dashboardIcons accept rotate180 openClose" src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>


		</div><!-- Closing left-Nav-bar-Menu -->


		<!--------------------------------------------------------------------------------------------------------------------------------->

		<div id="CommissionCalculator" class="Rightcolumn marginBody navBarMovable	" style="margin-bottom: 200px;">

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

			<div id="section1" style="width:100%;  margin-top: 14px;">

				<div class="HeaderDashboard flexibleContainer">

					<label class="DealsHeader flexible">COMMISSION CALCULATOR</label>

				</div>

				<div class="flexibleContainer" style="width: 100%; max-width: 700px; margin-top: 17px;">

					<div id="LeftSide" class="flexible" style="flex: 1.84;padding-bottom: 5px;padding-right: 15px;">

						<div class="navTop flexibleContainer" id="TopTabs" style="margin: 0;     margin-bottom: 15px;">

							<button onclick="Sale();" id="SaleBtn"
								class="tablinks topGrey topbutton flexible activeButton">Sale</button>

							<button onclick="Lease();" id="LeaseBtn" class="tablinks topGrey topbutton flexible"
								style="margin-right: 0;">Lease</button>

						</div>

						<div>

							<div class="containerForInput firstContainer">

								<label class="labelsFields" for="Price">Price</label><br>


								<div class="manualInput" >
									<span>$</span>

									<input placeholder="0.00" class="inlineInput"
										oninput="recalculate('PriceRange', 'Price'); Calculation()"
										onchange="formatNumber(this.id);" type="text" id="Price"
										name="Price">
										
								</div>
								<label for="PriceRange" class="floatDataRightSide" id="saleInputMax">$10M</label>


								<input type="range" id="PriceRange" min="0" max="10000000" step="100000" value="0.00"
									oninput="" />
							</div>



							<div class="containerForInput">

								<label class="labelsFields" for="CommissionPercent">Commission</label><br>

								<div class="manualInput">
									<span>%</span>

									<input placeholder="0.00" class="inlineInput"
										oninput="recalculate('CommissionPercentage', 'CommissionPercent'); Calculation();" onchange="checkComissionPercent()"
										type="text" id="CommissionPercent" name="CommissionPercent" value="">

								</div>

								<input style="display: none;" placeholder="0.00"
									oninput="recalculateSumBack('CommissionPercentage', 'Commission');" type="text"
									id="Commission" name="Commission">
									<label id="comissionInputMax" class="floatDataRightSide"  for="CommissionPercentage">5.00%</label>
								<div class="flexibleContainer flexible" style=" position: relative;">
									<span class="valueSpan">
										<span id="myValueComission"></span>
									</span>
									<input id="CommissionPercentage" type="range" min="0" max="5" value="0"
										step="0.1" onchange="">
								</div>
								
							</div>

						</div>

						<div class="containerForInput">

							<label class="labelsFields" for="Rebates">Rebate</label><br>


							<div class="manualInput">
								<span>$</span>

								<input class="inlineInput"
									oninput="checkMaxRebateReferralInput('Rebates', 'Referral'); recalculateComBack('RebatesRange', 'Rebates');"
									onchange="formatNumber(this.id);copydata(this.id, 'RebateResult');" type="text" id="Rebates"
									name="Rebates" placeholder="0.00" value="0.00">

							</div>
							<label for="RebatesRange" class="floatDataRightSide" >100.00%</label>
							<div class="flexibleContainer flexible" style=" position: relative;">
								<span class="valueSpan">
									<span id="myValueRebates"></span>
								</span>
								<input type="range" min="0" max="100" step="1" id="RebatesRange" value="0"
									oninput=" recalculateCom('Rebates','RebatesRange');checkMaxRebateReferralInput('Rebates', 'Referral'); " />

							</div>

							

						</div>

						<input type="text" style="display: none;" placeholder="Gross Commission" id="Gross Commission"
							name="Gross Commission">

						<div class="containerForInput">

							<label class="labelsFields" for="Referral">Referral Fee</label><br>

							<div class="manualInput">
								<span>$</span>

								<input class="inlineInput"
									oninput="checkMaxRebateReferralInput('Referral', 'Rebates'); recalculateComBack('ReferralRange', 'Referral');"
									onchange="formatNumber(this.id); copydata(this.id, 'ReferralResult');" type="text" id="Referral"
									name="Referral" placeholder="0.00" value='0.00'>

							</div>
							<label for="ReferralRange" class="floatDataRightSide" >100.00%</label>
							<div class="flexibleContainer flexible" style=" position: relative;">
								<span class="valueSpan">
									<span id="myValue"></span>
								</span>
								<input type="range" id="ReferralRange" min="0" max="100" step="1" value="0"
									oninput="recalculateCom('Referral','ReferralRange');" />
							</div>

							

						</div>

						<input type="text" style="display: none;" placeholder="Agent's Portion" id="Agent Portion"
							name="Agent Portion">

					</div><!-- Closing LeftSide -->

					<div id="RightSide" class="flexible SplitData" style="padding-top: 0px">

						<div class="flexibleContainer" style="flex-direction:column; background-color: #054d6a; padding: 10px;  box-sizing: border-box;">
							<div class="flexibleContainer comissionLabel">

								<label class="flexible">Split</label>
		
								<div class="manualInput">
									<span>%</span>
		
									<input oninput="" onchange="checkPercent(this.id, 100); Calculation(); splitChange()" type="text" id="Split" name="Split"
										value="<%=MyInformation.User_Split%>" placeholder="0.00">
		
								</div>
		
							</div>
		
							<div class="flexibleContainer comissionLabel">
		
								<label class="flexible">Annual Cap</label>
		
								<div class="manualInput">
									<span>$</span>
		
									<input type="text" id="Cap"
										value="<%=MyInformation.User_Cap %>" name="Cap" placeholder="0.00"
										onchange="formatNumber(this.id); checkAnnualCap();Calculation(); ">
										
								</div>
		
							</div>
		
		
							<div class="flexibleContainer comissionLabel">
		
								<label class="flexible">Cap Reached</label>
		
								<div class="manualInput">
									<span>$</span>
		
									<input type="text" id="YTD" name="YTD" placeholder="0.00" value="<%=mycompany.Temp%>"
										onchange="formatNumber(this.id); checkAnnualCap(); Calculation();">
		
								</div>
		
		
							</div>
							
						</div>

						<div class="flexibleContainer" style="background-color: #f3f3f3; margin-top: 10px; padding-top: 0; box-sizing: border-box;">
							<div class="flexibleContainer flexible totals" style="margin-right: 0;">

								<div class="flexibleContainer" style="margin-bottom: 10px;">
									<label for="Total">Total Fee
										<span class="tooltipHelp">
											<img class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16" height="16">
											<span class="tooltiptext">Total fee is calculated as price times commission percentage</span>
										</span>
									</label>
									<input class="inlineInput flexible" type="text" id="Total" name="Total" value="$0.00"
										oninput="formatNumber(this.id)" readonly>
								</div>

								<div class="flexibleContainer extraLabelCalculator" style="border-top: 1px solid #054d6a; padding-top: 10px;">
									<label for="SplitResult">Split with brokerage</label>
								
									<input class="inlineInput flexible" type="text" id="SplitResult" name="SplitResult" value="0.00" oninput="formatNumber(this.id)" readonly>
								</div>
								<div class="flexibleContainer extraLabelCalculator" >
									<label for="RebateResult">Rebate</label>
		
									<input class="inlineInput flexible" type="text" id="RebateResult" name="RebateResult" value="0.00" oninput="formatNumber(this.id)" readonly>
								</div>
								<div class="flexibleContainer extraLabelCalculator">
									<label for="ReferralResult">Referral Fee</label>
							
									<input class="inlineInput flexible" type="text" id="ReferralResult" name="ReferralResult" value="0.00" oninput="formatNumber(this.id)" readonly>
								</div>

								<div class="flexibleContainer" >
									<label for="NetCommission">Net Pay<span class="tooltipHelp">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-question-circle helpImg"
												viewBox="0 0 16 16" style="padding-left: 8px;">
												<path
													d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
												<path
													d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
											</svg>
											<!-- <img class="helpImg" src="../ImagesUsed/HelpIconePre.png" alt="MasterProBrokerHelp" width="16" height="16"> -->
											<span class="tooltiptext">Net pay is calculated as total fee less commission
												split, less rebate and referral fee</span></span></label>
									<input class="inlineInput flexible" type="text" id="NetCommission" name="NetCommission"
										value="$0.00" oninput="formatNumber(this.id)">
								</div>

								<div>
									<label style="    height: fit-content;
									margin-top: 10px;
									color: grey;
									padding: 10px;
									padding-right: 10px;
									font-size: 11px;
									font-weight: normal;
									line-height: 1.1;
									text-align: justify;
									border-radius: 10px;"> <span style="font-weight: bold;font-size: 11px;">Disclaimer:</span> This calculator is for illustrative purposes only. Information
										obtained by using this calculator is not legal, tax or financial advice. 
										Results will vary based on selected parameters. All amounts are net of sales tax.</label>
								</div>

								<div>

								</div>

							</div>


						</div>


					</div><!-- closing RightSide -->

				</div>
				

			</div><!-- Closing section1 -->

			<div id="section2" style="display: none;">

				<label class="HeadLinesSecondary">Add Rebate or Referral Payments</label>

				<hr style="width:100%">

				<div class="flexibleContainer">

				</div>

			</div><!-- Closing Section2 -->

			<div id="section3" style="display: none;">

				<hr style="width:100%">

				<div class="flexibleContainer comissionLabel" style="margin-top: auto;">

					<label class="flexible">Broker's Portion:</label>

					<input class="inlineInput flexible" type="text" id="Broker Portion" name="Broker Portion" value=""
						oninput="formatNumber(this.id)">

				</div>

				<div class="flexibleContainer">

					<label style="flex: 0.9; padding-top: 7px;">Net Commission:</label>


				</div>

				<div class="flexibleContainer">

					<label style="flex: 0.9; padding-top: 7px;">HST:</label>

					<input class="inlineInput flexible" style="border: none;" type="text" id="HST" name="HST" value="0"
						oninput="formatNumber(this.id)">

				</div>

				<div class="flexibleContainer">

					<label style="flex: 0.9; padding-top: 7px;">Total:</label>


				</div>

			</div><!-- Closing section3 -->

		</div><!-- Closing Commission Calculator -->
	</div>
	<script>
		function checkAnnualCap() {
			var Cap =parseFloat(document.getElementById('Cap').value.replace(/,/g, ''));
			var CapReached = parseFloat(document.getElementById('YTD').value.replace(/,/g, ''));
			if (Cap < CapReached) {
				document.getElementById('YTD').value = document.getElementById('Cap').value;
			}
		}


		function formatNumber(id) {
			if (!(isNaN(document.getElementById(id).value.replace(/,/g, '')) || document.getElementById(id).value.trim() == '')) {
				var inputNumber = parseFloat(document.getElementById(id).value.valueOf().replace(/,/g, ''));
			} else {
				var inputNumber = parseFloat(0);
			}
			let addedCommas = inputNumber.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			document.getElementById(id).value = addedCommas;
		}

		function checkPercent(id, val){
			if (!(isNaN(document.getElementById(id).value))) {
				if(parseFloat(document.getElementById(id).value) >val){
					var inputNumber = parseFloat(val);
				}else if(parseFloat(document.getElementById(id).value) < 0){
					var inputNumber = parseFloat(0);
				}else{
					var inputNumber = parseFloat(document.getElementById(id).value.replace(/,/g, ''));
				}
			} else {
				var inputNumber = parseFloat(0);
			}
			let addedCommas = inputNumber.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			document.getElementById(id).value = addedCommas;
		}

		function checkComissionPercent(){
			id= 'CommissionPercent'
			if(document.getElementById('SaleBtn').classList.contains('activeButton')){
				var val = 5;
			}else{
				var val = 100;
			}
			if (!(isNaN(document.getElementById(id).value))) {
				if(parseFloat(document.getElementById(id).value) >val){
					var inputNumber = parseFloat(val);
				}else if(parseFloat(document.getElementById(id).value) < 0){
					var inputNumber = parseFloat(0);
				}else{
					var inputNumber = parseFloat(document.getElementById(id).value.replace(/,/g, ''));
				}
			} else {
				var inputNumber = parseFloat(0);
			}
			let addedCommas = inputNumber.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			document.getElementById(id).value = addedCommas;

			myRangeFuncCom();
		}

		function formalnumberFinish(id) {
			let wDec = document.getElementById(id).value.replace('.nn', '') + '.00';
			document.getElementById(id).value = wDec;
		}



		function Calculation() {
			var Price = document.getElementById("Price").value.replace(/,/g, '');
			var CommissionPercentage = document.getElementById("CommissionPercentage").value.replace(/,/g, '');
			var Split = document.getElementById("Split").value.replace(/,/g, '');
			var CapReached = document.getElementById("YTD").value.replace(/,/g, '');
			var Rebate = parseFloat(document.getElementById("Rebates").value.replace(/,/g, ''));
			var ReferralFee = parseFloat(document.getElementById("Referral").value.replace(/,/g, ''));
			var Cap = document.getElementById("Cap").value.replace(/,/g, '');
			var GrossCommissions = parseFloat((Price * CommissionPercentage) / 100);
			document.getElementById("Gross Commission").value = GrossCommissions.toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			document.getElementById("Total").value = '$' + parseFloat(GrossCommissions).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			var total = parseFloat(document.getElementById("Total").value.replace(/,/g, '').replace('$', ''));
			var splitPercent = (parseFloat(100 - document.getElementById('Split').value.replace(/,/g, '')))/100;
			// if(total*splitPercent>Cap){
			// 	if(total*splitPercent>(Cap-CapReached)){
			// 		document.getElementById("SplitResult").value = parseFloat(Cap - CapReached).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 	}else{
			// 		document.getElementById("SplitResult").value = parseFloat(Cap).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 	}
			// }else{
			// 	if(total*splitPercent>(Cap-CapReached)){
			// 		if(!total == 0){
			// 			if(!isNan(parseFloat(Cap - CapReached))){
			// 				document.getElementById("SplitResult").value = parseFloat(Cap - CapReached).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 			}else{
			// 				document.getElementById("SplitResult").value = '0.00'.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 			}
			// 		}
			// 	}else{
			// 		if(!(total == 0)){
			// 			if(!isNan(parseFloat(total*splitPercent))){
			// 				document.getElementById("SplitResult").value = parseFloat(total*splitPercent).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 			}else{
			// 				document.getElementById("SplitResult").value = '0.00'.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 			}
			// 		}else{
			// 			document.getElementById("SplitResult").value = '666'.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			// 		}
					
			// 	}

			// }
			if(total*splitPercent>(Cap - CapReached)){
				document.getElementById("SplitResult").value = parseFloat(Cap - CapReached).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			}else{
				document.getElementById("SplitResult").value = parseFloat(total*splitPercent).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
			}
			
			

			var Agent = parseFloat(GrossCommissions * Split) / 100;
			var Broker = parseFloat(GrossCommissions) - parseFloat(Agent);
			var check = Cap - CapReached;
			var Net = 0;
			var HST = 0;
			if (check >= Broker) {
				document.getElementById("Agent Portion").value = parseFloat(Agent).toLocaleString(undefined, {
					minimumFractionDigits: 2, maximumFractionDigits: 2
				});;
				document.getElementById("Broker Portion").value = parseFloat(Broker).toLocaleString(undefined, {
					minimumFractionDigits: 2, maximumFractionDigits: 2
				});;
			} else {
				Broker = check;
				Agent = GrossCommissions - Broker;


				if (isNaN(parseFloat(check).toFixed(2))) {
					document.getElementById("Broker Portion").value = 0.00;
					document.getElementById("Agent Portion").value = 0.00;
				} else {
					document.getElementById("Broker Portion").value = parseFloat(check).toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});;
					document.getElementById("Agent Portion").value = parseFloat(Agent).toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});;
				}
			}
			var Referalrebates = Rebate + ReferralFee;
			if (isNaN(parseFloat(Agent - Referalrebates).toFixed(2))) {
				document.getElementById("NetCommission").value = '$' + (parseFloat(0))
					.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});;
			} else {
				// let a = document.getElementById('Total').value.replace(/,/g, '').replace('$', '');
				let b = document.getElementById('SplitResult').value.replace(/,/g, '');
				let c = document.getElementById('RebateResult').value.replace(/,/g, '');
				let d = document.getElementById('ReferralResult').value.replace(/,/g, '');
				if((total-b-c-d)>=0){
					document.getElementById("NetCommission").value = '$ ' + (parseFloat(total - b - c - d))
					.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});
				}else{
					document.getElementById("NetCommission").value = '$ ' + (parseFloat(0))
					.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});
				}
				
			}
		}


		function Lease() {
			document.getElementById('LeaseBtn').classList.add('activeButton');
			document.getElementById('SaleBtn').classList.remove('activeButton');

			document.getElementById('PriceRange').max = 10000;
			document.getElementById('PriceRange').step = 100;
			document.getElementById('PriceRange').value = 0.00;
			document.getElementById('Price').value = '';

			document.getElementById('CommissionPercentage').max = 100;
			document.getElementById('CommissionPercentage').step = 1;
			document.getElementById('CommissionPercentage').value = 0.00;
			document.getElementById('Commission').value = '0.00';
			document.getElementById('CommissionPercent').value = '';

			document.getElementById('Rebates').value = '0.00';
			document.getElementById('RebatesRange').value =0;
			document.getElementById('Referral').value = '0.00';
			document.getElementById('ReferralRange').value =0;
			document.getElementById('ReferralResult').value = '0.00';
			document.getElementById('RebateResult').value = '0.00';



			document.getElementById('saleInputMax').innerHTML = '$10,000';
			document.getElementById('comissionInputMax').innerHTML = '100.00%';

			myRangeFuncCom()
			myRangeFuncRef();
			myRangeFuncRebate();
			myRangeFuncPrice();

			Calculation();
		}

		function Sale() {
			document.getElementById('SaleBtn').classList.add('activeButton');
			document.getElementById('LeaseBtn').classList.remove('activeButton');

			document.getElementById('PriceRange').max = 10000000;
			document.getElementById('PriceRange').step = 100000;
			document.getElementById('PriceRange').value = 0.00;
			document.getElementById('Price').value = '';

			document.getElementById('CommissionPercentage').max = 5;
			document.getElementById('CommissionPercentage').step = 0.1;
			document.getElementById('CommissionPercentage').value = 0;
			document.getElementById('Commission').value = '0.00';
			document.getElementById('CommissionPercent').value = '';

			document.getElementById('Rebates').value = '0.00';
			document.getElementById('RebatesRange').value = 0.00;
			document.getElementById('Referral').value = '0.00';
			document.getElementById('ReferralRange').value = 0.00;
			document.getElementById('ReferralResult').value = '0.00';
			document.getElementById('RebateResult').value = '0.00';

			document.getElementById('saleInputMax').innerHTML = '$10M';
			document.getElementById('comissionInputMax').innerHTML = '5.00%';

			myRangeFuncCom()

			myRangeFuncRef();
			myRangeFuncRebate();
			myRangeFuncPrice();

			Calculation();
		}

		function addlimitsRebateReferral(maxlimitid, fieldID, secondfieldID) {
			var maxlimit;
			var minlimit = 0;
			var val1, val2;
			var value = parseFloat(document.getElementById(fieldID).value.replace(/,/g, ''));
			maxlimit = document.getElementById(maxlimitid).value.replace(/,/g, '');

			if (value > (maxlimit - document.getElementById(secondfieldID).value)) {
				val1 = (maxlimit - document.getElementById(secondfieldID).value)
					.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});
				document.getElementById(fieldID).value = val1;

				document.getElementById(secondfieldID).value = (maxlimit - document.getElementById(fieldID).value)
					.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					});


			} else if (value < minlimit) {
				document.getElementById(fieldID).value = minlimit;

			}
		}

		function recalculate(id1, id2) {
			document.getElementById(id1).value = document.getElementById(id2).value.replace(/,/g, '');
			Calculation();
		}

		function recalculatewithCommas(id1, id2) {
			document.getElementById(id1).value = parseFloat(document.getElementById(id2).value).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			Calculation();
		}

		function recalculateSum(id1, id2, idPercent) {
			let Price = parseFloat(document.getElementById("Price").value.replace(/,/g, ''));
			let val2 = document.getElementById(id2).value;
			let Percent = document.getElementById(idPercent);
			Percent.value = parseFloat(document.getElementById(id2).value).toFixed(2);
			document.getElementById(id1).value = parseFloat(val2 * Price / 100).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			Calculation();
		}

		function recalculateSumBack(id1, id2) {
			let Price = document.getElementById("Price").value.replace(/,/g, '');
			let val2 = document.getElementById(id2).value.replace(/,/g, '');
			document.getElementById(id1).value = parseFloat(val2 / Price * 100).toFixed(2).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			Calculation();
		}

		function recalculateCom(id1, id2, id3) {
			let Price =(parseFloat(document.getElementById("Commission").value.replace(/,/g, '')) - parseFloat(document.getElementById('SplitResult').value.replace(/,/g, ''))).toFixed(2);
			let val2 = document.getElementById(id2).value.replace(/,/g, '');
			if (isNaN(Price)) {
				document.getElementById(id1).value = '0.00'.toLocaleString(undefined, {
					minimumFractionDigits: 2, maximumFractionDigits: 2
				});
			} else {
				document.getElementById(id1).value = parseFloat(val2 * Price / 100).toLocaleString(undefined, {
					minimumFractionDigits: 2, maximumFractionDigits: 2
				});
			}
			Calculation();
		}

		function recalculateComBack(id1, id2) {
			let Price = document.getElementById("Commission").value.replace(/,/g, '');
			var r1 = parseFloat(document.getElementById('Rebates').value.replace(/,/g, ''));
			var rr1 = document.getElementById('RebatesRange');
			var r2 = parseFloat(document.getElementById('Referral').value.replace(/,/g, ''));
			var rr2 = document.getElementById('ReferralRange');

			rr1.value = parseFloat(r1 / Price * 100).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});
			rr2.value = parseFloat(r2 / Price * 100).toLocaleString(undefined, {
				minimumFractionDigits: 2, maximumFractionDigits: 2
			});

			// let val2 = document.getElementById(id2).value.replace(/,/g, '');
			// document.getElementById(id1).value = parseFloat(val2 / Price * 100).toFixed(2).toLocaleString(undefined, {
			// 	minimumFractionDigits: 2, maximumFractionDigits: 2
			// });
			myRangeFuncRef();
			myRangeFuncRebate();

			Calculation();
		}

		function splitChange(){
			copydata('Referral', 'ReferralResult');
			copydata('Rebates', 'RebateResult');
			Calculation();
		}

	</script>

	<script type="text/javascript" charset="utf-8">
		var myRange = document.querySelector('#ReferralRange');
		var myRange2 = document.querySelector('#RebatesRange');
		var myRange3 = document.querySelector('#CommissionPercentage');
		var myRangePrice = document.querySelector('#PriceRange');

		var myValue = document.querySelector('#myValue');
		var myValue2 = document.querySelector('#myValueRebates');
		var myValue3 = document.querySelector('#myValueComission');
		var myUnits = '%';

		var off = myRange.offsetWidth / (parseInt(myRange.max) - parseInt(myRange.min));
		var off2 = myRange2.offsetWidth / (parseInt(myRange2.max) - parseInt(myRange2.min));
		var off3 = myRange3.offsetWidth / (parseInt(myRange3.max) - parseInt(myRange3.min));
		var px = ((myRange.valueAsNumber - parseInt(myRange.min)) * off) - (myValue.offsetParent.offsetWidth / 2);
		var px2 = ((myRange2.valueAsNumber - parseInt(myRange2.min)) * off2) - (myValue2.offsetParent.offsetWidth / 2);
		var px3 = ((myRange3.valueAsNumber - parseInt(myRange3.min)) * off2) - (myValue3.offsetParent.offsetWidth / 2);

		myValue.parentElement.style.visibility = 'hidden';
		myValue2.parentElement.style.visibility = 'hidden';
		myValue3.parentElement.style.visibility = 'hidden';
		myValue.parentElement.style.left = px + 16 + 'px';
		myValue2.parentElement.style.left = px2 + 16 + 'px';
		myValue3.parentElement.style.left = px3 + 16 + 'px';

		myValue.parentElement.style.top = myRange.offsetHeight * 4 + 'px';
		myValue2.parentElement.style.top = myRange2.offsetHeight * 4 + 'px';
		myValue3.parentElement.style.top =  myRange3.offsetHeight * 4 + 'px';

		myValue.innerHTML = myRange.value + ' ' + myUnits;
		myValue2.innerHTML = myRange2.value + ' ' + myUnits;
		myValue3.innerHTML = myRange3.value + ' ' + myUnits;

		myRange.oninput = function () {
			myRangeFuncRebate();
			recalculateCom('Referral', 'ReferralRange');
			copydata('Referral', 'ReferralResult');
			copydata('Rebates', 'RebateResult');
			Calculation();
		};

		function myRangeFuncRebate() {
			checkMaxRebateReferral('RebatesRange', 'ReferralRange', 'Rebates', 'Referral');

			myValue.parentElement.style.visibility = 'visible';
			let px = ((myRange.valueAsNumber * 0.9 - parseInt(myRange.min)) * off) - (myValue.offsetWidth / 2);
			myValue.innerHTML = myRange.value + ' ' + myUnits;

			myValue.parentElement.style.left = px*1.05 + 8 + 'px';
			myRange.style.backgroundSize = (myRange.value - myRange.min) * 100 / (myRange.max - myRange.min) + '% 100%';

		}

		function myRangeFuncCom() {
			if(document.getElementById('SaleBtn').classList.contains('activeButton')){
				var val = 18;
				var val2 = 8;
			}else{
				var val = 1;
				var val2 = 8;
			}
			let px3 = ((myRange3.valueAsNumber * val - parseInt(myRange3.min)) * off) - (myValue3.offsetWidth / 2);
			myValue3.innerHTML = myRange3.value + ' ' + myUnits;

			myValue3.parentElement.style.left = px3*1.05 + val2 + 'px';
			myRange3.style.backgroundSize = (myRange3.value - myRange3.min) * 100 / (myRange3.max - myRange3.min) + '% 100%';

			myValue3.parentElement.style.visibility = 'visible';

		}

		function myRangeFuncRef() {
			checkMaxRebateReferral('ReferralRange', 'RebatesRange', 'Referral', 'Rebates');
						
			myValue2.parentElement.style.visibility = 'visible';
			let px2 = ((myRange2.valueAsNumber * 0.9 - parseInt(myRange2.min)) * off2) - (myValue2.offsetWidth / 2);
			myValue2.innerHTML = myRange2.value + ' ' + myUnits;

			myValue2.parentElement.style.left = px2*1.05 + 8 + 'px';
			myRange2.style.backgroundSize = (myRange2.value - myRange2.min) * 100 / (myRange2.max - myRange2.min) + '% 100%';

		}

		function myRangeFuncPrice() {
			myRangePrice.style.backgroundSize = (myRangePrice.value - myRangePrice.min) * 100 / (myRangePrice.max - myRangePrice.min) + '% 100%';
		}

		myRange2.oninput = function () {
			myRangeFuncRef();
			recalculateCom('Rebates', 'RebatesRange');
			copydata('Referral', 'ReferralResult');
			copydata('Rebates', 'RebateResult');
			Calculation();
		};


		myRange3.oninput = function () {
			myRangeFuncCom();
			recalculateSum('Commission', 'CommissionPercentage', 'CommissionPercent');
			copydata('Referral', 'ReferralResult');
			copydata('Rebates', 'RebateResult');
			Calculation();
		};

		myRangePrice.oninput = function(){
			recalculatewithCommas('Price', 'PriceRange');  
			Calculation();
			myRangeFuncPrice();
			recalculateSum('Commission', 'CommissionPercentage', 'CommissionPercent');

		}

		function copydata(id,id2){
			if(isNaN(document.getElementById(id).value.replace(/,/g, '')) || document.getElementById(id).value == ''){
				document.getElementById(id2).value =parseFloat(0).toFixed(2);
			}else{
				document.getElementById(id2).value = document.getElementById(id).value.toLocaleString(undefined, {
							minimumFractionDigits: 2, maximumFractionDigits: 2
						});;
			}
		}; 
		
		function checkMaxRebateReferral(id1, id2, id3, id4) {

			var com = document.getElementById('Commission').value;
			var Roller = document.getElementById(id1);
			var Changer = document.getElementById(id2);

			if (Roller.value > 100 - Changer.value) {
				Changer.value = 100 - Roller.value;
			}

		}

		function checkMaxRebateReferralInput(id1, id2) {

			var com = document.getElementById('SplitResult').value.replace(/,/g, '');
			var total = document.getElementById('Total').value.replace(/,/g, '').replace('$', '');
			var Roller = document.getElementById(id1);
			var val1 = document.getElementById(id1).value.replace(/,/g, '');
			var Changer = document.getElementById(id2);
			var val2 = document.getElementById(id2).value.replace(/,/g, '');

			if (parseFloat(val1) > parseFloat(total - com - val2)) {
				if (parseFloat(val1) > parseFloat(total - com)) {
					Roller.value = (parseFloat(total - com).toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					}));
					document.getElementById(id2).value = ('0'.toLocaleString(undefined, {
						minimumFractionDigits: 2, maximumFractionDigits: 2
					}));
					// Changer.value = ((0).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2}));
				} else {
					if (val1 <= (total -com)) {
						Changer.value = (parseFloat(total - com) - parseFloat(val1)).toLocaleString(undefined, {
							minimumFractionDigits: 2, maximumFractionDigits: 2
						});
					} else {
						Changer.value = (0).toLocaleString(undefined, {
							minimumFractionDigits: 2, maximumFractionDigits: 2
						});
					}

				}
			} 

			copydata('Referral', 'ReferralResult');
			copydata('Rebates', 'RebateResult');
		}
	</script>

	<script>
		checkNavBar();
		BORhideShow(1);
	</script>



</body>

</html>