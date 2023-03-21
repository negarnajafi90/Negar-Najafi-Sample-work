<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

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

Connection con=null;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../index.jsp");



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

//This part is to keep track of the maximum time a user can be in active on the system and after that direct the user to the login page

//int timeout = session.getMaxInactiveInterval(); // Get the time has been set 

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%> 

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Scripts to add jQuerry and bootrstrap -->

	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>
	<script type="text/javascript" src="../Scripts/jQuerry/jsPDF.min.js"></script>
	<!-- <script type="text/javascript" src="../Scripts/jQuerry/jquery-3.6.0.min.js"></script> -->
	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap.min.js"></script>

	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">



	<!-- Our scripts/css -->

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<link rel="stylesheet" type="text/css" href="../CSS/forRegistration.css">

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<script type="text/javascript" src="../Scripts/Registration.js"></script>

	<title>Personal Information - Masterre</title>

	<style>
		/* .modal {
			padding-top: 25vh;
		}

		.modal * {
			font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
		}

		#myModalonLoad .modal-content {
			background-color: white;
			max-width: 500px;
			padding: 10px;
			width: 50%;
		}

		.boxModal {
			border: 1px solid #054d6a;
			padding: 30px;
			padding-bottom: 40px;
			padding-top: 20px;
		}

		#myModalonLoad .modal-content p {
			color: #5b6a7d;
			font-size: 14px;
		}

		#myModalonLoad .modal-content h1 {
			color: #054d6a;
			font-size: 26px;
		}

		#myModalonLoad .finalButtons {
			padding: 8px 25px;
			font-weight: bold;
		}
 */


	</style>

<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

</head>

<header>


</header>

