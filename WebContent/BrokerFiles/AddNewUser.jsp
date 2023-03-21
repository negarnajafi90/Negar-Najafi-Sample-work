 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

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
	
  response.sendRedirect("../NoPermission.jsp");



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


	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css">
	
	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">
	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">
	<link rel="stylesheet" type="text/css" href="../CSS/forModals.css">

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">
	
	<title>New Agent - Masterre</title>

	<style>
	.secondSpan{
		margin-right: -10px !important;
	}
	</style>

</head>

<script>

		$(function () {
			console.log(1);
			$('#StartDate').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
			});
			$('#Anniversary').datepicker({
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

<body>
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

			<a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img
						class="dashboardIcons accept" src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span
						class="navText">Personal
						Profile</span></button></a>

			<a class="menubartext" href="CompanyProfile.jsp"><button class="tablinks"><img
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


	<div id="Right" style="max-width: 700px; height: 100vh; overflow: auto; padding-bottom: 50px;" class="Rightcolumn marginBody navBarMovable">

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


  		<iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
		<form id="NewUser" name="NewUser" method="post" action="../Registration" enctype="multipart" target="">

		    <div id="myModalExit" class="modal" >
				<div class="modal-content">
					<div class="modalHeader" id="modHead">Add new agent</div>
						<p id="modBody">Do you want to add new agent?</p>
						<div class="popUpContainer">
						<span class="close">No</span>
						<a  href="../BrokerFiles/NewDeal.jsp"><button class="submitButton" type="submit" id="SaveButton" name="SaveButton">Yes</button></a>
					</div>
				</div>

			</div>

			<div class="HeaderDashboard flexibleContainer" style='margin-top: 14px;'>

				<label class="DealsHeader flexible">Register New User</label>

			</div>

			<!-- <label class="HeadLines"></label> -->

			<!-- <a class="menubartext" href="NewDeal.jsp">?</a> -->

			<div class="flexibleContainer NewSectionSmall">

				<div class="flexible">

					<label class="MandentorySign"></label><label>Type</label>
					<div class="custom-select">
						<select id="UserType" name="UserType">

							<option value="">--Please choose an option--</option>

							<option value="Agent">Agent</option>

							<option value="Admin">Admin</option>

						</select>
					</div>

				</div>

				<div class="flexible"></div>

			</div>

			<div class="flexibleContainer">

				<div class="flexible">

					<label class="MandentorySign"></label><label>First Name:</label>

					<input class="inlineInput" type="text" id="Firstname" name="Firstname" maxlength="45">

				</div>

				<div class="flexible">

					<label class="MandentorySign"></label><label>Last Name:</label>

					<input class="inlineInput" type="text" id="Lastname" name="Lastname" maxlength="45">

				</div>

			</div>

			<div class="flexibleContainer NewSectionMedium">

				<div class="flexible">

					<label class="MandentorySign"></label><label>Start Date</label>

					<div class="input-group">
						<input id="StartDate" name="StartDate" type="text"
							class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly">
						<label class="input-group-btn" for="StartDate"
							id="StartDateLabel">
							<span class="btn btn-default">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</label>
					</div>

				</div>

				<div class="flexible">

					<label class="MandentorySign"></label><label>Anniversary Date</label>

					<div class="input-group">
						<input id="Anniversary" name="Anniversary" type="text"
							class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly">
						<label class="input-group-btn" for="Anniversary"
							id="AnniversaryDateLabel">
							<span class="btn btn-default">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</label>
					</div>

				</div>

			</div>

			<div class="flexibleContainer">

				<div class="flexible">

					<label class="MandentorySign"></label><label>Commission Split:</label>

					<input class="inlineInput" type="text" id="Split" name="Split" maxlength="9" autocomplete="off">

				</div>

				<div class="flexible">

					<label class="MandentorySign"></label><label>Commission Cap:</label>

					<input class="inlineInput" type="text" id="Cap" name="Cap" maxlength="10" autocomplete="off">

				</div>

			</div>

			<div class="flexibleContainer">

				<label class="flexible"> Create a tiered commission structure? </label>

				<span class="flexible"> <label class="container"><input type="checkbox" id="YES"
							name="YES" onclick="selectOnlyThis(this.id)"><span class="checkmark"
							style="top: -4px;"></span></span>
				</span>

			</div>

			<div class="flexibleContainer" id="secondTire" style="display:none;">

				<div id="Second" class="flexible">

					<label><label class="MandentorySign"></label>Second
						Commission
						Split:</label>

					<input class="inlineInput" type="text" id="Split2" name="Split2" maxlength="8" autocomplete="off">

				</div>

				<div id="Second" class="flexible">

					<Label><label class="MandentorySign"></label>Additional
						Cap:</label>

					<input class="inlineInput" type="text" id="Cap2" name="Cap2" maxlength="10" autocomplete="off">

				</div>

			</div>

			<div class="flexibleContainer" id="thirdTire" style="display:none;">

				<div id="Third" class="flexible">

					<label  id="LabelSplit3">Third Commission Split:</label>

					<input class="inlineInput" type="text" id="Split3" name="Split3"  maxlength="8" autocomplete="off">

				</div>

				<div id="Third" class="flexible">

					<label id="LabelCap3"> Additional Cap:</label>

					<input class="inlineInput" type="text" id="Cap3" name="Cap3" maxlength="10" autocomplete="off">

				</div>
			</div>

			<div class="flexibleContainer NewSectionMedium">

				<div class="flexible">

					<label class="MandentorySign"></label><label>E-mail address:</label>

					<input class="inlineInput" type="text" id="E-mail" name="E-mail" maxlength="50" autocomplete="email">

				</div>
				
				

				<div class="flexible itemShortPhone">

					<label class="floatDataLefttSide MandentorySign"></label>

					<div class="custom-select floatDataLefttSide">

						<select id="UserExteraContactInformationLabel" name="UserExteraContactInformationLabel">

							<option value="Mobile">Mobile</option>

							<option value="Mobile">Mobile</option>

							<option value="Fax">Fax</option>

						</select>

					</div>

					<input class="inlineInput" type="text" id="UserExteraContact" name="UserExteraContact"  autocomplete="phone" maxlength="14" autocomplete="tel">
				</div>

			</div>

			<div class="flexibleContainer">

				<div class="flexible">

					<label class="MandentorySign"></label><label>Temporary Password:</label>

					<input class="inlineInput" type="password" id="Password" name="Password" maxlength="30"
						onkeyup="" autocomplete="new-password">
					<img src="../ImagesUsed/ClosedEye.png" id="openEye1" class="passEye"
						onclick="displayPassword('Password', 'closedEye1', this.id);">
					<img src="../ImagesUsed/OpenedEye.png" id="closedEye1" class="passEye"
						onclick="hidePassword('Password',  'openEye1', this.id);" style="display: none;">
					<%-- <span class="smallError" id="NewPasswordErrorEmpty">Please enter new password</span> --%>
				</div>




				<div class="flexible"></div>
			</div>


			<div id="PaymentDetailsButtonSection" class="FooterButton">

				<div class="FooterButtonSpan">

					<span class="buttonDiscard floatDataLefttSide">
						<button class="savebtn" type="button" id="Save" name="Save">Save</button></span>
							<%-- and send welcome e-mail later --%>
					<span class="secondSpan ">

						<button class="savebtn" type="button" id="Save&SendEmail" name="Save&SendEmail">Save and send welcome e-mail</button>

					</span>

				</div>

			</div><!-- Closing PaymentDetailsButtonSection -->

		</form>


	</div>
</div>

	<script>

		function selectOnlyThis(id) {
			if(document.getElementById(id).checked){
				document.getElementById("secondTire").style.display = "";
				document.getElementById("thirdTire").style.display = "";
			}else{
				document.getElementById("secondTire").style.display = "none";
				document.getElementById("thirdTire").style.display = "none";
			}
		}
	</script>


	<script>
		forSelects();
		checkNavBar();
		// BORhideShow(0);

		var modal2 = document.getElementById("myModalExit");
		var span2 = modal2.getElementsByClassName("close")[0];
		var setofBtn = document.getElementsByClassName('savebtn');
		span2.onclick = function (event) {
			modal2.style.display = "none";
			// $(document).unbind('keyup');
			// ourForm.target = defaultTarget;
			event.stopPropagation();
		}
		for (let i = 0; i < setofBtn.length; i++) {
			setofBtn[i].onclick = function (event) {
				if(!validateNewContact()){
					if(this.id == "Save&SendEmail"){
						$("#modBody").text("Do you want to add " + $("#Firstname").val() + " " + $("#Lastname").val() + " as new contact and send an invitation email?" );
						$("#modHead").text("Add new Agent and Send Email");
					}else{
						$("#modBody").text("Do you want to add " + $("#Firstname").val() + " " + $("#Firstname").val() + " as new contact?" );
						$("#modHead").text("Add new Agent");
					}
					modal2.style.display = "block";
					event.stopPropagation();
				}
			}
		}

		function validateNewContact(){
			var Empty1 = 0;
    		var variables = [];

			variables.push(document.getElementById('UserType'),
			document.getElementById('Firstname'), document.getElementById('Lastname'),
			document.getElementById('StartDate'), document.getElementById('Anniversary'),
			document.getElementById('Cap'), document.getElementById('Split'),
			document.getElementById('E-mail'), document.getElementById('UserExteraContact'),
			document.getElementById('Password'));

			if(document.getElementById('YES').checked){
				variables.push(document.getElementById('Cap2'), document.getElementById('Split2'));
			}
			if(document.getElementById('Cap3').value || document.getElementById('Split3').value){
				variables.push(document.getElementById('Cap3'), document.getElementById('Split3'));
			}
			

			for (let i = 0; i < variables.length; i++) {
				if (variables[i].value === " " || variables[i].value === null || !variables[i].value) {
					Empty1 = 1;
					variables[i].style.borderColor = "red";
					if(variables[i].className == "form-control date-input"){variables[i].nextElementSibling.style.borderColor = "red"}
					if(variables[i].id == "UserType"){variables[i].parentElement.style.borderColor = "red"}
				} else {
					variables[i].style.borderColor = "lightgrey";
					if(variables[i].className == "form-control date-input"){variables[i].nextElementSibling.style.borderColor = "lightgrey"}
					if(variables[i].id == "UserType"){variables[i].parentElement.style.borderColor = ""}
				}
			}

			return Empty1;
		}
	</script>

</body>

</html>