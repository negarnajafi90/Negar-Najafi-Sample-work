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

  <link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

  <link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

  <link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

  <link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

  <link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

  <link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

       <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>


  <script type="text/javascript" src="../Scripts/Dashboard.js"></script>
  <script type="text/javascript" src="../Scripts/Newcontact.js"></script>
       <link rel="stylesheet" type="text/css" href="../CSS/forModals.css">


  <title>New Contact - Masterre</title>

  <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

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

    <a class="menubartext" href="CommissionCalculator.jsp"><button class="tablinks"> <img class="dashboardIcons accept"
          src="../ImagesUsed/Commission Calculator.png" alt="YesOrNo"><span class="navText">Commissions
          Calculator</span></button></a>

    <a class="menubartext" href="Reports.jsp"><button class="tablinks"><img class="dashboardIcons accept"
          src="../ImagesUsed/Reports.png" alt="YesOrNo" style="margin-bottom: -3px;"><span
          class="navText">Deals</span></button></a>

    <a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
          src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span class="navText">Personal
          Profile</span></button></a>

    <a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
          src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;" alt="YesOrNo"><span
          class="navText">Company Profile</span></button></a>

    <a class="menubartext" href="Contacts.jsp"><button class="tablinks"><img class="dashboardIcons accept"
          src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span class="navText">Contacts</span></button></a>

    <a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks"><img
          class="dashboardIcons accept" src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span
          class="navText">Inbox</span></button></a>

    <a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img class="dashboardIcons accept extrasize"
          src="../ImagesUsed/logOut.png" alt="YesOrNo"><span class="navText">Log Out</span></button></a>

    <button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
        class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

    <button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
        class="dashboardIcons accept rotate180 openClose " src="../ImagesUsed/collapse.png"
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

        <a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span class="">+
              New
              User</span></button></a>
      </div>
    </div>


    <div class="HeaderDashboard flexibleContainer" style='margin-top: 14px;'>

      <label class="DealsHeader flexible">New Contact</label>

    </div>

    <iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
    <form id="NewUser" name="NewUser" method="post" action="../AddNewContact" enctype="multipart" target="hiddenFrame"
      style="max-width: 700px;">

      <p id="ErrorEmpty1" class="ErrorEmpty" style="display: none;">
        <label>Complete all fields.</label></p>

      <div id="myModalSave" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;" alt=""><label>Document
            saved</label>
        </div>

      </div>

      <div id="myModalSaveClose" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <div class="modalHeader">Save</div>
          <p>Do you want to save changes?</p>
          <div class="popUpContainer">
            <span class="close">No</span>
            <button class="submitButton" id="SaveandClose" name="SaveandClose" type="submit">Yes</button>
          </div>
        </div>

      </div>

      <div class="flexibleContainer NewSectionSmall">

        <div class="flexible">

          <label class="MandentorySign"></label><label>Contact Type</label>
          <div class="custom-select" onclick="contactType()">
            <select id="UserType" name="UserType">

              <option value="">-- Please choose an option --</option>

              <option value="LawFirm">Law Firm</option>

              <option value="Brokerage">Brokerage</option>

              <option value="Client">Client</option>

            </select>
          </div>

        </div>

        <div class="flexible" id="LawyerBlock" style="display: none;">
          <label class="NoMandatory"></label><label id="NewLawerORAgentLabel">Lawyer</label>

          <input class="inlineInput" type="text" id="NewLawyerORAgent" name="NewLawyerORAgent" maxlength="60">
        </div>

        <div class="flexible" id="ClientBlock" style="display: none;">

          <label class="MandentorySign"></label><label>Client type</label>
          <div class="custom-select" id="ClientTypeCustom">
            <select id="ClientType" name="ClientType" onclick=" ClientType();">

              <option value="">-- Please choose an option --</option>

              <option value="Individual">Individual</option>

              <option value="Corporation">Corporation </option>

              <option value="Partnership">Partnership </option>

              <option value="Trust">Trust</option>

            </select>
          </div>

        </div>

        <div class="flexible" id="buffer"></div>
      </div>

      <div class="flexibleContainer" id="noheight">
        <div class="flexible" id="NewLawyerFirmORBrokerageBlock" style="display: none;">
          <label class="MandentorySign"></label><label id="NewLawyerFirmORBrokerageLabel">Lawyer Firm</label>

          <input class="inlineInput" type="text" id="NewLawyerFirmORBrokerage" name="NewLawyerFirmORBrokerage"  maxlength="60">
        </div>

        <div class="flexible" id="NewLawyerFirmORBrokerageBlockStyle"></div>

        <div id="FirstNameBlock" class="flexible" style="display: none;">
          <label class="MandentorySign"></label><label id="">First Name</label>

          <input class="inlineInput" type="text" id="NewFirstName" name="NewFirstName" maxlength="45">
        </div>

        <div id="LastNameBlock" class="flexible" style="display: none;">
          <label class="MandentorySign"></label><label id="">Last Name</label>

          <input class="inlineInput" type="text" id="NewLastName" name="NewLastName" maxlength="45">
        </div>


        <div id="BusinessNameBlock" class="flexible" style="display: none;">
          <label class="MandentorySign"></label><label id="">Business Name </label>

          <input class="inlineInput" type="text" id="NewBusinessName" name="NewBusinessName" maxlength="60">
        </div>

        <div id="OfficerNameBlock" class="flexible" style="display: none;">

          <label class="MandentorySign"></label><label id="">Signing Authority</label>

          <input class="inlineInput" type="text" id="NewOfficerName" name="NewOfficerName" maxlength="60">

        </div>

      </div>

      <div class="flexibleContainer NewSectionMedium">

        <div class="flexible ">

          <label class="NoMandatoryTwo"></label><label>Unit</label>

          <input class="inlineInput" type="text" id="newClientUnit" name="newClientUnit" maxlength="10">

        </div>

        <div class="flexible ">

          <label class="NoMandatoryTwo"></label><label>Street Number</label>

          <input class="inlineInput" type="text" id="newClientStreetNumber" name="newClientStreetNumber" maxlength="10">

        </div>

        <div class="flexible ">

          <label class="NoMandatoryTwo"></label><label>Street Name</label>

          <input class="inlineInput" type="text" id="newClientStreetName" name="newClientStreetName" maxlength="40">

        </div>

      </div>

      <div class="flexibleContainer">

        <div class="flexible ">

          <label class="NoMandatoryTwo MandatoryCity"></label><label>City</label>
          <input class="inlineInput" type="text" id="newClientCity" name="newClientCity" maxlength="30" >

        </div>

        <div class="flexible itemLongProvince">

          <label class="NoMandatoryTwo"></label><label>Province</label>

          <div class="box">

            <div class="custom-select" id="VendorProvince1Custom"
              onclick="ifProvinceOther('newClientProvince','newClientCountry'); Display('newClientProvince','newClientProvinceExtra');">

              <select class="inputSelection" id="newClientProvince" name="newClientProvince" readonly>

                <option value="ON">ON</option>

                <option value="AB">AB</option>

                <option value="BC">BC</option>

                <option value="MB">MB</option>

                <option value="NB">NB</option>

                <option value="NL">NL</option>

                <option value="NWT">NWT</option>

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

        </div>

        <div class="flexible ">

          <label class="NoMandatoryTwo"></label><label>Postal Code</label>
          <input class="inlineInput" type="text" id="newClientPostalCode" name="newClientPostalCode"  maxlength="11">

        </div>


        <div class="flexible">
          <label class="NoMandatoryTwo"></label><label>Country</label>

          <input type="text" class="inlineInput" id="newClientCountry" name="newClientCountry" value="Canada" readonly maxlength="20">
        </div>

      </div>

      <div class="flexibleContainer" style="display: none;" id="newClientProvinceExtra">

        <div class="flexible">
          <label class="NoMandatoryTwo"></label><label>Other province or state</label>

          <input type="text" class="inlineInput" id="newClientOtherProvince" name="newClientOtherProvince" maxlength="20">
        </div>

        <div class="flexible"></div>

        <div class="flexible"></div>

      </div>

      <div class="flexibleContainer NewSectionMedium">

        <div class="itemFullEmail flexible">

          <label class="NoMandatoryTwo"></label><label>Email</label>

          <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="Email" name="Email" maxlength="50">

        </div>

      </div>

      <div class="flexibleContainer">

        <div class="flexible itemLongerPhone">

          <label class="NoMandatoryTwo">Phone</label>

          <input class="input inlineInput" type="text" id="Phone" name="Phone" onkeydown="phoneNumberFormatter(this.id)" maxlength="14"
            onchange="phoneNumberFormatter(this.id);">
        </div>

        <div class="flexible itemShortPhone">

          <div class="custom-select">

            <select class="inputSelection1" id="ExtraContactInformationLabel" name="ExtraContactInformationLabel">

              <option value="">
                Mobile
              </option>

              <option value="Mobile">
                Mobile
              </option>

              <option value="Fax">
                Fax
              </option>

            </select>
          </div>

          <input class="input inlineInput" type="text" id="ExtraContactInformation" name="ExtraContactInformation" onkeydown="phoneNumberFormatter(this.id)"
          onchange="phoneNumberFormatter(this.id);" maxlength="20">
        </div>

      </div>

      <span id="LawClerkBlock" style="display: none;">
        <div>

          <label class="container NewSectionMedium" style="left: -10px"><input type="checkbox" onclick="addClerk();"
              class="checkbox" id="AddClerckInformation"><span class="checkmark" style="left: 10px;"></span></label>
          <label style="display:inline !important; margin-left: 16px;">Add law clerk

        </div>

        <div id="ClerkInformation" class="NewSectionSmall" style="display:none">

          <div class="flexibleContainer ">

            <div class="flexible itemLongerAssistantName">

              <label class="MandentorySign"></label><label>Full
                Name</label>

              <input class="input inlineInput" type="text" id="ClerkFullName" name="ClerkFullName" value="" maxlength="60">
            </div>

            <div class="flexible ">

              <label class="MandentorySign"></label><label>Email</label>

              <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="ClerkEmail" maxlength="50"
                name="ClerkEmail" value="">
            </div>

          </div>

        </div><!-- Closing Clerk's Information -->
      </span>

      <div class="Footer FooterButton">

        <div class="FooterButtonSpan">

          <span id="PurchaserLawyernext1" class="buttonDiscard floatDataLefttSide">
            <span class="buttonBack">
             <a href="Contacts.jsp"><button id="PurchaserLawyerBack" type="button" class="buttonBlue">Cancel</button></a> 
            </span>
          </span>

          <span class="secondSpan">
            <!-- <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn16">Delete</button> -->
            <!-- <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_16">Discard</button> -->
            <!-- <button style="padding: 8px 5px;" class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving16">Exit without saving</button> -->
            <button class="dropdownMenubtn dropBtn3" style='width: 126px' type="button" id="Savebtn" name="Savebtn">Save and close</button>

            <span class="savespan" id="savespan">

              <button class="buttonSaveOne" type="button" id="PurchaserLawyerSave">Save</button>

              <button class="buttonSaveTwo" onclick="openWindowNewContact(event)" type="button">&nbsp;</button>

            </span>

            <button class="buttonBlue" type="button" id="SaveandNew" name="SaveandNew" style="width: 85px;" onclick="validate()">Save and
              new</button>

          </span>



        </div>
      </div>
  </div>
  </form>
  </div>

