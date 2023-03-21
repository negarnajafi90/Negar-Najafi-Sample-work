<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<script>
	// window.onpageshow = function (event) {
	// 	  if (event.persisted) {
	// 	    window.location.reload(); //reload page if it has been loaded from cache
	// 	  }
	// 	};
</script>


<%


int UserID=0;//(int)session.getAttribute("Userid") ;

int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
   
String Type="0";//(String)session.getAttribute("Type") ;

String Email="";//(String)session.getAttribute("Email") ;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../NoPermission.jsp");

	return;

}else{
	
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

%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Scripts to add jQuerry and bootrstrap -->
	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>
	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css">

	<!-- Our scripts/css -->
	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">
	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">
	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">
	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">
	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">
	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">
	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<title>Agents and Admins - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

</head>

<header>


</header>

<body>

	<script type="text/javascript">
		$(function () {
			$('#DateOfBirth').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#StartDate').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#AnniversaryDate').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#DateOfAgent').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

		});
	</script>

	<div style='display: flex'>
		<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

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

			<a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks active active"><img
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
					class="dashboardIcons accept rotate180 openClose " src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>


		</div><!-- Closing left-Nav-bar-Menu -->


		<div id="BrokerPersonalDetail" class="Rightcolumn marginBody navBarMovable"
			style="overflow: auto;  margin-right: 0;     max-width: 700px;">

			<div class="navTop flexibleContainer" id="TopNavButtons">
				<a class="menubartext flexible" href="CompanyProfile.jsp"><button
						class="topGrey topbutton">COMPANY</button></a>
				<a class="menubartext flexible" href="PersonalProfile.jsp"><button class="topGrey topbutton">MY
						PROFILE</button></a>
				<a class="menubartext flexible" href="AgentsandAdmins.jsp"><button class="topBlue topbutton">AGENTS &
						ADMINS</button></a>
			</div><!-- Closing TopNavButtons -->

			<div class="dropdown1 dispNone" id="newDealAgentDropdown">
				<em class="arrow"></em>
				<div class="dropdown-content1">

					<a class="menubartext" href="NewDeal.jsp"><button class="tablinks"><span class="">+ New
								Deal</span></button></a>

					<a class="menubartext" href="AddNewContact.jsp"><button class="tablinks"><span class="">+ New
								Contact</span></button></a>

					<a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span class="">+ New
								User</span></button></a>
				</div>
			</div>


			<!-- <%

			/*	int Id=(Integer)session.getAttribute("Userid");

				System.out.println("ID is"+" "+Id);

				//int UserID=Integer.parseInt(Id);

				Users MyInformation=new Users();

				RDSFunctions RDS =new RDSFunctions();

				MyInformation=RDS.GetBrokerById(Id);*/


				%> -->


			<div id="CompanyTabs" class="PartiesNavBar flexibleContainer" style='margin-top: 14px;'>

				<button id="PersonalDetailsDetailsTab" class="tablinks2 flexible active"
					onclick="TabsHandleler(event,'PersonalDetails','tabcontent','tablinks2','PersonalDetailsDetailsTab'); ">Personal
					Details</button>

				<button id="Commissions&DisclosureTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Commissions&Disclosure', 'tabcontent', 'tablinks2', 'Commissions&DisclosureTab'); ">Commissions
					& Disclosure</button>

				<button id="Tax&BankingTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Tax&Banking','tabcontent', 'tablinks2', 'Tax&BankingTab'); "> Tax &
					Banking
				</button>

				<button id="AccessTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'StatusAndNotes','tabcontent', 'tablinks2', 'AccessTab'); ">Status And
					Notes</button>

				<button id="AuditTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'AuditTrail','tabcontent', 'tablinks2', 'AuditTab'); ">Audit
					Trail</button>

			</div>


			<form name="BrokerInfo" method="post" action="" enctype="multipart" style="width: 100%;">

				<div class="flexibleContainer NewSectionSmall">
					<div class="flexible">
						<label class="MandentorySign"></label><label>Agent</label>
						<div class="custom-select">
							<select class="inputSelection" id="ChosenAgent" name="ChosenAgent">
								<option value="">-- Please choose an option --</option>
								<option value="Agent1">Agent1</option>
								<option value="Agent2">Agent2</option>
							</select>
						</div>
					</div>
					<div class="flexible"></div>
				</div>

				<div id="PersonalDetails" class="tabcontent">

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label><label>Title</label>

							<input class="inlineInput" type="text" id="Firstname" name="Firstname" maxlength="10" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>First Name</label>

							<input class="inlineInput" type="text" id="Firstname" name="Firstname" maxlength="45" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Last Name</label>

							<input class="inlineInput" type="text" id="Lastname" name="Lastname" maxlength="45" />

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="NoMandatoryTwo"></label><label>PREC</label>

							<input class="inlineInput" type="text" id="PREC" name="PREC" maxlength="60" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Date of Birth</label>

							<!-- <input class="inlineInput" type="date" id="DateOfBirth" name="DateOfBirth" value="" > -->

							<div class="input-group">
								<input id="DateOfBirth" name="DateOfBirth" type="text" class="form-control date-input"
									placeholder="DD MM YYYY" readonly="readonly" />
								<label class="input-group-btn" for="DateOfBirth" id="DateOfBirthLabel">
									<span class="btn btn-default">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</label>
							</div>

						</div>

					</div>


					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="NoMandatoryTwo">Unit</label>

							<input class="inlineInput" type="text" id="CompanyUnitNumber" name="CompanyUnitNumber"
								maxlength="10" value="" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Number</label>

							<input class="inlineInput" type="text" id="CompanyStreetNumber" maxlength="10"
								name="CompanyStreetNumber" value="" />
						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Name</label>

							<input class="inlineInput" type="text" id="CompanyStreetName" name="CompanyStreetName"
								maxlength="40" value="" />
						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label><label>City</label>

							<input class="inlineInput" type="text" id="CompanyCity" name="CompanyCity" maxlength="30"
								value="" />

						</div>

						<div class="flexible ">

							<label class="MandentorySign"></label><label>Province</label>

							<div class="custom-select">

								<select class="inputSelection" id="CompanyProvince" name="CompanyProvince">

									<option value="ON" selected>ON</option>

									<option value="ON">ON</option>

									<option value="AB">AB</option>

									<option value="BC">BC</option>

									<option value="MB">MB</option>

									<option value="NB">NB</option>

									<option value="NL">NL</option>

									<option value="NT">NT</option>

									<option value="NS">NS</option>

									<option value="NU">NU</option>

									<option value="ON">ON</option>

									<option value="PE">PE</option>

									<option value="QC">QC</option>

									<option value="SK">SK</option>

									<option value="YT">YT</option>

								</select>

							</div>

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Postal Code</label>

							<input class="inlineInput" id="CompanyPostalcode" name="CompanyPostalcode" maxlength="11"
								value="" onblur="postalCorrect(this.id)">
						</div>

					</div>

					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="MandentorySign"></label><label>E-Mail</label>

							<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp"
									width="16" height="16"><span class="tooltiptext">Enter an email which will be
									included in a brokerage invoice.</span></span>

							<input class="inlineInput" type="text" id="CompanyEmail" name="CompanyEmail" maxlength="50"
								value="">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Phone</label>

							<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp"
									width="16" height="16"><span class="tooltiptext">Enter a phone number which will be
									included in a brokerage invoice.</span></span>

							<input class="inlineInput" type="text" id="CompanyPhone" name="CompanyPhone" maxlength="14"
								value="" onkeydown="phoneNumberFormatter(this.id)"
								onchange="phoneNumberFormatterAfter(this.id);" />
						</div>
					</div>


					<%-- <div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="NoMandatoryTwo">Unit</label>

							<input class="inlineInput" type="text" id="Unit" name="Unit" maxlength="10">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Number</label>

							<input class="inlineInput" type="text" id="StreetNumber" name="StreetNumber" maxlength="10">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Name</label>

							<input class="inlineInput" type="text" id="StreetName" name="StreetName"  maxlength="40">

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label><label>City</label>

							<input class="inlineInput" type="text" id="City" name="City"  maxlength="30">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Postal Code</label>

							<input class="inlineInput" type="text" id="PostalCode" name="PostalCode"  maxlength="11">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Province</label>

							<div class="custom-select">

								<select class="inputSelection" id="Province" name="Province">

									<option value="ON">ON</option>

									<option value="AB">AB</option>

									<option value="BC">BC</option>

									<option value="MB">MB</option>

									<option value="NB">NB</option>

									<option value="NL">NL</option>

									<option value="NT">NT</option>

									<option value="NS">NS</option>

									<option value="NU">NU</option>

									<option value="ON">ON</option>

									<option value="PE">PE</option>

									<option value="QC">QC</option>

									<option value="SK">SK</option>

									<option value="YT">YT</option>

									<option value="Other">Other</option>

								</select>

							</div>

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Country</label>

							<input class="inlineInput" type="text" id="Country" name="Country" maxlength="20">

						</div>

					</div>

					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="MandentorySign"></label><label>E-mail</label>

							<input class="inlineInput" type="text" id="E-mail" name="E-mail"  maxlength="20">

						</div>

					</div> --%>

					<%-- <div class="flexibleContainer">


						<div class="flexible">

							<label class="MandentorySign"></label><label>Phone</label>

							<input class="inlineInput" type="text" id="Phone" name="Phone" maxlength="14">

						</div>

						<div class="flexible">

							<label class="NoMandatoryTwo">Mobile</label>

							<input class="inlineInput" type="text" id="MobileNumber" name="MobileNumber" maxlength="14">

						</div>


					</div>

					<div id="PersonalDetailsButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">
		
									<button type="submit" id="SaveButtom"
										onclick="alert(2);">Save</button>
		
							</span>
		
						</div>

					</div><!-- Closing PersonalDetailsButtonsSection --> --%>


				</div><!-- Closing PersonalDetails -->

				<!------------------------------------------------------------------------------------------------------------------------------------------->

				<div id="Commissions&Disclosure" class="tabcontent">

					<div id="Commission Structure" style="Width:100%;">
						<div class="flexibleContainer" id="DivContent1">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Anniversary Date</label>

								<div class="input-group">
									<input id="AnniversaryDate" name="AnniversaryDate" type="text"
										class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
									<label class="input-group-btn" for="AnniversaryDate" id="AnniversaryDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Start Date</label>

								<div class="input-group">
									<input id="StartDate" name="StartDate" type="text" class="form-control date-input"
										placeholder="DD MM YYYY" readonly="readonly" />
									<label class="input-group-btn" for="StartDate" id="StartDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>

								<!-- <input class="inlineInput" disabled type="date" id="StartDate" name="StartDate" value=""> -->

							</div>

						</div><!-- Closing DivContent1 -->

						<div class="flexibleContainer NewSection">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Commission Split</label>

								<input class="inlineInput" disabled type="text" id="CommissionSplit1"
									name="CommissionSplit1" maxlength="8">

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Commission Cap</label>

								<input class="inlineInput" type="text" id="CommissionCap1" name="CommissionCap1"
									maxlength="10" />

							</div>



						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Second CommissionSplit</label>

								<input class="inlineInput" type="text" id="CommissionSplit2" name="CommissionSplit2"
									maxlength="8">

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Second Commission Cap</label>

								<input class="inlineInput" type="text" id="CommissionCap2" name="CommissionCap2"
									maxlength="10" />
							</div>

						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Third Commission Split</label>

								<input class="inlineInput" type="text" id="CommissionSplit3" name="CommissionSplit3"
									maxlength="8">
							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Third Commission Cap</label>

								<input class="inlineInput" type="text" id="CommissionCap3" name="CommissionCap3"
									maxlength="10" />
							</div>

						</div>

					</div><!-- Closing Commission Structure -->

					<div id="DisclosureSection" class="NewSection">
						<label class="HeadLinesSecondary" style="margin-left: 8px;">Disclosures</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<p>Disclosures</p>
					</div>

					<div id="Commissions&DisclosureButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">

								<button type="submit" id="SaveButtom" onclick="">Save</button>

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Commissions&Disclosure -->

				<div id="Tax&Banking" class="tabcontent" style="display: none;">

					<div id="MainTax&Banking" class="NewSectionSmall">

						<p id="ErrorEmpty2" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<div class="flexibleContainer" id="HSTSection">

							<div class="flexible ">
								<label class="MandentorySign"></label><label>HST Number</label>
								<div class="flexibleContainer" id="HSTSectionDiv">
									<input class="inlineInput flexible" type="text" id="CompanyHSTNumber" maxlength="9"
										name="CompanyHSTNumbere" value="" placeholder="123456789">
									<label class="flexible" for="" style="flex: 0.1; margin-top: 6px; ">RT</label>
									<input class="inlineInput flexible" style="flex: 0.5;" placeholder="0001"
										type="text" maxlength="4" id="CompanyHSTNumberRT" name="CompanyHSTNumbereRT"
										value=""></div>
							</div>

							<div class="flexible" style="flex: 2.2;"></div>

						</div>

						<div id="FirstRealEstateTrust" class="NewSectionMedium">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Real Estate Trust</label>

							<span id="PurcharerProcess" class="floatDataRightSide">
								<span class="tooltip">
									<img src="../ImagesUsed/AddSVG.svg" style="margin-top: 5px;"
										class="lineButton manageListButton" alt="+" type="button"
										onclick="AddTrust();"><span class="tooltiptext">Add Second Real Estate
										Trust</span>
								</span>
							</span>

							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">
								<div class="flexible">
									<label class="NoMandatory"></label><label>Bank Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber"
										maxlength="18" name="RealEstateTrustCompanyBankNumber" value="">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Transit Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber"
										maxlength="5" name="RealEstateTrustCompanyTransitNumber" value="">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Account Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber"
										maxlength="18" name="RealEstateTrustCompanyAccountNumber" value="">
								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>
									<input class="inlineInput" type="file" id="RealEstateTrustCompanyCheque"
										name="RealEstateTrustCompanyCheque">
									<br>
									<img alt="cheque" class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>
							</div>


						</div><!-- Closing FirstRealEstateTrust -->

						<div id="SecondRealEstateTrust" class="NewSectionMedium" style="display: none;">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Second Real Estate Trust</label>

							<span id="PurcharerProcess" class="floatDataRightSide">
								<span class="tooltip">
									<img src="../ImagesUsed/DeleteB.png" style="margin-top: 5px; cursor: pointer;"
										class="lineButton manageListButton" alt="+" type="button"
										onclick="RemoveTrust();"><span class="tooltiptext">Remove Real Estate
										Trust</span>
								</span>
							</span>

							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Name</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountName2"
										maxlength="60" name="RealEstateTrustCompanyAccountName2" value="">
								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Nick Name</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNickName2"
										maxlength="60" name="RealEstateTrustCompanyAccountNickName2" value="">
								</div>
							</div>

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Bank Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber2"
										maxlength="18" name="RealEstateTrustCompanyBankNumber2" value="">
								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Transit Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber2"
										maxlength="5" name="RealEstateTrustCompanyTransitNumber2" value="">
								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Number</label>
									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber2"
										maxlength="18" name="RealEstateTrustCompanyAccountNumber2" value="">
								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>
									<input type="file" id="RealEstateTrustCompanyCheque2"
										name="RealEstateTrustCompanyCheque2">
									<img alt="cheque" class="chequeImg" src="../ImagesUsed/Cheque.png">
								</div>

							</div>

						</div><!-- Closing SecondRealEstateTrust -->


						<div id="CommissionTrust" class="NewSectionMedium">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Commission Trust</label>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Bank Number</label>
									<input class="inlineInput" type="text" id="CommissionTrustCompanyBankNumber"
										maxlength="18" name="CommissionTrustCompanyBankNumber" value="">
								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Transit Number</label>
									<input class="inlineInput" type="text" id="CommissionTrustCompanyTransitNumber"
										maxlength="5" name="CommissionTrustCompanyTransitNumber" value="">
								</div>


								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Number</label>
									<input class="inlineInput" type="text" id="CommissionTrustCompanyAccountNumber"
										maxlength="18" name="CommissionTrustCompanyAccountNumber" value="">
								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>
									<input class="inlineInput" type="file" id="CommissionTrustCompanyCheque"
										name="CommissionTrustCompanyCheque">
									<img alt="cheque" class="chequeImg" src="../ImagesUsed/Cheque.png">
								</div>

							</div>

						</div><!-- Closing CommissionTrust -->

						<div id="GeneralAccount" class="NewSectionMedium">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">General Account</label>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="NoMandatory"></label><label>Bank Number</label>
									<input class="inlineInput" type="text" id="GeneralAccountCompanyBankNumber"
										maxlength="18" name="GeneralAccountCompanyBankNumber" value="">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Transit Number</label>
									<input class="inlineInput" type="text" id="GeneralAccountCompanyTransitNumber"
										maxlength="5" name="GeneralAccountCompanyTransitNumber" value="">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Account Number</label>
									<input class="inlineInput" type="text" id="GeneralAccountCompanyAccountNumber"
										maxlength="18" name="GeneralAccountCompanyAccountNumber" value="">
								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>
									<input type="file" id="GeneralAccountCompanyCheque"
										name="GeneralAccountCompanyCheque">
									<img alt="cheque" class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>
							</div>

						</div><!-- Closing GeneralAccount -->


					</div><!-- Closing MainTax&Banking -->

					<div id="Tax&BankingButtonSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="buttonDiscard floatDataLefttSide">
								<button style="display: none;" type="button" id="Discard">Discard</button></span>

							<span class="secondSpan ">

								<button class="dropBtn" type="button" id="SaveButtom3" name="SaveButtom3">Save</button>

							</span>

						</div>

					</div><!-- Closing Tax&BankingButtonSection -->

				</div>
		

		<%-- <div id="Tax&Banking" style="Width:100%;" class="tabcontent">

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>HST Number</label>

							<input class="inlineInput" type="text" id="HSTNumber" name="HSTNumber" value=""
								maxlength="15">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>SIN Number</label>

							<input class="inlineInput" type="text" id="SinNumber" name="SinNumber" value=""
								maxlength="9">

						</div>

					</div>


					<div class="NewSectionCopy">

						<label class="container"><input class="inlineInput" onclick="" type="checkbox" id=""
								name="CopyAddress1">
							<span class="checkmark"></span></label>

						<label id="" class="copyButton" style="margin-left: 16px;">Add Direct Deposit</label>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Bank Number</label>

							<input class="inlineInput" type="text" id="Bank" name="Bank" value="" maxlength="18" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Transit</label>

							<input class="inlineInput" type="text" id="Transit" name="Transit" value="" maxlength="5">
						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Number</label>

							<input class="inlineInput" type="text" id="AccountNumber" name="AccountNumber"
								maxlength="18">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Name</label>

							<input class="inlineInput" type="text" id="AccountName" name="AccountName" maxlength="60">

						</div>

					</div>



					<div id="void" class="NewSectionMedium" style="width:100%;">

						<div class="flexibleContainer">

							<div class="left flexible">

								<label style="border-width: 1px; height: 40px;" for="VoidCheque"
									class="custom-file-upload inlineInput">

									<img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;">

									<label style="text-align: left; position: absolute; margin-left: 20px;">Upload void
										cheque</label>

								</label>

								<input class="inlineInput" type="file" id="VoidCheque" name="VoidCheque" value="">

							</div>

							<div class="flexible">

								<label style="border-width: 1px; height: 40px;" for="VoidCheque"
									class="custom-file-upload inlineInput">
									<img src="../ImagesUsed/Cheque.png" alt="" style="float: right">
									<label style="float: right;  margin-top: 7px; margin-right: 10px;">Uploaded <span
											id="todayDate"></span></label>

								</label>

							</div>
						</div>

					</div><!-- Closing Void -->

					<script>
						var utc = new Date().toJSON().slice(0, 10).replace(/-/g, '/');
						document.getElementById('todayDate').innerHTML = utc;
					</script>

					<label class="HeadLinesSecondary NewSection" style="margin-left: 8px;">Tax Slips</label>

					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

					<div class="Slips NewSectionSmall">

						<div class="flexibleContainer">

							<div class="flexible heavyfont" style="margin-left: 8px;"> 2020 T4A</div>

							<div class="flexible" style="margin-right: 10px;"><label
									style="margin-top: 0; width: 100%; text-align: right;">Uploaded
									<span id="todayDate2">Feb 1, 2021</span></label></div>

							<div class="flexible" style="    flex: 0.15; margin-top: 2px; margin-right: 16px; "><img
									src="../ImagesUsed/Cheque.png" alt="" style="float: right"></div>

						</div>

						<div class="flexibleContainer">

							<div class="flexible heavyfont" style="margin-left: 8px;">2019 T4A</div>

							<div class="flexible" style="margin-right: 10px;"><label
									style="margin-top: 0; width: 100%; text-align: right;">Uploaded
									<span id="todayDate2">Feb 1, 2021</span></label></div>

							<div class="flexible" style="    flex: 0.15; margin-top: 2px; margin-right: 16px; "><img
									src="../ImagesUsed/Cheque.png" alt="" style="float: right"></div>

						</div>

					</div>




					<div id="Tax&BankingButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">

								<button type="submit" id="SaveButtom" onclick="alert(2);">Save</button>

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Tax&Banking --> --%>



		<div id="StatusAndNotes" class="tabcontent">

			<div id="StatusMainSection">

				<div class="flexibleContainer">

					<div class="flexible">

						<label class="MandentorySign"></label><label>Status</label>

						<div class="custom-select">

							<select class="inputSelection" id="ChosenAgent" name="ChosenAgent">

								<option value="">-- Please choose an option --</option>

								<option value="Agent1">On Leave</option>

								<option value="Agent2">Terminated</option>

							</select>
						</div>

					</div>

					<div class="flexible"></div>

				</div>

				<div class="flexibleContainer NewSectionSmall">

					<div class="flexible">

						<label class="MandentorySign"></label><label>Date of </label>

						<div class="input-group">
							<input id="DateOfAgent" name="DateOfAgent" type="text" class="form-control date-input"
								placeholder="DD MM YYYY" readonly="readonly" />
							<label class="input-group-btn" for="DateOfAgent" id="DateOfAgentLabel">
								<span class="btn btn-default">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</label>
						</div>

					</div>

					<div class="flexible"></div>

				</div>

				<hr class="NewSectionMedium" style="color:#054d6a; margin-right: 4px;">

				<p id="statusAvailable" class="Notification">
					The user will not be available to log into their account until their return date.</p>

				<p id="statusAvailable" class="Notification">
					The user will not be available to log into their account after their termination date.</p>

				<label class="HeadLinesSecondary NewSectionMedium" for="">Notes</label><br>

				<textarea class="NewSectionSmall" name="" id=""
					style="width: calc(100% - 25px); resize: vertical; height: 170px; padding: 10px;"></textarea>


				<!-- <span>

							<div class="NewSectionCopy">

								<label class="container"><input class="inlineInput" onclick="" type="checkbox"
										id="PersonalInformationConfirmation" name="PersonalInformationConfirmation">
									<span class="checkmark" style="top: 16px; left: 8px;"></span></label>

								<label id="CopyPropertyAddress1" class="copyButton" style="margin-left: 22px;">I confirm
									that my profile information is accurate and up to date</label>

							</div>

						</span> -->

				<!-- <label>Audit Trail</label>

						<hr>

						<table>

							<tr>
								<td>Profile Created by Broker</td>

								<td>date</td>
							<tr>


						</table> -->

			</div><!-- Closing AccessMainSection -->

			<div id="AccessButtonsSection" class="FooterButton">

				<div class="FooterButtonSpan">

					<span class="secondSpan ">

						<button type="submit" id="SaveButtom" onclick="alert(2);">Save</button>

					</span>

				</div>

			</div><!-- Closing AccessButtonsSection -->

		</div><!-- Closing Access -->

		<div id="AuditTrail" class="tabcontent">

			<div id="AuditMainSection">

				<div id="AuditTrail" class="NewSectionMedium">

					<label class="HeadLinesSecondary" style="margin-left: 8px;">Audit Trail</label>
					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

					<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Audit Trail</label>

							</div> -->

					<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->




					<table id="AuditTable" style="width: calc(100% + 4px); margin-top: 30px; margin-left: -8px;">

						<tbody>
							<tr style="    height: 30px !important;">

								<th width="50%" class="underLine" style="text-align: left; padding-left: 16px;">
									Designated Broker of Record</th>

								<th width="25%" class="underLine" style="text-align: center">Start</th>


								<th width="25%" class="underLine headlineright" style="text-align: center;">End
								</th>

							</tr>

							<tr id="" class="newclass">

								<td><input class="inlineInput" id="Broker" style="padding-left: 11px;" type="text"
										value="Primary Broker of Record, Broker Brokorovich." readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

							</tr>

							<tr id="">

								<td><input class="inlineInput" id="Broker" style="padding-left: 11px;" type="text"
										value="" readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

							</tr>

							<tr id="" class="newclass">

								<td><input class="inlineInput" id="Broker" style="padding-left: 11px;" type="text"
										value="Primary Broker of Record, Broker Brokorovich." readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

								<td><input class="inlineInput" style="text-align: center;" id="" value="01-Jan-21"
										readonly=""></td>

							</tr>



						</tbody>
					</table>




				</div>

				<!-- <label class="HeadLinesSecondary NewSection" style="margin-left: 8px;">Audit Trail</label>

						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;"> -->

				<!-- <table>

							<tr>
								<th width=80%></th>
								<th></th>
							</tr>

							<tr>
								<td>Profile Created by Broker</td>

								<td>date</td>
							<tr>


						</table>  -->

				<!-- <span>

							<div class="NewSectionCopy">

								<label class="container"><input class="inlineInput" onclick="" type="checkbox"
										id="PersonalInformationConfirmation" name="PersonalInformationConfirmation">
									<span class="checkmark" style="top: 16px; left: 8px;"></span></label>

								<label id="CopyPropertyAddress1" class="copyButton" style="margin-left: 22px;">I confirm
									that my profile information is accurate and up to date</label>

							</div>

						</span> -->

				<!-- <label>Audit Trail</label>

						<hr>

						<table>

							<tr>
								<td>Profile Created by Broker</td>

								<td>date</td>
							<tr>


						</table> -->

			</div><!-- Closing AccessMainSection -->

			<div id="AccessButtonsSection" class="FooterButton">

				<div class="FooterButtonSpan">

					<span class="secondSpan ">

						<button type="submit" id="SaveButtom" onclick="alert(2);">Save</button>

					</span>

				</div>

			</div><!-- Closing AccessButtonsSection -->

		</div><!-- Closing Access -->

		</form>

	</div><!-- Closing Broker PersonalDetail -->
	</div>

	<script>
		forSelects();

		TabsHandleler(event, 'PersonalDetails', 'tabcontent', 'tablinks', 'PersonalDetailsTab');
	</script>


	<script>
		checkNavBar();
		BORhideShow(1);
	</script>


</body>

</html>