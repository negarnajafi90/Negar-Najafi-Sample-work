<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="org.json.*"  %>
<%@ page import="org.json.simple.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"  %>



<%@ page import="ProMasterClasses.Users"  %>
<%@ page import="ProMasterClasses.Transaction"  %>
<%@ page import="RDS.RDSFunctions"  %>
<%@ page import="ProMasterClasses.CommissionDetails"  %>
<%@ page import="ProMasterClasses.Invoice"  %>
<%@ page import="ProMasterClasses.Contacts"  %>
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
  response.sendRedirect("../NoPermission.jsp");
}

else{
	 UserID=(int)session.getAttribute("Userid"); 
	 BrokerID=(int)session.getAttribute("Brokerid") ;
     Type=(String)session.getAttribute("Type") ;
     Email=(String)session.getAttribute("Email") ;
     con=(Connection) session.getAttribute("Connection");
%>
<% 
//This part is to keep track of the maximum time a user can be in active on the system and after that direct the user to the login page

//int timeout = session.getMaxInactiveInterval(); // Get the time has been set 

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<link rel="stylesheet" type="text/css" href="../CSS/TRSAndTable.css">

	<link rel="stylesheet" type="text/css" href="../CSS/forModals.css">

	<link rel="stylesheet" type="text/css" href="../DataTables/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../CSS/Contacts.css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

	<title>Contacts - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

</head>


<%

RDSFunctions myRDS=new  RDSFunctions();

JSONObject AllContactsJSON=myRDS.GetAllContactsJSON(UserID ,con);
//System.out.println("jsonArr ="+ AllContactsJSON);


//String AllContacts=myRDS.GetAllContacts(UserID ,con);
//JSONParser parser = new JSONParser();  
//JSONObject object = (JSONObject) parser.parse(AllContacts);  

JSONArray allCont = (JSONArray) AllContactsJSON.get("all");
JSONArray clientCont = (JSONArray) AllContactsJSON.get("Clients");
JSONArray BrokCont = (JSONArray) AllContactsJSON.get("Brokerages");
JSONArray LawFirmCont = (JSONArray) AllContactsJSON.get("LawFirm");

%>


<body>


	<form id="NewUser" name="NewUser" method="post" action="../DeleteContact" enctype="multipart">
		<div id="myModalDelete" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modalHeader">Delete Contact</div>
				<p>Do you want to delete selected Contact?</p>


				<input type="Hidden" name="ContactID1" id="ContactID1" value="978123">
				<div class="popUpContainer">
					<span class="close">No</span>
					<button id="deleteContact" class="submitButton" type="submit">Yes</button>
				</div>
			</div>
		</div>

	</form>

	<div id="myModalEdit" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalHeader">Edit Contact</div>
			<p>Do you want to edit selected Contact?</p>
			<div class="popUpContainer">
				<span class="close">No</span>
				<button class="submitButton" type="submit">Yes</button>
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

			<a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;"
						alt="YesOrNo"><span class="navText">Company Profile</span></button></a>

			<a class="menubartext" href="Contacts.jsp"><button class="tablinks active"><img class="dashboardIcons accept"
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

		<div id="MainContacts" class="Rightcolumn marginBody navBarMovable loading">

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

			<div class="HeaderDashboard flexibleContainer" style="margin-top: 14px;">

				<label class="DealsHeader flexible">Contacts</label>

			</div>


			<div id="InnerTabs" class="PartiesNavBar flexibleContainer"
				style="width: 100%; margin-top: 3px;">

				<button id="AllDealTab" class="tablinks2 flexible active"
					onclick="TabsHandleler(event,'AllContacts','tabcontent1','tablinks2','AllDealTab');">All
					Contacts</button>

				<button id="ClosedTab" class="tablinks2 flexible "
					onclick="TabsHandleler(event, 'ClientContacts', 'tabcontent1', 'tablinks2','ClosedTab');">Clients</button>

				<button id="FirmTab" class="tablinks2 flexible "
					onclick="TabsHandleler(event, 'LawFirmsContacts', 'tabcontent1', 'tablinks2', 'FirmTab');">Law
					Firms</button>

				<button id="OtherTab" class="tablinks2 flexible "
					onclick="TabsHandleler(event, 'BrokeragesContacts', 'tabcontent1', 'tablinks2', 'OtherTab');">Brokerages</button>

			</div>



			<div id="AllContacts" class="tabcontent1">

				<div style="width: 100%;">

					<p id="ErrorDelete1" class="ErrorEmpty" style="display: none;">Please select a contact to delete</p>

					<p id="ErrorEdit1" class="ErrorEmpty" style="display: none;">Please select a contact to edit</p>

				</div>

				<div>
					<div id="table-wrapper" class="NewSectionSmall hidden">

						<div class='wrapperdiv1child' style="">

							<a href="AddNewContact.jsp"><button class="contactButton"
									style=" margin-left: 0; padding-left: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-plus-circle optionsImg2" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										<path
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
									</svg>
									Add</button></a>

							<button class="contactButton" id="DeleteContacts1" type="button">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									style="margin-bottom: -1px;" class="bi bi-trash3 optionsImg2" viewBox="0 0 16 16">
									<path
										d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
								</svg>
								Delete</button>

							<button class="contactButton" onclick="openExport('AllContacts')">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="margin-bottom: -1px;"
									fill="currentColor" class="bi bi-box-arrow-up optionsImg2" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
									<path fill-rule="evenodd"
										d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
								</svg>
								Export</button>

							<button class="contactButton" id="EditContacts1">
								<svg xmlns="http://www.w3.org/2000/svg" style="    margin-bottom: -2px;" width="16"
									height="16" fill="currentColor" class="bi bi-pencil-square optionsImg2"
									viewBox="0 0 16 16">
									<path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
									<path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
								</svg>
								Edit</button>


							<div class="custom-select2 multichoiceBox" id="DisplayFields1">

								<select class="inputSelection" id="DisplayFieldsSelect1" name="">

									<option value="">Select Fields</option>

									<option value="0">Type</option>

									<option value="1">Name</option>

									<option value="2">Business name</option>
									
									<option value="3">Address</option>

									<option value="4">Email</option>

									<option value="5">Phone</option>

									<option value="6">Mobile</option>

									<option value="7">Law Clerk Name</option>

									<option value="8">Law Clerk Email</option>

								</select>

							</div>


						</div>



						<div id="table-scroll" class="tablediv" onclick="enable('EditContacts1', 'AllcontactsTable')">
							<span  class="rawSpan"></span>
							<table id="AllcontactsTable"
								style="display: block;     pointer-events: all;     overflow: auto;">

								<thead>

									<tr style="height: 30px !important; text-align: center; position: sticky; top: 0;">

										<th class="row1Comission tdSm">
											<div class="tdSm">Type</div>
										</th>

										<th class="row2Comission tdMed">
											<div class="tdMed">Name</div>
										</th>

										<th class="row3Comission tdBig">
											<div class="tdBig">Business Name</div>
										</th>

										<th class="row4Comission tdSm tdiPad">
											<div class='tdSm'>Address</div>
										</th>

										<th class="row5Comission tdSm">
											<div class="tdSm">Email</div>
										</th>

										<th class="row6Comission tdSm">
											<div class="tdSm">Phone</div>
										</th>

										<th class="row7Comission tdSm">
											<div class="tdSm">Mobile</div>
										</th>
										
										<th class="row8Comission tdSm">
											<div class='tdSm'>Law Clerk Name</div>
										</th>

										<th class="row9Comission tdSm">
											<div class='tdSm'>Law Clerk Email</div>
										</th>

									</tr>
								</thead>

								<tbody>
								<% 
									if(allCont!=null){
								    for (int i = 0, size = allCont.size(); i < size; i++) {
									JSONObject oneCont = (JSONObject) allCont.get(i);
								%>

									<tr onclick=' SetID("<%=oneCont.get("ID") %>"); '>
										<td class="row1Comission"><%= oneCont.get("Type") %></td>
										<td class="row2Comission">
											<%=oneCont.get("FirstName")%> <%=oneCont.get("LastName") %> <%=oneCont.get("BusinessName") %> <%=oneCont.get("Lawyer") %>
										</td>
										<td class="row3Comission"><%=oneCont.get("BusinessName")%> <%=oneCont.get("LawFirm") %></td>

										<td class="row4Comission"><%=oneCont.get("Unit") %> <%= oneCont.get("StreetNumber") %> <%= oneCont.get("StreetName") %>, <%= oneCont.get("City") %>, <%= oneCont.get("Province") %></td>

										<td class="row5Comission"><%=oneCont.get("Email") %></td>
										<td class="row6Comission"><%=oneCont.get("Phone") %></td>
										<td class="row7Comission"><%=oneCont.get("ExtraContactNumber")%></td>
										<td class="row8Comission"><%= oneCont.get("ClerkName")  %></td>
										<td class="row9Comission"><%=oneCont.get("ClerkEmail") %></td>
									</tr>
								<%}}%>
								</tbody>
								<%-- <tbody>


									<%   
									
								for ( Contacts Contact : AllContacts) {  
									Boolean isEmpty = true;
									if(!(Contact.StreetNumber == null)){
										isEmpty= Contact.StreetNumber.isEmpty();
									}else{
										isEmpty = true;
									}
									%>

									<tr onclick=" SetID('<%=Contact.ID%>'); ">
										<td class="row1Comission"><%= Contact.Type.replace("Firm", " Firm") %></td>
										<td class="row2Comission">
											<%=Contact.FirstName%> <%=Contact.LastName %> <%=Contact.Lawyer %><%=Contact.Officer %>
										</td>
										<td class="row3Comission"><%=Contact.businesName%> <%=Contact.LawFirm %></td>
										<%if(isEmpty){%>
										<td class="row4Comission"></td>
										<%}else{%>
										<td class="row4Comission"><%= Contact.Unit %> <%= Contact.StreetNumber %> <%= Contact.StreetName %>, <%= Contact.City %>, <%= Contact.Province %></td>
										<%}%>
										<td class="row5Comission"><%=Contact.Email %></td>
										<td class="row6Comission"><%=Contact.Phone  %></td>
										<td class="row7Comission"><%=Contact.ExtraContactNumber%></td>
										<td class="row8Comission"><%= Contact.ClerkName  %></td>
										<td class="row9Comission"><%= Contact.ClerkEmail  %></td>
									</tr>

									<% }%>
								</tbody> --%>

							</table>
						</div>
					</div>
				</div>

			</div>


			<div id="ClientContacts" class="tabcontent1" style="display: none;">

				<div style="max-width: 75vw; width: 100%;">

					<p id="ErrorDelete2" class="ErrorEmpty" style="display: none;">Please select a contact to delete.</p>


					<p id="ErrorEdit2" class="ErrorEmpty" style="display: none;">Please select a contact to edit</p>

				</div>

				<div>
					<div id="table-wrapper" class="NewSectionSmall">

						<div class='wrapperdiv1child'>
							<a href="AddNewContact.jsp"><button class="contactButton"
									style="margin-left: 0; padding-left: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-plus-circle optionsImg2" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										<path
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
									</svg>
									Add</button></a>
							<button class="contactButton" id="DeleteContacts2">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									style="margin-bottom: -1px;" class="bi bi-trash3 optionsImg2" viewBox="0 0 16 16">
									<path
										d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
								</svg>
								Delete</button>
							<button class="contactButton" onclick="openExport('ClientContacts')">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="margin-bottom: -1px;"
									fill="currentColor" class="bi bi-box-arrow-up optionsImg2" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
									<path fill-rule="evenodd"
										d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
								</svg>
								Export</button>
							<button class="contactButton" id="EditContacts2">
								<svg xmlns="http://www.w3.org/2000/svg" style="    margin-bottom: -2px;" width="16"
									height="16" fill="currentColor" class="bi bi-pencil-square optionsImg2"
									viewBox="0 0 16 16">
									<path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
									<path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
								</svg>
								Edit</button>

							<div class="custom-select2 multichoiceBox" id="DisplayFields2">

								<select class="inputSelection" id="DisplayFieldsSelect2" name="">

									<option value="">Select Fields</option>

									<option value="0">Name</option>

									<option value="1">Business name</option>

									<option value="2">Address</option>

									<option value="3">Email</option>

									<option value="4">Phone</option>

									<option value="5">Mobile</option>

								</select>

							</div>

						</div>


						<div id="table-scroll" class="tablediv" onclick="enable('EditContacts2', 'ClientsTable')">
							<span  class="rawSpan"></span>

							<table id="ClientsTable" style="display: block;     pointer-events: all;     overflow: auto;">

								<thead>
									
									<tr style="height: 30px !important; text-align: center; position: sticky; top: 0">

										<th class="row1Comission tdMed">
											<div class='tdMed'>Name</div>
										</th>

										<th class="row2Comission tdBig">
											<div class='tdBig'>Business Name</div>
										</th>
										
										<th class="row3Comission tdMed">
											<div class='tdMed'>Address</div>
										</th>

										<th class="row4Comission tdMed">
											<div class='tdMed'>Email</div>
										</th>

										<th class="row5Comission tdMed">
											<div class='tdMed'>Phone</div>
										</th>

										<th class="row6Comission tdMed">
											<div class='tdMed'>Mobile</div>
										</th>

									</tr>
								</thead>
								<tbody>
								<% 
									if(clientCont!=null){
								    for (int i = 0, size = clientCont.size(); i < size; i++) {
									JSONObject oneCont = (JSONObject) clientCont.get(i);
								%>

									<tr onclick=' SetID("<%=oneCont.get("ID")%>"); '>
										<td class="row1Comission"><%= oneCont.get("FirstName") %> <%=oneCont.get("LastName") %> <%= oneCont.get("Officer") %> </td>
										<td class="row2Comission"><%= oneCont.get("BusinessName") %></td>
										<td class="row3Comission"><%=oneCont.get("Unit") %> <%= oneCont.get("StreetNumber") %> <%= oneCont.get("StreetName") %>, <%= oneCont.get("City") %>, <%= oneCont.get("Province") %></td>
										<td class="row4Comission"><%=oneCont.get("Email") %></td>
										<td class="row5Comission"><%=oneCont.get("Phone") %></td>
										<td class="row6Comission"><%=oneCont.get("ExtraContactNumber")%></td>
									</tr>

								<%}}%>


								</tbody>

								<%-- <tbody>


									<%  for (Contacts Contact : AllContacts ) { 
										Boolean isEmpty = true;
										
										if( "Client".equals(Contact.Type) ){
											
										
										if(!(Contact.StreetNumber == null)){
											isEmpty= Contact.StreetNumber.isEmpty();
										}else{
											isEmpty = true;
										}
									%>
										
									<tr onclick=" SetID('<%=Contact.ID%>'); ">
										<td class="row1Comission"><%= Contact.FirstName %> <%= Contact.LastName %> <%= Contact.Officer %> </td>
										<td class="row2Comission"><%= Contact.businesName %></td>
										<%if(isEmpty){%>
										<td class="row3Comission"></td>
										<%}else{%>
										<td class="row3Comission"><%= Contact.Unit %> <%= Contact.StreetNumber %> <%= Contact.StreetName %>, <%= Contact.City %>, <%= Contact.Province %> </td>
										<%}%>
										<td class="row4Comission"><%= Contact.Email  %></td>
										<td class="row5Comission"><%= Contact.Phone  %></td>
										<td class="row6Comission"><%= Contact.ExtraContactNumber  %></td>

									</tr>

									<%} }%>
								</tbody> --%>

							</table>
						</div>
					</div>
				</div>



			</div>



			<div id="LawFirmsContacts" class="tabcontent1" style="display: none;">

				<div style="max-width: 75vw; width: 100%;">

					<p id="ErrorDelete3" class="ErrorEmpty" style="display: none;">Please select a contact to delete.</p>


					<p id="ErrorEdit3" class="ErrorEmpty" style="display: none;">Please select a contact to edit</p>

				</div>

				<div>
					<div id="table-wrapper" class="NewSectionSmall">

						<div class='wrapperdiv1child'>
							<a href="AddNewContact.jsp"><button class="contactButton"
									style="margin-left: 0; padding-left: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-plus-circle optionsImg2" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										<path
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
									</svg>
									Add</button></a>

							<button class="contactButton" id="DeleteContacts3">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									style="margin-bottom: -1px;" class="bi bi-trash3 optionsImg2" viewBox="0 0 16 16">
									<path
										d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
								</svg>
								Delete</button>

							<button class="contactButton" onclick="openExport('LawFirmsContacts')">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="margin-bottom: -1px;"
									fill="currentColor" class="bi bi-box-arrow-up optionsImg2" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
									<path fill-rule="evenodd"
										d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
								</svg>
								Export</button>


							<button class="contactButton" id="EditContacts3">
								<svg xmlns="http://www.w3.org/2000/svg" style="    margin-bottom: -2px;" width="16"
									height="16" fill="currentColor" class="bi bi-pencil-square optionsImg2"
									viewBox="0 0 16 16">
									<path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
									<path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
								</svg>
								Edit</button>

							<div class="custom-select2 multichoiceBox" id="DisplayFields3">

								<select class="inputSelection" id="DisplayFieldsSelect3" name="">

									<option value="">Select Fields</option>

									<option value="0">Name</option>

									<option value="1">Business name</option>

									<option value="2">Address</option>

									<option value="3">Email</option>

									<option value="4">Phone</option>

									<option value="5">Mobile</option>

									<option value="6">Law Clerk Name</option>

									<option value="7">Law Clerk Email</option>

								</select>

							</div>

						</div>


						<div id="table-scroll" class="tablediv" onclick="enable('EditContacts3', 'lawFirmsTable')">
							<span  class="rawSpan"></span>
							<table id="lawFirmsTable" style="display: block;     pointer-events: all;     overflow: auto;">

								<thead>

									<tr style="height: 30px !important; text-align: center; position: sticky; top: 0">

										<th class="row1Comission tdSm">
											<div class='tdSm'>Name</div>
										</th>

										<th class="row2Comission tdBig">
											<div class='tdBig'>Business Name</div>
										</th>

										<th class="row3Comission tdSm">
											<div class='tdSm'>Address</div>
										</th>

										<th class="row4Comission tdSm">
											<div class="tdSm">Email</div>
										</th>

										<th class="row5Comission tdSm">
											<div class='tdSm'>Phone</div>
										</th>

										<th class="row6Comission tdMin">
											<div class='tdMin'>Mobile</div>
										</th>

										<th class="row7Comission tdSm">
											<div class='tdSm'>Law Clerk Name</div>
										</th>

										<th class="row8Comission tdSm">
											<div class='tdSm'>Law Clerk Email</div>
										</th>

									</tr>
								</thead>

								<tbody>
								<% 
									if(LawFirmCont!=null){
								    for (int i = 0, size = LawFirmCont.size(); i < size; i++) {
									JSONObject oneCont = (JSONObject) LawFirmCont.get(i);
								%>

									<tr onclick=' SetID("<%=oneCont.get("ID") %>"); '>
										<td class="row1Comission"><%= oneCont.get("Lawyer")  %> </td>
										<td class="row2Comission"><%= oneCont.get("LawFirm") %></td>
										<td class="row3Comission"><%= oneCont.get("Unit") %> <%= oneCont.get("StreetNumber") %> <%= oneCont.get("StreetName") %>, <%= oneCont.get("City") %>, <%= oneCont.get("Province") %></td>
										<td class="row4Comission"><%=oneCont.get("Email") %></td>
										<td class="row5Comission"><%=oneCont.get("Phone") %></td>
										<td class="row6Comission"><%=oneCont.get("ExtraContactNumber")%></td>
										<td class="row7Comission"><%= oneCont.get("ClerkName") %></td>
										<td class="row8Comission"><%= oneCont.get("ClerkEmail") %></td>
									</tr>

								<%}}%>

								</tbody>

								<%-- <tbody>

									<%  for (Contacts Contact : AllContacts) { 
										
										
										if( "LawFirm".equals(Contact.Type) ){
				
										Boolean isEmpty = true;
										if(!(Contact.StreetNumber == null)){
											isEmpty= Contact.StreetNumber.isEmpty();
										}else{
											isEmpty = true;
										}
									%>

									<tr onclick=" SetID('<%=Contact.ID%>'); ">
										<td class="row1Comission"><%= Contact.Lawyer  %> </td>
										<td class="row2Comission"><%= Contact.LawFirm %></td>
										<%if(isEmpty){%>
										<td class="row3Comission"></td>
										<%}else{%>
										<td class="row3Comission"><%= Contact.Unit %> <%= Contact.StreetNumber %> <%= Contact.StreetName %>, <%= Contact.City %>, <%= Contact.Province %></td>
										<%}%>
										<td class="row4Comission"><%= Contact.Email  %></td>
										<td class="row5Comission"><%= Contact.Phone  %></td>
										<td class="row6Comission"><%= Contact.ExtraContactNumber  %></td>
										<td class="row7Comission"><%= Contact.ClerkName  %></td>
										<td class="row8Comission"><%= Contact.ClerkEmail  %></td>
									</tr>

									<% }}%>
								</tbody> --%>

							</table>
						</div>
					</div>
				</div>



			</div>



			<div id="BrokeragesContacts" class="tabcontent1" style="display: none;">

				<div style="max-width: 75vw; width: 100%;">

					<p id="ErrorDelete4" class="ErrorEmpty" style="display: none;">Please select a contact to delete.</p>

					<p id="ErrorEdit4" class="ErrorEmpty" style="display: none;">Please select a contact to edit</p>

				</div>

				<div>
					<div id="table-wrapper" class="NewSectionSmall">

						<div class='wrapperdiv1child'>
							<a href="AddNewContact.jsp"><button class="contactButton"
									style="margin-left: 0; padding-left: 0;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-plus-circle optionsImg2" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										<path
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
									</svg>
									Add</button></a>
							<button class="contactButton" id="DeleteContacts4">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									style="margin-bottom: -1px;" class="bi bi-trash3 optionsImg2" viewBox="0 0 16 16">
									<path
										d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
								</svg>
								Delete</button>
							<button class="contactButton" onclick="openExport('BrokeragesContacts')">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="margin-bottom: -1px;"
									fill="currentColor" class="bi bi-box-arrow-up optionsImg2" viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
									<path fill-rule="evenodd"
										d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
								</svg>
								Export</button>
							<button class="contactButton" id="EditContacts4">
								<svg xmlns="http://www.w3.org/2000/svg" style="    margin-bottom: -2px;" width="16"
									height="16" fill="currentColor" class="bi bi-pencil-square optionsImg2"
									viewBox="0 0 16 16">
									<path
										d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
									<path fill-rule="evenodd"
										d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
								</svg>
								Edit</button>

							<div class="custom-select2 multichoiceBox" id="DisplayFields4">

								<select class="inputSelection" id="DisplayFieldsSelect4" name="">

									<option value="">Select Fields</option>

									<option value="0">Name</option>

									<option value="1">Business name</option>
									
									<option value="2">Address</option>

									<option value="3">Email</option>

									<option value="4">Phone</option>

									<option value="5">Mobile</option>


								</select>

							</div>

						</div>


						<div id="table-scroll" class="tablediv" onclick="enable('EditContacts4', 'BrokeragesTable')">
							<span  class="rawSpan"></span>
							<table id="BrokeragesTable"
								style="display: block;     pointer-events: all;     overflow: auto;">

								<thead>

									<tr style="height: 30px !important; text-align: center; position: sticky; top: 0">

										<th class="row1Comission tdBig">
											<div class='tdBig'>Name</div>
										</th>

										<th class="row2Comission tdMed">
											<div class='tdMed'>Business Name</div>
										</th>

										<th class="row3Comission tdMed">
											<div class='tdMed'>Address</div>
										</th>

										<th class="row4Comission tdMed">
											<div class="tdMed">Email</div>
										</th>

										<th class="row5Comission tdMed">
											<div class='tdMed'>Phone</div>
										</th>

										<th class="row6Comission tdMed">
											<div class='tdMed'>Mobile</div>
										</th>

									</tr>
								</thead>

								<tbody>
								<% 
									if(BrokCont!=null){
								    for (int i = 0, size = BrokCont.size(); i < size; i++) {
									JSONObject oneCont = (JSONObject) BrokCont.get(i);
								%>

									<tr onclick=' SetID("<%=oneCont.get("ID") %>"); '>
										<td class="row1Comission"><%= oneCont.get("Lawyer")  %> </td>
										<td class="row2Comission"><%= oneCont.get("LawFirm") %></td>
										<td class="row3Comission"><%= oneCont.get("Unit") %> <%= oneCont.get("StreetNumber") %> <%= oneCont.get("StreetName") %>, <%= oneCont.get("City") %>, <%= oneCont.get("Province") %></td>
										<td class="row4Comission"><%=oneCont.get("Email") %></td>
										<td class="row5Comission"><%=oneCont.get("Phone") %></td>
										<td class="row6Comission"><%=oneCont.get("ExtraContactNumber")%></td>
									</tr>

								<%}}%>

								</tbody>

							</table>
						</div>
					</div>
				</div>

			</div>

			<div class="loadingmodal"></div>

		</div><!-- Closing MainContacts  -->
	</div>



</body>

<script>
	$(document).ready(function() {

      $.getScript("../DataTables/datatables.min.js", function()
		{
			$.getScript("../Scripts/Contacts.js", function(){
				$("#MainContacts").removeClass("loading");  
				$("#table-wrapper").removeClass("hidden");  	
			}, true);
		}, true);

      $.getScript("../Scripts/Dashboard.js", function(){}, true);
    }); 

	//getScript refactor to prevent caching


</script>

</html>

<%}%>