<body>

	<script type="text/javascript">
		
	</script>

	<div id="myModalonLoad" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalHeader">Corporate Interview Completed!</div>
			<div class="boxModal" id='PersonalModalLoad'>
				<p style="margin-top: 30px;">Thank you for completing the corporate interview.
					Please take a few more minutes to complete your personal profile setup.</p>
				<p style="margin-bottom: 30px;">You can save your progress and logout if you wish to leave the interview.</p>
				<span class="finalButtons">Begin Personal Interview</span>
			</div>
		</div>
	</div>

	<div style='display: flex'>
		<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

			<div class="logo">

				<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

				<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

			</div>

			<div class="dropdown" id="forhov">
				<a><button id="createDrop" class="dropbtn">+</button></a>
			</div>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Dashboard.png" alt="YesOrNo"
					style="margin-bottom: 0px;"><span class="navText">Dashboard</span></button>

			<button class="tablinks"> <img class="dashboardIcons accept" src="../ImagesUsed/Commission Calculator.png"
					alt="YesOrNo"><span class="navText">Commissions Calculator</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Reports.png" alt="YesOrNo"
					style="margin-bottom: -3px;"><span class="navText">Deals</span></button>

			<button class="tablinks active active"><img class="dashboardIcons accept"
					src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span class="navText">Personal
					Profile</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Company Profile.png"
					style="margin-bottom: -3px;" alt="YesOrNo"><span class="navText">Company Profile</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span
					class="navText">Contacts</span></button>

			<a class="menubartext" href="" style="display: none;"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span
						class="navText">Inbox</span></button></a>

			<a class="menubartext " href="../Logout.jsp"><button class="tablinks tablinkLogout"><img
						class="dashboardIcons accept extrasize" src="../ImagesUsed/logOut.png" alt="YesOrNo"><span
						class="navText">Log Out</span></button></a>

			<button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
					class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

			<button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
					class="dashboardIcons accept rotate180 openClose " src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>


		</div><!-- Closing left-Nav-bar-Menu -->


		<div id="BrokerPersonalDetail" class="Rightcolumn marginBody navBarMovable" >

			<%
			
			int Id=(Integer)session.getAttribute("Userid");

				//int UserID=Integer.parseInt(Id);

				Users MyInformation=new Users();

				RDSFunctions RDS =new RDSFunctions();

				MyInformation=RDS.GetAnyUserById(Id,con);


				%>


			<div class="HeaderDashboard flexibleContainer" style='margin-top: 14px; max-width: 700px;'>

				<label class="DealsHeader flexible">Personal Profile</label>

			</div>
			<div id="CompanyTabs" class="PartiesNavBar flexibleContainer" style="max-width: 700px;">

				<button id="PersonalDetailsDetailsTab" class="tablinks2 flexible active"
					onclick="TabsHandleler(event,'PersonalDetails','tabcontent','tablinks2','PersonalDetailsDetailsTab'); ">Personal
					Details</button>

				<button id="Commissions&DisclosureTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Commissions&Disclosure', 'tabcontent', 'tablinks2', 'Commissions&DisclosureTab'); ">Commissions</button>

				<button id="Tax&BankingTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Tax&Banking','tabcontent', 'tablinks2', 'Tax&BankingTab'); ">Tax & Banking
				</button>

				<button id="AccessTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'Access','tabcontent', 'tablinks2', 'AccessTab'); ">Access</button>


			</div>

			<iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
			<form name="BrokerDetailInfo" id="BrokerDetailInfo" method="post" action="../PersonalProfileRegistration"
				enctype="multipart" target="hiddenFrame" style="width: 100%;">

				<div id="PersonalDetails" class="tabcontent" style="margin-top: 0;">

					<p id="ErrorEmpty" class="ErrorEmpty" style="display: none;">
						Complete all required fields before proceeding.</p>

					<div class="flexibleContainer NewSectionSmall">

						<div class="flexible">

							<label class="MandentorySign"></label><label>Title</label>

							<input class="inlineInput" type="text" id="Title" name="Title" maxlength="10"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.Title%>"
								onchange="trimString(this.id)" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>First Name</label>

							<input class="inlineInput" type="text" id="Firstname" name="Firstname" maxlength="45"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.Firstname%>"
								onchange="trimString(this.id)" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Last Name</label>

							<input class="inlineInput" type="text" id="Lastname" name="Lastname" maxlength="45"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.Lastname%>"
								onchange="trimString(this.id)" />

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="NoMandatoryTwo">PREC</label>

							<input class="inlineInput" type="text" id="PRECNum" name="PRECNum" maxlength="60"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.PREC%>" />

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Date of Birth</label>

							<div class="input-group">
								<input id="DateOfBirth" name="DateOfBirth" type="text"
									onchange="PersonalDetailsStepSubmit()" class="form-control date-input"
									placeholder="DD MM YYYY" value="<%= MyInformation.DateOfBirth%>" readonly />
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
								value="<%=MyInformation.User_Unit%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Number</label>

							<input class="inlineInput" type="text" id="StreetNumber" name="StreetNumber" maxlength="10"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_StreetNumber%>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Street Name</label>

							<input class="inlineInput" type="text" id="StreetName" name="StreetName" maxlength="40"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_StreetName%>"
								onchange="trimString(this.id)">

						</div>

					</div>

					<div class="flexibleContainer">

						<div class="flexible">

							<label class="MandentorySign"></label><label>City</label>

							<input class="inlineInput" type="text" id="City" name="City" maxlength="30"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_City  %>"
								onchange="trimString(this.id)">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Province</label>

							<div class="custom-select"
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
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_PostalCode %>">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label><label>Country</label>

							<input class="inlineInput" type="text" id="Country" name="Country" readonly maxlength="20"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_Country%>">

						</div>

					</div>

					<div class="flexibleContainer" style="display: none;" id="ProvinceExtra">

						<div class="flexible">
							<label class="MandentorySign"></label><label>Other province or state</label>

							<input type="text" class="inlineInput" id="OtherProvince" name="OtherProvince"  maxlength="20">
						</div>

						<div class="flexibleotherProvince"></div>


					</div>

					<div class="flexibleContainer NewSection">

						<div class="flexible">

							<label class="MandentorySign"></label><label>E-mail</label>

							<input class="inlineInput" type="text" id="Email" name="Email" maxlength="50"
								onblur="PersonalDetailsStepSubmit()" value="<%=MyInformation.User_Email%>">

						</div>

					</div>

					<div class="flexibleContainer">


						<div class="flexible">

							<label class="MandentorySign"></label><label>Phone</label>

							<input class="inlineInput" type="text" id="Phone" name="Phone" maxlength="14"
								onblur="PersonalDetailsStepSubmit()"
								onkeydown="phoneNumberFormatter(this.id);PersonalDetailsStepSubmit()"
								autocomplete="tel"
								value="<%=MyInformation.User_Phone%>">

						</div>

						<div class="flexible">

							<label class="NoMandatoryTwo">Mobile</label>

							<input class="inlineInput" type="text" id="MobileNumber" name="MobileNumber" maxlength="20"
								value="<%=MyInformation.User_faxOrMobileNumber%>"
								onkeydown="phoneNumberFormatter(this.id)"
								autocomplete="tel">

						</div>


					</div>

					<div id="PersonalDetailsButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span>

								<span class="buttonDiscard floatDataLefttSide">

								</span>

								<span class="secondSpan extraspacing">

									<span class="savespan" id="savespan1">
									</span>

									<button id="PersonalDetailsNext" name="PersonalDetailsNext" class="buttonBlue"
										type="button" onclick="PersonalDetailsStep(); PersonalDetailsStepSubmit()">Save
										& Next</button>

									<!-- <button id="PersonalDetailsSave" class="buttonBlue" type="button">Save</button> -->

								</span>

							</span>

						</div>

					</div><!-- Closing PersonalDetailsButtonsSection -->


				</div><!-- Closing PersonalDetails -->

				<!------------------------------------------------------------------------------------------------------------------------------------------->

				<div id="Commissions&Disclosure" class="tabcontent" style="margin-top: 0;">

					<div id="Commission Structure">
						
						<p id="ErrorCap" class="ErrorEmpty" style="display:none;">The commission cap cannot be less than the commission cap entered for the previous tier.</p>


						<div class="flexibleContainer NewSectionSmall" id="DivContent1">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Start Date</label>

								<div class="input-group">
									<input id="StartDate" name="StartDate" type="text" class="form-control date-input"
										placeholder="DD MM YYYY" value="<%=MyInformation.User_StartDate%>" readonly />
									<label class="input-group-btn" for="StartDate" id="StartDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>

								<!-- <input class="inlineInput" disabled type="date" id="StartDate" name="StartDate" value=""> -->

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Anniversary Date</label>

								<div class="input-group">
									<input id="AnniversaryDate" name="AnniversaryDate" type="text"
										class="form-control date-input" placeholder="DD MM YYYY"
										value="<%=MyInformation.User_Anniversary%>" readonly />
									<label class="input-group-btn" for="AnniversaryDate" id="AnniversaryDateLabel">
										<span class="btn btn-default">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</label>
								</div>

							</div>

						</div><!-- Closing DivContent1 -->

						<div class="flexibleContainer NewSection">

							<div class="flexible">

								<label class="MandentorySign"></label><label>Commission Split</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit1" name="CommissionSplit1" maxlength="8"
										value="<%=MyInformation.User_Split%>" onchange='checkPercent(this.id, 100);  lockComissions();'
										onkeyup="NextStepComissionSubmit()">
								</span>

							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Commission Cap</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap1" name="CommissionCap1" maxlength="10"
										onchange='FormatNumber(this.id); lockComissions();' onkeyup="NextStepComissionSubmit()"
										value="<%=MyInformation.User_Cap%>" />
								</span>

							</div>



						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="NoMandatory"></label><label>Second Commission Split</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit2" maxlength="8" onchange='checkPercent(this.id, 100);  lockComissions();'
										onkeyup="NextStepComissionSubmit()" name="CommissionSplit2"
										value="<%=MyInformation.User_Split2%>">
								</span>



							</div>

							<div class="flexible">

								<label class="NoMandatory"></label><label>Second Commission Cap</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap2" maxlength="10" name="CommissionCap2"
										onchange='FormatNumber(this.id); lockComissions();' onkeyup="NextStepComissionSubmit()"
										value="<%=MyInformation.User_Cap2%>" />
								</span>

							</div>

						</div>

						<div class="flexibleContainer">

							<div class="flexible">

								<label class="NoMandatory"></label><label>Third Commission Split</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px; float: right;">%</label>
									<input class="input5" type="text" id="CommissionSplit3" maxlength="8" name="CommissionSplit3"
										onchange='checkPercent(this.id, 100); lockComissions();' value="<%=MyInformation.User_Split3%>"
										onkeyup="NextStepComissionSubmit()">
								</span>


							</div>

							<div class="flexible">

								<label class="NoMandatory"></label><label>Third Commission Cap</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;float: left;">$</label>
									<input class="input5" type="text" id="CommissionCap3"  maxlength="10" name="CommissionCap3"
										onchange='FormatNumber(this.id); lockComissions();' value="<%=MyInformation.User_Cap3%>"
										onkeyup="NextStepComissionSubmit()" />
								</span>

							</div>

						</div>

					</div><!-- Closing Commission Structure -->

					<div id="DisclosureSection" class="NewSection" style="display: none;">
						<label class="HeadLinesSecondary" style="margin-left: 8px;">Disclosures</label>
						<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

						<p>Disclosures</p>
					</div>

					<div id="Commissions&DisclosureButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">



							<span class="buttonDiscard floatDataLefttSide">

								<button id="Commissions&DisclosureBack" type="button" class="buttonBlue"
									onclick="TabsHandleler(event,'PersonalDetails','tabcontent','tablinks2','PersonalDetailsDetailsTab'); ">Back</button>

							</span>
							<span class="secondSpan extraspacing">

								<span class="savespan" id="savespan2">
								</span>

								<button id="Commissions&DisclosureNext" name="Commissions&DisclosureNext"
									class=" buttonBlue" type="button" onclick="NextStepComission();">Save
									& Next</button>

								<!-- <button id="Commissions&DisclosureSave" type="button" class="buttonBlue">Save</button> -->
							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Commissions&Disclosure -->

				<div id="Tax&Banking" style="Width:100%; margin-top: 0;" class="tabcontent">

					<p id="ErrorEmpty3" class="ErrorEmpty" style="display: none;">
						Complete all required fields before proceeding.</p>

					<p id="ErrorSIN9" class="ErrorEmpty" style="display: none;">
						Please make sure SIN number has 9 digits.</p>


					<div class="flexibleContainer NewSectionSmall">

						<div class="flexible">

							<label id="hstLabel" class="NoMandatory"></label>

							<label>HST Number</label>

							<input class="inlineInput" type="text" id="HSTNumber" name="HSTNumber" maxlength="15"
								value="<%=MyInformation.HST%>" onblur="NextStepTaxSubmit()">

						</div>

						<div class="flexible">

							<label id="sinNumber" class="MandentorySign"></label>

							<label>SIN Number</label>

							<input class="inlineInput" type="text" id="SinNumber" name="SinNumber" maxlength="9"
								value="<%=MyInformation.SinNumber%>" onblur="NextStepTaxSubmit()">

						</div>

					</div>


					<div class="NewSectionCopy" style="display: none;">>

						<label class="container"><input class="inlineInput" type="checkbox" id="directOpener" name=""
								onclick="openDirect()">
							<span class="checkmark"></span></label>

						<label class="copyButton" style="margin-left: 16px;">Add Direct Deposit</label>

					</div>

					<div id="DirectDeposit" class="flexibleContainer" style="display: none;">

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Bank Number</label>

							<input class="inlineInput" type="text" id="Bank" name="Bank" maxlength="20"/>

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Transit</label>

							<input class="inlineInput" type="text" id="Transit" name="Transit" maxlength="20">
						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Number</label>

							<input class="inlineInput" type="text" id="AccountNumber" name="AccountNumber" maxlength="20">

						</div>

						<div class="flexible">

							<label class="MandentorySign"></label>

							<label>Account Name</label>

							<input class="inlineInput" type="text" id="AccountName" name="AccountName" maxlength="20">

						</div>

					</div>



					<div id="void" class="NewSectionMedium" style="width:100%; display: none;">

						<div class="flexibleContainer">

							<div class="left flexible">

								<label style="border-width: 1px; height: 40px;" for="VoidCheque"
									class="custom-file-upload inlineInput">

									<img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;">

									<label
										style="text-align: left; position: absolute; margin-left: 20px;  margin-top: 7px;">Upload
										void
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

					<label class="HeadLinesSecondary NewSection" style="margin-left: 8px; display: none;">Tax Slips</label>

					<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px; display: none;">

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

							<span class="buttonDiscard floatDataLefttSide">

								<button id="Tax&BankingBack" type="button" class="buttonBlue"
									onclick="TabsHandleler(event,'Commissions&Disclosure', 'tabcontent', 'tablinks2', 'Commissions&DisclosureTab'); ">Back</button>

							</span>

							<span class="secondSpan extraspacing">

								<span class="savespan" id="savespan3">

								</span>

								<button id="Tax&BankingNext" name="Tax&BankingNext" class="buttonBlue" type="button"
									onclick="NextStepTax();">Save &
									Next</button>

								<!-- <button id="Tax&BankingSave" type="button" class="buttonBlue">Save</button> -->

							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Tax&Banking -->

				<div id="Access" class="tabcontent" style="margin-top: 0;">

					<div id="AccessMainSection" class="NewSectionSmall passwordBox"
						style="margin-top: 40px; border: 1px solid lightgrey; box-sizing: border-box; padding: 22px; padding-left: 40px; margin-right: 4px;">

						<p id="ErrorEmpty5" class="ErrorEmpty" style="display:none;">Complete all required fields
							before proceeding.</p>

						<div class="flexibleContainer">

							<div class="flexible">

								<div class="">

									<label class="MandentorySign"></label><label>Login email</label>

									<input class="inlineInput" type="text" id="LoginEmail" name="LoginEmail" value="" maxlength="50">

								</div>

								<div class="" style="margin-top: 15px;">

									<label class="MandentorySign"></label><label>Current Password</label>

									<input class="inlineInput" type="password" id="CurrentPassword" name="CurrentPassword" maxlength="30"
										autocomplete="current-password">
									<img src="../ImagesUsed/ClosedEye.png" id="openEye0" class="passEye"
										onclick="displayPassword('CurrentPassword', 'closedEye0', this.id);">
									<img src="../ImagesUsed/OpenedEye.png" id="closedEye0" class="passEye"
										onclick="hidePassword('CurrentPassword',  'openEye0', this.id);"
										style="display: none;">
									<span class="smallError" id="CurrentPasswordErrorEmpty">Please enter your
										password</span>
									<span class="smallError" id="CurrentIncorrentPassword">Password is incorrect</span>

								</div>

								<div class="" style="margin-top: 15px;">

									<label class="MandentorySign"></label><label>New Password</label>

									<input class="inlineInput" type="password" id="NewPassword" name="NewPassword"  maxlength="30"
										autocomplete="new-password" onkeyup="isAllPresent(this.id, 'ConfirmNewPassword');">
									<img src="../ImagesUsed/ClosedEye.png" id="openEye1" class="passEye"
										onclick="displayPassword('NewPassword', 'closedEye1', this.id);">
									<img src="../ImagesUsed/OpenedEye.png" id="closedEye1" class="passEye"
										onclick="hidePassword('NewPassword',  'openEye1', this.id);" style="display: none;">
									<span class="smallError" id="NewPasswordErrorEmpty">Please enter new password</span>

								</div>

								<div class="" style="margin-top: 15px;">

									<label class="MandentorySign"></label><label>Re-enter New Password</label>

									<input class="inlineInput" type="password" id="ConfirmNewPassword"
										name="ConfirmNewPassword" onkeyup="isAllPresent('NewPassword', this.id)"  maxlength="30">
									<img src="../ImagesUsed/ClosedEye.png" id="openEye2" class="passEye"
										onclick="displayPassword('ConfirmNewPassword', 'closedEye2', this.id);">
									<img src="../ImagesUsed/OpenedEye.png" id="closedEye2" class="passEye"
										onclick="hidePassword('ConfirmNewPassword',  'openEye2', this.id);"
										style="display: none;">
									<span class="smallError" id="ConfirmNewPasswordErrorEmpty">Please re-enter new
										password</span>
									<span class="smallError" id="ConfirmNewPasswordNoMatch">Passwords do not match</span>

								</div>

							</div>

							<div class="flexible" style="padding: 0px 20px 20px 20px;">
								<label class="Conditionslabel"> New password must include:</label>

								<div class="ConditionsBox">
									<ul>
										<li id="opt1" class="list notCompleted">Uppercase letter</li>
										<li id="opt2" class="list notCompleted">Lowercase letter</li>
										<li id="opt3" class="list notCompleted">A number</li>
										<li id="opt4" class="list notCompleted">A symbol character (@ ! $ # %)</li>
										<li id="opt5" class="list notCompleted">At least 8 characters</li>
										<li id="opt6" class="list notCompleted">Match Re-entered password</li>

									</ul>

								</div>

							</div>

						</div>

						<div style="margin-left: 16%; margin-top: -25px;">

							<label class="container"><input class="inlineInput" onclick="let a = document.getElementById('AccessFinalize'); if(document.getElementById('PersonalInformationConfirmation').checked){a.style.background = '';a.style.color = ''; a.classList.remove('noPointerEvent')}else{a.style.background = 'lightgrey';a.style.color = 'black'; a.classList.add('noPointerEvent')} " type="checkbox"
									id="PersonalInformationConfirmation" name="PersonalInformationConfirmation">
								<span class="checkmark" style="top: 16px; left: 8px;"></span></label>

							<label id="CopyPropertyAddress1" class="copyButton" style="margin-left: 22px;">I confirm
								that my profile information is accurate and up to date</label>

						</div>

					</div><!-- Closing AccessMainSection -->

					<div id="AccessButtonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="buttonDiscard floatDataLefttSide">

								<button id="AccessBack" type="button" class="buttonBlue" style='padding: 8px 20px;'
									onclick="TabsHandleler(event,'Tax&Banking','tabcontent', 'tablinks2', 'Tax&BankingTab'); ">Back</button>
							</span>

							<span class="secondSpan extraspacing">

								<button id="AccessFinalize" name="AccessFinalize" style='margin-right: 24px; padding: 8px 20px; background: lightgrey; color: black;'
									onclick="ValidatePassword(); checktoSubmit('<%=MyInformation.User_password %>')"
									class="buttonBlue noPointerEvent" type="button"> Complete 
								</button>
							</span>

						</div>

					</div><!-- Closing AccessButtonsSection -->

				</div><!-- Closing Access -->

			</form>

		</div><!-- Closing Broker PersonalDetail -->
	</div>

	<script type="text/javascript" src="../Scripts/PersonalRegLoad.js"></script>


	<script>$(document).ready(function(){
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

			});
			$(function () {
				$('#StartDate').datepicker({
					format: "dd M yyyy",
					startDate: '1d'
				}).on('changeDate', function (e) {
					var anndate= new Date($("#StartDate").val());
					var minDate = anndate.setDate(anndate.getDate());
					var someDate = new Date($("#StartDate").val());
					var maxDate = someDate.setDate(someDate.getDate() + 366);
					if(new Date($("#AnniversaryDate").val()) < new Date($("#StartDate").val())){
					$('#AnniversaryDate').datepicker('setDate', new Date($("#StartDate").val()));
					}
					
					if(minDate != ''){
						$('#AnniversaryDate').datepicker('setStartDate', new Date(minDate));
					}

					if(maxDate != ''){
						$('#AnniversaryDate').datepicker('setEndDate', new Date(maxDate));
					}
					
					$(this).datepicker('hide');
					document.getElementById(this.id).style.borderColor = "lightgrey";
					document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";

				});

			});
			$(function () {
				$('#AnniversaryDate').datepicker({
					format: "dd M yyyy",
					startDate: '1d'

				}).on('changeDate', function (e) {
					$(this).datepicker('hide');
					document.getElementById(this.id).style.borderColor = "lightgrey";
					document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
				});

			});
		});
	</script>

</body>

</html>