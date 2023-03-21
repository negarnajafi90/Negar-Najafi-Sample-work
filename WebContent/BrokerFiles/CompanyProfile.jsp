<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="ProMasterClasses.Companies"  %>

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

Connection con=null;

if( session.getAttribute("Userid")==null  ){
  response.sendRedirect("../NoPermission.jsp");
  return;
}else{
	 UserID=(int)session.getAttribute("Userid"); 
	
	 BrokerID=(int)session.getAttribute("Brokerid") ;
			   	   
     Type=(String)session.getAttribute("Type") ;
     
     Email=(String)session.getAttribute("Email") ;
     
     con=(Connection) session.getAttribute("Connection");
}

%>

<%

//This part is to keep track of the maximum time a user can be in active on the system and after that direct the user to the login page

//int timeout = session.getMaxInactiveInterval(); // Get the time has been set 

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%>

<%

String isBroker = "1";

//Here we are getting the information for the user

//Geting the user's information 

Companies MyCompanies=new Companies();

RDSFunctions myRDS=new RDSFunctions();

MyCompanies=myRDS.GetaCompanyBuyBrokerID(BrokerID,con);

String MyID=String.valueOf( MyCompanies.ID );	

String URL="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+MyID;	

Users MyInformation=new Users();

MyInformation=myRDS.GetAnyUserById(UserID,con);

//System.out.println("user "+UserID);
//System.out.println(BrokerID);

%>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Scripts to add jQuerry and bootrstrap -->

	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css">

	<!-- Our scripts/css -->

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<script type="text/javascript" src="../Scripts/CropImage.js"></script>

	<!-- <link rel="stylesheet" href="../CSS/ProBroker.css" type="text/css"> -->

	<!-- <link rel="stylesheet" href="../CSS/AddForms.css" type="text/css"> -->

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<title>Company Details - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

	<style>
		.logoModal {
			width: 45px;
			float: left;
			margin-top: 8px;
			margin-left: 5px;
		}

		.insideImg {
			width: 150px;
			height: 150px;
		}

		.insideWideImg {
			max-width: 150px;
			max-height: 150px;
		}

		.canvasLogoMain {
			width: 150px;
			height: 150px;
		}

	
	</style>

</head>

<header>

</header>