</div>

  <script>
    forSelects();
    checkNavBar();
  </script>

  <script>
    var myModalSaveClose = document.getElementById("myModalSaveClose");
    var spanx = myModalSaveClose.getElementsByClassName("close")[0];
    var BtnSaveCP = document.getElementsByClassName('dropBtn3')[0];

    spanx.onclick = function () {
      myModalSaveClose.style.display = "none";
      document.getElementById('NewUser').target = 'hiddenFrame';
    }

    BtnSaveCP.onclick = function (event) {
      if (validate()) {
        document.getElementById('ErrorEmpty1').style.display = 'none';
        myModalSaveClose.style.display = "block";
        document.getElementById('NewUser').target = '';
      } else {
        document.getElementById('ErrorEmpty1').style.display = '';
        document.getElementById('NewUser').target = 'hiddenFrame';
      }
      event.stopPropagation();
    }

    var myModalSave = document.getElementById("myModalSave");
    var setofBtnSave = document.getElementsByClassName('buttonSaveOne')[0];


    setofBtnSave.onclick = function (event) {
      if (validate()) {
        myModalSave.style.display = "block";
        // myModalSaveClose.style.display = "";
        setTimeout(
          function () {
            document.getElementById('myModalSave').style.marginTop = '20px';
            // myModalSave.style.display = ""; 
          }, 200 /// milliseconds 
        );
        setTimeout(
          function () {
            document.getElementById('myModalSave').style.marginTop = '-45px';
          }, 2000 /// milliseconds 
        );
        setTimeout(
          function () {
            myModalSave.style.display = "";
          }, 2500 /// milliseconds 
        );
        document.getElementById('ErrorEmpty1').style.display = 'none';
        document.getElementById('PurchaserLawyerSave').type = 'submit';

      } else {
        document.getElementById('ErrorEmpty1').style.display = '';
        document.getElementById('PurchaserLawyerSave').type = 'button';
      }

      event.stopPropagation();
    }

    var saveandNew = document.getElementById('SaveandNew');
    saveandNew.onclick = function (event) {
      if (validate()) {
        document.getElementById('ErrorEmpty1').style.display = 'none';
        document.getElementById('NewUser').target = '';
        document.getElementById('SaveandNew').type = 'submit';
      } else {
        document.getElementById('ErrorEmpty1').style.display = '';
        document.getElementById('NewUser').target = 'hiddenFrame';
        document.getElementById('SaveandNew').type = 'button';
      }
      event.stopPropagation();
    }


    // When the user clicks anywhere outside of the modal, close it
    document.onclick = function (event) {
      if (event.target == myModalSaveClose) {
        myModalSaveClose.style.display = "none";
        document.getElementById('NewUser').target = 'hiddenFrame';
      }
      if (event.target == myModalSave) {
        myModalSave.style.display = "";
      }
      event.stopPropagation();
    }

    $('#NewUser').submit(function(e){
              // e.preventDefault();

              // do ajax now
        // if(!($('#NewUser').attr('target') == 'hiddenFrame')){
        //       window.location.href = "../BrokerFiles/Contacts.jsp";
        // }
       });
  </script>


</body>

</html>