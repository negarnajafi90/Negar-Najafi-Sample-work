<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"  %>

<%-- <%@ page import="java.text.DecimalFormat"  %> --%>

<%@ page import="java.text.NumberFormat" %>

<%@ page import="java.util.Locale" %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="java.util.Date"  %>

<%@ page import="java.text.SimpleDateFormat"  %>

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

String isBroker = "1";

SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");

int UserID=0;//(int)session.getAttribute("Userid") ;
int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
String Type="0";//(String)session.getAttribute("Type") ;
String Email="";//(String)session.getAttribute("Email") ;
Connection con=null;

if( session.getAttribute("Userid")==null  ){
  response.sendRedirect("../index.jsp");
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



NumberFormat CanadaVal = NumberFormat.getCurrencyInstance(Locale.CANADA);

//Geting the user's information 

Users MyInformation=new Users();

RDSFunctions myRDS=new RDSFunctions();

MyInformation=myRDS.GetAnyUserById(UserID,con);


JSONParser parser = new JSONParser();  
String InvData = myRDS.GetUsersCommissions(UserID,con);
JSONObject object = (JSONObject) parser.parse(InvData);  
JSONArray InvoiceJSONArr = (JSONArray) object.get("Commissions");


ArrayList<CommissionDetails> MyCommissions = new ArrayList<CommissionDetails>();

MyCommissions=myRDS.SearchCommissions( BrokerID , "1" , BrokerID ,con);

String B_date ="";
if(MyInformation.DateOfBirth!=null){
//System.out.println("1");
	B_date =new SimpleDateFormat("dd MMM YYYY",Locale.US).format(new Date(MyInformation.DateOfBirth.getTime()));
	//Birthday=new Date(MyInformation.DateOfBirth.getTime());
}



//Date Anniversarydate=new Date();

String A_date = "";
if(MyInformation.User_Anniversary!=null){
	A_date =new SimpleDateFormat("dd MMM YYYY",Locale.US).format(new Date(MyInformation.User_Anniversary.getTime()));
	//Anniversarydate=new Date(MyInformation.User_Anniversary.getTime());
}
//Date Anniversarydate=new Date(MyInformation.User_Anniversary.getTime());


//Date Startdate=new Date();

String S_date ="";

if(MyInformation.User_StartDate!=null){
	S_date =new SimpleDateFormat("dd MMM YYYY",Locale.US).format(new Date(MyInformation.User_StartDate.getTime()));
	//Startdate=new Date(MyInformation.User_StartDate.getTime());
}

//Date Startdate=new Date(MyInformation.User_StartDate.getTime());



%>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>


	<title>Personal Information - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

	<style>
		.passEye{
			top: -25px;
		}
	</style>

</head>

<header>

</header>

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




		<div id="BrokerPersonalDetail" class="Rightcolumn marginBody navBarMovable" style='max-width: 715px'>

			<div class="dropdown1 dispNone" id="newDealAgentDropdown">
				<em class="arrow"></em>
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

			<div id="myModalChequePreview" class="modal" style="padding-top: 10vh;">

				<div class="modal-content" style="    max-width: 50vw; width: auto;">
					<div class="modalHeader">Cheque preview <span class="close floatDataRightSide"
							style="margin-top: -6px; padding: 6px 30px; color: black">Close</span></div>
					<img id='chequePicturePreview' class="chequePreviewpic" src="../ImagesUsed/Cheque.png" alt="">
					<p></p>
					<div class="popUpContainer">

						<!-- <button class="submitButton" type="submit" id="ExitWithNoSaving" name="ExitWithNoSaving">Yes</button> -->
					</div>
				</div>

			</div>

			<div class="navTop flexibleContainer" id="TopNavButtons" style='max-width: 700px;'>

				<a class="menubartext flexible " href="CompanyProfile.jsp"><button class="topGrey topbutton">COMPANY</button></a>

				<a class="menubartext flexible " href="PersonalProfile.jsp"><button class="topBlue topbutton">MY PROFILE</button></a>
				<% if(isBroker == "1"){ %>
					<a class="menubartext flexible " href="AgentsandAdmins.jsp"><button class="topGrey topbutton">AGENTS & ADMINS</button></a>
				<% } %>

			</div><!-- Closing TopNavButtons -->


			<div id="CompanyTabs" class="PartiesNavBar flexibleContainer" style='max-width: 700px;'>

				<button id="PersonalDetailsDetailsTab" class="tablinks2 flexible active"
					onclick="TabsHandleler(event,'PersonalDetails','tabcontent','tablinks2','PersonalDetailsDetailsTab'); ">Personal
					Details</button>

				<button id="Commissions&DisclosureTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Commissions&Disclosure', 'tabcontent', 'tablinks2', 'Commissions&DisclosureTab'); ">Commissions</button>

				<button id="Tax&BankingTab" class="tablinks2 flexible"
					onclick="checkPrec(); TabsHandleler(event,'Tax&Banking','tabcontent', 'tablinks2', 'Tax&BankingTab'); ">
					Tax & Banking
				</button>

				<button id="AccessTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Access','tabcontent', 'tablinks2', 'AccessTab'); ">Access</button>

				<button id="AuditTab" style="display: none;" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'AuditTrail','tabcontent', 'tablinks2', 'AuditTab'); ">Audit Trail</button>

			</div>

			<iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
			<form name="BrokerInfo" id="BrokerInfo" method="post" action="../PersonalProfileUpdate" enctype="multipart"
				style="width: 100%;" target="hiddenFrame">

				<div id="myModalSave" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;" alt=""><label
							style="margin-left: 10px;">Your changes were saved</label>
					</div>

				</div>

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

				<div id="PersonalDetails" class="tabcontent" style="margin-top: 0;">

					<p id="ErrorEmpty1" class="ErrorEmpty" style="display:none;">Complete all required fields before
						proceeding.</p>

					<div class="flexibleContainer NewSectionSmall">

						<div class="flexible">

							<label class="MandentorySign"></label><label>Title</label>

							<input class="inlineInput" type="text" id="Title" name="Title" value="<%= MyInformation.Title%>" maxlength="10"
								onchange="trimString(this.id)" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>First Name</label>

							<input class="inlineInput" type="text" id="Firstname" name="Firstname"
								value="<%= MyInformation.Firstname%>" onchange="trimString(this.id)"  maxlength="45"/>

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Last Name</label>

							<input class="inlineInput" type="text" id="Lastname" name="Lastname"
								value="<%=MyInformation.Lastname%>" onchange="trimString(this.id)"  maxlength="45"/>

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="NoMandatory"></label><label>PREC</label>

							<input class="inlineInput" type="text" id="PRECNum" name="PRECNum" maxlength="60"
								value="<%=MyInformation.PREC%>" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Date of Birth</label>

							<div class="input-group">
								<input id="DateOfBirth" name="DateOfBirth" type="text" class="form-control date-input"
									placeholder="DD MM YYYY" readonly value="<%=B_date%>" />
								<label class="input-group-btn" for="DateOfBirth" id="DateOfBirthLabel">
									<span class="btn btn-default">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</label>
							</div>

						</div>

					</div>

					<!-- <label class="HeadLinesSecondary" style="margin-left: 8px; margin-top: 42px;">Address & Contact
						Details</label>

					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;"> -->


					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="NoMandatoryTwo">Unit</label>

							<input class="inlineInput" type="text" id="Unit" name="Unit" maxlength="10"
								value="<%= MyInformation.User_Unit %>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Number</label>

							<input class="inlineInput" type="text" id="StreetNumber" name="StreetNumber" maxlength="10"
								value="<%=MyInformation.User_StreetNumber%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Name</label>

							<input class="inlineInput" type="text" id="StreetName" name="StreetName" maxlength="40"
								value="<%=MyInformation.User_StreetName%>" onchange="trimString(this.id)">

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label><label>City</label>

							<input class="inlineInput" type="text" id="City" name="City" maxlength="30"
								value="<%=MyInformation.User_City%>" onchange="trimString(this.id)">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Province</label>

							<div class="custom-select" id="ProvinceCustom"
								onclick="ifProvinceOther('Province','Country');  Display('Province', 'ProvinceExtra');">

								<select class="inputSelection" id="Province" name="Province">

									<option value="<%=MyInformation.User_Province%>" selected><%=MyInformation.User_Province%></option>

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

							<label class="MandentorySign"></label><label>Postal Code</label>

							<input class="inlineInput" type="text" id="PostalCode" name="PostalCode" maxlength="11"
								value="<%=MyInformation.User_PostalCode%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Country</label>

							<input class="inlineInput" type="text" id="Country" name="Country" readonly maxlength="20"
								value="<%= MyInformation.User_Country%>">

						</div>

					</div>

					<div class="flexibleContainer" style="display: none;" id="ProvinceExtra">

						<div class="flexible">
							<label class="MandentorySign"></label><label>Other province or state</label>

							<input type="text" class="inlineInput" id="OtherProvince" name="OtherProvince" value="" maxlength="20">
						</div>

						<div class="flexibleotherProvince"></div>


					</div>

					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="MandentorySign"></label><label>E-mail</label>

							<!-- <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext" style="width: 200px">This email will be used to communicate with you</span></span> -->

							<input class="inlineInput" type="text" id="Email" name="Email" maxlength="50"
								value="<%=MyInformation.User_Email%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Phone</label>

							<input class="inlineInput" type="text" id="Phone" name="Phone" maxlength="14"
								value="<%= MyInformation.User_Phone%>">

						</div>

					</div>

					<div class="flexibleContainer" style="display: none;">

						<div class="flexible">

							<label class="NoMandatoryTwo"><%=MyInformation.User_faxOrMobile%></label>

							<input class="inlineInput" type="text" id="MobileNumber" name="MobileNumber" maxlength="20"
								value="<%=MyInformation.User_faxOrMobileNumber%>">

						</div>


					</div>

					<div id="PersonalDetailsButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span>

								<div class="FooterButtonSpan">


									<span class="secondSpan ">

										<button type="button" id="SaveButton1" class="buttonSaveOne">Save</button>

									</span>

								</div>

							</span>

							</span>

						</div>

					</div><!-- Closing PersonalDetailsButtonsSection -->


				</div><!-- Closing PersonalDetails -->

				<!------------------------------------------------------------------------------------------------------------------------------------------->

				<div id="Commissions&Disclosure" class="tabcontent" style="margin-top: 0;">

					<div id="Commission Structure">

					<label class="HeadLinesSecondary NewSectionMedium" style="margin-left: 8px; width: 100%; cursor: pointer" onclick='document.getElementsByClassName("rotimgUpDown")[0].classList.toggle("rotateimg180"); document.querySelector("#updateComSection").classList.toggle("hide")'>Update Commissions <img class='rotimgUpDown rotateimg180' style='float: right; margin-right: 10px' src="../ImagesUsed/collapse.png"></label>
					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">
					
					<div id='updateComSection' class='updateCom hide'>
					<%-- <span class="tooltipHelp"><img
						class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
						height="16" loading="lazy"><span class="tooltiptext">The anniversary date, commission split and cap can be updated by the Broker of Record only.</span></span> --%>


						<p id="ErrorEmpty2" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<p id="ErrorCap" class="ErrorEmpty" style="display:none;">The commission cap cannot be less than the commission cap entered for the previous tier.</p>

						<div class="flexibleContainer " id="DivContent1">

							<div class="flexible">

								<label class="MandentorySign" id="date2ForBor"></label><label>New Commission Start Date</label>

								<div class="input-group">
									<input id="StartDate" name="StartDate" type="text" class="form-control date-input"
										placeholder="DD MM YYYY" value=""  readonly />
									<label class="input-group-btn" for="StartDate" id="StartDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>
							</div>

							<div class="flexible">

								<label class="MandentorySign" id="date1ForBor"></label><label>New Anniversary Date</label>

								<div class="input-group">
									<input id="AnniversaryDate" name="AnniversaryDate" type="text"
										class="form-control date-input" placeholder="DD MM YYYY"  value="" readonly />
									<label class="input-group-btn" for="AnniversaryDate" id="AnniversaryDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>
							</div>

							<div class="flexible">

								<label class="NoMandatory"></label><label>Hire Date</label>

								<div class="input-group dis">
									<input id="HireDate" name="HireDate" type="text" class="form-control date-input dis"
										placeholder="DD MM YYYY" value="" disabled />
									<label class="input-group-btn" for="HireDate" id="HireDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>
							</div>

						</div><!-- Closing DivContent1 -->

						<div class="flexibleContainer ">

							<div class="flexible">

								<label class="MandentorySign" id="splitForBor"></label><label>Commission Split</label>

								<span class="inlineInput shortValue relativeInputPercent "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit1" maxlength="8"
										 name="CommissionSplit1" onchange='checkPercent(this.id, 100);  lockComissions();'
										value="<%=MyInformation.User_Split%>" >
										
								</span>
							</div>

							<div class="flexible">

								<label class="MandentorySign" id="capForBor"></label><label>Commission Cap</label>

								<span class="inlineInput shortValue relativeInput "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap1" maxlength="10" onchange='FormatNumber(this.id);  lockComissions();'
										name="CommissionCap1" value="<%=MyInformation.User_Cap%>" >
										 
								</span>
							</div>



						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="NoMandatory"></label><label>Second Commission Split</label>

								<span class="inlineInput shortValue relativeInputPercent "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit2" maxlength="8"
										name="CommissionSplit2" value="<%=MyInformation.User_Split2%>" onchange='checkPercent(this.id, 100);  lockComissions();' 
										value="">
										
								</span>
							</div>

							<div class="flexible ">

								<label class="NoMandatory"></label><label>Second Commission Cap</label>

								<span class="inlineInput shortValue relativeInput "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap2"  maxlength="10" onchange='FormatNumber(this.id); lockComissions();'
										name="CommissionCap2" value="<%=MyInformation.User_Cap2%>" >
										
								</span>
							</div>

						</div>

						<div class="flexibleContainer" style='margin-bottom: 15px;'>

							<div class="flexible">

								<label class="NoMandatory"></label><label>Third Commission Split</label>

								<span class="inlineInput shortValue relativeInputPercent "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit3" maxlength="8"
										name="CommissionSplit3"  value="<%=MyInformation.User_Split3%>" onchange='checkPercent(this.id, 100); lockComissions();' 
										value="">
										
								</span>


							</div>

							<div class="flexible ">

								<label class="NoMandatory"></label><label>Third Commission Cap</label>

								<span class="inlineInput shortValue relativeInput "
									style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap3" maxlength="10" onchange='FormatNumber(this.id);  lockComissions();'
										name="CommissionCap3" value="<%=MyInformation.User_Cap3%>" >
										
								</span>

							</div>

						</div>

						<label class="container" style='margin-top: -10px;'><input class="inlineInput" onclick="openDirect()" type="checkbox"
								id="useLastVal" name="useLastVal">
							<span class="checkmark"></span></label>
						<label for='useLastVal' class="copyButton" style="margin-left: 16px;">Use last value of Cap Reached</label>


						<button type="button" id="SaveButton2" class="buttonSaveOne" style='float: right; background: #29c1e1; padding: 5px 30px; border-radius: 15px; color: white; border: 1px solid lightgrey;'>Update</button>

					</div>
					</div><!-- Closing Commission Structure -->

					<label class="HeadLinesSecondary NewSectionMedium" style="margin-left: 8px;">Commission Cap</label>
					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

					<style>


						.updateCom{
							overflow: hidden;
   							max-height: 100vh;
							transition: max-height 0.6s ease-out;
						}


						.tiers{
							margin-top: 10px;
							margin-bottom: 14px;
							    padding-left: 10px;
						}

						.tiers label{
							height: min-content;
							margin: 0;
							margin-top: 3px;
						}
						.tiers .flexibleContainer{
							max-width: 400px;
							margin-left: 19px;
						}

						.tierSpan{
							display: inline-block;
							width: 80px;
						}

						/* .noteInf:hover{
							text-decoration: underline;
							cursor: pointer;
						} */
						.noteInf .tooltipHelp{
							position: sticky;
							font-weight: bold;
							text-decoration: underline;
						}

						.noteInf .tooltipHelp:hover{
							text-decoration: underline;
							cursor: pointer;
							
						}

						.noteInf .tooltiptext{
							width: 150px;
							top: 30px;
							left: -70px;
							margin-top: 0px; 
							margin-left: 0px;
						}

						.coverdiv{
							font-weight: bold;
							color: #054d6a;
							max-height: 100vh;
							transition: max-height 0.6s ease-out;
							overflow: hidden;
						}


					</style>

					<div id='alltables'>
						<div id='UpdateNewTable' style="display: none">
							<label onclick='this.getElementsByClassName("rotimg")[0].classList.toggle("rotateimg90"); this.parentElement.getElementsByClassName("coverdiv")[0].classList.toggle("hide")'>
								<label style='width: 100%; cursor: pointer; padding-left: 10px;'  ><img class='rotimg rotateimg90'style='' src="../ImagesUsed/collapse.png">
								<span style="font-weight: bold"><span style="font-weight: bold" id="fromNew"></span> - <span style="font-weight: bold" id="toNew"></span></label>
							</label>
							<div class="coverdiv hide">
								<div class='tiers'>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan' id="newTier1">Tier 1</span></label>
										<label class='flexible capCom' id="newCap1"></label>
									</div>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan' id="newTier2">Tier 2</span></label>
										<label class='flexible capCom' id="newCap2"></label>
									</div>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan' id="newTier3">Tier 3</span></label>
										<label class='flexible capCom' id="newCap3"></label>
									</div>
									<div class='flexibleContainer' style="padding-top: 10px;">
										<label class='flexible splitCom'><span style="width: 200px;" class='tierSpan'>Last value of Cap Reached</span></label>
										<label class='flexible capCom' id="lastVal"></label>
									</div>
								</div>

								<table id="comTable">
									
									<thead>
										<tr class="newclass HeaderRowComissions" style='background: #f3f3f3;'>
											<th class="cen">
												<div style="padding: 5px;">#</div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Type</div>
											</th>
											<th class="cen noteInf">
												<div style="min-width: 60px;padding: 5px;"><span class="tooltipHelp">Date<span class="tooltiptext">Finalized, deleted or re-finalized date</span></span></div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Gross Fee</div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Agent split</div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Net to Agent</div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Net to Brokerage</div>
											</th>
											<th class="cen noteInf">
												<div style="padding: 5px;"><span class="tooltipHelp">Cap<span class="tooltiptext">Amount paid to brokerage added to Cap Reached</span></span></div>
											</th>
											<th class="cen noteInf">
												<div style="padding: 1px;"><span class="tooltipHelp">Cap (DS)<span class="tooltiptext">Amount paid to brokerage for double sided (DS) deals added to Cap Reached</span></span></div>
											</th>
											<th class="cen">
												<div style="padding: 5px;">Cap Reached</div>
											</th>
										</tr>
									</thead>
									<tbody>

                                    	<tr class="tablerows" data-closingdate=''>
                                            <td class="cen"></td>
                                        	
                                            <td class="cen"></td>
                                            <td class="cen"></td>
                                            <td class='num'></td>
                                            <td class='num'></td>
                                            <td class='num'></td>
                                            <td class='num'></td>
                                            <td class="cen cap"></td>
                                            <td class="cen cap"></td>
                                            <td class='num'></td>

                                        </tr>
										<tfoot>
											<tr class="tablerowFinal" style='border-top: 2px solid grey;'>
												<td class="cen" style='text-align: left;'>Total</td>
												<td></td>
												<td></td>
												<td class="num"></td>
												<td></td>
												<td class="num"></td>
												<td class="num"></td>
												<td></td>
												<td></td>
												<td class="num"></td>
											</tr>
										</tfoot>

									</tbody>
                        		</table>
							</div>
						</div>

						<div id='comtable'>
							<label onclick='this.getElementsByClassName("rotimg")[0].classList.toggle("rotateimg90"); this.parentElement.getElementsByClassName("coverdiv")[0].classList.toggle("hide")'>
								<label style='width: 100%; cursor: pointer; padding-left: 10px;'  ><img class='rotimg'style='' src="../ImagesUsed/collapse.png">
								<span style="font-weight: bold"><%= S_date %> - <%= A_date %></label>
							</label>
							<div class="coverdiv">

								<div class='tiers'>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan'>Tier 1</span><%=MyInformation.User_Split%>%</label>
										<label class='flexible capCom'><%= MyInformation.User_Cap%></label>
									</div>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan'>Tier 2</span><%=MyInformation.User_Split2%>%</label>
										<label class='flexible capCom'><%= MyInformation.User_Cap2%></label>
									</div>
									<div class='flexibleContainer'>
										<label class='flexible splitCom'><span class='tierSpan'>Tier 3</span><%=MyInformation.User_Split3%>%</label>
										<label class='flexible capCom'><%= MyInformation.User_Cap3%></label>
									</div>
									<div class='flexibleContainer' style="padding-top: 10px;">
										<label class='flexible splitCom'><span style="width: 200px;" class='tierSpan'>Last value of Cap Reached</span></label>
										<label class='flexible capCom'>1</label>
									</div>
								</div>

                        		<table id="comTable">
									
									<thead>
										<tr class="newclass HeaderRowComissions" style='background: #f3f3f3;'>

											<th class="cen">
												<div style="padding: 5px;">#</div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Type</div>
											</th>

											<th class="cen noteInf">
												<div style="min-width: 60px;padding: 5px;"><span class="tooltipHelp">Date<span class="tooltiptext">Finalized, deleted or re-finalized date</span></span></div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Gross Fee</div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Agent split</div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Net to Agent</div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Net to Brokerage</div>
											</th>

											<th class="cen noteInf">
												<div style="padding: 5px;"><span class="tooltipHelp">Cap<span class="tooltiptext">Amount paid to brokerage added to Cap Reached</span></span></div>
											</th>

											<th class="cen noteInf">
												<div style="padding: 1px;"><span class="tooltipHelp">Cap (DS)<span class="tooltiptext">Amount paid to brokerage for double sided (DS) deals added to Cap Reached</span></span></div>
											</th>

											<th class="cen">
												<div style="padding: 5px;">Cap Reached</div>
											</th>

										</tr>
									</thead>
									<tbody>

										<%  if(InvoiceJSONArr.size()>1){
											System.out.println(InvoiceJSONArr.size());
											for (int i = 0, size = InvoiceJSONArr.size(); i < size; i++) {
											JSONObject oneCom = (JSONObject) InvoiceJSONArr.get(i); %>

 												<tr class="tablerows" data-closingdate='<%=oneCom.get("Date")%>'>
                                  	
                                       			  <td class="cen"><%= oneCom.get("TransactionID") %></td>
                                       			  <td class="cen"><%= oneCom.get("Type") %></td>
                                       			  <td class="cen"><%= oneCom.get("Date") %></td>
                                       			  <td class='num'><%= oneCom.get("Price") %></td>
                                       			  <td class='num'><%= oneCom.get("AgentSplit") %></td>
                                       			  <td class='num'><%= oneCom.get("NetToAgent") %></td>
                                       			  <td class='num'><%= oneCom.get("NetToBrokerage") %></td>
                                       			  <td class="cen cap<%= oneCom.get("Cap") %>"></td>
                                       			  <td class="cen cap<%= oneCom.get("CapDS") %>"></td>
                                       			  <td class='num'> <%= oneCom.get("CapReached") %> </td>

	  										

										 <% }} %> 

										
										<tfoot>
											<tr class="tablerowFinal" style='border-top: 2px solid grey;'>
												<td class="cen" style='text-align: left;'>Total</td>
												<td></td>
												<td></td>
												<%-- <td class="num"><%= TotalPrice%></td> --%>
												<td></td>
												<%-- <td class="num"><%=  TotalNets%></td> --%>
												<%-- <td class="num"><%= TotalBrokers%></td> --%>
												<td></td>
												<td></td>
												<%-- <td class="num" id="lastCapCom"><%=  CapReached %></td> --%>
											</tr>
										</tfoot>

									</tbody>
                        		</table>
							</div>
						</div>
					
					</div>


					<div id="DisclosureSection" class="NewSection" style="display: none;">
						<label class="HeadLinesSecondary" style="margin-left: 8px;">Disclosures</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<div style="width: 100%;"><label for="" style="width: 100%;
							font-weight: bold;
							font-size: 14px;
							text-align: left;
							margin-top: 20px;
							color: #5b6a7d;
							padding-left: 8px;">Coming Soon</label>
						</div>
					</div>

					<%-- <div id="Commissions&DisclosureButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">


							</span>

						</div>

					</div><!-- Closing AccessButtonsSection --> --%>

				</div><!-- Closing Commissions&Disclosure -->

				<div id="Tax&Banking" style="Width:100%; margin-top: 0;" class="tabcontent">

					<p id="ErrorEmpty3" class="ErrorEmpty" style="display:none;">Complete all required fields before
						proceeding.</p>

					<div class="flexibleContainer NewSectionSmall">

						<div class="flexible">

							<label class="NoMandatory"></label>

							<label>HST Number</label>

							<input class="inlineInput" type="text" id="HSTNumber" name="HSTNumber" maxlength="15"
								value="<%=MyInformation.HST%>">

						</div>

						<div class="flexible">

							<label id="SINMandatory" class="NoMandatory"></label>

							<label>SIN Number</label>

							<input class="inlineInput" type="text" id="SinNumber" name="SinNumber" maxlength="9"
								value="<%=MyInformation.SinNumber%>">

						</div>

					</div>


					<div class="NewSectionCopy" style="display: none;">

						<label class="container"><input class="inlineInput" onclick="openDirect()" type="checkbox"
								id="directOpener" name="directOpener">
							<span class="checkmark"></span></label>

						<label id="" class="copyButton" style="margin-left: 16px;">Direct Deposit</label>

					</div>


					<div id="void" style="width:100%; display: none;">

						<div class="flexibleContainer">

							<div class="left flexible">

								<input class="inlineInput chequeInputClass" type="file" id="VoidCheque" name="VoidCheque"
									onchange="uploadCheque('VoidCheque', 'todayDate')" value="">

								<label for="VoidCheque" onclick="" class="custom-file-upload inlineInput">

									<img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;">

									<label class="uploadButton" for="VoidCheque">Upload void cheque</label>

								</label>

							</div>

							<div class="flexible">

								<label class="custom-file-upload inlineInput" style="cursor: auto;">
									<span class="chequeDelete" style="display: none;"
										onclick="deleteCheque('VoidCheque', 'todayDate')">Delete</span>
									<img src="../ImagesUsed/Cheque.png" alt="" class="floatDataRightSide viewCheque"
										onclick="showCheque('VoidCheque')">
									<label class="UploadedDate" id="todayDate">Not Uploaded</label>

								</label>

							</div>
						</div>

					</div><!-- Closing Void -->

					<div id="DirectDeposit" class="flexibleContainer" style="display: none;">

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Bank Number</label>

							<input class="inlineInput" type="text" id="Bank" name="Bank" maxlength="20"
								value="<%=MyInformation.User_Bank%>" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Transit</label>

							<input class="inlineInput" type="text" id="Transit" name="Transit" maxlength="20"
								value="<%=MyInformation.User_Transit%>">
						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Number</label>

							<input class="inlineInput" type="text" id="AccountNumber" name="AccountNumber" maxlength="20"
								value="<%=MyInformation.User_AccountNumber%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Name</label>

							<input class="inlineInput" type="text" id="AccountName" name="AccountName" maxlength="20"
								value="<%=MyInformation.AccountName%>">

						</div>

					</div>

					<!-- <label class="HeadLinesSecondary NewSection" style="margin-left: 8px;">Tax Slips</label>

					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

					<div style="width: 100%;"><label for="" style="width: 100%;
						font-weight: bold;
						font-size: 14px;
						text-align: left;
						margin-top: 20px;
						color: #5b6a7d;
						padding-left: 8px;">Coming Soon</label></div> -->

					<div class="Slips NewSectionSmall" style="display: none;">

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

							<div class="flexible" style="    flex: 0.15;  margin-top: 2px; margin-right: 16px;"><img
									src="../ImagesUsed/Cheque.png" alt="" style="float: right"></div>

						</div>

					</div>




					<div id="Tax&BankingButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">

								<button type="button" class="buttonSaveOne" id="SaveButton3">Save</button>

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Tax&Banking -->



				<div id="Access" class="tabcontent" style="margin-top: 0;">
					<div class="accessHeadline">
						<label class="heavyfont">Change Email</label>
						<div id="showMoreEmail">
							<img src="../ImagesUsed/Arrow.png" alt="">
						</div>
					</div>
					<div class="passwordBox passwordBoxonPP" id="emailShow" style=" padding-bottom: 22px;">
						<p id="ErrorEmptyEmail" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<p id="ErrorEmail" class="ErrorEmpty" style="display:none;">Please try another email.</p>
						<div class="flexibleContainer">
							<div class="flexible" style="padding-right: 20px; display:flex;flex-direction:row">
								<div>
									<label class="NoMandatory heavyfont" style="margin-bottom: 5px;">Login Email:</label>

									<input class="inlineInput" type="text" id="LoginEmail" name="LoginEmail" maxlength="50"
										style="border: none; flex: 1; background-color: white; height: 30px;" 
										value="<%=MyInformation.User_Email%>" readonly>
								</div>
							</div>

							<div class="flexible"></div>
						</div>
						<div class="flexibleContainer">
							<div class="flexible" style="padding-right: 20px; display:flex;flex-direction:row">

								<div style="width: 100%;">

									<label class="MandentorySign"></label><label>New Email</label>

									<input class="inlineInput" type="text" id="NewLoginEmail" name="NewLoginEmail" maxlength="50"
									style="width: 100%; flex: 1; background-color: white; height: 30px;" value=""
									autocomplete="email">

								</div>

							</div>

							<div class="flexible">
								<button id="EmailChange" name="EmailChange" class="buttonBlue" type="button"
									onclick="checkEmail('<%=MyInformation.User_Email%>'); changeFormTarget(this);">Change</button>
							</div>
						</div>
						
					</div>

					<div class="accessHeadline">
						<label class="heavyfont">Change Password</label>
						<div id="showMorePassword">
							<img src="../ImagesUsed/Arrow.png" alt="">
						</div>
					</div>
					<div id="AccessMainSection" class="NewSectionSmall passwordBox passwordBoxonPP">

						<p id="ErrorEmpty5" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<p id="ErrorEmpty6" class="ErrorEmpty" style="display:none;">The password you have entered is
							incorrect.</p>

						
						<div class="flexibleContainer">

							<div class="flexible" style="padding-right: 20px;">

								<div>

									<label class="MandentorySign"></label><label>Current Password</label>

									<input class="inlineInput" type="password" id="CurrentPassword" name="CurrentPassword" maxlength="30"
										value="" autocomplete="current-password" style="height:30px"
										onkeyup="checktoSubmit('<%=MyInformation.User_password%>');">
									<span class="smallError" id="CurrentPasswordErrorEmpty">Please enter your
										password</span>

								</div>

								<div class="" style="margin-top: 21px;">

									<label class="MandentorySign"></label><label>New Password</label>

									<input class="inlineInput" type="password" id="NewPassword" name="NewPassword" value="" style="height:30px" maxlength="30"
										onkeyup="isAllPresent(this.id, 'ConfirmNewPassword'); cleasPasswordError(1)" autocomplete="new-password">
									<img src="../ImagesUsed/ClosedEye.png" id="openEye1" class="passEye"
										onclick="displayPassword('NewPassword', 'closedEye1', this.id);">
									<img src="../ImagesUsed/OpenedEye.png" id="closedEye1" class="passEye"
										onclick="hidePassword('NewPassword',  'openEye1', this.id);" style="display: none;">
									<span class="smallError" id="NewPasswordErrorEmpty">Please enter new password</span>
								</div>

								<div class="" style="margin-top: 21px;">

									<label class="MandentorySign"></label><label>Re-enter New Password</label>

									<input class="inlineInput" type="password" id="ConfirmNewPassword"style="height:30px"  autocomplete="new-password" maxlength="30"
										name="ConfirmNewPassword" onkeyup="isAllPresent('NewPassword', this.id);  cleasPasswordError(0);" value="">
									<img src="../ImagesUsed/ClosedEye.png" id="openEye2" class="passEye"
										onclick="displayPassword('ConfirmNewPassword', 'closedEye2', this.id);">
									<img src="../ImagesUsed/OpenedEye.png" id="closedEye2" class="passEye"
										onclick="hidePassword('ConfirmNewPassword',  'openEye2', this.id);"
										style="display: none;">
									<span class="smallError" id="ConfirmNewPasswordErrorEmpty">Please re-enter new password</span>
									<span class="smallError" id="ConfirmNewPasswordNoMatch">Passwords do not match</span>
								</div>



							</div>

							<div class="flexible" style="padding-bottom: 20px;">

								<div class="ConditionsBox ConditionsBoxSmell">
									<label class="Conditionslabel" style="margin-left: 0;">Password must include:</label>
									<ul style="margin: 0;">
										<li id="opt1" class="listsmall notCompleted">Uppercase letter</li>
										<li id="opt2" class="listsmall notCompleted">Lowercase letter</li>
										<li id="opt3" class="listsmall notCompleted">A number</li>
										<li id="opt4" class="listsmall notCompleted">A symbol character (@ ! $ # %)</li>
										<li id="opt5" class="listsmall notCompleted">At least 8 characters</li>
										<li id="opt6" class="listsmall notCompleted">Match re-entered password</li>

									</ul>

								</div>

								<div class="flexible onpassword">
									<button class="buttonBlue" id="passwordchange" name="passwordchange" type="button" style="margin-right: -4px;"
										onclick="checktoSubmit('<%= MyInformation.User_password%>')">Change</button>
								</div>

							</div>

						</div>


						<div style="margin-left: 16%; margin-top: -25px; display: none;">

							<label class="container"><input class="inlineInput" onclick="" type="checkbox"
									id="PersonalInformationConfirmation" name="PersonalInformationConfirmation">
								<span class="checkmark" style="top: 16px; left: 8px;"></span></label>

							<label id="CopyPropertyAddress1" class="copyButton" style="margin-left: 22px;">I confirm
								that my profile information is accurate and up to date</label>

						</div>


					</div><!-- Closing AccessMainSection -->

					<div id="AccessButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="buttonDiscard floatDataLefttSide">

							</span>

							<span class="secondSpan">

								<span class="savespan" id="savespan4">

								</span>

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Access -->

				<div id="AuditTrail" class="tabcontent" style="margin-top: 0;">

					<div id="AuditMainSection" class="NewSectionSmall">

						<label class="HeadLinesSecondary NewSectionSmall" style="margin-left: 8px;">Audit Trail</label>

						<hr class="" style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<p id="ErrorEmpty4" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<table>

							<tr>
								<th width=80%></th>
								<th></th>
							</tr>

							<tr>
								<td>Profile Created by Broker</td>

								<td>date</td>
							<tr>


						</table>

					</div>

					<div id="AccessButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan ">

								<button type="button" id="SaveButton4" class="buttonSaveOne">Save</button>

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Access -->

			</form>

		</div><!-- Closing Broker PersonalDetail -->
	</div>

	<script>

	function createNewTab(){
		document.querySelector('#newTier1').innerHTML=document.querySelector('#CommissionSplit1').value+"%";
		document.querySelector('#newTier2').innerHTML=document.querySelector('#CommissionSplit2').value+"%";
		document.querySelector('#newTier3').innerHTML=document.querySelector('#CommissionSplit3').value+"%";
		document.querySelector('#newCap1').innerHTML=document.querySelector('#CommissionCap1').value+" ";
		document.querySelector('#newCap2').innerHTML=document.querySelector('#CommissionCap2').value+" ";
		document.querySelector('#newCap3').innerHTML=document.querySelector('#CommissionCap3').value+" ";

		document.querySelector('#fromNew').innerHTML=document.querySelector('#StartDate').value;
		document.querySelector('#toNew').innerHTML=document.querySelector('#AnniversaryDate').value;


		if(document.querySelector('#useLastVal').checked){
			document.querySelector('#lastVal').innerHTML=document.querySelector('#lastCapCom').innerHTML;
		}
		document.getElementById('UpdateNewTable').style.display="";
		document.querySelector("#UpdateNewTable").style.display="";
		
	}

		$(document).ready(function() {

			$.getScript("../Scripts/PersonalProfile.js").then(function() {
				forSelects();
				checkNavBar();
				TabsHandleler(event,'PersonalDetails','tabcontent','tablinks2','PersonalDetailsDetailsTab');

				$.getScript("../Scripts/PersonalProfileLaunch.js").then(()=> {lockComissions();})
			})
	

		}); 
	</script>


</body>




</html>