<body>

	<script type="text/javascript">
		$(function () {
			$('#CompanyFiscalyearend').datepicker({
				format: "dd MM"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#AlternateBrokerEndDate').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#AlternateBrokerStartDate').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});

			$('#CardClosingDate').datepicker({
				format: "dd M yyyy",
				startDate: '-10y'
				//endDate: '-1d'
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor = "lightgrey";
				document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
			});

		});
	</script>


<div style='display: flex'>
	<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

		<!-- <div class="logo" style="padding-bottom: 35px;">

			<img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"
				style="width:31px;  margin-left:16px; margin-bottom:5px;">

			<span class="navText"><img src="../ImagesUsed/MasterRe2.png" alt="MasterBroker"
					style="width:150px; margin-left:6px; margin-bottom:10px;"></span>

		</div> -->

		<div class="logo">

			<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

			<img class='img2logo' src="../ImagesUsed/MasterRe2.png?math=<%=Math.random()%>" alt="MasterRe">

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

		<a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
					src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span class="navText">Personal
					Profile</span></button></a>

		<a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks active active"><img
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

	<!-- *************************************************************************************************************  -->

	<div id="CompanyMainSection" class="Rightcolumn marginBody navBarMovable" style="overflow: auto;  margin-right: 0;     max-width: 730px;">

			<div class="dropdown1 dispNone" id="newDealAgentDropdown" style="max-width: 700px;">
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

			</div><!-- Closing newDealAgentDropdown -->

		<div id="divNumber1" style="max-width: 700px;">

			<div class="navTop flexibleContainer" id="TopNavButtons">

				<a class="menubartext flexible" href="CompanyProfile.jsp"><button class="topBlue topbutton">COMPANY</button></a>

				<a class="menubartext flexible" href="PersonalProfile.jsp"><button class="topGrey topbutton">MY PROFILE</button></a>
				<% if(isBroker == "1"){ %>
					<a class="menubartext flexible" href="AgentsandAdmins.jsp"><button class="topGrey topbutton">AGENTS & ADMINS</button></a>
				<% } %>
			</div><!-- Closing TopNavButtons -->

		</div><!-- Closing HeadButtons -->
		

		<div id="CompanyTabs" class="PartiesNavBar flexibleContainer" style="max-width: 700px;">

			<button id="CorporateDetailsTab" class="tablinks2 flexible"
				onclick="TabsHandleler(event,'CorporateDetails','tabcontent2','tablinks2','CorporateDetailsTab'); ">Company
				Details</button>

			<button id="BrokerofRecordTab" class="tablinks2 flexible"
				onclick="TabsHandleler(event,'BrokerofRecord', 'tabcontent2', 'tablinks2', 'BrokerofRecordTab'); ">Broker
				of Record</button>

			<button id="Tax&BankingTab" class="tablinks2 flexible"
				onclick="TabsHandleler(event,'Tax&Banking','tabcontent2', 'tablinks2', 'Tax&BankingTab'); "> Tax &
				Banking
			</button>

			<button id="PaymentDetailsTab" class="tablinks2 flexible" style="display: none;"
				onclick="TabsHandleler(event,'PaymentDetails','tabcontent2', 'tablinks2', 'PaymentDetailsTab'); ">Payment
				Details</button>

			<button id="UserAccessTab" class="tablinks2 flexible" style="display:none"
				onclick="TabsHandleler(event,'UserAccess','tabcontent2', 'tablinks2', 'UserAccessTab'); ">User
				Access</button>

		</div><!-- Closing CompanyTabs -->



		<iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
		
		<form id="CompanyDetailsForm" name="CompanyDetailsForm" action="../CompanyProfileUpdate" method="post" style="max-width: 700px;"
		
			enctype="multipart/form-data" target="hiddenFrame">

			<div id="myModalSaveClose" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<div class="modalHeader">Save</div>
					<p>Would you like to save your changes?</p>
					<div class="popUpContainer">
						<span class="close">No</span>
						<button class="submitButton" type="submit">Yes</button>
					</div>
				</div>

			</div>

			<div id="myModalSave" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;" alt=""><label>Document
						saved</label>
				</div>

			</div>

			<div id="CorporateDetails" class="tabcontent2">

				<p id="ErrorEmpty1" class="ErrorEmpty" style="display:none;">Complete all required fields before
					proceeding.</p>

				<div id="CorporateDetailsTabMainSection" class="NewSectionSmall">

					<div id="ContactDetails" style="Width:100%; display:inline-block; ">

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Business Name</label>

								<input class="inlineInput" type="text" id="CompanyBusinessName" maxlength="60"
									name="CompanyBusinessName" value="<%=MyCompanies.BusinessName%>">

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Fiscal Year-End</label>

								<div class="input-group">
									<input id="CompanyFiscalyearend" name="CompanyFiscalyearend" type="text"
										class="form-control date-input" placeholder="DD MM" readonly="readonly"
										value="<%=MyCompanies.FiscalYearEnd%>" />
									<label class="input-group-btn" for="CompanyFiscalyearend"
										id="CompanyFiscalyearendLabel">
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

								<input class="inlineInput" type="text" id="CompanyUnitNumber" name="CompanyUnitNumber" maxlength="10"
									value="<%= MyCompanies.Unit %>" />

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Street Number</label>

								<input class="inlineInput" type="text" id="CompanyStreetNumber" maxlength="10"
									name="CompanyStreetNumber" value="<%=MyCompanies.StreetNumber%>" />
							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Street Name</label>

								<input class="inlineInput" type="text" id="CompanyStreetName" name="CompanyStreetName" maxlength="40"
									value="<%=MyCompanies.StreetName%>" />
							</div>

						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="MandentorySign"></label><label>City</label>

								<input class="inlineInput" type="text" id="CompanyCity" name="CompanyCity" maxlength="30"
									value="<%=MyCompanies.City%>" />

							</div>

							<div class="flexible ">

								<label class="MandentorySign"></label><label>Province</label>

								<div class="custom-select">

									<select class="inputSelection" id="CompanyProvince" name="CompanyProvince">

										<option value="<%=MyCompanies.Province%>" selected><%=MyCompanies.Province%></option>

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
									value="<%=MyCompanies.PostalCode%>" onblur="postalCorrect(this.id)">
							</div>

						</div>

						<div class="flexibleContainer NewSection">

							<div class="flexible">

								<label class="MandentorySign"></label><label>E-Mail</label>

								<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
									height="16"><span class="tooltiptext">Enter an email which will be included in a brokerage invoice.</span></span>

								<input class="inlineInput" type="text" id="CompanyEmail" name="CompanyEmail" maxlength="50"
									value="<%=MyCompanies.Email%>">

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Phone</label>
								
								<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
									height="16"><span class="tooltiptext">Enter a phone number which will be included in a brokerage invoice.</span></span>

								<input class="inlineInput" type="text" id="CompanyPhone" name="CompanyPhone" maxlength="14"
									value="<%=MyCompanies.Phone%>" onkeydown="phoneNumberFormatter(this.id)"
									onchange="phoneNumberFormatterAfter(this.id);" />
							</div>
						</div>

						<label class="HeadLinesSecondary NewSection" style="margin-left: 8px;">Invoice Setup</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<div class="flexibleContainer">

							<div class="flexible frontImageFlex frontImageWideLogo" id="wideId" >
								<%-- <label class="NoMandatoryTwo">Logo</label> --%>
								<div class="flexibleContainer" style="width: 150px;   ">
									<div class="flexible" style='margin-top: 0; '>
										<label style="cursor: pointer; margin-top: 0;    width: 100%; text-align: center; " for="CompanyLogo" onclick="TESTpath( 'CompanyLogo' , 'CompanyLogoInfo' );"   >Re-Upload Logo</label>
									</div>
									<%-- <div class="flexible">
										<label style="cursor: pointer; margin: auto;     width: 100%; text-align: center;" onclick="deleteFile(event, 'CompanyLogoImg', 'CompanyLogo', 'cover')" for="">Delete</label>
									</div> --%>
								</div>
								<span id="cover" style="display: none;     justify-content: left;"></span>

								<img src="<%=URL%>?num=<%=Math.random()%>" onerror='this.src="../ImagesUsed/UploadLogo.png"' width="150px" alt="House" class="insideWideImg"
									id="CompanyLogoImg">


								<input type="file" accept="image/*" name="CompanyLogo" id="CompanyLogo" multiple="true"

									onchange="displayCroppedMainCompany('CompanyLogo', 'cover'); " style="display: none;">


								<input type="hidden" name="CompanyLogoInfo" id="CompanyLogoInfo" value="Test" >


							</div>



							<div class="NewSectionMedium flexible" style="float: left; flex: 1; ">
								<label class="NoMandatoryTwo">Invoice Footnote</label>
								<input class="input inlineInput" maxlength="60"
								list="FootnoteList" id="Footnote" name="Footnote" />
								<datalist id="FootnoteList" name="FootnoteList">
									<option value="E.&O.E.">
                				</datalist>


							</div>

						</div>

						<div class="flexibleContainer  NewSectionSmall">
							<div class="flexible">
								<p id="ImgSmallError" class="ErrorEmpty"
									style="padding: 20px;  margin-top: 13px ; display: none; margin-right: 0;">

									<label class="heavyfont">Looks like your image is very small</label><br>
									Please make sure your logo looks correcr. The recommended upload file is at least 5
									KB.</p>


								<p id="ImgBigError" class="ErrorEmpty"
									style="padding: 20px; margin-top: 13px; display: none; margin-right: 0;"  >

									<label class="heavyfont">We are sorry, but your image is too big</label><br>
									The maximum upload file is 200 KB.</p>
							</div>
							<div class="flexible">

							</div>
						</div>


						<script>
							var loadFile = function (event) {

								// alert("ffff");
								
								var image = document.getElementById('output');
								var file = document.getElementById('CompanyLogo');
								
								 alert(URL.createObjectURL(event.target.files[0]));

								if (file.files[0].size < 5240) {
									document.getElementById('ImgSmallError').style.display = '';
									document.getElementById('ImgBigError').style.display = 'none';
									image.src = URL.createObjectURL(event.target.files[0]);
								} else
								if (file.files[0].size > 204800) {
									document.getElementById('ImgSmallError').style.display = 'none';
									document.getElementById('ImgBigError').style.display = '';
									// alert(file.files[0].size);
								} else {
									image.src = URL.createObjectURL(event.target.files[0]);
								

									document.getElementById('ImgSmallError').style.display = 'none';
									document.getElementById('ImgBigError').style.display = 'none';
								}
								
	
							};
							

							var deleteFile = function (event, id1, id2, idcanv) {

								var image = document.getElementById(id1);
								var file = document.getElementById(id2);

								var canvas = document.getElementById(idcanv);

								// alert(file.value);

								if (file.value) {
									try {
										file.value = ''; //for IE11, latest Chrome/Firefox/Opera...
									} catch (err) {}
									if (file.value) { //for IE5 ~ IE10
										var form = document.createElement('form'),
											parentNode = file.parentNode,
											ref = file.nextSibling;
										form.appendChild(file);
										form.reset();
										parentNode.insertBefore(file, ref);
									}
								}

								// alert(file.value);
								image.src = '../ImagesUsed/Picture2.png';
								image.style.visibility = '';
								document.getElementById('ImgSmallError').style.display = 'none';
								document.getElementById('ImgBigError').style.display = 'none';
								document.getElementById('cover').style.display = 'none';

							};
						</script>

					</div><!-- Closing Contact Details-->

				</div><!-- Closing CorporateDetailsTabMainSection -->

				<div id="CorporateDetailsbuttonsSection" class="FooterButton">

					<div class="FooterButtonSpan">

						<span class="buttonDiscard floatDataLefttSide">
							<button style="display: none;" type="button" id="Discard">Discard</button></span>

						<span class="secondSpan ">

							<button class="dropBtn" type="button" id="SaveButtom1" name="SaveButtom1"  >Save</button>

						</span>

					</div>

				</div><!-- CorporateDetailsbuttonsSection -->

			</div><!-- Closing CorporateDetails -->

			<div id="BrokerofRecord" class="tabcontent2">


				<div id="MainBrokerSection">

					<div id="AlternateBroker" style="margin-bottom: 80px;   margin-top: 46px;">

						<label class="HeadLinesSecondary" style="margin-left: 8px;">Primary Broker of Record</label>
						<!-- <span
						class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
							alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
							listing number will be used to auto populate transaction details</span></span> -->
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">
						<!-- 
					<div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Primary Broker of Record</label><span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
						alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
						listing number will be used to auto populate transaction details</span></span></div> -->

						<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->

						<div class="NewSectionSmall">
							<label style="margin-left: 8px;">Broker of Record:</label>
							<label style="margin-left: 10px;"
								class="heavyfont"><%=MyInformation.Firstname %> <%=MyInformation.Lastname %></label>
						</div>


						<!-- <label>Primary Broker of Records</label>

					<hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->

						<!-- <label>Broker of Record</label> -->

						<p class="Notification" style="line-height: 1.4;">
							The Primary Broker of Record could be changed under your personal profile. A change could occur in situations where the Primary Broker of Record is going to be absent for a significant period of time and cannot fulfil their responsibilities under the Act and regulations.</p>

						<label class="HeadLinesSecondary NewSectionMedium"
							style="margin-left: 8px; display:none;">Alternate Broker of
							Records</label>
						<!-- <span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
							alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
							listing number will be used to auto populate transaction details</span></span> -->
						<!-- <hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;"> -->

						<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Alternate Broker of Records</label><span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
						alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
						listing number will be used to auto populate transaction details</span></span></div> -->

						<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->

						<div class="flexibleContainer NewSectionMedium" style="display:none">
							<div class="flexible" style="margin-top: 6px;">

								<label class="MandentorySign"></label><label>Alternate Broker of Record</label>

								<div class="custom-select" onclick="AlternateBroker()">
									<select id="AlternateBrokerOfRecord" name="AlternateBrokerOfRecord">

										<option value="">-- Select an Alternate Broker of Record --</option>

										<option value="">-- Select an Alternate Broker of Record --</option>

										<option value="1">-- 1 --</option>

										<option value="2">-- 2 --</option>

										<option value="3">-- 3 --</option>

									</select>
								</div>

							</div>


							<div class="flexible">
								<p id="noAltNot" class="Notification"
									style="line-height: 1.4;margin-top: -4px; margin-right: 0; margin-left: 1px;     padding: 8px 8px 8px 20px;">
									You have not yet created a second user profile who could act as an Alternative
									Broker of
									Record.</p>
							</div>

						</div>

						<div id="Dates" style="display: none;">

							<p>Dates when alternate broker of record will be acting as designated broker of
								record <span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
										alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
										listing number will be used to auto populate transaction details</span></span>
							</p>



							<div class="flexibleContainer">
								<div class="flexible">
									<label class="NoMandatory"></label>
									<label>Start Date</label>

									<div class="input-group">
										<input id="AlternateBrokerStartDate" name="AlternateBrokerStartDate" type="text"
											class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly"
											value="" />
										<label class="input-group-btn" for="CompletionDate"
											id="AlternateBrokerStartDateLabel">
											<span class="btn btn-default">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</label>
									</div>
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label>
									<label> End Date</label>

									<div class="input-group">
										<input id="AlternateBrokerEndDate" name="AlternateBrokerEndDate" type="text"
											class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly"
											value="" />
										<label class="input-group-btn" for="CompletionDate"
											id="AlternateBrokerEndDateLabel">
											<span class="btn btn-default">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</label>
									</div>
								</div>
							</div>


						</div><!-- Closing Dates -->

						<div id="AuditTrail" class="NewSectionMedium" style="display: none;">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Audit Trail</label><span
								class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
									alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
									listing number will be used to auto populate transaction details</span></span>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Audit Trail</label>

						</div> -->

							<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->




							<table id="AuditTable"
								style="width: calc(100% + 4px); margin-top: 30px; margin-left: -8px;">

								<tbody>
									<tr style="    height: 30px !important;">

										<th width="50%" class="underLine" style="text-align: left; padding-left: 16px;">
											Designated Broker of Record</th>

										<th width="25%" class="underLine" style="text-align: center">Start</th>


										<th width="25%" class="underLine headlineright" style="text-align: center;">End
										</th>

									</tr>

									<tr class="newclass">

										<td><input class="inlineInput" id="Broker" style="padding-left: 11px;"
												type="text" value=""
												readonly></td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

									</tr>

									<tr>

										<td><input class="inlineInput" id="Broker" style="padding-left: 11px;"
												type="text" value="" readonly>
										</td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

									</tr>

									<tr class="newclass">

										<td><input class="inlineInput" id="Broker" style="padding-left: 11px;"
												type="text" value=""
												readonly></td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

										<td><input class="inlineInput" style="text-align: center;" value="01-Jan-21"
												readonly></td>

									</tr>



								</tbody>

							</table>

						</div><!-- Closing AuditTrail -->


					</div><!-- Closing AlternateBroker  -->


				</div><!-- Closing MainBrokerSection -->

				<div id="BrokerofRecordButtonSection" class="FooterButton">

					<div class="FooterButtonSpan">

						<span class="buttonDiscard floatDataLefttSide">
							<button style="display: none;" type="button" id="Discard">Discard</button></span>

						<span class="secondSpan ">

							<button class="dropBtn" type="button" id="SaveButtom2" name="SaveButtom2">Save</button>

						</span>

					</div>


				</div><!-- Closing BrokerofRecordButtonSection -->

			</div><!-- Closing BrokerofRecord -->

			<div id="Tax&Banking" class="tabcontent2" style="margin-bottom: 80px;">

				<div id="MainTax&Banking" class="NewSectionMedium">

					<p id="ErrorEmpty2" class="ErrorEmpty" style="display:none;">Complete all required fields
						before proceeding.</p>

					<div class="flexibleContainer" id="HSTSection">

						<div class="flexible ">
							<label class="MandentorySign"></label><label>HST Number</label>
							<div class="flexibleContainer" id="HSTSectionDiv">
								<input class="inlineInput flexible" type="text" id="CompanyHSTNumber" maxlength="9"
									name="CompanyHSTNumbere" value="<%= MyCompanies.HSTNumberPart1 %>"
									placeholder="123456789">
								<label class="flexible" for="" style="flex: 0.1; margin-top: 6px; ">RT</label>
								<input class="inlineInput flexible" style="flex: 0.5;" placeholder="0001" type="text" maxlength="4"
									id="CompanyHSTNumberRT" name="CompanyHSTNumbereRT"
									value="<%= MyCompanies.HSTNumberPart2 %>"></div>
						</div>

						<div class="flexible" style="flex: 2.2;"></div>

					</div>

					<div id="FirstRealEstateTrust" class="NewSectionMedium">

						<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Real Estate Trust</label></div> -->

						<label class="HeadLinesSecondary" style="margin-left: 8px;">Real Estate Trust</label>

						<span id="PurcharerProcess" class="floatDataRightSide">

							<span class="tooltip">
								<img src="../ImagesUsed/AddSVG.svg" style="margin-top: 5px;"
									class="lineButton manageListButton" alt="+" type="button" onclick="AddTrust();"
									id="AddMorePuchaser" name="AddMorePuchaser"><span class="tooltiptext">Add Second Real
									Estate Trust</span>
							</span>

						</span>

						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<div class="flexibleContainer">
							<div class="flexible">
								<label class="NoMandatory"></label><label>Bank Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber" maxlength="18"
									name="RealEstateTrustCompanyBankNumber"
									value="<%=MyCompanies.RealEstateTrustBankNumber%>">
							</div>

							<div class="flexible">
								<label class="NoMandatory"></label><label>Transit Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber" maxlength="5"
									name="RealEstateTrustCompanyTransitNumber"
									value="<%=MyCompanies.RealEstateTrustTransitNumber%>">
							</div>

							<div class="flexible">
								<label class="NoMandatory"></label><label>Account Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber" maxlength="18"
									name="RealEstateTrustCompanyAccountNumber"
									value="<%=MyCompanies.RealEstateTrustAccountNumber%>">
							</div>

							<div class="flexible" style="flex: 0.2; display: none;">
								<label class="chequeLabel">Cheque</label>

								<input class="inlineInput" type="file" id="RealEstateTrustCompanyCheque"
									name="RealEstateTrustCompanyCheque">
								<br>

								<img class="chequeImg" src="../ImagesUsed/Cheque.png">

							</div>
						</div>


					</div><!-- Closing FirstRealEstateTrust -->

					<div id="SecondRealEstateTrust" class="NewSectionMedium" style="display: none;">

						<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

						<label class="HeadLinesSecondary" style="margin-left: 8px;">Second Real Estate Trust</label>

						<span id="PurcharerProcess" class="floatDataRightSide">

							<span class="tooltip">
								<img src="../ImagesUsed/DeleteB.png" style="margin-top: 5px; cursor: pointer;"
									class="lineButton manageListButton" alt="+" type="button" onclick="RemoveTrust();"
									id="AddMorePuchaser" name="AddMorePuchaser"><span class="tooltiptext">Remove Real
									Estate Trust</span>
							</span>

						</span>

						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<div class="flexibleContainer">

							<div class="flexible">
								<label class="MandentorySign"></label><label>Account Name</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountName2" maxlength="60"
									name="RealEstateTrustCompanyAccountName2"
									value="<%=MyCompanies.RealEstateTrustAccountName2%>">

							</div>

							<div class="flexible">
								<label class="MandentorySign"></label><label>Account Nick Name</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNickName2" maxlength="60"
									name="RealEstateTrustCompanyAccountNickName2"
									value="<%=MyCompanies.RealEstateTrustAccountNikname2%>">

							</div>
						</div>

						<div class="flexibleContainer">

							<div class="flexible">
								<label class="MandentorySign"></label><label>Bank Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber2" maxlength="18"
									name="RealEstateTrustCompanyBankNumber2"
									value="<%= MyCompanies.RealEstateTrustBankNumber2 %>">

							</div>

							<div class="flexible">
								<label class="MandentorySign"></label><label>Transit Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber2" maxlength="5"
									name="RealEstateTrustCompanyTransitNumber2"
									value="<%=MyCompanies.RealEstateTrustTransitNumber2%>">

							</div>

							<div class="flexible">
								<label class="MandentorySign"></label><label>Account Number</label>

								<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber2" maxlength="18"
									name="RealEstateTrustCompanyAccountNumber2"
									value="<%=MyCompanies.RealEstateTrustAccountNumber2%>">

							</div>

							<div class="flexible" style="flex: 0.2; display: none;">
								<label class="chequeLabel">Cheque</label>

								<input type="file" id="RealEstateTrustCompanyCheque2"
									name="RealEstateTrustCompanyCheque2">

								<img class="chequeImg" src="../ImagesUsed/Cheque.png">

							</div>

						</div>

					</div><!-- Closing SecondRealEstateTrust -->


					<div id="CommissionTrust" class="NewSectionMedium">

						<label class="HeadLinesSecondary" style="margin-left: 8px;">Commission Trust</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

						<div class="flexibleContainer">

							<div class="flexible">
								<label class="MandentorySign"></label><label>Bank Number</label>

								<input class="inlineInput" type="text" id="CommissionTrustCompanyBankNumber" maxlength="18"
									name="CommissionTrustCompanyBankNumber"
									value="<%=MyCompanies.CommissionBankNumber%>">

							</div>

							<div class="flexible">
								<label class="MandentorySign"></label><label>Transit Number</label>

								<input class="inlineInput" type="text" id="CommissionTrustCompanyTransitNumber" maxlength="5"
									name="CommissionTrustCompanyTransitNumber"
									value="<%=MyCompanies.CommissionTransitNumber%>">

							</div>


							<div class="flexible">
								<label class="MandentorySign"></label><label>Account Number</label>

								<input class="inlineInput" type="text" id="CommissionTrustCompanyAccountNumber" maxlength="18"
									name="CommissionTrustCompanyAccountNumber"
									value="<%=MyCompanies.CommissionAccountNumber%>">

							</div>

							<div class="flexible" style="flex: 0.2; display: none;">
								<label class="chequeLabel">Cheque</label>

								<input class="inlineInput" type="file" id="CommissionTrustCompanyCheque"
									name="CommissionTrustCompanyCheque">

								<img class="chequeImg" src="../ImagesUsed/Cheque.png">

							</div>

						</div>

					</div><!-- Closing CommissionTrust -->

					<div id="GeneralAccount" class="NewSectionMedium">

						<label class="HeadLinesSecondary" style="margin-left: 8px;">General Account</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

						<div class="flexibleContainer">

							<div class="flexible">
								<label class="NoMandatory"></label><label>Bank Number</label>

								<input class="inlineInput" type="text" id="GeneralAccountCompanyBankNumber" maxlength="18"
									name="GeneralAccountCompanyBankNumber"
									value="<%=MyCompanies.GeneralAccountBankNumber%>">

							</div>

							<div class="flexible">
								<label class="NoMandatory"></label><label>Transit Number</label>

								<input class="inlineInput" type="text" id="GeneralAccountCompanyTransitNumber" maxlength="5"
									name="GeneralAccountCompanyTransitNumber"
									value="<%=MyCompanies.GeneralAccountTransitNumber%>">

							</div>


							<div class="flexible">
								<label class="NoMandatory"></label><label>Account Number</label>

								<input class="inlineInput" type="text" id="GeneralAccountCompanyAccountNumber" maxlength="18"
									name="GeneralAccountCompanyAccountNumber"
									value="<%=MyCompanies.GeneralAccountAccountNumber%>">

							</div>

							<div class="flexible" style="flex: 0.2; display: none;">
								<label class="chequeLabel">Cheque</label>

								<input type="file" id="GeneralAccountCompanyCheque" name="GeneralAccountCompanyCheque">

								<img class="chequeImg" src="../ImagesUsed/Cheque.png">

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

			</div><!-- Closing Tax&Banking  -->

			<div id="PaymentDetails" class="tabcontent2" style="margin-bottom: 80px;">

				<div id="MainPaymnetdetailSection" class="NewSectionMedium">

					<div id="FirstPaymnetVisist">

						<div class="flexibleContainer">
							<div class="flexible">
								<label class="MandentorySign"></label><label> My Plan </label>
								<div class="custom-select">
									<select id="Myplan" name="Myplan">

										<option value="">-- Option --</option>

										<option value="1">1</option>

										<option value="2">2</option>

									</select>
								</div>
							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Active Users</label><span
									class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
										alt="MasterProBrokerHelp" width="16" height="16"><span
										class="tooltiptext">Description</span></span>

								<input style="margin-top: -1px; text-align: right;" class="inlineInput" type="text"
									id="ActiveUser" name="ActiveUser" value="" placeholder="0">

							</div>

							<div class="flexible">
								<label class="NoMandatoryTwo">Monthly Price</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;">$</label>
									<input class="input5" type="text" id="PlanPrice" name="PlanPrice" min="0"
										placeholder="0.00" onblur="limiting(this); clearing()">
								</span>

							</div>

						</div>

						<div class="flexibleContainer" style="margin-left: 9px; margin-top: -7px; ">
							<div class="flexible"><label style="cursor: pointer;">View all plans HERE</label></div>
							<div class="flexible"></div>
							<div class="flexible"></div>
						</div>

						<div id="Plans"> </div><!-- Closing Plans   -->

						<div id="PaymentMethodDetails Information " style="width: 378px;
						margin-left: 14%;
						border: 1px solid grey;
						border-radius: 30px;
						padding: 28px;
						margin-top: 30px;">

							<label style="font-weight: bold;font-size: 15px; margin-left: 20px;">Please select
								your payment method </label>

							<span style="">

								<img class="cardimg" src="../ImagesUsed/Visa2.PNG">

								<img class="cardimg" src="../ImagesUsed/mastercard-new-logo.jpg">

								<!-- <img class="cardimg" src="../ImagesUsed/Card3.png">

							<img class="cardimg" src="../ImagesUsed/Card4.png"> -->

							</span>

							<div class="flexible" style=" padding-left: 20px; padding-right: 20px;">
								<label class="MandentorySign"></label><label> Card Number </label>

								<input class="inlineInput" type="text" id="CardNumber" name="CardNumber" value=" ">
							</div>

							<div class="flexible" style="padding-left: 20px; padding-right: 20px; margin-top: 14px;">
								<label class="MandentorySign"></label><label> Card Holder Name </label>

								<input class="inlineInput" type="text" id="CardHolderName" name="CardHolderName"
									value=" ">
							</div>
							<div class="flexibleContainer" style="width: auto;padding-left: 20px;padding-right: 20px;">
								<div class="flexible">

									<div style="width: 100%; box-sizing: border-box;">
										<label class="MandentorySign"></label><label>Expiration Date</label>
									</div>

									<div class="flexibleContainer">
										<input style="flex: 1; margin-right: 4px;  text-align: center;"
											class="inlineInput" type="text" id="ExpirationMounth"
											name="ExpirationMounth" value="" placeholder="MM">

										<input style=" flex: 1; text-align: center;" class="inlineInput" type="text"
											id="ExpirationYear" name="ExpirationYear" value="" placeholder="YY">
									</div>

								</div>

								<div class="flexible" style="display: none;">

									<label class="NoMandatoryTwo">&nbsp;</label>

									<div class="input-group">
										<input id="CardClosingDate" name="CardClosingDate" type="text"
											class="form-control date-input" placeholder="DD MM YYYY"
											readonly="readonly">
										<label class="input-group-btn" for="CardClosingDate" id="CardClosingDatelabel">
											<span class="btn btn-default">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</label>
									</div>

									<!-- <input id="?" name="CompletionDate" type="text"
									   class="form-control date-input" placeholder="DD MM YYYY"
									   readonly="readonly" />
								<label class="input-group-btn" for="CompletionDate"
									   id="?">
									   <span class="btn btn-default">
											  <span class="glyphicon glyphicon-calendar"></span>
									   </span>
								</label> -->
								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label> Security Code </label>

									<input class="inlineInput" type="number" step="0.01" id="CardSecurityCode" 
										name="CardSecurityCode" value="">
								</div>
							</div>
						</div>


						<div style="margin-left: 23%; margin-top: 20px;">

							<label class="container"><input onclick="" type="checkbox" checked="checked"
									id="PaymnetTerms&Comdition" name="PaymnetTerms&Comdition" value="Percentage"><span
									class="checkmark" style="top: 10px;"></span></label>

							<!-- <input type="checkbox" id="PaymnetTerms&Comdition" name="PaymnetTerms&Comdition"> -->

							<label style="margin-left: 22px; width: 280px;">I accept terms and conditions and confirm
								that
								corporate information is accurate and up
								to date.</label>


						</div>


					</div><!-- Closing FirstPaymnetVisist -->

					<div id="SecondPaymnetVisit" style="display: none;">

						<label> Billing and Payment</label>

						<hr>

						<span>
							<img src=" ">

							<label id="CardTypeLabel"> Credit card ending </label><label
								id="UserCardNumber">*****2423</label>
						</span>


						<span>
							<img src=" ">

							<label id="Plan"> Premium Plan </label>
						</span>

						<span>
							<label id="Number Of Active Users"></label>

							<label> Active users </label>
						</span>

						<span>
							<label id="PlanMonthlyPrice"></label>

							<label>/ month </label>
						</span>

						<span>
							<label>Next Payment on</label>

							<label id="NextPaymnetDate">Jan 1, 2022</label>
						</span>

					</div><!-- closing  SecondPaymnetVisit -->

				</div><!-- Closing MainPaymnetdetailSection  -->

				<div id="PaymentDetailsButtonSection" class="FooterButton">

					<div class="FooterButtonSpan">

						<span class="buttonDiscard floatDataLefttSide">
							<button style="display: none;" type="button" id="Discard">Discard</button></span>

						<span class="secondSpan ">

							<button class="dropBtn" type="button" id="SaveButtom4" name="SaveButtom4">Save</button>

						</span>

					</div>

				</div><!-- Closing PaymentDetailsButtonSection -->


			</div><!-- Closing PaymentDetails -->

		</form>

		<div id="UserAccess" class="tabcontent2" style="margin-bottom: 80px;">

			<div id="DetailsParties&amp;ContactInformation" class="DetailsPartiesAndContactInformation NewSectionMedium"
				style="margin-top: 30px;">

				<div style="height: 25px;">

					<!-- <input type="text" id="myInputSort" class="inlineInput" onkeyup="SortTable()" placeholder="Sort By" > -->

					<div class="custom-select" style="width:20%; float: right;" onclick="SortTable('myInputSort')">

						<select class="inputSelection" id="myInputSort" name="myInputSort">

							<option value="">Sort By</option>

							<option value="NameUp">Name A-Z</option>

							<option value="NameDown">Name Z-A</option>

							<option value="Status">Status</option>

							<option value="Access">Access</option>

							<option value="Role">Role</option>

						</select>

					</div>

					<input type="text" id="myInput" class="inlineInput" onkeyup="SearchTable()" placeholder="Search"
						style="width:20%; float: right; margin-right: 6px;">
				</div>

				<table style="width:100%;" id="tableOne" class="NewSectionSmall">

					<tbody>
						<tr style="background: #f3f3f3; border-bottom: 2px solid lightgrey;">

							<th width="9%" style="padding-left:14px"></th>

							<th width="23%">Name</th>

							<th width="15%">Status</th>

							<th width="15%">Access</th>

							<th width="15%">Role</th>

							<th width="23%">Restrictions</th>
						</tr>

					</tbody>

				</table>

			</div>
			<script>

			</script>

			<div id="UserAccessButtonSection" class="FooterButton"></div><!-- Closing UserAccessButtonSection-->

		</div><!-- Closing UserAccess -->

	</div><!-- Closing CompanyMainSection -->
  </div>

	<script type="text/javascript" src="../Scripts/CompanyProfileLaunch.js"></script>
	


	<!-- ************************************************************************************************************ -->

</body>

</html>