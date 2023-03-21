<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Contacts"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="ProMasterClasses.Companies" %>

<%@ page import="ProMasterClasses.RecordSheet"  %>

<%@ page import="org.json.simple.JSONObject"%>

<%@ page import="org.json.simple.JSONArray"%>

<%@ page import="java.sql.Connection" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<%

////int timeout = session.getMaxInactiveInterval();

//response.setHeader("Refresh", 
		
//timeout + "; URL =../Login.jsp");

%>


<head>

  <%
  
  int UserID=0;//(int)session.getAttribute("Userid") ;

  int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
     
  String Type="0";//(String)session.getAttribute("Type") ;

  String Email="";//(String)session.getAttribute("Email") ;
  
  Connection con=null;

  if( session.getAttribute("Userid")==null  ){
  	
    response.sendRedirect("../index.jsp");  }
    return;
  else{
  	
  	    UserID=(int)session.getAttribute("Userid"); 
  	
  	    BrokerID=(int)session.getAttribute("Brokerid") ;
  			   	   
        Type=(String)session.getAttribute("Type") ;
        
        Email=(String)session.getAttribute("Email") ;
        
        con=(Connection) session.getAttribute("Connection");

  }
  
  RDSFunctions myRDS= new RDSFunctions();

  Users MyInformation=new Users();
  
  MyInformation=myRDS.GetAnyUserById(UserID,con);
  
  JSONObject AllContactsJSON=myRDS.GetAllContactsJSON(UserID ,con);
  JSONArray LawFirmCont = (JSONArray) AllContactsJSON.get("LawFirm");
  //System.out.println(LawFirmCont);
  
  //ArrayList< Contacts >  Clients = new ArrayList<Contacts>();
  
  //Clients=myRDS.SerchContacts( UserID, "Client",con);
  
  
  
  //ArrayList< Contacts > Lawyers = new ArrayList<Contacts>();
  
  //Lawyers=myRDS.SerchContacts( UserID, "LawFirm",con);
  
  
  // ArrayList< Contacts > Lawfirms = new ArrayList<Contacts>();
  //Lawfirms=myRDS.distinctSerchContacts(UserID, "LawFirm");
  
  
  
  
  
  //ArrayList< Contacts > Brokerage = new ArrayList<Contacts>();
  
  //Brokerage=myRDS.SerchContacts(UserID, "Brokerage",con);

  
  
  Companies Mycompany=myRDS.GetaCompanyBuyBrokerID(BrokerID,con);
  

  int  TransactionID= Mycompany.TransactionID +1;

  //System.out.println( "TransactionID" + " " + TransactionID);

  session.setAttribute("TransactionID",TransactionID);
  
  String Companylogo="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+Mycompany.ID;
  
  

  %>  

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- Scripts to add jQuerry and bootrstrap -->
  <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

  <script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="../Scripts/CropImage.js"></script>

  <link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

  <!-- Our scripts/css -->
  <link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

  <link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

  <link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

  <link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

  <link rel="stylesheet" type="text/css" href="../CSS/TRSAndTable.css">

  <link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

  <link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

  <link rel="stylesheet" type="text/css" href="../CSS/forModals.css">

  <!-- <link rel="stylesheet" type="text/css" href="../CSS/AuditTrail.css"> -->
  
  <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

  <title>TRS Form - Masterre</title>
</head>

<body>


  <!-- This div tag contains the 5 Tabs named Trade Record Sheet ,Property Details , Parties , Other Brokerage ,Customer Rebate -->
<div class='flexBody'>
  <div class="navBar" id="TRSNavbar">

    <!-- <div class="logo">
      <img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"  class="masterre1">
      <label class="masterre2" for="">MASTERRE</label>
    </div> -->
    <div class="logo">

			<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

			<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

	  </div>

    <button id="PropertyDetailsTab" class="tablinks1"
      onclick="TabsHandleler(event,'PROPERTY DETAILS','tabcontent','tablinks1','PropertyDetailsTab');"><img id="TransactionDetailsTabIMG"
        class="accept" src="../ImagesUsed/Didnotaccept.png" alt="YesOrNo"> Transaction Details</button>

    <button id="PartiesTab" class="tablinks1"
      onclick="TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab');" disabled><img class="accept" id="PartiesTabIMG"
        src="../ImagesUsed/Didnotaccept.png" alt="YesOrNo">
      Parties</button>

    <button id="InvoiceTab" class="tablinks1"
      onclick="TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab'); Invoice(); "><img id="InvoiceTabIMG"
        class="accept" src="../ImagesUsed/Didnotaccept.png" alt="YesOrNo">
      Invoice</button>

    <button id="ReferralFeeTab" class="tablinks1"
      onclick="  TabsHandleler(event, 'Referral Fee', 'tabcontent', 'tablinks1', 'ReferralFeeTab');  TabsHandleler(event, 'Agent', 'tabcontent3', 'tablinks3', 'ReferralAgentTab');"
      disabled><img class="accept" id="ReferralFeeTabIMG" src="../ImagesUsed/Didnotaccept.png" alt="YesOrNo"> Referral Fee</button>

    <button id="CustomerRebateTab" class="tablinks1"
      onclick="TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');" disabled><img
        class="accept" src="../ImagesUsed/Didnotaccept.png" id="CustomerRebateTabIMG" alt="YesOrNo"> Customer Rebate</button>

    <button id="TRSTab" class="tablinks1" onclick="  NextTRS('<%=MyInformation.User_Split%>','<%=0%>', '<%=MyInformation.User_Split2%>', '<%=MyInformation.User_Split3%>', '<%=MyInformation.User_Cap%>', '<%=MyInformation.User_Cap2%>', '<%=MyInformation.User_Cap3%>', '<%=Mycompany.Temp%>'); " disabled><img class="accept"
        src="../ImagesUsed/Didnotaccept.png" id="TRSTabIMG" alt="YesOrNo">
      TRS</button>

    <button id="DocumentsTab" class="tablinks1" style="padding-left: 45px;"
      onclick="TabsHandleler(event, 'Documents','tabcontent','tablinks1','DocumentsTab'); PropertyLabel('Property4');"> Documents</button>


    <button id="AuditTrailTab" class="tablinks1" style="padding-left: 45px;"
      onclick="TabsHandleler(event, 'AuditTrail','tabcontent','tablinks1','AuditTrailTab'); PropertyLabel('Property8');"> Audit Trail</button>

  </div>

  <iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
    
  <form name="EmailForm" action="../TradeRecordSheet" id="EmailForm" method="post" enctype="multipart/form-data" target='hiddenFrame' class="loading RightSideFlex">
   
  <div id="myModalEmail" class="modal">
 
    <div class="modal-content">
      <span class="close" ><i class="bi bi-x-lg"></i></span>
      <div class="emailBody">
      <div class="HeaderDashboard flexibleContainer">
   
        <label class="DealsHeader flexible">Email Commission Statement</label>
        
      </div>

      <div class="errors">
         <p id="comissionEmailed" class="ErrorEmpty greedBack" style='display: none'>Commission statement was emailed. See <span style="text-decoration:underline; cursor: pointer" onclick="TabsHandleler(event, 'AuditTrail','tabcontent','tablinks1','AuditTrailTab'); PropertyLabel('Property8'); closeEmailPopup()">Audit Trail</span> for additional details.</p>
         <p id="emptyAdresseeError" class="ErrorEmpty" style='display: none'>Select at least one email recipient.</p>
         <p id="emptyEmailFields" class="ErrorEmpty" style='display: none'>Complete all required fields before proceeding.</p>
         <p class="ErrorEmpty blueBack"><span id="dueTo"></span>: $<span id="paysumEmail"></span></p>
      </div>
      
      <div id="Addressee">
        <div class="Addressee" >
          <label for="" class="headlineEmail">Addressee</label>
          <div class="flexibleContainer">
            
          </div>
        </div>

        <div class="optional">
          <label for="" class="headlineEmail">Optional Parties  <img src="../ImagesUsed/Arrow.png" onclick="showAddParties()" id="iconEmailPreview" alt="" loading="lazy"></label> 

          <div id="optionalDIV" class="remove">

              <div class="flexibleContainer">

              </div>

          </div>

        </div>
      </div>
      <div class="message">
        <div class="subject">
          <label class="MandentorySign"></label><label for="">Subject Line</label>
          <input id="subjectLineEmail" type="text" class="inlineInput" style="padding-left: 10px; height: 29px; border-color: #8badbd;" value="Commission statement for 1010-123 Main Street, Toronto">
        </div>
        <div class="notes">
          <label class="MandentorySign"></label><label for="">Email Notes</label>
          <textarea id="messageEmail" name="messageEmail"  class="inlineInput TextArea" style="height: 200px; border-color: #8badbd;line-height: 1.5;   padding: 15px; padding-left: 10px; resize: none;" cols="30" rows="10" >Please see attached our commission statement. &#10;&#10;&#10;&#10;Kind regards, &#10;&#10;The Best Brokerage</textarea>
        </div>
      </div>

        <div class="popUpContainer" style="display: flex;">

         <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary7"
                name="Secondary7" value=""><span class="checkmark"></span>Email me a copy</label>
          <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary8"
                name="Secondary8" value=""><span class="checkmark"></span>Save to documents</label>
        <button style='width: auto;' class="submitButton" type="button" id="SendEmailInvoice" name="SendEmailInvoice" onclick="validateSendInvoice()">Send</button>
      </div>
    </div>
    </div>

  </div>
 

  <!-- The Following form is about to collect the required information of an Property and Transaction to Create The TRS  -->
  <input type="hidden" id="agentNameHidden" value = '<%=MyInformation.Firstname %> <%=MyInformation.Lastname%>'>

  
  <form name="AgentTRSCreation" action="../TradeRecordSheet" id="AgentTRSCreation" method="post" enctype="multipart/form-data" target="hiddenFrame">

    <div id="myModalExit" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Exit without saving</div>
        <p>Do you want to leave without saving?</p>
        <div class="popUpContainer">
        <span class="close">No</span>
       <a href="../BrokerFiles/Dashboard.jsp"><button class="submitButton" type="button" id="ExitWithNoSaving" name="ExitWithNoSaving">Yes</button></a>
      </div>
        <!-- <span>Cancel</span> -->
      </div>

    </div>

    <div id="myModalCompleted" class="modal" >

           <div class="modal-content">
                  <div class="modalHeader">Move to completed</div>
                  <p>Do you want to move this deal to completed deals?</p>
                  <div class="popUpContainer">
                  <span class="close">No</span>
                  <button class="submitButton" type="submit" id="completeDeal" name="completeDeal">Yes</button>
                  </div>
           </div>

    </div>

    <div id="myModalDiscard" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Discard</div>
        <p>Do you want to leave without saving?</p>
        <div class="popUpContainer">
        <span class="close">No</span>
       <a href="../BrokerFiles/NewDeal.jsp"><button class="submitButton" type="button" id="Discard" name="Discard"  onclick="changeFormTarget(this);">Yes</button></a>
      </div>
        <!-- <span>Cancel</span> -->
      </div>

    </div>

    <div id="myModalDelete" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Delete</div>
        <p>Are you sure you want to delete this deal?</p>
        <div class="popUpContainer">
        <span class="close">No</span>
        <button class="submitButton" type="submit" id="Delete" name="Delete" onclick="changeFormTarget(this);">Yes</button>
      </div>
      </div>

    </div>

    <div id="myModalHST" class="modal" >

        <!-- Modal content -->
      <div class="modal-content">
        <div class="modalHeader">HST Reset</div>
        <p>Do you want to reset HST to original rates?</p>
        <div class="popUpContainer">
          <span class="close">No</span>
          <button class="submitButton" onclick="discardHST();" id='ResetHSTbutton' type="button">Yes</button>
        </div>
      </div>

    </div>

    <div id="myModalSave" class="modal" >
      <div class="modal-content">
        <img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;" alt="" loading="lazy"><label>Document saved</label>
      </div>

    </div>

    <div id="myModalEmailSent" class="modal" >
      <div class="modal-content">
        <img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;" alt="" loading="lazy"><label>Email sent</label>
      </div>
    </div>
    
    
 
        <!-- The Modal -->
        <div id="myModal" class="modal">

          <!-- Modal content -->
          <div class="modal-content">
            <span  id="beforeApproved">
              <div style="box-sizing: initial;" class="modalHeader">Finalize</div>  
              <p id="statusWarning" class="Warning2 ErrorEmptyYellow" style="display:none; margin-top: 15px;padding-left: 12px;">
                The deal status will be updated to closed.</p>
              <p style="line-height: 1.5;">Are you ready to finalize this deal?</p>
              
              <div class="popUpContainer">
              <span class="close">Cancel</span>
              <button class="submitButton" type="submit" onclick="submitted();" id="Finalized" name="Finalized">Finalize</button>
            </div>
            </span>
            <div id="afterApproved" style="display: none; height: 220px;">
              <div style="box-sizing: initial;" class="modalHeader">Finalized</div>
              <div class="finalizedIcon">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-check2-circle" viewBox="0 0 16 16">
                      <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z"></path>
                      <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z"></path>
                    </svg>
                    <p style='color: green; text-align: center; font-size: 20px; padding-top: 0;     padding-bottom: 0; margin-top: 5px; margin-bottom: 5px;'>Successfuly finalized</p>
              </div>
              
              <div class="popUpContainer">
                <a class='totheLeft'  href="../BrokerFiles/NewDeal.jsp"><div class="finalButtons">New deal</div></a>
                <a class='totheRight'  href="../BrokerFiles/Dashboard.jsp"><div class="finalButtons">Dashboard</div></a>

              </div>
              
            </div>
            
          </div>

        </div>

    <%-- <div id="myModalExpired" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Save</div>
        <p>The deal status is set as Expired. It will be moved to Completed Deals.</p>
        <div class="popUpContainer">
        <span class="close">Cancel</span>
        <button class="submitButton" type="submit" id="Finalaizing2" name="Finalaizing2" >Proceed</button>
      </div>
      </div>

    </div>

    <div id="myModalOffMarket" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Save</div>
        <p>The deal status is set as Off Market. It will be moved to Completed Deals.</p>
        <div class="popUpContainer">
        <span class="close">Cancel</span>
        <button class="submitButton saveSpecial" type="submit" id="Finalaizing3" name="Finalaizing3" >Proceed</button>
      </div>
      </div>

    </div>

    <div id="myModalAvailable" class="modal" >
      
      <!-- Modal content -->
    <div class="modal-content">
      <div class="modalHeader">Save</div>
        <p>The deal status is set as Available. It will remain in Pending Deals.</p>
        <div class="popUpContainer">
        <span class="close">Cancel</span>
        <button class="submitButton saveSpecial" type="submit" id="Finalaizing4" name="Finalaizing4" >Yes</button>
      </div>
      </div>

    </div> --%>

    <div id="myModalSaveClose" class="modal" >

      <!-- Modal content -->
    <div class="modal-content">
        <div class="modalHeader">Save and close</div>
        <p>Do you want to save and close?</p>
        <div class="popUpContainer">
          <span class="close">No</span>
          <button class="submitButton saveSpecial" type="submit" id="SaveExit" name="SaveExit" onclick="changeFormTarget(this);">Yes</button>
        </div>
      </div>

    </div>

    <div id="PROPERTY DETAILS" class="tabcontent">

      <!-- This is the main Tab content -->

      <div id="AddressAndMLS">

        <label class="HeadLines">TRADE RECORD SHEET</label>

        <hr style="margin-right: 4px;">

        <p id="ErrorEmpty1" class="ErrorEmpty" style="display:none;">Complete all required fields before proceeding.</p>

        <p id="Warning1" style="display:none;">Please double check
          whether MLS number applies to this transaction</p>

        <!-- The following div called property details collects the details information of the property through the inputs tags ------------------------------------------------------------------------------------------------------------------------------------------------------------------->

        <div class="mainAddress" id="PropertyDetails" style="margin-top: 22px;">

        <div class='doubleFlexTRS frontImage'>
          <div class="flexible frontImageFlex">
              <span id="cover" style='display:none'></span>
              <div class="insideImg divforImg PropDetached">
                <img src="../ImagesUsed/Detached.png" style="display: none;" alt="House"  id="PropertyPic">
                <label class="btnUpload forvisibility" for="PropertyImg">Upload the image</label>
                <a class="closebtn forvisibility" onclick="deleteFile(event)"><img
                    class="closeimg" src="../ImagesUsed/Close.png" alt=""></a>
                <input type="file" accept="image/*" name="PropertyImg" id="PropertyImg"
                  onchange="displayCroppedMain('PropertyImg', 'cover')" style="display: none;" multiple="true">
              </div>
          </div>

          <div style='flex: 2;'>
            <div class="flexibleContainer  ">
              <div class="flexible">
                <label class="NoMandatoryTwo" id="AutoMLSNumber">MLS Number</label>
                <input class="inlineInput " type="text" id="MLSNumber" name="MLSNumber" maxlength="20">
              </div>

              <%-- <span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
                    alt="MasterProBrokerHelp" width="16" height="16" loading="lazy"><span class="tooltiptext">MLS
                    listing number will be used to auto populate transaction details</span></span> --%>

              <div class="flexible">
                <label class="NoMandatoryTwo">Unit</label><input class="inlineInput" type="text" id="PropertyUnit" maxlength="10"
                  name="PropertyUnit" value="">
              </div>
            </div>

            <div class="flexibleContainer">
              <div class="flexible">
                <label class="MandentorySign" for="PropertyStreetNumber"></label><label>Street Number</label>
                <input class="inlineInput" type="text" id="PropertyStreetNumber" name="PropertyStreetNumber" value="" maxlength="10">
              </div>

              <div class="flexible ">
                <label class="MandentorySign" for="PropertyStreetName"></label><label>Street Name</label>
                <input class="inlineInput" type="text" id="PropertyStreetName" name="PropertyStreetName" value="" maxlength="40">
              </div>

            </div>
          </div>
        </div>

          <div class="flexibleContainer">

            <div class="flexible ">

              <label class="MandentorySign" for="PropertyCity"></label><label for="PropertyCity">City</label>
              <input class="inlineInput" type="text" id="PropertyCity" name="PropertyCity" value="" maxlength="30">

            </div>


            <div class="flexible itemLongProvince">

              <label class="MandentorySign"></label><label>Province</label>

              <div class="box">
                <div class="custom-select" id="PropertyProvinceCustom" onclick="ProvinceCheck();">

                  <select class="inputSelection" id="PropertyProvince" name="PropertyProvince">

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

                  </select>

                </div>

              </div>

            </div>

            <div class="flexible ">

              <label class="MandentorySign" for="PropertyPostalCode" ></label><label for="PropertyPostalCode">Postal Code</label>
              <input class="inlineInput" type="text" id="PropertyPostalCode" name="PropertyPostalCode" value="" maxlength="20" onblur="postalCorrect(this.id)">
              <!-- onblur="postalCorrect(this.id);" -->

            </div>

          </div>



        </div><!-- Closing PropertyDetails -->

      </div><!-- Closing Address&MLS -->

      <!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

      <!-- The following div section called Listing Details is to collect the required information about the transaction such as listing side price and so on as you see. Actually each data has its own id and name to be retrived  -->

      <div id="ListingDetails" class="NewSectionSmall" style="    margin-top: 42px;">

        <label class="HeadLinesSecondary" style="margin-left: 8px;">Transaction Details</label>

        <hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

        <div style="height:auto; text-align:left;" id="ListingDetailInformation" class="NewSectionSmall">

          <!-- These 4 following p tags are to inform the users about all possible errors after entering the data and moving to the next step --------------------------------------------------------------------------------------------------------------------------------------------------------------->


          <p id="ErrorEmpty2" class="ErrorEmpty" style="display:none;">
            Complete all required fields before proceeding.</p>            


          <p id="Warning2" class="Warning2 ErrorEmptyYellow" style="display:none; ">
            Listing commission exceeds 2.5%. Please review.</p>

          <p id="Warning3" class="Warning3 ErrorEmptyYellow" style="display:none; ">
            Selling commission exceeds 2.5%. Please review.</p>

          <p id="Warning4" class="Warning4 ErrorEmptyYellow" style="display:none;">
            Total commissions exceeds 5%. Please review.</p>

          <div id="statusAvailable" class="Notification" style="display:none;">
            <label class="heavyfont"> Status: Available <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">This listing will remain in Pending Deals until status is updated.</span></span>
            </label> 
          </div>

          <div id="statusExpired" class="Notification" style="display:none;">
            <label class="heavyfont"> Status: Expired <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">Expired listings could be moved to completed deals and reopened at a later time.</span></span>
            </label> 
            <button type='button' id='statusExpiredComplete' class='buttonBody floatDataRightSide' onclick='movetocompleted("")'>Move to completed</button>
          </div>



          <div id="statusWidthdrawan" class="Notification" style="display:none;">

            <label class="heavyfont" > Status: Offer Withdrawn <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">Commissions could not be changed and any client deposit must be returned.</span></span>
            </label>

          </div>

          <div id="statusOffMarket" class="Notification" style="display:none;">
            <label class="heavyfont"> Status: Off Market<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">Off Market listings could be moved to completed deals and reopened at a later time.</span></span>
            </label>
            <button type='button' id='statusOffMarketComplete' class='buttonBody floatDataRightSide' onclick='movetocompleted("")'>Move to completed</button>
          </div>

          <p id="LeaseWarning2" class="Warning2 ErrorEmptyYellow" style="display:none;">
            Listing commission exceeds 50% of monthly rent. Please review.</p>

          <p id="LeaseWarning3" class="Warning3 ErrorEmptyYellow" style="display:none;">
            Selling commission exceeds 50% of monthly rent. Please review.</p>

          <p id="LeaseWarning4" class="Warning4 ErrorEmpty" style="display:none;">
            Total commission exceeds first month rent. Please review.</p>

          <p id="ComissionError" class="ErrorEmpty" style="display:none;">Total commission exceeds sale price. Please
            review.</p>

          <!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <p style="display:none">Office Lead commission allocation will replace the
            commission split percentage and will be counted toward the commission
            cap.</p>

          <div class="flexibleContainer">

            <div class="flexible">

              <span> <label class="MandentorySign"></label><label>Amount</label>

               <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">Amount must be
                    sale price or monthly rent</span></span>

                <span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
                  <label style="margin-left: 5px;">$</label>
                  <input class="input5" type="text" id="ProPertyListingPrice" name="ProPertyListingPrice" min=0 maxlength="10"
                    placeholder="0.00" onblur="limiting(this); clearing()">
                </span>
            </div>

            <div class="flexible">

              <label class="MandentorySign"></label><label>Property Type</label>

              <div id="" class="custom-select" onclick="ChangePropertyImage()">

                <select class="inputSelection" id="PropertyType" name="PropertyType">

                  <option value="">-- Please choose an option --</option>

                  <option value="Detached">Detached</option>

                  <option value="Semi-detached">Semi-detached</option>

                  <option value="Townhouse">Townhouse</option>

                  <option value="Condominium">Condominium</option>

                  <option value="Commercial">Commercial</option>

                  <option value="Land">Land</option>

                  <option value="Other">Other</option>

                </select>
              </div>

              <!-- <input class="inlineInput" id="PropertyType" name="PropertyType" value=""> -->


            </div>

          </div>

          <div class="flexibleContainer">

            <div class="flexible">

              <label class="MandentorySign"></label><label>Listing Type</label>

              <div id="PropertyListingTypeCustom" class="custom-select" onclick="CheckListingType(); SetStatusOptions();">

                <select class="inputSelection"
                  id="PropertyListingType" name="PropertyListingType" style="width: 100%;">

                  <option value="">-- Please choose an option --</option>

                  <option value="Buyer-Side">Buyer Side</option>

                  <option value="Listing-Side">Listing Side</option>

                  <option value="Sale-Double-Sided">Sale - Double Sided</option>

                  <option value="Landlord-Side">Landlord Side</option>

                  <option value="Tenant-Side">Tenant Side</option>

                  <option value="Lease-DoubleSided">Lease - Double Sided</option>

                  <option value="BuyerSide-Self-Represented-Vendor">Buyer Side - Self-Represented Vendor</option>

                  <option value="TenantSide-Self-Represented-Landlord">Tenant Side - Self-Represented Landlord</option>

                </select>
              </div>

            </div>



            <div class="flexible">

              <label class="MandentorySign"></label><label>Deal Source</label>

              <div id="ProPertyListingSourceCustom" class="custom-select" onclick="CheckTransactionSource();">

                <select class="inputSelection" type="text"
                  id="ProPertyListingSource" name="ProPertyListingSource">


                  <option value="">-- Please choose an option --</option>

                  <option value="Agent-lead">Agent lead</option>

                  <option value="Office-lead">Office lead</option>

                </select>
              </div>

            </div>



          </div>

          <div class="flexibleContainer">


            <div class="flexible">

              <label class="MandentorySign"></label><label>Status</label>

              <div class="custom-select" id="PropertyStatusCustom" onclick="PropertyStatus();">

                <select class="inputSelection" id="PropertyListingStatus" name="PropertyListingStatus">

                  <option value="">-- Please choose an option --</option>

                </select>

              </div>

            </div>

            <div class="flexible">

              <label class="NoMandatory"></label><label>Conditions</label>

              <input class="inlineInput" type="text" maxlength="45" id="PropertyCondition" name="PropertyCondition" value="" placeholder="Describe conditions">

            </div>

          </div>

          <div class="flexibleContainer">

            

          </div>

        </div><!-- closing ListingDetailInformation div -->

        <div id="CommisionsDetails">

          <span style="display:block; padding-top: 5px; margin-left: 8px;"><label style="width: 240px;">Listing
              Commission:</label>

            <label class="container" style="padding-left: 20px; width: 40px;"><input
                onclick="SetCommissionAmounts('ListingComiissionPercentage','ListingComiissionPercentage','ListingComiissionFixedAmount','ListingComiissionPercentage','ListingCommissionsign','PropertyListingComission');"
                type="checkbox" checked="checked" id="ListingComiissionPercentage" name="ListingComiissionPercentage"
                value="Percentage"><span class="checkmark" style=" top: -1px"></span>%</label>

            <label class="container" style="padding-left: 20px;"><input
                onclick="SetCommissionAmounts('ListingComiissionFixedAmount','ListingComiissionPercentage','ListingComiissionFixedAmount','ListingComiissionPercentage','ListingCommissionsign','PropertyListingComission');"
                type="checkbox" id="ListingComiissionFixedAmount" name="ListingComiissionFixedAmount"
                value="Fixed Amount"><span class="checkmark" style=" top: -1px;"></span>$</label>

            <span class="inlineInput  percentSpan percent" style="width: calc(25% + 2px);">

              <label id="ListingCommissionsign" style="margin-top: 1px;">%</label>

              <input class="input5" onblur="limiting(this); "
                oninput=" TotalAgentsCommissions('FirstAgentGrossCommisionSplit','SecondAgentGrossCommisionSplit','PropertyListingComission','PropertySellingComission'); maxLengthCheckSign(this, 'ListingCommissionsign'); "
                type="number" step="0.01" placeholder=0.00 step="0.01" id="PropertyListingComission"
                name="PropertyListingComission" value="0.00" maxlength="10">
            </span>

          </span>

          <span><label style="padding-top: 5px; width: 240px;  margin-left: 8px;">Selling
              Commission:</label>

            <label class="container" style="padding-left: 20px; width: 40px;">
              <input onclick="SetCommissionAmounts('SellingComiissionPercentage','SellingComiissionPercentage','SellingComiissionFixedAmount','SellingComiissionPercentage','SelllingCommissionsign','PropertySellingComission');"
                class="checkbox" checked="checked" type="checkbox" id="SellingComiissionPercentage"
                name="SellingComiissionPercentage">

              <span class="checkmark" style="  top: -2px"></span>%</label>

            <label class="container" style="padding-left: 20px;"><input
                onclick="SetCommissionAmounts('SellingComiissionFixedAmount','SellingComiissionPercentage','SellingComiissionFixedAmount','SellingComiissionPercentage','SelllingCommissionsign','PropertySellingComission');"
                class="checkbox" type="checkbox" id="SellingComiissionFixedAmount" name="SellingComiissionFixedAmount"
                value="Fixed Amount"><span class="checkmark" style="  top: -2px"></span>$</label>

            <span class="inlineInput percentSpan percent">

              <label id="SelllingCommissionsign" style="margin-top: 1px;">%</label>

              <input class="input5" onblur="limiting(this); "
                oninput="TotalAgentsCommissions('FirstAgentGrossCommisionSplit','SecondAgentGrossCommisionSplit','PropertyListingComission','PropertySellingComission');  maxLengthCheckSign(this, 'SelllingCommissionsign');"
                type="number" step="0.01" placeholder="0.00" step="0.01" id="PropertySellingComission"
                name="PropertySellingComission" value="0.00" maxlength="10" max="10000000"> 
            </span>
          </span>

          <span style="display:none; padding-top: 5px; margin-left: 8px;">

            <label class="container">

              <input onclick="HSTView();" class="checkbox" type="checkbox" id="HSTViewcheckmark"
                name="HSTViewcheckmark"><span class="checkmark"></span></label>

            <label style="margin-left: 16px;">View GST/HST</label>

            <span id="HSTSection" class="inlineInput percentSpan percent"
              style="display:none; margin-top: 12px; width: calc(25% + 2px);">

              <label id="" style="margin-top: 1px;">%</label>

              <input class="input5" type="number" placeholder=0.00 step="0.01" id="HSTAMount" name="HSTAMount"
              
                value="13.00"  oninput="maxlengthCheckHST(this)" maxlength="5">

            </span>

          </span>




          <div id="OfficeLeadCommisison" class="Notification NewSectionSmall"
            style="display:none; padding-bottom: 0px;padding-top: 13px;">

            <label id="OfficeLeadItem11" style="display:none;  font-weight: bold;   margin-top: 6px;">Office lead
              allocation</label>

            <hr style="display:none; margin-right: 4px; border: none; margin: 0;" id="OfficeLeaditem2">

            <div class="flexibleContainer">

              <label style="margin-top: 15px; flex: 0.8;" class="flexible">Listing</label>

              <label class="flexible" style="flex: 2; margin-top: 15px;">Gross commission allocation to
                office</label>

              <div class="percent inlineInput flexible" style="flex: 0.92; background: white;">
                <label>%</label><input class="input5" type="number" min="0.00" placeholder="0.00" step="0.01" maxlength="5"
                  value="50.00" id="OfficeLeadAllocaton" name="OfficeLeadAllocaton" onblur="limiting(this);"
                  oninput="maxLengthCheck100(this)">
              </div>

            </div>

            <div class="flexibleContainer">

              <label style="margin-top: 15px;     flex: 0.8;" class="flexible"></label>

              <label class="flexible" style="flex: 2;">Apply against agent's commission cap</label>
              <div class="flexible" style="flex: 0.92;">
                <label class="container" style="    margin-right: 16px; height: auto;
                float: right;"><input type="checkbox" class="checkbox" id="OfficeLeadAgainstCap"
                    name="OfficeLeadAgainstCap" value="yes" checked><span class="checkmark" style="    margin-right: 16px;
                    float: right;  top: -8px;"></span></label>
              </div>
            </div>

          </div>

          <div id="OfficeLeaddoubledouble" class="Notification NewSectionSmall"
            style="display:none; padding-bottom: 0px; padding-top: 13px;">

            <label id="OfficeLeadItem1" style="display:none;  font-weight: bold;   margin-top: 6px;">Office lead
              allocation</label>

            <hr style="display:none; margin-right: 4px; border: none; margin: 0;" id="OfficeLeaditem2">

            <div>

              <div class="flexibleContainer">

                <label style="margin-top: 15px; flex: 0.8;" class="flexible">Listing</label>

                <label class="flexible" style="flex: 2; margin-top: 15px;">Gross commission allocation to
                  office</label>

                <div class="percent inlineInput flexible" style="flex: 0.92; background: white;">

                  <label>%</label>
                  <input class="input5" type="number" placeholder="0.00" step="0.01" value="50.00" maxlength="5"
                    id="OfficeLeadAllocatonListng" name="OfficeLeadAllocatonListng" onblur="limiting(this);"
                    oninput="maxLengthCheck100(this)">

                </div>
              </div>


              <div class="flexibleContainer">
                <label style="margin-top: 15px;     flex: 0.8;" class="flexible"></label>

                <label class="flexible" style="flex: 2;">Apply against agent's commission cap</label>

                <div class="flexible" style="flex: 0.92;">
                  <label class="container" style="    margin-right: 16px; height: auto;
                  float: right;"><input type="checkbox" class="checkbox" id="OfficeLeadAgainstCapListing"
                      name="OfficeLeadAgainstCapListing" value="yes" checked><span class="checkmark"
                      style="left:90%;      top: -8px;"></span></label>

                </div>
              </div>

            </div>

            <div>

              <div class="flexibleContainer">

                <label style="margin-top: 15px;     flex: 0.8;" class="flexible">Selling</label>

                <label class="flexible" style="flex: 2; margin-top: 15px;">Gross commission allocation to
                  office</label>

                <div class="percent inlineInput flexible" style="flex: 0.92;  background: white;">

                  <label>%</label>
                  <input class="input5" type="number" min="0.00" placeholder="0.00" step="0.01" value="50.00" maxlength="5"
                    id="OfficeLeadAllocatonSelling" name="OfficeLeadAllocatonSelling" onblur="limiting(this);"
                    oninput="maxLengthCheck100(this)">

                </div>

              </div>


              <div class="flexibleContainer">
                <label style="margin-top: 15px;     flex: 0.8;" class="flexible"></label>

                <label class="flexible" style="flex: 2;">Apply against agent's commission cap</label>

                <label class="container flexible" style="flex: 0.92; height: auto;">
                  <input type="checkbox" class="checkbox" id="OfficeLeadAgainstSelling" name="OfficeLeadAgainstSelling"
                    value="yes" checked><span class="checkmark" style="left:90%;     top: -4px;"></span></label>

              </div>
            </div>

          </div><!-- Closing Office Lead double double -->

          <div> 

            <label class="HeadLinesSecondary" style="margin-left: 8px; margin-top: 42px;">Dates</label>

           <hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

            <p id="ErrorDate1" class="ErrorEmpty" style="display:none;">
              Listing Expiration Date cannot be before Listing date.</p>

            <p id="ErrorDate2" class="ErrorEmpty" style="display:none;">
              Closing Date cannot be before Listing Date.</p>

            <p id="ErrorDate3" class="ErrorEmpty" style="display:none;">
              Offer Expiration, Offer Withdrawal or Offer Acceptance cannot be before Offer date.</p>
              
            <p id="ErrorDate4" class="ErrorEmpty" style="display:none;">
              No dates can be before Listing Date.</p>

            <div class="flexibleContainer">

              <div class="flexible" id="DisplayingClosingDate">
                <label class="MandentorySign" id="dunamicMandantoryfiled1"></label><label id="CloseDateLabel">Closing</label>
                <div class="input-group withdelete">
                  <input id="PropertyClosingDate" name="PropertyClosingDate" type="text" class="form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyClosingDate" id="PropertyClosingDatelabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              <div class="flexible">
  
                <label class="NoMandatory" id="ListingDateMand"></label><label>Listing</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyListingDate" name="PropertyListingDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyListingDate" id="PropertyListingDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn"onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                  </label>
                </div>
              </div>
  
              <div class="flexible">
                <label class="NoMandatory" id="dynamicMandentorysign2" style="margin-right: 2px;"></label>
                <label style="margin-bottom: 3px;">Listing Expiration</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyExpirationDate" name="PropertyExpirationDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyExpirationDate" id="PropertyExpirationDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
              </div>
  
              
            </div>

            <div class="flexibleContainer">

              <div class="flexible">
                <label class="NoMandatory" id="OfferLabel"></label><label>Offer</label>
                <div class="input-group withdelete">
                  <input id="PropertyOfferDate" name="PropertyOfferDate" type="text" class="form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOfferDate" id="PropertyOfferDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              <div class="flexible">
  
                <label class="NoMandatory"></label><label>Offer Expiration</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyOfferExpirationDate" name="PropertyOfferExpirationDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOfferExpirationDate" id="PropertyOfferExpirationDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>

              </div>
  
              <div class="flexible ">
               
                <label class="NoMandatory"></label><label>Offer Acceptance</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyOfferAcceptanceDate" name="PropertyOfferAcceptanceDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOfferAcceptanceDate" id="PropertyOfferAcceptanceDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                 
                </div>
  
              </div>
  
              
            </div>

            <div class="flexibleContainer">

              <div class="flexible">
                <label class="NoMandatory"></label><label>Conditions Expiration</label>
                <div class="input-group withdelete">
                  <input id="PropertyConditionsExpirationDate" name="PropertyConditionsExpirationDate" type="text" class="form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyConditionsExpirationDate" id="PropertyConditionsExpirationDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              <div class="flexible">
  
                <label class="NoMandatory"></label><label>Conditions Complete</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyConditionsCompleteDate" name="PropertyConditionsCompleteDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyConditionsCompleteDate" id="PropertyConditionsCompleteDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>

              </div>
  
              <div class="flexible ">
               
                <label class="NoMandatory" id="OfferWithdrawalLabel"></label><label>Offer Withdrawal</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyOfferWithdrawalDate" name="PropertyOfferWithdrawalDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOfferWithdrawalDate" id="PropertyOfferWithdrawalDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              
            </div>

            <div class="flexibleContainer">

              <div class="flexible">
                <label class="NoMandatory"></label><label>Inspection</label>
                <div class="input-group withdelete">
                  <input id="PropertyInspectionDate" name="PropertyInspectionDate" type="text" class="form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyInspectionDate" id="PropertyInspectionDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              <div class="flexible">
  
                <label class="NoMandatory"></label><label>Occupancy</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyOccupancyDate" name="PropertyOccupancyDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOccupancyDate" id="PropertyOccupancyDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>

              </div>
  
              <div class="flexible ">
               
                <label class="NoMandatory" id="OffMarketLabel"></label><label>Off Market</label>
  
                <div class="input-group withdelete">
                  <input id="PropertyOffMarketDate" name="PropertyOffMarketDate" type="text" value=""
                    class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="PropertyOffMarketDate" id="PropertyOffMarketDateLabel">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                  <label class="input-group-btn" onclick="eraseDate(this)">
                    <span class="btn btn-default">
                        <i class="bi bi-x"></i>
                      </span>
                 </label>
                </div>
  
              </div>
  
              
            </div>

          </div>


        </div><!-- Closing CommisionsDetails div -->


      </div>
      <!--Closing ListingDetails div  -->

      <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->


      <!-- Id is repeating -->



      <div id="agent">

        <div class="NewSection">

          <span id="changeAgent" style="display: none;">

            <label class="container" style="margin-left: 7px;"><input class="inlineInput" 
              onclick="forBrokerage()" type="checkbox" id="changeAgentBox" name="changeAgentBox">
            <span class="checkmark" style="top: 16px; left: -7px;"></span></label>

          <label style="margin-left: 6px; margin-right: 2px;">Change First Agent</label>

          </span>

          <div id="TheAgentsParties" class="flexibleContainer">

            <!----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

            <div id="FirstAgentIDCustom" class="flexible" style="pointer-events: none; display: none;">

              <label class="MandentorySign"></label><label>First Agent</label>

              <div class="custom-select" id="FirstAgentIDCustom"  onclick="SetSecondAgentLists('SecondAgentID');">

                <select onchange="SetAgent1();" class="inputFull" id="FirstAgentID" name="FirstAgentID">

                  <option value="<%= MyInformation.id%> <%=MyInformation.Firstname%>  <%=MyInformation.Lastname%>" > <%= MyInformation.Firstname %>  <%= MyInformation.Lastname %></option>


                </select>

              </div>

            </div>

            <div class="flexible"></div>

            <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
          </div>

          <script>
          
          
            var agents=[] ;
  
            var IDs=[];
               <%
               
               int MyId=0;
               
               String  addelemet="";
               
                  ArrayList<Users> AgentList= new ArrayList<Users>(); //This is an arrayList to keep the agents information
  
                  AgentList=myRDS.GetAgents(BrokerID , "2",con);//Calling the function to get the agents related to the specific broker and keep save them in agent ArrayList
  
                for (Users User : AgentList) { 
               
                  MyId=User.id  ;
                  
                  addelemet=User.Firstname+" "+User.Lastname;
               
               %> 
  
               agents.push( "<%=addelemet%>" );
  
               IDs.push( "<%=MyId%>" );
  
  
                <%}%>
  
            //  var select1 = document.getElementById("FirstAgentID");
  
              //In the following for loop , the agents list is assigin to select option list  
  
              //for (var i = 0; i < agents.length; i++) {
  
              //  var opt = agents[i]; //Setting the data for an option
  
                //var el1 = document.createElement("option");
  
                //el1.textContent = opt;
  
                //el1.value = IDs[i] + " " + opt;
  
                //select1.appendChild(el1);
  
             // } //Closing the for loop 
            </script>

          <p id="ErrorEmpty3" class="ErrorEmpty" style="display:none;">Complete all required fields before
            proceeding.</p>

          <p id="GrossCommissionsError" class="ErrorEmpty" style="display:none;">You chose to add another agent. Ensure
            both agents receive a portion of the gross commission.</p>

          <p id="AgentTwoError" class="ErrorEmpty" style="display:none;">You chose to add another agent. You must add
            the second agent's name.</p>

          <div class="flexible" id="ExteraAgent" style="margin-top: 2px; margin-bottom: 7px; display: none;">

            <label class="container" style="margin-left: 7px;"><input class="inlineInput"
                onclick="CheckForSecondAgent();" type="checkbox" id="AddAgent" name="AddAgent">
              <span class="checkmark" style="top: 16px; left: -7px;"></span></label>

            <label style="margin-left: 6px; margin-right: 2px;">Add another agent</label>

            <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                height="16" loading="lazy"><span class="tooltiptext">Second agent must be from your brokerage. Use “Referral Fee”
                section, if a referral payment must be made to an agent from another brokerage.</span>
            </span>

          </div>

          <!-- <p id="Help3" style=" display:none; text-align:left;">Second
            agent can be selected from your brokerage, if they assisted you on this
            transaction. Please use "Referral Payment" section, if you would like
            to make a referral payment to a broker from another brokerage.</p> onclick="HideAndShowHelps('Help3');" -->

          <div style="display:none;" id="AddNewAgent">

            <div class="flexibleContainer">

              <div class="flexible">

                <label class="MandentorySign"></label><label>Second Agent</label> <br>



                <div class="custom-select" id="SecondAgentIDCustom" onclick="SetAgent2();">

                  <select onchange="SetAgent2();" class="inputFull" id="SecondAgentID" name="SecondAgentID">

                    <option value="">-- Please choose an option --</option>

                  </select>



                </div>

              </div>

              <div class="flexible"></div>

            </div>

          </div>
          <div class="flexibleContainer" id="SecondAgentRole" style="display:none">
            <div class="flexible" style="text-align:left;">

              <label class="NoMandatory" style="    margin-right: 0;"></label>

              <label>Role</label>

              <div class="custom-select" id="CustomAgentRol" onclick="AgentsRolsCommission();">

                <select class="inputSelection" id="SecondAgentIDRole"
                  name="SecondAgentIDRole">

                  <option value="">-- Please choose an option --</option>

                  <option value="Selling Agent">Selling Agent</option>

                  <option value="Listing Agent">Listing Agent</option>

                </select>
              </div>

            </div>

            <div class="flexible"></div>
          </div>




          <div style="text-align:left;" id="AgentsCommissionSplit">

            <div id="checkAgent2" style="display:none; ">

              <!-- <label>Gross commission split:</label><br><br> -->

              <div class="flexibleContainer ">

                <div class="flexible flexibleContainer" style="float: left; margin-bottom: 2px;">

                  <label class="SomelabelStyle flexible NoMandatoryMove" id="FirstAgentGross">First Agent</label>

                  <span class="inlineInput shortValuePercent flexible" style="float: right; margin: 0;">

                    <label style="float: right;">%</label>

                    <input class="input5" onblur="limiting(this); maxLengthCheck(this); TotalAgentsCommissions('FirstAgentGrossCommisionSplit','SecondAgentGrossCommisionSplit','PropertyListingComission','PropertySellingComission'); "
                      type="number" step="0.01" id="FirstAgentGrossCommisionSplit" name="FirstAgentGrossCommisionSplit" min=0
                      max="100.00" placeholder="0.00" value="100.00">

                  </span>

                </div>

                <div class="flexible"></div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible flexibleContainer" style="float: left; margin-top: 2px;">

                  <label class="SomelabelStyle flexible NoMandatoryMove" id="SecondAgentGross">Second
                    Agent</label>

                  <span class="inlineInput shortValuePercent flexible"
                    style="background-color: #f3f3f3; border-color: lightgray; margin: 0; float: right;">
                    <label style="float: right;">%</label>
                    <input class="input5" type="number" step="0.01" onchange="limiting(this); " id="SecondAgentGrossCommisionSplit"
                      style="background: #f3f3f3;" name="SecondAgentGrossCommisionSplit" min=0.00 max=100.00
                      placeholder="0.00" value="0.00" readonly="readonly">
                  </span>

                </div>

                <div class="flexible"></div>

              </div>

            </div><!-- Closing checkAgent2 -->

          </div><!-- Closing AgentsCommissionSplit -->

        </div><!-- Closing TheAgentsParties div -->

      </div><!-- Closing Agents -->

      <div class="FooterButton">

        <div class="FooterButtonSpan">

          <span class="buttonDiscard ">

          <span class="secondSpan ">
            
            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn1">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_1" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving1">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn1">Save and close</button>

            <span class="savespan" id="savespan1">

              <button class="buttonSaveOne" type="button" id="SaveTransactionDetails" name="SaveTransactionDetails" >Save</button>
              
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving1', 'Deletebtn1', 'Savebtn1', 'savespan1', 'Deletebtn1_1', 1, event)" type="button" >&nbsp;</button>

            </span>

            <button id="Warningbutton" type="button" style="display:none;" onclick="PropertyNextWarnings()">Accept
              Warnings and Proceed</button>

            <button class="buttonBlue" id="Nextbutton" type="button" onclick="PropertyNext(); ">Next</button>
          </span>

        </div>

      </div>

    </div><!-- Closing PROPERTY DETAILS -->

    <!-- **************************************************************************************************************************************************************************************************************************************************************************************************** -->

    <div id="PARTIES" class="tabcontent" style="display: none;">

      <label class="HeadLines">TRADE RECORD SHEET</label>

      <!-- This Span contains the Property information -->

      <div class="forAddressTop">

        <label id="Property1"></label>

      </div>

      <hr class="addressHr" style="margin-right: 4px;">

      <div class="PartiesNavBar flexibleContainer" id="PartiesNavBar">

        <button id="MyVendor" type="button" class="tablinks2 flexible"
          onclick=" TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab'); TabsHandleler(event, 'Vendors', 'tabcontent2', 'tablinks2', 'MyVendor');"
          disabled>Vendors</button>

        <button id="MyVendorLawyer" type="button" class="tablinks2 flexible"
          onclick=" TabsHandleler(event, 'VendorLawyer', 'tabcontent2', 'tablinks2', 'MyVendorLawyer');"
          disabled>Vendor's <br>Lawyer</button>

        <button id="MyPurchaser" type="button" class="tablinks2 flexible"
          onclick="TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser'); "
          disabled>Purchaser</button>

        <button id="MyPurchaserLawyer" type="button" class="tablinks2 flexible"
          onclick="TabsHandleler(event, 'PurchaserLawyer', 'tabcontent2', 'tablinks2', 'MyPurchaserLawyer');"
          disabled>Purchaser's <br>Lawyer</button>

        <button id="MyDeposits" type="button" class="tablinks2 flexible"
          onclick="TabsHandleler(event, 'Deposits', 'tabcontent2', 'tablinks2', 'MyDeposits');"
          disabled>Deposit</button>

        <button id="MyCooperatingBrokerage" type="button" class="tablinks2 flexible"
          onclick="TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');"
          disabled>Co-operating<br> Brokerage</button>


        <span id="ClientProcess" class="floatDataRightSide">

          <span class="tooltip">
            <img src="../ImagesUsed/AddSVG.svg" style="margin-top: 22px;" class="lineButton manageListButton" alt="+"
              type="button" onclick="AddParties('Vendor2','Vendor3','Vendor4','AddMoreVendor','RemoveOneVendor');"
              id="AddMoreVendor" name="AddMoreVendor" loading="lazy"><span class="tooltiptext">Add Party</span>
          </span>

        </span>

        <span id="PurcharerProcess" class="floatDataRightSide" style="display: none;">

          <span class="tooltip">
            <img src="../ImagesUsed/AddSVG.svg" style="margin-top: 22px;" class="lineButton manageListButton" alt="+"
              type="button"
              onclick="AddParties('puchaser2','puchaser3','puchaser4','AddMorePuchaser','RemoveOnePurchaser');"
              id="AddMorePuchaser" name="AddMorePuchaser" loading="lazy"><span class="tooltiptext">Add Party</span>
          </span>

        </span>

        <span id="DepositProcess" class="floatDataRightSide" style="display: none;">

          <span class="tooltip">
            <img src="../ImagesUsed/AddSVG.svg" style="margin-top: 22px;" class="lineButton manageListButton" alt="+"
              type="button" onclick="AddParties('Deposit2','Deposit3','Deposit4','AddMoreDeposits','RemoveOneDeposit');"
              id="AddMoreDeposits" name="AddMoreDeposits"><span class="tooltiptext">Add Deposit</span>
          </span>

        </span>



      </div><!-- Closing PartiesNavBar-->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

      <div id="Vendors" class="tabcontent2">



        <div id="MainVendors">

          <p id="VendorEmptyError" class="ErrorEmpty" style="display:none;">Complete all required fields before
            proceeding.</p>

          <p id="AvailableError" class="ErrorEmpty" style="display:none; line-height: 1.5;">The listing status is set as Available. You cannot proceed until the listing status is updated.</p>

          <p id="OffMarketError" class="ErrorEmpty" style="display:none; line-height: 1.5;">The listing status is set as Off-Market. You cannot proceed until the listing status is updated.</p>

          <div class="mainForVendors" id="Vendor1">


            <div class="flexibleContainer NewSectionSmall" id="Vendordiv1">

              <div class="itemFull flexible" id="Vendordiv2">

                <label class="MandentorySign"></label><label>Type</label>

                <div id="VendorType1Custom" class="custom-select" onclick="PatiesType('VendorType1','VendorBusinessinquiries1','VendorFisrtNameLastName1');">

                  <select class="inputSelection " id="VendorType1" name="VendorType1">

                    <option value="">-- Please choose an option --</option>

                    <option value="Individual">Individual</option>

                    <option value="Corporation">Corporation </option>

                    <option value="Partnership">Partnership </option>

                    <option value="Trust">Trust</option>

                  </select>

                </div>

              </div><!-- Closing Vendordiv2 -->

              <div class="flexible">
                <span id='poaV1' class='attrn'>
                  <label class="NoMandatoryTwo">Power of Attorney</label>

                  <input class="input inlineInput" type="text" id="poaVendor1" maxlength="45" name="poaVendor1" value="">
                </span>
              </div>

            </div><!-- Closing Vendordiv1 -->

            <!--****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="flexibleContainer" id="VendorFisrtNameLastName1">

              <div class="flexible" id="VendorFirstNamediv">

                <label id="MandentoryLabel2Vendor1" class="MandentorySign"></label><label
                  id="VendorfirstnameLabel1">First Name</label>

                <input class="input inlineInput" oninput="SetVendorName1();" type="text" id="VendorFirstName1" maxlength="45"
                  name="VendorFirstName1" value="">

              </div>

              <div class="flexible" id="VendorLastNamediv">

                <label id="MandentoryLabel3Vendor1" class="MandentorySign"></label><label id="VendorlastnameLabel1">Last
                  Name</label>

                <input class="input inlineInput" type="text" id="VendorLastName1" name="VendorLastName1" value="" maxlength="45">
              </div>

            </div>


            <div class="flexibleContainer" style="display:none;" id="VendorBusinessinquiries1">

              <div class="flexible" id="VendorBusinessNamediv">

                <label class="MandentorySign" id="MandentoryLabel4Vendor1"></label><label
                  id="VendorBusinessNameLabel1">Business Name</label>

                <input class="input inlineInput" type="text" id="VendorBusinessName1" name="VendorBusinessName1" maxlength="60"
                  value="">

              </div>

              <div id="VendorAuthorizedSigningOfficerdiv" class="flexible">

                <label id="MandentoryLabel1Vendor1" class="MandentorySign"></label><label
                  id="VendorAuthorizedSigningOfficerLabel1">Signing Authority</label>

                <input class="input inlineInput" oninput="SetVendorName1();" type="text" maxlength="60"
                  id="VendorAuthorizedSigningOfficer1" name="VendorAuthorizedSigningOfficer1" value="">
              </div>

            </div>

            <!--*******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->
            <!-- Address from old fields, need to be updated -->

            <div class="vendorAddress" id="">

              <div class="NewSectionCopy">

                <label class="container"><input class="inlineInput"
                    onclick="CopyAddress('VendorUnit1','VendorStreetNumber1','VendorStreetName1','VendorProvince1','VendorPostalCode1','VendorCity1');"
                    type="checkbox" id="CopyAddress1" name="CopyAddress1">
                  <span class="checkmark" style="top: 16px; left: 8px;"></span></label>

                <label id="CopyPropertyAddress1" class="copyButton" style="margin-left: 22px;">Copy Property
                  Address</label>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label>

                  <input class="inlineInput" type="text" id="VendorUnit1" name="VendorUnit1" value="" maxlength="10">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Number</label>

                  <input class="inlineInput" type="text" id="VendorStreetNumber1" name="VendorStreetNumber1" value="" maxlength="10">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Name</label>

                  <input class="inlineInput" type="text" id="VendorStreetName1" name="VendorStreetName1" value="" maxlength="40">

                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="MandentorySign MandatoryCity"></label><label>City</label> <input class="inlineInput"
                    type="text" id="VendorCity1" name="VendorCity1" value="" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="box">

                    <div class="custom-select" id="VendorProvince1Custom"
                      onclick="Display('VendorProvince1', 'Vendor1ProvinceExtra');ifProvinceOther('VendorProvince1','VendorCountry1');">

                      <select class="inputSelection" id="VendorProvince1" name="VendorProvince1" readonly>

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

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                    type="text" id="VendorPostalCode1" name="VendorPostalCode1" value="" maxlength="11">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>


                <div class="flexible">
                  <label class="MandentorySign"></label><label>Country</label>

                  <input type="text" class="inlineInput" id="VendorCountry1" name="VendorCountry1" value="Canada" maxlength="20"
                    readonly>
                </div>

              </div>

              <div class="flexibleContainer" style="display: none;" id="Vendor1ProvinceExtra">

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Other province or state</label>

                  <input type="text" class="inlineInput" id="VendorOtherProvince1" name="VendorOtherProvince1" value="" maxlength="20">
                </div>

                <div class="flexibleotherProvince"></div> 


              </div>

            </div>

            <!-- End of address -->

            <div class="flexibleContainer NewSection">

              <div class="flexible itemFullEmail">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="VendorEmail1" maxlength="50"
                  name="VendorEmail1" value="">
              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="VendorPhone1" name="VendorPhone1" value="" maxlength="14"
                  onkeydown="phoneNumberFormatter(this.id)" >

              </div>

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="VendorExteraContactInformation1"
                    name="VendorExteraContactInformation1">

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Mobile">Mobile</option>

                    <option value="International Phone">International Phone</option>

                  </select>
                </div>

                <input class="input inlineInput" type="text" id="VendorExteraContact1" name="VendorExteraContact1" maxlength="32"
                  value="">
              </div>

            </div>

            <!-- Commented because it is mandatory but I dont use  -->

          </div><!-- Closing Vendor1 -->


          <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div class="mainForVendors NewSection" id="Vendor2" style="display:none">

            <span>

              <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

              <span class="tooltip floatDataRightSide">
                <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                  onclick="RemoveOneParty('Vendor2','Vendor3','Vendor4','AddMoreVendor');" style="display: inline;"
                  id="RemoveOneVendor2" name="RemoveOneVendor2" loading="lazy">
                <span class="tooltiptext">Remove Party</span>
              </span>
              <hr style="margin-right: 4px;">
            </span>



            <div class="flexibleContainer NewSectionSmall" id="Vendo2rdiv1">

              <div class="flexible" id="Vendo2rdiv2">

                <label class="MandentorySign"></label><label>Type</label>

                <div id="VendorType2Custom" class="custom-select" onclick="PatiesType('VendorType2', 'VendorBusinessinquiries2', 'VendorFisrtNameLastName2');">

                  <select class="inputSelection" id="VendorType2" name="VendorType2">

                    <option value="">-- Please choose an option --</option>

                    <option value="Individual">Individual</option>

                    <option value="Corporation">Corporation </option>

                    <option value="Partnership">Partnership </option>

                    <option value="Trust">Trust</option>

                  </select>

                </div>

              </div><!-- Closing Vendo2rdiv2 -->

              <div class="flexible">
                <span id='poaV2' class='attrn'>
                  <label class="NoMandatoryTwo">Power of Attorney</label>

                  <input class="input inlineInput" type="text" id="poaVendor2" maxlength="45" name="poaVendor2" value="">
                </span>
              </div>

            </div><!-- Closing Vendo2rdiv1 -->

            <!--*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="flexibleContainer" style="display:none;" id="VendorBusinessinquiries2">

              <div class=" flexible">

                <label class="MandentorySign" id="MandentoryLabel4Vendor2"></label><label
                  id="vendorBusinessNameLabel2">Business Name</label>

                <input class="inlineInput" type="text" id="VendorBusinessName2" name="VendorBusinessName2" value="" maxlength="60">
              </div>

              <div class=" flexible" id="VendorAuthorizedSigningOfficerdiv2">

                <label class="MandentorySign" id="MandentoryLabel1Vendor2"></label><label
                  id="VendorAuthorizedSigningOfficerLabel2">Signing Authority</label>

                <input class="inlineInput" type="text" id="VendorAuthorizedSigningOfficer2" maxlength="60"
                  name="VendorAuthorizedSigningOfficer2" value="">

              </div>

            </div>

            <div class="flexibleContainer" id="VendorFisrtNameLastName2">

              <div class=" flexible" id="VendorFirstNamediv2">

                <label id="MandentoryLabel2Vendor2" class="MandentorySign"></label><label
                  id="VendorfirstnameLabel2">First Name</label>

                <input class="inlineInput" type="text" id="VendorFirstName2" name="VendorFirstName2" value="" maxlength="45">

              </div>

              <div class=" flexible" id="VendorLastNamediv2">

                <label id="MandentoryLabel3Vendor2" class="MandentorySign"></label><label id="VendorlastnameLabel2">Last
                  Name</label>

                <input class="inlineInput" type="text" id="VendorLastName2" name="VendorLastName2" value="" maxlength="45">
              </div>

            </div>

            <!--************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="vendorAddress" id="">

              <div class="NewSectionCopy">

                <label class="container"><input class="inlineInput"
                    onclick="CopyAddress('VendorUnit2','VendorStreetNumber2','VendorStreetName2','VendorProvince2','VendorPostalCode2','VendorCity2');"
                    type="checkbox" id="CopyAddress2" name="CopyAddress2">
                  <span class="checkmark" style="top: 16px; left: 8px;"></span></label>

                <label id="CopyPropertyAddress2" class="copyButton" style="margin-left: 22px;">Copy Property
                  Address</label>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" id="VendorUnit2" maxlength="10"
                    name="VendorUnit2">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street
                    Number</label> <input class="inlineInput" type="text" id="VendorStreetNumber2" maxlength="10"
                    name="VendorStreetNumber2">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street
                    Name</label> <input class="inlineInput" type="text" id="VendorStreetName2" name="VendorStreetName2" maxlength="40">

                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>City</label>
                  <input class="inlineInput" type="text" id="VendorCity2" name="VendorCity2" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="custom-select" id="VendorProvince2Custom"
                    onclick="Display('VendorProvince2', 'Vendor2ProvinceExtra'); ifProvinceOther('VendorProvince2','VendorCountry2');">

                    <select class="inputSelection" id="VendorProvince2" name="VendorProvince2" readonly>

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

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                    type="text" id="VendorPostalCode2" name="VendorPostalCode2" maxlength="11">

                  <!-- onblur="postalCorrect(this.id);" -->
                </div>

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Country</label>

                  <input type="text" class="inlineInput" id="VendorCountry2" name="VendorCountry2" value="Canada" maxlength="20"
                    readonly>
                </div>

              </div>

              <div class="flexibleContainer" style="display: none;" id="Vendor2ProvinceExtra">

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Other province or state</label>

                  <input type="text" class="inlineInput" id="VendorOtherProvince2" name="VendorOtherProvince2" value="" maxlength="20">
                </div>

                <div class="flexibleotherProvince"></div>

              </div>

            </div>

            <!-- End of address Vendor 2 -->


            <div class="flexibleContainer NewSection">
              <div class="itemFullEmail flexible">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="VendorEmail2" maxlength="50"
                  name="VendorEmail2" value="">
              </div>
            </div>

            <div class="flexibleContainer">
              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="VendorPhone2" name="VendorPhone2" value="" maxlength="14"
                  onkeydown="phoneNumberFormatter(this.id)" >

              </div>



              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="VendorExteraContactInformation2"
                    name="VendorExteraContactInformation2">

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Mobile">Mobile</option>

                    <option value="International Phone">International Phone</option>

                  </select>

                </div>

                <input class="input inlineInput" type="text" id="VendorExteraContact2" name="VendorExteraContact2" maxlength="32"
                  value="">
              </div>

            </div>

          </div> <!-- Closing Vendor2 -->

          <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div class="mainForVendors NewSection" id="Vendor3" style="display:none">

            <span>

              <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

              <span class="tooltip floatDataRightSide">
                <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                  onclick=" RemoveOneParty('Vendor3','Vendor2','Vendor4','AddMoreVendor');" style="display: inline;"
                  id="RemoveOneVendor3" name="RemoveOneVendor3" loading="lazy">
                <span class="tooltiptext">Remove Party</span>

              </span>
              <hr style="margin-right: 4px;">
            </span>

            <div class="flexibleContainer NewSectionSmall">

              <div class="itemFull flexible">

                <label class="MandentorySign"></label><label>Type</label>

                <div id="VendorType3Custom" class="custom-select" onclick="PatiesType('VendorType3', 'VendorBusinessinquiries3', 'VendorFisrtNameLastName3');">

                  <select class="inputSelection" id="VendorType3" name="VendorType3">

                    <option value="">-- Please choose an option --</option>

                    <option value="Individual">Individual</option>

                    <option value="Corporation">Corporation </option>

                    <option value="Partnership">Partnership </option>

                    <option value="Trust">Trust</option>

                  </select>
                </div>

              </div>

              <div class="flexible">
                <span id='poaV3' class='attrn'>
                  <label class="NoMandatoryTwo">Power of Attorney</label>

                  <input class="input inlineInput" type="text" id="poaVendor3" maxlength="45" name="poaVendor3" value="">
                </span>
              </div>
            </div>

            <!--*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="flexibleContainer" style="display:none;" id="VendorBusinessinquiries3">

              <div class="flexible">

                <label class="MandentorySign" id="MandentoryLabel4Vendor3"></label><label
                  id="vendorBusinessNameLabel3">Business Name</label>

                <input class="input inlineInput" type="text" id="VendorBusinessName3" name="VendorBusinessName3" maxlength="60"
                  value="">

              </div>

              <div class="flexible" id="VendorAuthorizedSigningOfficerdiv3">

                <label id="MandentoryLabel1Vendor3" class="MandentorySign"></label><label
                  id="VendorAuthorizedSigningOfficerLabel3">Signing Authority</label>

                <input class="input inlineInput" oninput="SetVendorName1();" type="text" maxlength="60"
                  id="VendorAuthorizedSigningOfficer3" name="VendorAuthorizedSigningOfficer3" value="">
              </div>

            </div>

            <div class="flexibleContainer" id="VendorFisrtNameLastName3">

              <div class="flexible" id="VendorFirstNamediv3">

                <label id="MandentoryLabel2Vendor3" class="MandentorySign"></label><label
                  id="VendorfirstnameLabel3">First Name</label>

                <input class="input inlineInput" type="text" id="VendorFirstName3" name="VendorFirstName3" maxlength="45">
              </div>

              <div class="flexible" id="VendorLastNamediv3">

                <label id="MandentoryLabel3Vendor3" class="MandentorySign"></label><label id="VendorlastnameLabel3">Last
                  Name</label>

                <input class="input inlineInput" type="text" id="VendorLastName3" name="VendorLastName3" maxlength="45">
              </div>

            </div>

            <!--*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="vendorAddress" id="">

              <div class="NewSectionCopy">

                <label class="container"><input class="inlineInput"
                    onclick="CopyAddress('VendorUnit3','VendorStreetNumber3','VendorStreetName3','VendorProvince3','VendorPostalCode3','VendorCity3');"
                    type="checkbox" id="CopyAddress3" name="CopyAddress3"><span class="checkmark"
                    style="top: 16px;left: 8px;"></span></label>

                <label id="CopyPropertyAddress3" class="copyButton" style="margin-left: 22px;">Copy Property
                  Address</label>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" id="VendorUnit3" maxlength="10"
                    name="VendorUnit3">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street
                    Number</label> <input class="inlineInput" type="text" id="VendorStreetNumber3" maxlength="10"
                    name="VendorStreetNumber3">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Name</label> <input class="inlineInput" maxlength="40"
                    type="text" id="VendorStreetName3" name="VendorStreetName3">

                </div>
              </div>

              <div class="flexibleContainer">
                <div class="flexible ">

                  <label class="MandentorySign"></label><label>City</label>
                  <input class="inlineInput" type="text" id="VendorCity3" name="VendorCity3" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="box">

                    <div class="custom-select" id="VendorProvince3Custom"
                      onclick="Display('VendorProvince3', 'Vendor3ProvinceExtra'); ifProvinceOther('VendorProvince3','VendorCountry3');">

                      <select class="inputSelection" id="VendorProvince3" name="VendorProvince3" readonly>

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

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                    type="text" id="VendorPostalCode3" name="VendorPostalCode3" maxlength="11">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Country</label>

                  <input type="text" class="inlineInput" id="VendorCountry3" name="VendorCountry3" value="Canada" maxlength="20"
                    readonly>
                </div>

              </div>

              <div class="flexibleContainer" style="display: none;" id="Vendor3ProvinceExtra">

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Other province or state</label>

                  <input type="text" class="inlineInput" id="VendorOtherProvince3" name="VendorOtherProvince3" value="" maxlength="20">
                </div>

                <div class="flexibleotherProvince"></div>

              </div>

            </div> <!-- Closing address -->
            <div class="flexibleContainer NewSection">
              <div class="itemFullEmail flexible">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="VendorEmail3" maxlength="50"
                  name="VendorEmail3" value="">
              </div>
            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="VendorPhone3" name="VendorPhone3" value="" maxlength="14"
                  onkeydown="phoneNumberFormatter(this.id)" >
              </div>

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="VendorExteraContactInformation3"
                    name="VendorExteraContactInformation3">

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Mobile">Mobile
                    </option>

                    <option value="International Phone">International Phone</option>

                  </select>

                </div>

                <input class="input inlineInput" type="text" id="VendorExteraContact3" name="VendorExteraContact3" maxlength="32"
                  value="">
              </div>

            </div>

          </div> <!-- Closing Vendor3-->

          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

          <div class="mainForVendors NewSection" id="Vendor4" style="display:none">



            <span>

              <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

              <span class="tooltip floatDataRightSide">
                <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                  onclick=" RemoveOneParty('Vendor4','Vendor2','Vendor3','AddMoreVendor');" style="display: inline;"
                  id="RemoveVendor4" name="RemoveVendor4" loading="lazy">
                <span class="tooltiptext">Remove Party</span>
              </span>
              <hr style="margin-right: 4px;">
            </span>

            <div class="flexibleContainer NewSectionSmall" id="Vendor4div1">

              <div class="itemFull flexible" id="Vendor4div2">

                <label class="MandentorySign"></label><label>Type</label>

                <div id="VendorType4Custom" class="custom-select" onclick="PatiesType('VendorType4', 'VendorBusinessinquiries4', 'VendorFisrtNameLastName4');">

                  <select class="inputSelection" id="VendorType4" name="VendorType4">

                    <option value="">-- Please choose an option -- </option>

                    <option value="Individual">Individual</option>

                    <option value="Corporation">Corporation</option>

                    <option value="Partnership"> Partnership</option>

                    <option value="Trust">Trust</option>

                  </select>

                </div>

              </div><!-- Closing Vendor4div2 -->

              <div class="flexible">
                <span id='poaV4' class='attrn'>
                  <label class="NoMandatoryTwo">Power of Attorney</label>

                  <input class="input inlineInput" type="text" id="poaVendor4" maxlength="45" name="poaVendor4" value="">
                </span>
              </div>

            </div><!-- Closing Vendor4div1 -->

            <!--*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="flexibleContainer " style="display:none;" id="VendorBusinessinquiries4"
              id="VendorBusinessinquiries4">

              <div class="flexible">

                <label class="MandentorySign" id="MandentoryLabel4Vendor4"></label><label
                  id="vendorBusinessNameLabel4">Business Name</label>

                <input class="input inlineInput" type="text" id="VendorBusinessName4" name="VendorBusinessName4" maxlength="60"
                  value="">
              </div>

              <div class="flexible" id="VendorAuthorizedSigningOfficerdiv4">

                <label class="MandentorySign" id="MandentoryLabel1Vendor4"></label><label
                  id="VendorAuthorizedSigningOfficerLabel4">Signing Authority</label>

                <input class="input inlineInput" type="text" id="VendorAuthorizedSigningOfficer4" maxlength="60"
                  name="VendorAuthorizedSigningOfficer4" value="">
              </div>

            </div>

            <div class="flexibleContainer" id="VendorFisrtNameLastName4">

              <div class="flexible" id="VendorFirstNamediv4">

                <label class="MandentorySign" id="MandentoryLabel2Vendor4"></label><label
                  id="VendorfirstnameLabel4">First Name</label>

                <input class="input inlineInput" type="text" id="VendorFirstName4" name="VendorFirstName4" maxlength="45">

              </div>

              <div class="flexible" id="VendorLastNamediv4">

                <label class="MandentorySign" id="MandentoryLabel3Vendor4"></label><label id="VendorlastnameLabel4">Last
                  Name</label>

                <input class="input inlineInput" type="text" id="VendorLastName4" name="VendorLastName4" maxlength="45">
              </div>

            </div>

            <!--***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

            <div class="vendorAddress" id="">

              <div class="NewSectionCopy">

                <label class="container"><input class="inlineInput"
                    onclick="CopyAddress('VendorUnit4','VendorStreetNumber4','VendorStreetName4','VendorProvince4','VendorPostalCode4','VendorCity4');"
                    type="checkbox" id="CopyAddress4" name="CopyAddress4"><span class="checkmark"
                    style="top: 16px; left: 8px;"></span></label>

                <label id="CopyPropertyAddress4" class="copyButton NewSectionCopy" style="margin-left: 22px;">Copy
                  Property
                  Address</label>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" id="VendorUnit4" maxlength="10"
                    name="VendorUnit4">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street
                    Number</label> <input class="inlineInput" type="text" id="VendorStreetNumber4" maxlength="10"
                    name="VendorStreetNumber4">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Name</label>
                    <input class="inlineInput" type="text" id="VendorStreetName4" name="VendorStreetName4" maxlength="40">

                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>City</label>
                  <input class="inlineInput" type="text" id="VendorCity4" name="VendorCity4" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="box">

                    <div class="custom-select" id="VendorProvince4Custom"
                      onclick="Display('VendorProvince4', 'Vendor4ProvinceExtra'); ifProvinceOther('VendorProvince4','VendorCountry4');">

                      <select class="inputSelection" id="VendorProvince4" name="VendorProvince4" readonly>

                        <option value="ON">ON</option>

                        <option value="AB">AB</option>

                        <option value="BC">BC</option>

                        <option value="MB">MB</option>

                        <option value="NB">NB</option>

                        <option value="NL">NL</option>

                        <option value="NT">NWT</option>

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

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                    type="text" id="VendorPostalCode4" name="VendorPostalCode4" maxlength="11">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Country</label>

                  <input type="text" class="inlineInput" id="VendorCountry4" name="VendorCountry4" value="Canada" maxlength="20"
                    readonly>
                </div>

              </div>

              <div class="flexibleContainer" style="display: none;" id="Vendor4ProvinceExtra">

                <div class="flexible">
                  <label class="MandentorySign"></label><label>Other province or state</label>

                  <input type="text" class="inlineInput" id="VendorOtherProvince4" name="VendorOtherProvince4" value="" maxlength="20">
                </div>

                <div class="flexibleotherProvince"></div>

              </div>

            </div>
            <!-- address over -->
            <div class="flexibleContainer NewSection">
              <div class="itemFullEmail flexible">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="VendorEmail4" maxlength="50"
                  name="VendorEmail4" value="">
              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="VendorPhone4" name="VendorPhone4" maxlength="14"
                  onkeydown="phoneNumberFormatter(this.id)" >
              </div>

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="VendorExteraContactInformation4"
                    name="VendorExteraContactInformation4">

                    <option value="">
                      Mobile</option>

                    <option value="Mobile">
                      Mobile</option>

                    <option value="International Phone">International Phone</option>

                  </select>

                </div>

                <input class="input inlineInput" type="text" id="VendorExteraContact4" name="VendorExteraContact4" maxlength="32"
                  value="">
              </div>

            </div>

          </div> <!-- Closing Vendor4-->

          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>
        </div><!-- Closing Main Vendors -->



        <div class="FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" id="VendorDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->
              <span class="buttonBack">
                <button id="VendorBackStep" type="button" class="buttonBlue"
                  onclick=" TabsHandleler(event,'PROPERTY DETAILS','tabcontent','tablinks1','PropertyDetailsTab'); ">Back</button>
              </span>
            </span>

            <span class="secondSpan">

            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn2">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_2" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving2">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn2">Save and close</button>

            <span class="savespan" id="savespan2">

              <button class="buttonSaveOne" type="button" id="VendorSave" name="VendorSave" >Save</button>
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving2', 'Deletebtn2', 'Savebtn2', 'savespan2', 'Deletebtn1_2', 1, event)" type="button">&nbsp;</button>

            </span>
            <span>
              <button class="buttonBlue" id="VendorNextStep" type="button" onclick="VendorsStep();">Next</button>
            </span>
              

            </span>

          </div>

        </div>



      </div><!-- closing Vendor -->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>



      <div id="VendorLawyer" class="tabcontent2">

        <div id="MainVendorLawyerSection">

          <div id="VendorLawerDetails">

            <p id="VendorLawerEmptyError" class="ErrorEmpty" style="display:none;">Complete all required fields
              before proceeding.</p>


            <div class="flexibleContainer">

              <div class="flexible itemLongerLawFirm">

                <label class="MandentorySign"></label><label>Law
                  Firm</label>

                <input class="input inlineInput" maxlength="80" list="VendorLawyerFirmList" id="VendorLawyerFirm" name="VendorLawyerFirm" />

                <datalist id="VendorLawyerFirmList" name="VendorLawyerFirmList">

                </datalist>

              </div>


              <script>
                
              </script>

              <div class="flexible ">

                <label class="MandentorySign"></label><label id="VendorLawyerNameLabel">Lawyer</label>

                <input class="input inlineInput" maxlength="60"
                  list="VendorLawyerNameList" id="VendorLawyerName" name="VendorLawyerName" />

                <datalist id="VendorLawyerNameList" name="VendorLawyerNameList">

                </datalist>
                <!-- 
                <input class="input inlineInput" type="text" id="VendorLawyerName" name="VendorLawyerName" value=""> -->

              </div>

            </div>

            <!-- <div id="NoContactNotification" class="Notification NewSectionSmall" style="display: block; margin-right: 4px;">

              <label id="OfficeLeadItem11" style="font-weight: bold; margin-top: 6px;">We do not have this contact in the database.</label>
    
              <br>

              <label class="container" style="margin-bottom: -5px;height: 10px;"><input type="checkbox" class="checkbox" id="OfficeLeadAgainstCap" name="OfficeLeadAgainstCap" value="yes" checked=""><span class="checkmark" style=" top: -8px;"></span></label>

              <label class="" style="margin-top: 10px; margin-left: 15px;">Add to Contacts</label>

              


    
              </div> -->

            <!-- Address from old fields, need to be updated -->

            <div class="vendorLawyerAddress NewSection" id="">

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label>

                  <input class="inlineInput" type="text" id="VendorLawyerUnit" name="VendorLawyerUnit" maxlength="10">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Number</label>
                    <input class="inlineInput" type="text" id="VendorLawyerStreetNumber" maxlength="10"
                    name="VendorLawyerStreetNumber">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Name</label>
                  <input class="inlineInput" type="text" id="VendorLawyerStreetName" maxlength="40"
                    name="VendorLawyerStreetName">

                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>City</label>
                  <input class="inlineInput" type="text" id="VendorLawyerCity" name="VendorLawyerCity" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="box">
                    <div class="custom-select">

                      <select class="inputSelection" id="VendorLawyerProvince" name="VendorLawyerProvince">

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

                      </select>

                    </div>

                  </div>

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput" onblur="postalCorrect(this.id)"
                    type="text" id="VendorLawyerPostalCode" name="VendorLawyerPostalCode" maxlength="11">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>

              </div>
            </div>

            <!-- End of address -->
            <div class="flexibleContainer NewSection">
              <div class="itemFullEmail flexible">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="VendorLawyerEmail" maxlength="50"
                  name="VendorLawyerEmail" value="">
              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="VendorLawyerPhone" name="VendorLawyerPhone" value="" maxlength="14"
                  onkeydown="phoneNumberFormatter(this.id)" >
              </div>

              <!-- New fieild with selector -->

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="VendorLawyerExteraContactInformation"
                    name="VendorLawyerExteraContactInformation">

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Mobile">Mobile</option>

                    <option value="Fax">Fax</option>

                  </select>
                </div>

                <input class="input inlineInput" type="text" id="VendorLawyerExteraContact" maxlength="32"
                  name="VendorLawyerExteraContact" value="">
              </div>

            </div>

            <div class="items" style="display:none">

              <label>Fax</label>

              <input class="input inlineInput" type="text" id="VendorLawyerFax" name="VendorLawyerFax" value="fax">
            </div>

            <div class="items" style="display:none">

              <label class="MandentorySign"></label><label>Address</label>

              <input class="input inlineInput" type="text" id="VendorLawyerAddress" name="VendorLawyerAddress"
                value="address">
            </div>

            <div style="width:100%; display:block;" class="items">

              <label class="container" style="left: -10px"><input type="checkbox" onclick="clerk();" class="checkbox"
                  id="AddClerckInformation"><span class="checkmark" style="left: 10px;"></span></label>
              <label style="display:inline !important; margin-left: 16px;">Add law clerk's contact

            </div>

            <div id="ClerkInformation" style="display:none">

              <div class="flexibleContainer NewSection">

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

          </div>
          <!--Closing VendorLawerDetails -->

        </div><!-- Closing MainVendorLawyerSection -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" id="VendorLawyerDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->
              <span class="buttonBack">
                <button id="VendorLawyerBack" type="button" class="buttonBlue"
                  onclick="TabsHandleler(event,'Vendors','tabcontent2','tablinks2','MyVendor'); topbuttonsBack(1);">Back</button>
              </span>
            </span>

            <span class="secondSpan">

              <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn10">Delete</button>
              <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_10" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving10">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn10">Save and close</button>

            <span class="savespan" id="savespan10">

              <button class="buttonSaveOne" type="button" id="VendorLawyerSave"  name="VendorLawyerSave" >Save</button>
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving10', 'Deletebtn10', 'Savebtn10', 'savespan10', 'Deletebtn1_10',event)" type="button">&nbsp;</button>

            </span>

              <button class="buttonBlue" id="VendorLawyerNext" type="button" onclick="VendorLawyerStep();">Next</button>

            </span>

          </div>
        </div>

      </div><!-- Closing Vendor's Lawyer -->

      <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="Purchasers" class="tabcontent2">

        <span class="floatDataRightSide">

          <div id="MainPurchasers">

            <p id="PurchaserEmptyError" class="ErrorEmpty" style="display:none;">Complete all required fields
              before proceeding.</p>

            <div id="puchaser1" class="mainForVendors">

              <div class="flexibleContainer NewSectionSmall">

                <div class="itemFull flexible">

                  <label class="MandentorySign"></label><label>Type</label>

                  <div id="PurchaserType1Custom" class="custom-select" onclick=" PatiesType('PurchaserType1', 'PurchaserBusinessinquiries1', 'PurchaserFisrtNameLastName1');">


                    <select class="inputSelection" id="PurchaserType1" name="PurchaserType1">

                      <option value="">-- Please choose an option -- </option>

                      <option value="Individual">Individual</option>

                      <option value="Corporation"> Corporation</option>

                      <option value="Partnership"> Partnership</option>

                      <option value="Trust">Trust </option>

                    </select>

                  </div>

                </div>

                <div class="flexible">
                  <span id='poaP1' class='attrn'>
                    <label class="NoMandatoryTwo">Power of Attorney</label>

                    <input class="input inlineInput" type="text" id="poaPurchaser1" maxlength="45" name="poaPurchaser1" value="">
                  </span>
                </div>

              </div>


              <!--***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="flexibleContainer" style="display:none" id="PurchaserBusinessinquiries1">

                <div class="flexible">

                  <label class="MandentorySign" id="MandentoryLabel4Purchaser1"></label><label
                    id="PurchaserBusinessNameLabel1">Business Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserBusinessName1" name="PurchaserBusinessName1" maxlength="60"
                    value="">
                </div>

                <div class="flexible " id="Section1Purchaser1">

                  <label class="MandentorySign" id="MandentoryLabel1Purchaser1"></label><label
                    id="PurchaserAuthorizedSigningOfficerLabel1">Signing Authority</label>

                  <input class="input inlineInput" type="text" id="PurchaserAuthorizedSigningOfficer1" maxlength="60"
                    name="PurchaserAuthorizedSigningOfficer1" value="">
                </div>

              </div>

              <div class="flexibleContainer" id="PurchaserFisrtNameLastName1">

                <div class="flexible" id="Section2Purchaser1">

                  <label class="MandentorySign" id="MandentoryLabel2Purchaser1"></label><label
                    id="PurchaserfirstnameLabel1">First Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserFirstName1" name="PurchaserFirstName1" maxlength="45"
                    value="">
                </div>

                <div class="flexible" id="Section3Purchaser1">

                  <label class="MandentorySign" id="MandentoryLabel3Purchaser1"></label><label
                    id="PurchaserlastnameLabel1">Last Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserLastName1" name="PurchaserLastName1" maxlength="45"
                    value="">
                </div>

              </div>

              <!--***************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="vendorAddress NewSection" id="">

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="NoMandatoryTwo">Unit</label>
                    <input class="inlineInput" type="text" id="PurchaserUnit1" name="PurchaserUnit1" value="" maxlength="10">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street Number</label>
                    <input class="inlineInput" type="text" id="PurchaserStreetNumber1" maxlength="10"
                      name="PurchaserStreetNumber1" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street Name</label>
                      <input class="inlineInput" type="text" id="purchaserStreetName1" maxlength="40"
                      name="purchaserStreetName1" value="">

                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="MandentorySign MandatoryCity"></label><label>City</label>
                    <input class="inlineInput" type="text" id="PurchaserCity1" name="PurchaserCity1" value="" maxlength="30">

                  </div>

                  <div class="flexible itemLongProvince">

                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="box">
                      <div class="custom-select" id="PurchaserProvince1Custom"
                        onclick="Display('PurchaserProvince1', 'Purchaser1ProvinceExtra'); ifProvinceOther('PurchaserProvince1','PurchaserCountry1');">

                        <select class="inputSelection" id="PurchaserProvince1" name="PurchaserProvince1" readonly>

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

                    <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                      type="text" id="PurchaserPostalCode1" name="PurchaserPostalCode1" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->

                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input type="text" class="inlineInput" id="PurchaserCountry1" name="PurchaserCountry1" maxlength="20"
                      value="Canada" readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Purchaser1ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="PurchaserOtherProvince1" name="PurchaserOtherProvince1"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <!-- End of address -->
              <div class="flexibleContainer NewSection">
                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PurchaserEmail1" maxlength="50"
                    name="PurchaserEmail1" value="">
                </div>
              </div>

              <div class="flexibleContainer">
                <div class="flexible itemLongerPhone">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="PurchaserPhone1" name="PurchaserPhone1" value="" maxlength="14"
                    onkeydown="phoneNumberFormatter(this.id)" >

                </div>

                <!-- <div class="itemsSpecial" style="display: none">

                  <label class="MandentorySign"></label><label>Address</label>

                  <input class="input inlineInput" type="text" id="PurchaserAddres1" name="PurchaserAddres1" value="">
                </div> -->

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="PurchaserExteraContactInformation1"
                      name="PurchaserExteraContactInformation1">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone</option>

                    </select>

                  </div>

                  <input class="input inlineInput" type="text" id="PurchaserExteraContact1" maxlength="32"
                    name="PurchaserExteraContact1" value="">
                </div>

              </div>





            </div>


            <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

            <div class="mainForVendors NewSection" style="display:none;" id="puchaser2">

              <span>
                <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

                <span class="tooltip floatDataRightSide">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick=" RemoveOneParty('puchaser2','puchaser3','puchaser4','AddMorePuchaser');"
                    style="display: inline;" loading="lazy">
                  <span class="tooltiptext">Remove Party</span>

                </span>

                <hr style="margin-right: 4px;">

              </span>

              <div class="flexibleContainer NewSectionSmall">

                <div class="itemFull flexible">

                  <label class="MandentorySign"></label><label>Type</label>

                  <div id="PurchaserType2Custom" class="custom-select" onclick="PatiesType('PurchaserType2', 'PurchaserBusinessinquiries2', 'PurchaserFisrtNameLastName2');">


                    <select class="inputSelection" id="PurchaserType2" name="PurchaserType2">

                      <option value="">-- Please choose an option -- </option>

                      <option value="Individual">Individual</option>

                      <option value="Corporation"> Corporation</option>

                      <option value="Partnership"> Partnership</option>

                      <option value="Trust">Trust </option>

                    </select>

                  </div>
                </div>

                <div class="flexible">
                  <span id='poaP2' class='attrn'>
                    <label class="NoMandatoryTwo">Power of Attorney</label>

                    <input class="input inlineInput" type="text" id="poaPurchaser2" maxlength="45" name="poaPurchaser2" value="">
                  </span>
                </div>

              </div>

              <!--****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="flexibleContainer" style="display:none" id="PurchaserBusinessinquiries2">

                <div class="flexible">

                  <label class="MandentorySign" id="MandentoryLabel4Purchaser2"></label><label
                    id="PurchaserBusinessNameLabel2">Business Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserBusinessName2" name="PurchaserBusinessName2" maxlength="60"
                    value="">

                </div>

                <div class="flexible" id="Section1Purchaser2">

                  <label class="MandentorySign" id="MandentoryLabel1Purchaser2"></label><label
                    id="PurchaserAuthorizedSigningOfficerLabel2">Signing Authority</label>

                  <input class="input inlineInput" type="text" id="PurchaserAuthorizedSigningOfficer2" maxlength="60"
                    name="PurchaserAuthorizedSigningOfficer2" value="">
                </div>

              </div>

              <div class="flexibleContainer" id="PurchaserFisrtNameLastName2">

                <div class="flexible" id="Section2Purchaser2">

                  <label class="MandentorySign" id="MandentoryLabel2Purchaser2"></label><label
                    id="PurchaserfirstnameLabel2">First Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserFirstName2" name="PurchaserFirstName2" maxlength="45"
                    value="">

                </div>

                <div class="flexible" id="Section3Purchaser2">

                  <label class="MandentorySign" id="MandentoryLabel3Purchaser2"></label><label
                    id="PurchaserlastnameLabel2">Last Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserLastName2" name="PurchaserLastName2" maxlength="45"
                    value="">

                </div>

              </div>

              <!--*****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="vendorAddress NewSection" id="">

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" maxlength="10"
                      id="PurchaserUnit2" name="PurchaserUnit2" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Number</label> <input class="inlineInput" type="text" id="PurchaserStreetNumber2" maxlength="10"
                      name="PurchaserStreetNumber2" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Name</label> <input class="inlineInput" type="text" id="purchaserStreetName2" maxlength="40"
                      name="purchaserStreetName2" value="">

                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="MandentorySign MandatoryCity"></label><label>City</label>
                    <input class="inlineInput" type="text" id="PurchaserCity2" name="PurchaserCity2" value="" maxlength="30">

                  </div>

                  <div class="flexible itemLongProvince">

                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="box">
                      <div class="custom-select" id="PurchaserProvince2Custom"
                        onclick="Display('PurchaserProvince2', 'Purchaser2ProvinceExtra'); ifProvinceOther('PurchaserProvince2','PurchaserCountry2');">

                        <select class="inputSelection" id="PurchaserProvince2" name="PurchaserProvince2" readonly>

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

                    <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                      type="text" id="PurchaserPostalCode2" name="PurchaserPostalCode2" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->

                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input type="text" class="inlineInput" id="PurchaserCountry2" name="PurchaserCountry2" maxlength="20"
                      value="Canada" readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Purchaser2ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="PurchaserOtherProvince2" name="PurchaserOtherProvince2"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <!-- End of address -->
              <div class="flexibleContainer NewSection">

                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PurchaserEmail2" maxlength="50"
                    name="PurchaserEmail2" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemLongerPhone">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="PurchaserPhone2" name="PurchaserPhone2" value="" maxlength="14"
                    onkeydown="phoneNumberFormatter(this.id)" >
                </div>

                <!-- <div class="itemsSpecial" style="display:none">

                  <label class="MandentorySign"></label><label>Address</label>

                  <input class="input inlineInput" type="text" id="PurchaserAddres2" name="PurchaserAddres2" value="">
                </div> -->

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="PurchaserExteraContactInformation2"
                      name="PurchaserExteraContactInformation2">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone</option>

                    </select>

                  </div>

                  <input class="input inlineInput" type="text" id="PurchaserExteraContact2" maxlength="32"
                    name="PurchaserExteraContact2" value="">
                </div>

              </div>





            </div><!-- Closing puchaser2  -->

            <!----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

            <div class="mainForVendors NewSection" style="display:none;" id="puchaser3">

              <span>
                <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

                <span class="tooltip floatDataRightSide">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick=" RemoveOneParty('puchaser3','puchaser2','puchaser4','AddMorePuchaser');"
                    style="display: inline;" loading="lazy">
                  <span class="tooltiptext">Remove Party</span>
                </span>
                <hr style="margin-right: 4px;">

              </span>

              <div class="flexibleContainer NewSectionSmall">

                <div class="itemFull flexible ">

                  <label class="MandentorySign"></label><label>Type</label>

                  <div id="PurchaserType3Custom" class="custom-select" onclick="PatiesType('PurchaserType3', 'PurchaserBusinessinquiries3', 'PurchaserFisrtNameLastName3');">

                    <select class="inputSelection" id="PurchaserType3" name="PurchaserType3">

                      <option value="">-- Please choose an option --</option>

                      <option value="Individual">Individual</option>

                      <option value="Corporation">
                        Corporation</option>

                      <option value="Partnership">
                        Partnership</option>

                      <option value="Trust">Trust
                      </option>

                    </select>

                  </div>

                </div>

                <div class="flexible">
                  <span id='poaP3' class='attrn'>
                    <label class="NoMandatoryTwo">Power of Attorney</label>

                    <input class="input inlineInput" type="text" id="poaPurchaser3" maxlength="45" name="poaPurchaser3" value="">
                  </span>
                </div>
              </div>
              <!--************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="flexibleContainer" id="PurchaserBusinessinquiries3" style="display:none">

                <div class="flexible">

                  <label class="MandentorySign" id="MandentoryLabel4Purchaser3"></label><label
                    id="PurchaserBusinessNameLabel3">Business
                    Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserBusinessName3" name="PurchaserBusinessName3" maxlength="60"
                    value="">
                </div>

                <div class="flexible" id="Section1Purchaser3">

                  <label class="MandentorySign" id="MandentoryLabel1Purchaser3"></label><label
                    id="PurchaserAuthorizedSigningOfficerLabel3" id="PurchaserAuthorizedSigningOfficerLabel3">Signing
                    Authority</label>

                  <input class="input inlineInput" type="text" id="PurchaserAuthorizedSigningOfficer3" maxlength="60"
                    name="PurchaserAuthorizedSigningOfficer3" value="">
                </div>

              </div>

              <div class="flexibleContainer" id="PurchaserFisrtNameLastName3">

                <div class="flexible" id="Section2Purchaser3">

                  <label class="MandentorySign" id="MandentoryLabel2Purchaser3"></label><label
                    id="PurchaserfirstnameLabel3">First Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserFirstName3" name="PurchaserFirstName3" maxlength="45"
                    value="">

                </div>

                <div class="flexible" id="Section3Purchaser3">

                  <label class="MandentorySign" id="MandentoryLabel3Purchaser3"></label><label
                    id="PurchaserlastnameLabel3">Last Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserLastName3" name="PurchaserLastName3" maxlength="45"
                    value="">
                </div>

              </div>
              <!--*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div class="vendorAddress NewSection" id="">

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" maxlength="10"
                      id="PurchaserUnit3" name="PurchaserUnit3" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Number</label> <input class="inlineInput" type="text" id="PurchaserStreetNumber3" maxlength="10"
                      name="PurchaserStreetNumber3" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Name</label> <input class="inlineInput" type="text" id="purchaserStreetName3" maxlength="40"
                      name="purchaserStreetName3" value="">

                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="MandentorySign MandatoryCity"></label><label>City</label>
                    <input class="inlineInput" type="text" id="PurchaserCity3" name="PurchaserCity3" value="" maxlength="30">

                  </div>

                  <div class="flexible itemLongProvince">

                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="box">
                      <div class="custom-select" id="PurchaserProvince3Custom"
                        onclick="Display('PurchaserProvince3', 'Purchaser3ProvinceExtra'); ifProvinceOther('PurchaserProvince3','PurchaserCountry3');">

                        <select class="inputSelection" id="PurchaserProvince3" name="PurchaserProvince3" readonly>

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

                    <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                      type="text" id="PurchaserPostalCode3" name="PurchaserPostalCode3" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->

                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input type="text" class="inlineInput" id="PurchaserCountry3" name="PurchaserCountry3" maxlength="20"
                      value="Canada" readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Purchaser3ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="PurchaserOtherProvince3" name="PurchaserOtherProvince3"
                    value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <!-- End of address -->
              <div class="flexibleContainer NewSection">
                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PurchaserEmail3" maxlength="50"
                    name="PurchaserEmail3" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemLongerPhone">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="PurchaserPhone3" name="PurchaserPhone3" value="" maxlength="14"
                    onkeydown="phoneNumberFormatter(this.id)" >
                </div>

                <!-- <div class="itemsSpecial" style="display:none">

                  <label class="MandentorySign"></label><label>Address</label>

                  <input class="input inlineInput" type="text" id="PurchaserAddres3" name="PurchaserAddres3" value="">
                </div> -->

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="PurchaserExteraContactInformation3"
                      name="PurchaserExteraContactInformation3">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone</option>


                    </select>

                  </div>

                  <input class="input inlineInput" type="text" id="PurchaserExteraContact3" maxlength="32"
                    name="PurchaserExteraContact3" value="">
                </div>

              </div>





            </div><!-- Closing puchaser3 -->

            <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

            <div class="mainForVendors NewSection" style="display:none;" id="puchaser4">

              <span>

                <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Party</label>

                <span class="tooltip floatDataRightSide">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick=" RemoveOneParty('puchaser4','puchaser3','puchaser2','AddMorePuchaser');"
                    style="display: inline;" loading="lazy">
                  <span class="tooltiptext">Remove Party</span>
                </span>
                <hr style="margin-right: 4px;">

              </span>

              <div class="flexibleContainer NewSectionSmall">

                <div class="itemFull flexible">

                  <label class="MandentorySign"></label><label>Type</label>

                  <div id="PurchaserType4Custom" class="custom-select" onclick="PatiesType('PurchaserType4', 'PurchaserBusinessinquiries4', 'PurchaserFisrtNameLastName4');">

                    <select class="inputSelection" id="PurchaserType4" name="PurchaserType4">

                      <option value="">-- Please choose an option --</option>

                      <option value="Individual">Individual</option>

                      <option value="Corporation">
                        Corporation</option>

                      <option value="Partnership">
                        Partnership</option>

                      <option value="Trust">Trust
                      </option>

                    </select>

                  </div>
                </div>

                <div class="flexible">
                  <span id='poaP4' class='attrn'>
                    <label class="NoMandatoryTwo">Power of Attorney</label>

                    <input class="input inlineInput" type="text" id="poaPurchaser4" maxlength="45" name="poaPurchaser4" value="">
                  </span>
                </div>
              </div>

              <!--********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->
              <div class="flexibleContainer" style="display:none" id="PurchaserBusinessinquiries4">

                <div class="flexible">
                  <label class="MandentorySign" id="MandentoryLabel4Purchaser4"></label><label
                    id="PurchaserBusinessNameLabel4">Business Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserBusinessName4" name="PurchaserBusinessName4" maxlength="60"
                    value="">
                </div>

                <div class="flexible" id="Section1Purchaser4">

                  <label class="MandentorySign" id="MandentoryLabel1Purchaser4"></label><label
                    id="PurchaserAuthorizedSigningOfficerLabel4">Signing Authority</label>

                  <input class="input inlineInput" type="text" id="PurchaserAuthorizedSigningOfficer4" maxlength="60"
                    name="PurchaserAuthorizedSigningOfficer4" value="">
                </div>

              </div>

              <div class="flexibleContainer" id="PurchaserFisrtNameLastName4">

                <div class="flexible itemLongerBusinessName" id="Section2Purchaser4">

                  <label class="MandentorySign" id="MandentoryLabel2Purchaser4"></label><label
                    id="PurchaserfirstnameLabel4">First Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserFirstName4" name="PurchaserFirstName4" maxlength="45"
                    value="">
                </div>

                <div class="flexible " id="Section3Purchaser4">

                  <label class="MandentorySign" id="MandentoryLabel3Purchaser4"></label><label
                    id="PurchaserlastnameLabel4">Last Name</label>

                  <input class="input inlineInput" type="text" id="PurchaserLastName4" name="PurchaserLastName4" maxlength="45"
                    value="">
                </div>

              </div>

              <!--****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <input type="text" id="emptyInput" style="display: none;">

              <div class="vendorAddress NewSection" id="">

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" maxlength="10"
                      id="PurchaserUnit4" name="PurchaserUnit4" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Number</label> <input class="inlineInput" type="text" id="PurchaserStreetNumber4" maxlength="10"
                      name="PurchaserStreetNumber4" value="">

                  </div>

                  <div class="flexible ">

                    <label class="MandentorySign"></label><label>Street
                      Name</label> <input class="inlineInput" type="text" id="purchaserStreetName4" maxlength="40"
                      name="purchaserStreetName4" value="">

                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible ">

                    <label class="MandentorySign MandatoryCity"></label><label>City</label>
                    <input class="inlineInput" type="text" id="PurchaserCity4" name="PurchaserCity4" value="" maxlength="30">

                  </div>

                  <div class="flexible itemLongProvince">

                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="box">
                      <div class="custom-select" id="PurchaserProvince4Custom"
                        onclick="Display('PurchaserProvince4', 'Purchaser4ProvinceExtra'); ifProvinceOther('PurchaserProvince4','PurchaserCountry4');">

                        <select class="inputSelection" id="PurchaserProvince4" name="PurchaserProvince4" readonly>

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

                    <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                      type="text" id="PurchaserPostalCode4" name="PurchaserPostalCode4" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->

                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input type="text" class="inlineInput" id="PurchaserCountry4" name="PurchaserCountry4" maxlength="20"
                      value="Canada" readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Purchaser4ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="PurchaserOtherProvince4" name="PurchaserOtherProvince4"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <!-- End of address -->
              <div class="flexibleContainer NewSection">

                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PurchaserEmail4" maxlength="50"
                    name="PurchaserEmail4" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemLongerPhone">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="PurchaserPhone4" name="PurchaserPhone4" value="" maxlength="14"
                    onkeydown="phoneNumberFormatter(this.id)" >
                </div>

                <!-- <div class="itemsSpecial" style="display:none">

                  <label class="MandentorySign"></label><label>Address</label>

                  <input class="input inlineInput" type="text" id="PurchaserAddres4" name="PurchaserAddres4" value="">
                </div> -->

                <div class="flexible itemShortPhone">
                  <div class="custom-select">

                    <select class="inputSelection" id="PurchaserExteraContactInformation4"
                      name="PurchaserExteraContactInformation4">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone
                      </option>

                    </select>

                  </div>

                  <input class="input inlineInput" type="text" id="PurchaserExteraContact4" maxlength="32"
                    name="PurchaserExteraContact4" value="">
                </div>

              </div>

            </div><!-- Closing puchaser4 -->

          </div><!-- Closing MainPurchasers -->

          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div class="Footer FooterButton">

            <div class="FooterButtonSpan">

              <span class="buttonDiscard floatDataLefttSide">

                <!-- <button style="display: none;" id="PurchaserDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->

                <span class="buttonBack">

                  <button type="button" class="buttonBlue"
                    onclick="TabsHandleler(event,'VendorLawyer','tabcontent2','tablinks2','MyVendorLawyer'); topbuttonsBack(4);"
                    id="Purchaserback1">Back</button>
                </span>

                <span class="buttonBack" style="margin-left: 0px;">

                  <button type="button" style="display:none;" class="buttonBlue"
                    onclick="TabsHandleler(event,'Vendors','tabcontent2','tablinks2','MyVendor'); topbuttonsBack(1);"
                    id="Purchaserback2">Back</button>
                </span>

              </span>

              <span class="secondSpan">

              <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn11">Delete</button>
              <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_11" >Discard</button>
              <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving11">Exit without saving</button>
              <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn11">Save and close</button>
  
              <span class="savespan" id="savespan11">
  
                <button class="buttonSaveOne" type="button" id="PurchaserSave"  name="PurchaserSave" >Save</button>
                
                <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving11', 'Deletebtn11', 'Savebtn11', 'savespan11', 'Deletebtn1_11', 1, event)" type="button">&nbsp;</button>
  
              </span>

                <button class="buttonBlue" id="PurchaserNext" type="button"
                  onclick="PurchaserStep();  SetDeposits('DepositReceivedFrom1');SetDeposits('DepositRecivedFrom2');SetDeposits('DepositRecivedFrom3');SetDeposits('DepositReceivedFrom4');">Next</button>
              </span>
            </div>
          </div>

      </div><!-- Closing Purchaser -->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>


      <div id="PurchaserLawyer" class="tabcontent2">

        <div id="MainPurchaserLawyer" class="mainForVendors">

          <!-- <label>Purchaser's Lawyer</label> -->

          <!-- <hr> -->

          <div id="PurchaserLawyerDetailInformation">

            <div class="flexibleContainer">

              <div class="flexible itemLongerBusinessName">

                <label  class="NoMandatoryTwo">Law Firm</label>

                <input class="input inlineInput" maxlength="80"
                  list="PurchaserLawyerFirmList" id="PurchaserLawyerFirm" name="PurchaserLawyerFirm" />

                <datalist id="PurchaserLawyerFirmList" name="PurchaserLawyerFirmList">

                </datalist>

              </div>

              <script>
                
              </script>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Lawyer</label>

                <input class="input inlineInput" maxlength="60"
                  list="PurchaserLawyerNameList" id="PurchaserLawyerName" name="PurchaserLawyerName" />

                <datalist id="PurchaserLawyerNameList" name="PurchaserLawyerNameList">

                </datalist>

                <!-- <input class="input inlineInput" type="text" id="PurchaserLawyerName" name="PurchaserLawyerName"
                  value=""> -->

              </div>

            </div>

            <!-- <div id="NoContactNotification" class="Notification NewSectionSmall" style="display: block; margin-right: 4px;">

              <label id="OfficeLeadItem11" style="font-weight: bold; margin-top: 6px;">We do not have this contact in the database.</label>
    
              <br>

              <label class="container" style="margin-bottom: -5px;height: 10px;"><input type="checkbox" class="checkbox" id="OfficeLeadAgainstCap" name="OfficeLeadAgainstCap" value="yes" checked=""><span class="checkmark" style=" top: -8px;"></span></label>

              <label class="" style="margin-top: 10px; margin-left: 15px;">Add to Contacts</label>

            </div> -->

            <!-- Address from old fields, need to be updated -->

            <div class="vendorAddress NewSection" id="">

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label>

                  <input class="inlineInput" type="text" id="PurchaserLawyerUnit" name="PurchaserLawyerUnit" value="" maxlength="10">

                </div>

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Street Number</label>

                  <input class="inlineInput" type="text" id="PurchaserLawyerStreetNumber" maxlength="10"
                    name="PurchaserLawyerStreetNumber" value="">

                </div>

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Street Name</label>

                  <input class="inlineInput" type="text" id="PurchaserLawyerStreetName" name="PurchaserLawyerStreetName" maxlength="40"
                    value="">

                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">City</label>

                  <input class="inlineInput" type="text" id="PurchaserLawyerCity" name="PurchaserLawyerCity" value="" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="NoMandatoryTwo">Province</label>

                  <div class="box">
                    <div class="custom-select">

                      <select class="inputSelection" id="PurchaserLawyerProvince" name="PurchaserLawyerProvince">

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

                      </select>

                    </div>

                  </div>

                </div>

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Postal Code</label>

                  <input class="inlineInput" type="text" id="PurchaserLawyerPostalCode" name="PurchaserLawyerPostalCode" onblur="postalCorrect(this.id)" maxlength="11"
                    value="">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>

              </div>

            </div>

            <!-- End of address -->

            <div class="flexibleContainer NewSection">

              <div class="itemFullEmail flexible">

                <label class="NoMandatoryTwo">Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PurchaserLawyerEmail" maxlength="50"
                  name="PurchaserLawyerEmail" value="">

              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="NoMandatoryTwo">Phone</label>

                <input class="input inlineInput" type="text" id="PurchaserLawyerPhone" name="PurchaserLawyerPhone" maxlength="14"
                  value="" onkeydown="phoneNumberFormatter(this.id)" >
              </div>

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="PurchaserLawyerExteraContactInformation"
                    name="PurchaserLawyerExteraContactInformation">

                    <option value="Mobile">Mobile</option>

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Fax">Fax
                    </option>

                  </select>

                </div>

                <input class="input inlineInput" type="text" id="PurchaserLawyerExteraContact" maxlength="32"
                  name="PurchaserLawyerExteraContact" value="">
              </div>

            </div>

            <!-- <div class="items" style="display:none">

              <label>Address</label>

              <input class="input inlineInput" type="text" id="PurchaserLawyerAddress" name="PurchaserLawyerAddress"
                value="">
            </div>

            <div class="items" style="display:none">

              <label>Fax</label>

              <input class="input inlineInput" type="text" id="PurchaserLawyerFax" name="PurchaserLawyerFax" value="">
            </div> -->

          </div>
          <!-- Closing Purchaser's LawyerDetail Information  -->

        </div><!-- Closing MainPurchaserLawyer -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span id="PurchaserLawyernext1" class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" id="PurchaserLawyerDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->
              <span class="buttonBack">
                <button id="PurchaserLawyerBack" type="button" class="buttonBlue"
                  onclick="TabsHandleler(event,'Purchasers','tabcontent2','tablinks2','MyPurchaser');topbuttonsBack(2);">Back</button>
              </span>
            </span>

            <span class="secondSpan">

              
              <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn16">Delete</button>
              <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_16" >Discard</button>
              <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving16">Exit without saving</button>
              <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn16">Save and close</button>
  
              <span class="savespan" id="savespan16">   
  
                <button class="buttonSaveOne" type="button" id="PurchaserLawyerSave" name="PurchaserLawyerSave" >Save</button>
                
                <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving16', 'Deletebtn16', 'Savebtn16', 'savespan16', 'Deletebtn1_16', 1, event)" type="button">&nbsp;</button>
  
              </span>

              <button class="buttonBlue" type="button" id="PurchaserLawyerNext"
                onclick="PuchaserLawyerStep();">Next</button>

            </span>

          </div>
        </div>

      </div><!-- Closing Purchaser Lawyer-->

      <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="Deposits" class="tabcontent2">


        <div id="MainDeposit">

          <div class="mainForVendors" id="Deposit1">

            <p id="DepositsEmptyError" class="ErrorEmpty" style="display:none;">Complete all required fields
              before proceeding.</p>

            <p id="Help6" style="display:none;">Note that cash will trigger AML (Anti Money Laundering) reporting</p>

            <div class="itemFullDeposit flexibleContainer NewSectionSmall">

              <div class="flexible">

                <label class="MandentorySign" style="display:none;"></label>

                <label class="NoMandatoryTwo">Type</label>

                <div class="custom-select">

                  <select class="inputSelection" id="DepositType1" name="DepositType1">

                    <option value=""> -- Option --
                    </option>

                    <option value="ETF">ETF
                    </option>

                    <option value="Cheque">Cheque
                    </option>

                    <option value="Cash">Cash
                    </option>

                  </select>

                </div>

              </div>

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>
                <label class="NoMandatoryTwo">Amount</label><br>

                <span class="shortValue inlineInput" style="float: left;">
                  <label>$</label>
                  <input class="inlineInput" maxlength="15"
                    style="float: right; width: 80%; border-width: 0px; text-align: right; height: 22px; background: none;"
                    min="0" placeholder='0.00' type="number" step="0.01" onblur="limiting(this)" id="DepositAmount1"
                    name="DepositAmount1" placeholder="0.00">
                </span>
              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Date</label>

                <div class="input-group">
                  <input id="DepositDate1" name="DepositDate1" type="text" class="form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="DepositDate1" id="DepositDateLabel1">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                </div>

              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Reference</label>

                <input class="input inlineInput" type="text" id="DepositRef1" name="DepositRef1" value="" maxlength="20">

              </div>

            </div>

            <div class="flexibleContainer NewSectionMedium" id="DepositExtra1">
              <div class="flexible">
                  <label class="NoMandatoryTwo">FINTRAC explanation</label>
                  <textarea class="inlineInput" style='resize: none;height: 40px;' type="text" id="fintrac1" name="fintrac1"></textarea>
              </div>
            </div>

            <div class="flexibleContainer NewSectionMedium">

              <div class="flexible">

                <label class="NoMandatoryTwo">Received From</label>

                <div class="custom-select" onclick="ControlDeposit1()">

                  <select class="inputSelection depositList" id="DepositReceivedFrom1" name="DepositReceivedFrom1">

                    <option value="">-- Please choose an option --</option>

                  </select>

                </div>

              </div>

              <div id="DepositUnderSection1" class="flexible" style="display: none;">

                <label class="NoMandatoryTwo">Relationship</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromRelationship1" maxlength="30"
                  name="DepositRecivedFromRelationship1" value="">
              </div>

              <div class="flexible" id="DepositUnderSectionSup1"></div>

            </div>

            <div id="DepositSection1" style="display: none;">

              <div class="flexibleContainer">

                <div class="flexible">

                  <label class="MandentorySign"></label><label>First
                    Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromFirstName1" maxlength="45"
                    name="DepositRecivedFromFirstName1" value="">

                </div>

                <div class="flexible itemHalf">

                  <label class="MandentorySign"></label><label>Last Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromLastName1" maxlength="45"
                    name="DepositRecivedFromLastName1" value="">
                </div>

              </div>

              <div name="address" class="NewSectionMedium">

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="NoMandatoryTwo">Unit</label>

                    <input class="inlineInput" type="text" id="DepositUnitNumber1" name="DepositUnitNumber1" value="" maxlength="10">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Number</label>

                    <input class="inlineInput" type="text" id="DepositStreetNumber1" name="DepositStreetNumber1" maxlength="10"
                      value="">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street
                      Name</label>

                    <input class="inlineInput" type="text" id="DepositStreetName1" name="DepositStreetName1" value="" maxlength="40">
                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>City</label>

                    <input class="inlineInput" type="text" id="DepositCity1" name="DepositCity1" value="" maxlength="30">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="custom-select" id="DepositProvince1Custom"
                      onclick="Display('DepositProvince1', 'Deposit1ProvinceExtra'); ifProvinceOther('DepositProvince1','DepositCountry1');">

                      <select id="DepositProvince1" name="DepositProvince1" readonly>

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

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Postal Code</label>

                    <input class="inlineInput" type="text" id="DepositPostalCode1" name="DepositPostalCode1" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input class="inlineInput" type="text" id="DepositCountry1" name="DepositCountry1" value="Canada" maxlength="20"
                      readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Deposit1ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="OtherDepositProvince1" name="OtherDepositProvince1"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <div class="flexibleContainer NewSection">

                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="DepositRecivedEmail1" maxlength="50"
                    name="DepositRecivedEmail1" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemHalf itemHalfOne">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromPhone1" maxlength="14"
                    name="DepositRecivedFromPhone1" value="" onkeydown="phoneNumberFormatter(this.id)"
                    >

                </div>

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="DepositRecivedExteraContactLabel1"
                      name="DepositRecivedExteraContactLabel1">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone</option>
                    </select>
                  </div>

                  <input class="input inlineInput" type="text" id="DepositRecivedExteraContactNumber1" maxlength="32"
                    name="DepositRecivedExteraContactNumber1" value="">
                </div>

              </div>

              <!-- <div class="itemsSpecial" style="display:none">

                <label>Work</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromPWork1"
                  name="DepositRecivedFromWork1" value="">
              </div> -->


            </div>

            <div class="flexibleContainer">

              <div class="flexible">

                <label style="border-width: 1px; height: 40px;" for="DepositDepositReceipt1"
                  class="custom-file-upload inlineInput">
                  <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"><label class="UploadDocumentLabel">Upload
                    Document</label>
                </label>

                <input class="inlineInput" type="file" id="DepositDepositReceipt1Before" name="DepositDepositReceipt1Before" multiple="true">

              </div>

              <div class="flexible">
                <label id="deposit1Document" class="documentDone" style="display: none;"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
              </div>

            </div>

          </div><!-- Closing Deposit1 -->

          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

          <div style="display:none;" id="Deposit2" class="NewSection">

            <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Deposit</label>

            <span class="tooltip floatDataRightSide">
              <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                onclick=" RemoveOneParty('Deposit2','Deposit3','Deposit4','AddMoreDeposits');" style="display: inline;"
                id="RemoveOneDeposit" name="RemoveOneDeposit" loading="lazy">
              <span class="tooltiptext">Remove Deposit</span>
            </span>

            <hr style="margin-right: 4px;">

            <div class="itemFullDeposit flexibleContainer NewSectionSmall">

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>

                <label class="NoMandatoryTwo">Type</label>

                <div class="custom-select">

                  <select class="inputSelection" id="DepositType2" name="DepositType2">

                    <option value=""> -- Option --
                    </option>

                    <option value="ETF">ETF
                    </option>

                    <option value="Cheque">Cheque
                    </option>

                    <option value="Cash">Cash
                    </option>

                  </select>

                </div>
              </div>

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>
                <label class="NoMandatoryTwo">Amount</label><br>

                <span class="shortValue inlineInput" style="float: left">
                  <label>$</label>
                  <input class="inlineInput" maxlength="15"
                    style="float: right; width: 80%; border-width: 0px; text-align: right; height: 22px; background: none;"
                    type="number" step="0.01" min="0" placeholder='0.00' onblur="limiting(this)" id="DepositAmount2"
                    name="DepositAmount2" placeholder="0.00">

                </span>
              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Date</label>

                <div class="input-group">
                  <input id="DepositDate2" name="DepositDate2" type="text" class="  form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="DepositDate2" id="DepositDateLabel2">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                </div>

              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Reference</label>

                <input class="input inlineInput" type="text" id="DepositRef2" name="DepositRef2" value="" maxlength="20">
              </div>

            </div>

            <div class="flexibleContainer NewSectionMedium" id="DepositExtra2">
              <div class="flexible">
                  <label class="NoMandatoryTwo">FINTRAC explanation</label>
                  <textarea class="inlineInput" style='resize: none;height: 40px;' type="text" id="fintrac2" name="fintrac2"></textarea>
              </div>
            </div>

            <div class="flexibleContainer NewSectionMedium">

              <div class="flexible">

                <label class="NoMandatoryTwo">Received from</label>

                <div class="custom-select" onclick="ControlDeposit2()">

                  <select class="inputSelection depositList" id="DepositRecivedFrom2" name="DepositRecivedFrom2">

                    <option value=""> -- Option --
                    </option>

                  </select>

                </div>

              </div>

              <div id="DepositUnderSection2" class="flexible" style="display: none;">

                <label class="NoMandatoryTwo">Relationship</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromRelationship2" maxlength="30"
                  name="DepositRecivedFromRelationship2" value="">
              </div>

              <div class="flexible" id="DepositUnderSectionSup2"></div>
            </div>

            <div id="DepositSection2" style="display: none;">

              <div class="flexibleContainer">

                <div class="flexible">

                  <label class="MandentorySign"></label><label>First
                    Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromFirstName2" maxlength="45"
                    name="DepositRecivedFromFirstName2" value="">

                </div>

                <div class="flexible itemHalf">

                  <label class="MandentorySign"></label><label>Last Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromLastName2" maxlength="45"
                    name="DepositRecivedFromLastName2" value="">
                </div>

              </div>

              <div name="address" class="NewSectionMedium">

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="NoMandatoryTwo">Unit</label>

                    <input class="inlineInput" type="text" id="DepositUnitNumber2" name="DepositUnitNumber2" value="" maxlength="10">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Number</label>

                    <input class="inlineInput" type="text" id="DepositStreetNumber2" name="DepositStreetNumber2" maxlength="10"
                      value="">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Name</label>

                    <input class="inlineInput" type="text" id="DepositStreetName2" name="DepositStreetName2" value="" maxlength="40">
                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>City</label>

                    <input class="inlineInput" type="text" id="DepositCity2" name="DepositCity2" value="" maxlength="30">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="custom-select" id="DepositProvince2Custom"
                      onclick=" Display('DepositProvince2', 'Deposit2ProvinceExtra'); ifProvinceOther('DepositProvince2','DepositCountry2');">

                      <select id="DepositProvince2" name="DepositProvince2" readonly>

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

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Postal Code</label>

                    <input class="inlineInput" type="text" id="DepositPostalCode2" name="DepositPostalCode2" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input class="inlineInput" type="text" id="DepositCountry2" name="DepositCountry2" value="Canada" maxlength="20"
                      readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Deposit2ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="OtherDepositProvince2" name="OtherDepositProvince2"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <div class="flexibleContainer NewSection">

                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="DepositRecivedEmail2" maxlength="50"
                    name="DepositRecivedEmail2" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemHalf itemHalfOne">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromPhone2" maxlength="14"
                    name="DepositRecivedFromPhone2" value="" onkeydown="phoneNumberFormatter(this.id)"
                    >

                </div>

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="DepositRecivedExteraContactLabel2"
                      name="DepositRecivedExteraContactLabel2">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone
                      </option>
                    </select>
                  </div>

                  <input class="input inlineInput" type="text" id="DepositRecivedExteraContactNumber2" maxlength="32"
                    name="DepositRecivedExteraContactNumber2" value="">
                </div>

              </div>

              <!-- <div class="itemsSpecial" style="display:none">

                <label>Work</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromWork2"
                  name="DepositRecivedFromWork2" value="">
              </div> -->

            </div>

            <div class="flexibleContainer">

              <div class="flexible">

                <label style="border-width: 1px; height: 40px;" for="DepositDepositReceipt2"
                  class="custom-file-upload inlineInput">
                  <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"><label class="UploadDocumentLabel">Upload
                    Document</label>
                </label>

                <input class="inlineInput" type="file" id="DepositDepositReceipt2Before" name="DepositDepositReceipt2Before" multiple="true">

              </div>

              <div class="flexible">
                <label id="deposit2Document" class="documentDone" style="display: none;"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
              </div>

            </div>

          </div><!-- Closing Deposit2 -->

          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div style="display:none;" id="Deposit3" class="NewSection">

            <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Deposit</label>

            <span class="tooltip floatDataRightSide">
              <img src="../ImagesUsed/Subtract.png" class="lineButtonMinus manageListButton" alt="-" type="button"
                onclick=" RemoveOneParty('Deposit3','Deposit3','Deposit2','AddMoreDeposits');" style="display: inline;"
                id="RemoveOneDeposit" name="RemoveOneDeposit" loading="lazy">
              <span class="tooltiptext">Remove Deposit</span>
            </span>

            <hr style="margin-right: 4px;">

            <div class="itemFullDeposit flexibleContainer NewSectionSmall">

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>

                <label class="NoMandatoryTwo">Type</label>

                <div class="custom-select">

                  <select class="inputSelection" id="DepositType3" name="DepositType3">

                    <option value=""> -- Option --
                    </option>

                    <option value="ETF">ETF
                    </option>

                    <option value="Cheque">Cheque
                    </option>

                    <option value="Cash">Cash
                    </option>

                  </select>

                </div>

              </div>

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>
                <label class="NoMandatoryTwo">Amount</label><br>

                <span class="shortValue inlineInput" style="float: left">
                  <label>$</label>
                  <input class="inlineInput" maxlength="15"
                    style="float: right; width: 80%; border-width: 0px; text-align: right; height: 22px; background: none;"
                    type="number" step="0.01" min="0" placeholder='0.00' onblur="limiting(this)" id="DepositAmount3"
                    name="DepositAmount3" placeholder="0.00">

                </span>
              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Date</label>

                <div class="input-group">
                  <input id="DepositDate3" name="DepositDate3" type="text" class="  form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="DepositDate3" id="DepositDateLabel3">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                </div>

              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Reference</label>

                <input class="input inlineInput" type="text" id="DepositRef3" name="DepositRef3" value="" maxlength="20">
              </div>

            </div>

            <div class="flexibleContainer NewSectionMedium" id="DepositExtra3">
              <div class="flexible">
                  <label class="NoMandatoryTwo">FINTRAC explanation</label>
                  <textarea class="inlineInput" style='resize: none;height: 40px;' type="text" id="fintrac3" name="fintrac3"></textarea>
              </div>
            </div>

            <div class="flexibleContainer NewSectionMedium">
              <div class="flexible">

                <label class="NoMandatoryTwo">Received from</label>

                <div class="custom-select" onclick="ControlDeposit3()">

                  <select class="inputSelection depositList" id="DepositRecivedFrom3" name="DepositRecivedFrom3">

                    <option value=""> -- Option --
                    </option>

                  </select>

                </div>

              </div>
              <div class="flexible" id="DepositUnderSection3" style="display: none;">

                <label class="MandentorySign"></label><label>Relationship</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromRelationship3" maxlength="30"
                  name="DepositRecivedFromRelationship3" value="">
              </div>
              <div class="flexible" id="DepositUnderSectionSup3"></div>
            </div>

            <div id="DepositSection3" style="display: none;">

              <div class="flexibleContainer">

                <div class="flexible">

                  <label class="MandentorySign"></label><label>First
                    Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromFirstName3" maxlength="45"
                    name="DepositRecivedFromFirstName3" value="">

                </div>

                <div class="flexible itemHalf">

                  <label class="MandentorySign"></label><label>Last Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromLastName3" maxlength="45"
                    name="DepositRecivedFromLastName3" value="">
                </div>

              </div>

              <div name="address" class="NewSectionMedium">

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="NoMandatoryTwo">Unit</label>

                    <input class="inlineInput" type="text" id="DepositUnitNumber3" name="DepositUnitNumber3" value="" maxlength="10">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Number</label>

                    <input class="inlineInput" type="text" id="DepositStreetNumber3" name="DepositStreetNumber3" maxlength="10"
                      value="">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Name</label>

                    <input class="inlineInput" type="text" id="DepositStreetName3" name="DepositStreetName3" value="" maxlength="40">
                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>City</label>

                    <input class="inlineInput" type="text" id="DepositCity3" name="DepositCity3" value="" maxlength="30">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="custom-select" id="DepositProvince3Custom"
                      onclick="Display('DepositProvince3', 'Deposit3ProvinceExtra'); ifProvinceOther('DepositProvince3','DepositCountry3');">

                      <select id="DepositProvince3" name="DepositProvince3" readonly>

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

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Postal Code</label>

                    <input class="inlineInput" type="text" id="DepositPostalCode3" name="DepositPostalCode3" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input class="inlineInput" type="text" id="DepositCountry3" name="DepositCountry3" value="Canada" maxlength="20"
                      readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Deposit3ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="OtherDepositProvince3" name="OtherDepositProvince3"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <div class="flexibleContainer NewSection">

                <div class="flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="DepositRecivedEmail3" maxlength="50"
                    name="DepositRecivedEmail3" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemHalf itemHalfOne">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromPhone3" maxlength="14"
                    name="DepositRecivedFromPhone3" value="" onkeydown="phoneNumberFormatter(this.id)"
                    >

                </div>

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="DepositRecivedExteraContactLabel3"
                      name="DepositRecivedExteraContactLabel3">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone
                      </option>
                    </select>
                  </div>

                  <input class="input inlineInput" type="text" id="DepositRecivedExteraContactNumber3" maxlength="32"
                    name="DepositRecivedExteraContactNumber3" value="">
                </div>

              </div>

              <!-- <div class="itemsSpecial" style="display:none">

                <label>Work</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromPWork3"
                  name="DepositRecivedFromWork3" value="">
              </div> -->

            </div>

            <div class="flexibleContainer">

              <div class="flexible">

                <label style="border-width: 1px; height: 40px;" for="DepositDepositReceipt3"
                  class="custom-file-upload inlineInput">
                  <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"><label class="UploadDocumentLabel">Upload
                    Document</label>
                </label>

                <input class="inlineInput" type="file" id="DepositDepositReceipt3Before" name="DepositDepositReceipt3Before" multiple="true">

              </div>

              <div class="flexible">
                <label id="deposit3Document" class="documentDone" style="display: none;"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
              </div>

            </div>

          </div><!-- Closing Deposit3 -->

          <!----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div style="display:none;" id="Deposit4" class="NewSection">

            <label class="forCheckLabel HeadLinesSecondary heavyfont">Additional Deposit</label>

            <span class="tooltip floatDataRightSide">
              <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                onclick=" RemoveOneParty('Deposit4','Deposit3','Deposit2','AddMoreDeposits');" style="display: inline;"
                id="RemoveOneDeposit" name="RemoveOneDeposit" loading="lazy">
              <span class="tooltiptext">Remove Deposit</span>
            </span>
            <hr style="margin-right: 4px;">

            <div class="itemFullDeposit flexibleContainer">

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>
                <label class="NoMandatoryTwo">Type</label>

                <div class="custom-select">

                  <select class="inputSelection" id="DepositType4" name="DepositType4">

                    <option value=""> -- Option --
                    </option>

                    <option value="ETF">ETF
                    </option>

                    <option value="Cheque">Cheque
                    </option>

                    <option value="Cash">Cash
                    </option>
                  </select>

                </div>
              </div>

              <div class="flexible ">

                <label class="MandentorySign" style="display:none;"></label>
                <label class="NoMandatoryTwo">Amount</label><br>

                <span class="shortValue inlineInput" style="float: left">
                  <label>$</label>
                  <input class="inlineInput" maxlength="15"
                    style="float: right; width: 80%; border-width: 0px; text-align: right; height: 22px; background: none;"
                    type="number" step="0.01" min="0" placeholder='0.00' onblur="limiting(this)" id="DepositAmount4"
                    name="DepositAmount4" placeholder="0.00">
                </span>

              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Date</label>

                <div class="input-group">
                  <input id="DepositDate4" name="DepositDate4" type="text" class="  form-control date-input"
                    placeholder="DD MM YYYY" readonly="readonly" />
                  <label class="input-group-btn" for="DepositDate4" id="DepositDateLabel4">
                    <span class="btn btn-default">
                      <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                  </label>
                </div>

              </div>

              <div class="flexible ">

                <label class="NoMandatoryTwo">Reference</label>

                <input class="input inlineInput" type="text" id="DepositRef4" name="DepositRef4" value="" maxlength="20">
              </div>

            </div>

            <div class="flexibleContainer NewSectionMedium" id="DepositExtra4">
              <div class="flexible">
                  <label class="NoMandatoryTwo">FINTRAC explanation</label>
                  <textarea class="inlineInput" style='resize: none;height: 40px;' type="text" id="fintrac4" name="fintrac4"></textarea>
              </div>
            </div>

            <div class="flexibleContainer NewSectionMedium">
              <div class="flexible">
                <label class="NoMandatory"></label><label>Received from</label>

                <div class="custom-select" onclick="ControlDeposit4()">

                  <select class="inputSelection depositList" id="DepositReceivedFrom4" name="DepositReceivedFrom4">

                    <option value=""> -- Option --
                    </option>

                  </select>

                </div>

              </div>

              <div class="flexible itemHalf" id="DepositUnderSection4" style="display: none;">

                <label class="MandentorySign"></label><label>Relationship</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromRelationship4" maxlength="30"
                  name="DepositRecivedFromRelationship4" value="">
              </div>
              <div class="flexible" id="DepositUnderSectionSup4"></div>
            </div>

            <div id="DepositSection4" style="display: none;">

              <div class="flexibleContainer">

                <div class="flexible">

                  <label class="MandentorySign"></label><label>First Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromFirstName4" maxlength="45"
                    name="DepositRecivedFromFirstName4" value="">

                </div>

                <div class="flexible itemHalf">

                  <label class="MandentorySign"></label><label>Last Name</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromLastName4" maxlength="45"
                    name="DepositRecivedFromLastName3" value="">
                </div>

              </div>

              <div name="address" class="NewSectionMedium">

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="NoMandatoryTwo">Unit</label>

                    <input class="inlineInput" type="text" id="DepositUnitNumber4" name="DepositUnitNumber4" value="" maxlength="10">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Number</label>

                    <input class="inlineInput" type="text" id="DepositStreetNumber4" name="DepositStreetNumber4" maxlength="10"
                      value="">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Street Name</label>

                    <input class="inlineInput" type="text" id="DepositStreetName4" name="DepositStreetName4" value="" maxlength="40">
                  </div>

                </div>

                <div class="flexibleContainer">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>City</label>

                    <input class="inlineInput" type="text" id="DepositCity4" name="DepositCity4" value="" maxlength="30">
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Province</label>

                    <div class="custom-select" id="DepositProvince4Custom"
                      onclick="Display('DepositProvince4', 'Deposit4ProvinceExtra'); ifProvinceOther('DepositProvince4','DepositCountry4');">

                      <select id="DepositProvince4" name="DepositProvince4" readonly>

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

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Postal Code</label>

                    <input class="inlineInput" type="text" id="DepositPostalCode4" name="DepositPostalCode4" value="" maxlength="11">
                    <!-- onblur="postalCorrect(this.id);" -->
                  </div>

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Country</label>

                    <input class="inlineInput" type="text" id="DepositCountry4" name="DepositCountry4" value="Canada" maxlength="20"
                      readonly>
                  </div>

                </div>

                <div class="flexibleContainer" style="display: none;" id="Deposit4ProvinceExtra">

                  <div class="flexible">
                    <label class="MandentorySign"></label><label>Other province or state</label>

                    <input type="text" class="inlineInput" id="OtherDepositProvince4" name="OtherDepositProvince4"
                      value="" maxlength="20">
                  </div>

                  <div class="flexibleotherProvince"></div>

                </div>

              </div>

              <!-- Need id -->

              <div class="flexibleContainer NewSection">

                <div class="itemFullEmail flexible">

                  <label class="MandentorySign"></label><label>Email</label>

                  <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="DepositRecivedEmail4" maxlength="50"
                    name="DepositRecivedEmail4" value="">
                </div>

              </div>

              <div class="flexibleContainer">

                <div class="flexible itemHalf itemHalfOne">

                  <label class="MandentorySign"></label><label>Phone</label>

                  <input class="input inlineInput" type="text" id="DepositRecivedFromPhone4" maxlength="14"
                    name="DepositRecivedFromPhone4" value="" onkeydown="phoneNumberFormatter(this.id)"
                    >

                </div>

                <div class="flexible itemShortPhone">

                  <div class="custom-select">

                    <select class="inputSelection" id="DepositRecivedExteraContactLabel4"
                      name="DepositRecivedExteraContactLabel4">

                      <option value="Mobile">Mobile
                      </option>

                      <option value="Mobile">Mobile
                      </option>

                      <option value="International Phone">International Phone
                      </option>
                    </select>
                  </div>

                  <input class="input inlineInput" type="text" id="DepositRecivedExteraContactNumber4" maxlength="32"
                    name="DepositRecivedExteraContactNumber4" value="">
                </div>

              </div>

              <!-- <div class="itemsSpecial" style="display:none">

                <label>Work</label>

                <input class="input inlineInput" type="text" id="DepositRecivedFromPWork4"
                  name="DepositRecivedFromWork4" value="">
              </div> -->

            </div>

            <div class="flexibleContainer">

              <div class="flexible">

                <label style="border-width: qpx; height: 40px;" for="DepositDepositReceipt4"
                  class="custom-file-upload inlineInput">
                  <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"> <label class="UploadDocumentLabel">Upload
                    Document</label>
                </label>

                <input class="inlineInput" type="file" id="DepositDepositReceipt4Before" name="DepositDepositReceipt4Before" multiple="true">

              </div>

              <div class="flexible">
                <label id="deposit4Document" class="documentDone" style="display: none;"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
              </div>

            </div>

          </div><!-- Closing Deposit4 -->

        </div><!--  Closing MainDeposit -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" id="DepositDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->

              <span class="buttonBack">

                <button type="button" class="buttonBlue"
                  onclick=" TabsHandleler(event,'PurchaserLawyer','tabcontent2','tablinks2','MyPurchaserLawyer');topbuttonsBack(3);"
                  id="Depositback1">Back</button>
              </span>

              <span class="buttonBack" style="margin-left: 0;">

                <button type="button" style="display:none;" class="buttonBlue"
                  onclick="TabsHandleler(event,'Purchasers','tabcontent2','tablinks2','MyPurchaser'); topbuttonsBack(2);"
                  id="Depositback2">Back</button>

              </span>

            </span>

            <span class="secondSpan">

            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn3">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_3" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving3">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn3">Save and close</button>

            <span class="savespan" id="savespan3">

              <button class="buttonSaveOne" type="button" id="DepositSave"  name="DepositSave" >Save</button>
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving3', 'Deletebtn3', 'Savebtn3', 'savespan3', 'Deletebtn1_3', 1, event)" type="button">&nbsp;</button>

            </span>

              <button class="buttonBlue" id="NextDeposit" type="button" onclick="DepositStep(); ">Next</button>

            </span>

          </div>
        </div>

      </div><!-- Closing Deposit -->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="CooperatingBrokerage" class="tabcontent2 extraStyling">

        <div id="MainCooperatingBrokerage">

          <!-- The following div named Co-Brokerage Detail information, takes the contact information such as name , address ... of Co operate Broker from the user -->

          <div id="Co-Brokerage Detail information" class="badID">

            <p id="CooperateBrokerageEmptyError" class="ErrorEmpty" style="display:none;">Complete all required
              fields before proceeding.</p>
            <div class="flexibleContainer">
              <div class="flexible itemLongerLawFirm">

                <label class="MandentorySign"></label><label>Co-operating Brokerage</label>

                <input class="input inlineInput"  maxlength="60"
                
                oninput='fillFunctionCooperating("Brokername", "CooperatingFirmList","CooperatingUnit","CooperatingStreetNumber","COOPERATINGBROKERAGEstreetName" ,"CooperatingCity", "CooperatingPostalCode", "CooperatingProvince")'
                
                
                 id="Brokername" name="Brokername"  list="CooperatingFirmList">
                
                <datalist id="CooperatingFirmList" name="CooperatingFirmList"> </datalist>
                
                
              </div>
              
            <script>
            // fillCooperating('CooperatingFirmList');
              </script>

              <div class="flexible ">

                <label class="MandentorySign"></label><label>Agent</label>

                <input class="input inlineInput" type="text" id="CooperatingAgentName" name="CooperatingAgentName" maxlength="60"
                  value="">
              </div>

            </div>



            <!-- <div class="items" style="display:none">

              <label class="MandentorySign"></label><label>Address</label>

              <input class="input inlineInput" type="text" id="COOPERATINGBROKERAGEAddress"
                name="COOPERATINGBROKERAGEAddress" value="">
            </div> -->

            <div class="vendorLawyerAddress NewSection" id="">

              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="NoMandatoryTwo">Unit</label> <input class="inlineInput" type="text" id="CooperatingUnit" maxlength="10"
                    name="CooperatingUnit">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Number</label> <input class="inlineInput" maxlength="10"
                    type="text" id="CooperatingStreetNumber" name="CooperatingStreetNumber">

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Street Name</label> <input class="inlineInput"
                    type="text" id="COOPERATINGBROKERAGEstreetName" name="COOPERATINGBROKERAGEstreetName" maxlength="40">

                </div>

              </div>
              <div class="flexibleContainer">

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>City</label>
                  <input class="inlineInput" type="text" id="CooperatingCity" name="CooperatingCity" maxlength="30">

                </div>

                <div class="flexible itemLongProvince">

                  <label class="MandentorySign"></label><label>Province</label>

                  <div class="box">
                    <div class="custom-select">

                      <select class="inputSelection" id="CooperatingProvince" name="CooperatingProvince">

                        <option value="ON">ON</option>

                        <option value="ON">ON</option>

                        <option value="AB">AB</option>

                        <option value="BC">BC</option>

                        <option value="MB">MB</option>

                        <option value="NB">NB</option>

                        <option value="NL">NL</option>

                        <option value="NWT">NWT</option>

                        <option value="NS">NS</option>

                        <option value="NU">NU</option>

                        <option value="PE">PE</option>

                        <option value="QC">QC</option>

                        <option value="SK">SK</option>

                        <option value="YT">YT</option>

                      </select>

                    </div>

                  </div>

                </div>

                <div class="flexible ">

                  <label class="MandentorySign"></label><label>Postal Code</label> <input class="inlineInput"
                    type="text" id="CooperatingPostalCode" name="CooperatingPostalCode" onblur="postalCorrect(this.id)" maxlength="11">
                  <!-- onblur="postalCorrect(this.id);" -->

                </div>

              </div>
            </div>

            <!-- End of address -->

            <div class="flexibleContainer NewSection">
              <div class="itemFullEmail flexible">

                <label class="MandentorySign"></label><label>Email</label>

                <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" maxlength="50"
                  id="CO-OPERATINGBROKERAGEEmail" name="CO-OPERATINGBROKERAGEEmail" value="">
              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible itemLongerPhone">

                <label class="MandentorySign"></label><label>Phone</label>

                <input class="input inlineInput" type="text" id="CO-OPERATINGBROKERAGEPhone" maxlength="14"
                  name="CO-OPERATINGBROKERAGEPhone" onkeydown="phoneNumberFormatter(this.id)"
                  >
              </div>

              <div class="flexible itemShortPhone">

                <div class="custom-select">

                  <select class="inputSelection" id="CO-OPERATINGBROKERAGEExteraContactInformation"
                    name="CO-OPERATINGBROKERAGEExteraContactInformation">

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Mobile">Mobile
                    </option>

                    <option value="Fax">Fax
                    </option>

                  </select>

                </div>

                <input class="input inlineInput" type="text" id="CO-OPERATINGBROKERAGErExteraContact" maxlength="32"
                  name="CO-OPERATINGBROKERAGErExteraContact" value="">
              </div>

            </div>


          </div><!-- Closing Co-Brokerage Detail information" -->

        </div><!-- Closing MainCooperatingBrokerage -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" id="CooperatingDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->

              <span class="buttonBack">

                <button id="Cooperating1" type="button" class="buttonBlue"
                  onclick="TabsHandleler(event,'Deposits','tabcontent2','tablinks2','MyDeposits');topbuttonsBack(5);">Back</button>

              </span>

              <span class="buttonBack" style="margin-left: 0px;">

                <button id="Cooperating2" type="button" style="display:none; " class="buttonBlue"
                  onclick="TabsHandleler(event,'PurchaserLawyer','tabcontent2','tablinks2','MyPurchaserLawyer');">Back</button>

              </span>

              <span class="buttonBack" style="margin-left: 0px;">

                <button id="Cooperating3" type="button" style=" display:none; " class="buttonBlue"
                  onclick="TabsHandleler(event,'Purchasers','tabcontent2','tablinks2','MyPurchaser');topbuttonsBack(2);">Back</button>

              </span>

            </span>

            <span class="secondSpan">

              <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn12">Delete</button>
              <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_12" >Discard</button>
              <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving12">Exit without saving</button>
              <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn12">Save and close</button>
  
              <span class="savespan" id="savespan12">
  
                <button class="buttonSaveOne" type="button" id="CooperatingSave" name="CooperatingSave" >Save</button>
                
                <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving12', 'Deletebtn12', 'Savebtn12', 'savespan12', 'Deletebtn1_12', 1, event)" type="button">&nbsp;</button>
  
              </span>

              <button class="buttonBlue" id="CooperatingNext" type="button"
                onclick="CooperatingBrokerageStep();">Next</button>
            </span>

          </div>

        </div>

      </div><!-- Closing Cooperating Brokerage -->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

    </div><!-- Closing Parties-->

    <div id="Invoice" class="tabcontent" style="display: none;">

      <label class="HeadLines">TRADE RECORD SHEET</label>

      <span class="floatDataRightSide">

        <span class="tooltip">
          <img class="lineButton manageListButton"  id="emailInvoicebtn" src="../ImagesUsed/Email.png" alt="Email"
             style="width: 22px;" loading="lazy">
          <span class="tooltiptext">Email invoice</span>
        </span>

        <span class="tooltip">
          <img class="lineButton printButton" type="button" id="invoicep" onclick="simplePrint('MainInvoiceSection')" src="../ImagesUsed/Print.png"
            alt="Print" loading="lazy">
          <span class="tooltiptext">Print page</span>
        </span>

      </span>

      <!-- This Span contains the Property information -->

      <div class="forAddressTop">

        <label id="Property5"></label>

      </div>

      <hr class="addressHr" style="margin-bottom: 22px; margin-right: 4px;">

      <div id="MainInvoiceSection">

        <div id="printMainInvoice">
          
          <div class="frontImageLogo frontImageFlex">
            <img src="<%=Companylogo%>?math=<%=Math.random()%>" alt="House" class="insideImglogo" loading="lazy">
          </div>
          
          <label style="color:black;  text-transform: uppercase;" class="heavyfont" id="MainTitle">Commission Statement</label>
          

          <div class="flexibleContainer NewSectionSmall" style="width: 70%;">

            <label class="flexibleDate heavyfont NewSectionSmall" id="Date"
              style="margin-right: auto; padding-left: 0;"></label>

            <label class="flexibleDate heavyfont floatDataRightSide" style="display:none;">Reference 1100</label>

          </div>


          <div class="NewSectionSmall" style="width: 70%;">

            <label class="flexibleZero" id="Reciever Full Name"></label>
            <span id="ReceiverExtraspan"><br><label class="flexibleZero" id="ReceiverExtraLabel"></label></span>

          </div>

          <div class="flexibleContainer" style="width: 70%;">

            <label id="RecieverAddress"></label>

          </div>

          <div class="flexibleContainer" style="width: 70%;">

            <label id="RecieverAddressTwo"></label>

          </div>


          <div id="SummaryOfTransaction" class="invoiceBox NewSectionSmall" style="height: auto;">

            <div class="flexibleContainer">

              <label class="heavyfont"
                style="margin: 0; width: 130px;  margin-left: 15px; padding-top: 4px;  ">Property:</label>

              <label id="Property7" class="inlineInput flexibleZero"></label>

            </div>

            <div class="flexibleContainer">

              <label id="Title1"
                style="margin: 0; width: 130px; padding-top: 7px; margin-left: 15px; font-weight: bold;">Vendor(s):</label>

              <label class="inlineInput flexibleZero" id="InvoiceVendors"></label>

            </div>


            <div class="flexibleContainer">

              <label id="Title2" style="margin: 0; width: 130px; margin-left: 15px; padding-top: 7px;"
                class="heavyfont">Puchaser(s):</label>

              <label class="inlineInput flexibleZero" id="InvoicePuchasers"></label>

            </div>

            <div class="flexibleContainer">

              <label style="margin: 0; width: 130px; margin-left: 15px; padding-top: 7px;"
                class="heavyfont">Closing:</label>

              <label class="inlineInput flexibleZero" id="InvoiceClosingDate"></label>

            </div>

          </div><!-- Closing SummaryOfTransaction -->

          <p class="invoiceBox" id="LeasingBox" style="text-align: center;">Commission for our services rendered in accordance with the relevant Agreement of Purchase and Sale.</p>

          <p class="invoiceBox" id="SellingBox" style="text-align: center;">Commission for our services rendered in accordance with the relevant Rental Agreement.</p>

          <div id="SomeDetailInformationTRS" class="NewSectionSmall" style="padding-right: 15px;">

            <div class="flexibleContainer">

              <label class="flexible" style="flex: 6;" id="InvoiceFeeLabelPrice">Price</label>

              <label class="flexible inlineInput" style="flex: 0.1; padding-top: 3px;">$</label>

              <label class="inlineInput flexible" id="InvoicePrice"></label>

            </div>

            <div class="flexibleContainer" style="margin-top: 4px;">

              <label class="flexible" style="flex: 6;" id="InvoiceFeeLabel">Commission Payable</label>

              <label class="flexible" style="flex: 0.1; padding-top: 3px;"></label>

              <label class="inlineInput flexible" id="InvoiceCommission"></label>

            </div>

            <div class="flexibleContainer" style="margin-top: 4px; height: 19px; border-bottom: 1px solid lightgrey;">

              <label class="flexible" style="flex: 6;">HST (<%=Mycompany.HSTNumberPart1%>RT<%=Mycompany.HSTNumberPart2%>)</label>

              <label class="flexible" style="flex: 0.1; padding-top: 3px;"></label>

              <label class="inlineInput flexible"id="InvoiceTaxAmount"></label>
              <!-- <label id="InvoicetaxNumber"></label> -->
            </div>

            <div class="flexibleContainer" style="margin-top: 7px;">

              <label id="HSTLabel" class="flexible" style="flex: 6;">Total Commission</label>

              <label class="flexible inlineInput" style="flex: 0.1;">$</label>

              <label class="inlineInput flexible" id="InvoiceTotal"></label>

            </div>
          <!-- 
          <div class="flexibleContainer" style="margin-top: 4px;">

                 <label class="flexible" style="flex: 6; font-weight: bold; padding-top: 2px;"><b>Balance</b></label>

                 <label class="flexible inlineInput" style="flex: 0.1; font-weight: bold; padding-top: 5px;">$</label>

                 <input class="inlineInput flexible" type="text" style="text-align: right; font-weight: bold; padding-top: 6px;" id="BalanceInvoice" name="BalanceInvoice" value="Balance">
          </div> -->

            <div class="flexibleContainer NewSectionSmall" style=" border-bottom: 1px solid lightgrey;">

              <label class="flexible" style="flex: 6; height: 19px; padding-top: 3px;">Deposit held in trust:</label>

              <label class="flexible inlineInput" style="flex: 0.1; padding-top: 3px;"></label>

              <label class="inlineInput flexible" style="text-align: right; padding-top: 3px;"
                id="InvoiceDeposits"></label>
            </div>

            <div class="flexibleContainer" style="margin-top: 6px;">

              <label id="BalanceLabel" class="flexible" style="flex: 6; font-weight: bold; padding-top: 3px;">Balance
                due:</label>

              <label class="flexible inlineInput" style="flex: 0.1; font-weight: bold; padding-top: 3px;">$</label>

              <label class="inlineInput flexible"
                style="text-align: right; font-weight: bold; padding-top: 3px;" id="InvoiceRemaingBalance"></label>
            </div>

        </div>


        <div id="StatmentContects" class="noticePaymentSec" >

          <span class="BlockDislay" id="ExtraNotice">

            <label style="margin-right: 0;">A sum of $</label>

            <label style="" id="BalanceDueAmountRemain"></label>

            <label style="" id="StatementReturnMessage"> is owning to the vendor(s) on
              closing.</label></span>

          <p class="BlockDislay" style="margin-top: 5px; margin-bottom: 0;">Please
            contact our office if you have any questions.</p>

        </div><!-- Closing StatmentContects  -->

        <div id="InvoiceContects">

          <div class="invoiceBox NewSectionSmall" style="padding: 0">

            <p class="noticePayment" style=" margin-bottom: 0;">Please mail a cheque
              payable to "<%=Mycompany.BusinessName%>" or make
              an electronic payment to our commission trust
              account:</p>

            <div   class="noticePayment" style="margin-top: 0;    padding-top: 0;">

                <div style="width: 100%;">
    
                  <label style="width: 100px;  font-weight: bold;">Bank:</label>
    
                  <input type="text" class="inlineInput" id="InvoiceBank" name="InvoiceBank" value="<%=Mycompany.CommissionBankNumber %>"
                    style="padding: 0;" readonly>
                </div>
    
                <div style="width: 100%; margin-top: 1px;">
    
                  <label style="width: 100px;  font-weight: bold;">Transit:</label>
    
                  <input type="text" class="inlineInput" id="InvoiceTransit" name="InvoiceTransit" value="<%=Mycompany.CommissionTransitNumber%>"
                    style="padding: 0;" readonly>
                </div>
    
                <div style="width: 100%; margin-top: 1px; ">
    
                  <label style="width: 100px;  font-weight: bold;">Account:</label>
    
                  <input type="text" class="inlineInput" id="InvoiceAccount" name="InvoiceAccount" value="<%=Mycompany.CommissionAccountNumber%>"
                    style="padding: 0;" readonly>
                </div>
    
            </div>
          </div>


          

        </div><!-- Closing  InvoiceContects -->


        <div id="SenderInformation">

          <label style="margin-top: 32px;">Sincerely,</label>

          <br>

          <label style="padding-left: 0;margin-top: 34px;" class="inlineInput" type="text" id="InvoiceBroker"
            name="InvoiceBroker"><%= MyInformation.Firstname%> <%= MyInformation.Lastname%></label>

          <br>

          <label style="margin-top: 4px;">Broker of Record</label>

          <br><br>

          <label style="margin-top: 4px;"><%=Mycompany.BusinessName%></label>

          <br>

          <label style="margin-top: 4px;"><%=Mycompany.Unit%> <%=Mycompany.StreetNumber%> <%=Mycompany.StreetName %></label>

          <br>

          <label style="margin-top: 4px;"><%=Mycompany.City%>, <%=Mycompany.Province%>, <%=Mycompany.PostalCode%></label>
          <br><br>

          <label style="margin-top: 4px;"><%=Mycompany.Phone%></label>

          <br>

          <label style="margin-top: 4px;"><a target="_blank" href="mailto:<%=Mycompany.Email%>"><%=Mycompany.Email%></a></label>




        </div><!-- Closing SenderInformation -->

        <!-- Hidden inputs for getting data -->

        <input  type="hidden" id="hiddenInvoiceDate"       name="hiddenInvoiceDate"         value="" >

        <input  type="hidden" id="hiddeninvoiceCommission" name="hiddeninvoiceCommission"   value="" >

        <input  type="hidden" id="hiddenInvoiceHSTtax"     name="hiddenInvoiceHSTtax"       value="" >

        <input  type="hidden" id="hiddenInvoiceBalance"    name="hiddenInvoiceBalance"      value="" >

        <input  type="hidden" id="hiddenInvoiceDeposits"   name="hiddenInvoiceDeposits"     value="" >
        
         <input  type="hidden" id="hiddenVendors"      name="hiddenVendors"     value="" >
           
         <input  type="hidden" id="hiddenPurchasers"   name="hiddenPurchasers"     value="" >

      </div>

      </div><!-- Closing Main Invoice Section -->

      <div class="Footer FooterButton" id="invoiceButtonSection">

        <div class="FooterButtonSpan">

          <span class="buttonDiscard floatDataLefttSide" id="Invoice steps">

            <!-- <button style="display: none;" id="InvoiceDiscard" type="button" class="dropbtnDiscard" >Discard</button> -->

            <span class="buttonBack">

              <button id="Invoiceveback1" type="button" class="buttonBlue"
                onclick="TabsHandleler(event, 'PARTIES','tabcontent','tablinks1','PartiesTab');  TabsHandleler(event, 'CooperatingBrokerage','tabcontent2','tablinks2','MyCooperatingBrokerage');topbuttonsBack(6);">Back</button>

              <button style="display:none" id="Invoiceveback2" type="button" class="buttonBlue"
                onclick="TabsHandleler(event, 'PARTIES','tabcontent','tablinks1','PartiesTab');  TabsHandleler(event, 'Deposits','tabcontent2','tablinks2','MyDeposits'); topbuttonsBack(6);">Back</button>

              <button style="display:none" id="Invoiceveback3" type="button" class="buttonBlue"
                onclick="TabsHandleler(event, 'PARTIES','tabcontent','tablinks1','PartiesTab');   TabsHandleler(event, 'PurchaserLawyer', 'tabcontent2', 'tablinks2', 'MyPurchaserLawyer');topbuttonsBack(6);">Back</button>

              <button style="display:none" id="Invoiceveback4" type="button" class="buttonBlue"
                onclick="TabsHandleler(event, 'PARTIES','tabcontent','tablinks1','PartiesTab');  TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser'); topbuttonsBack(2);">Back</button>


            </span>

          </span>

          <span class="secondSpan">

            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn4">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_4" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving4">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn4">Save and close</button>

            <span class="savespan" id="savespan4">

              <button class="buttonSaveOne" type="button" id="InvoiceveSave" name="InvoiceveSave" >Save</button>
              
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving4', 'Deletebtn4', 'Savebtn4', 'savespan4', 'Deletebtn1_4', 1, event)" type="button">&nbsp;</button>

            </span>


            <button class="buttonBlue" id="InvoiceeNext" type="button" onclick="NextStepInvoice();">Next</button>
          </span>

        </div>

      </div>

    </div><!-- Closing Invoice -->


    <!-- *********************************************************************************************************************************************************************************************************************************************-->

    <div id="Referral Fee" class="tabcontent content" style="display: none;">

      <label class="HeadLines">TRADE RECORD SHEET</label>

      <!-- This Span contains the Property information -->

      <div class="forAddressTop">

        <label id="Property2"></label>

      </div>

      <hr class="addressHr" style="margin-right: 4px;">

      <!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div class="PartiesNavBar" id="ReferralNavBar">

        <button id="ReferralAgentTab" type="button" class="tablinks3" style="width: 120px;">Referral Fee</button>

        <button id="ReferralPaymentTab" type="button" class="tablinks3 " style="Display:none; width: 120px;">Payment</button>


      </div><!-- Closing ReferralNavBar -->

      <!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="Agent" class="tabcontent3 extraStyling">

        <div id="MainReferral">

          <div id="Disclosure and Agent">

            <p id="ReferralErrorcheck" class="ErrorEmpty" style="display:none;">Complete all required fields
              before proceeding.</p>


            <label class="ErrorEmpty"
              style="display:none; margin-top: 20px; padding-bottom: 13px; padding-top: 13px;  height: auto;"
              id="RecipentMessageError">Compensation may not be provided to an individual or entity that is not
              registered.</label>


            <label class="ErrorEmpty" style="display:none; margin-top: 20px; height: auto;"
              id="NoCompansionAgrrementError">Referral fee cannot be paid until a written compensation agreement is
              provided to all parties.</label>

            <div style="padding-top: 10px; height:30px; width:100%;">

              <label class="AddRebateReferral NewSectionSmall">Add referral fee <span class="tooltipHelp"><img
                    class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                    height="16" loading="lazy"><span class="tooltiptext">Referral fee is for agents from another
                    brokerage.</span></span></label>

              <label class="container">

                <input class="Checkmark1"
                  onclick="CheckForReferral('AddRefferalFree','RefferalSection','ReferralPaymentTab','ReferralSteps1','ReferralSteps2');"
                  type="checkbox" class="checkbox" id="AddRefferalFree" name="AddRefferalFree" value=" "> <span
                  class="checkmark"></span></label>

            </div>

            <div id="RefferalSection" style="display:none; height:auto;">

              <div id="Disclosure">

                <div id="DetailDisclosureandAgentInformation">


                  <div style="height:30px; width:100%;" class="NewSectionSmall">

                    <label class="AddRebateReferral">Is the recipient a registrant? <span class="tooltipHelp"><img
                          class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
                          height="16" loading="lazy"><span class="tooltiptext">Referral fee can only be paid to
                          registrants.</span></span></label>

                    <label class="container" style="width: 3%;">
                      <input class="Checkmark1"
                        onclick="ReferralRebate('ReferralfeeIsRegistrantYES','ReferralfeeIsRegistrantYES','ReferralfeeIsRegistrantNO','ReferralDisclosedToALL','RecipentMessageError','NoCompansionAgrrementError','ReferralfeeIsRegistrantYES');"
                        type="checkbox" class="checkbox" id="ReferralfeeIsRegistrantYES"
                        name="ReferralfeeIsRegistrantYES"><span class="checkmark"></span></label><label>YES</label>

                    <label class="container" style="width: 3%;">
                      <input class="Checkmark1"
                        onclick="ReferralRebate('ReferralfeeIsRegistrantNO','ReferralfeeIsRegistrantYES','ReferralfeeIsRegistrantNO','ReferralDisclosedToALL','RecipentMessageError','NoCompansionAgrrementError','ReferralfeeIsRegistrantYES'); ReferralRebateAdditional('ReferralfeeIsDisclosedToAllYES','ReferralfeeIsDisclosedToAllNO');"
                        type="checkbox" class="checkbox" id="ReferralfeeIsRegistrantNO" name="ReferralfeeIsRegistrantNO"
                        value="NO"><span class="checkmark"></span></label><label>NO</label>

                  </div>

                  <div style="display:none" id="ReferralDisclosedToALL" class="NewSectionSmall">

                    <label class="AddRebateReferral">Was the compensation agreement disclosed to all parties? <span
                        class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
                          alt="MasterProBrokerHelp" width="16" height="16" loading="lazy"><span class="tooltiptext">Written disclosure
                          to all parties is required.</span></span></label>


                    <label style="width: 3%;" class="container"><input class="Checkmark1"
                        onclick="ReferralRebate('ReferralfeeIsDisclosedToAllYES','ReferralfeeIsDisclosedToAllYES','ReferralfeeIsDisclosedToAllNO','ReferralDisclosureUpload','NoCompansionAgrrementError','','ReferralfeeIsDisclosedToAllYES');"
                        type="checkbox" class="checkbox" id="ReferralfeeIsDisclosedToAllYES"
                        name="ReferralfeeIsDisclosedToAllYES"><span class="checkmark"></span></label><label>YES</label>

                    <label style="width: 3%;" class="container"><input class="Checkmark1"
                        onclick="ReferralRebate('ReferralfeeIsDisclosedToAllNO','ReferralfeeIsDisclosedToAllYES','ReferralfeeIsDisclosedToAllNO','ReferralDisclosureUpload','NoCompansionAgrrementError','','ReferralfeeIsDisclosedToAllYES'); "
                        type="checkbox" class="checkbox" id="ReferralfeeIsDisclosedToAllNO"
                        name="ReferralfeeIsDisclosedToAllNO" value="NO"><span
                        class="checkmark"></span></label><label>NO</label>



                    <div style="display:none" id="ReferralDisclosureUpload">

                      <div class="flexibleContainer NewSectionSmall">

                        <label class="AddRebateReferral flexible" style="margin-top: 27px;">Upload
                          written
                          disclosure
                          agreement</label>

                        <div class="flexible">

                          <label style="border-width: 1px; height: 40px; margin-left: 28px; width: 200px; float: left;"
                            for="ReferralDisclosureDoc" class="custom-file-upload inlineInput">

                            <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"><label class="UploadDocumentLabel">Upload
                              Document</label>
                          </label>

                          <input id="ReferralDisclosureDocBefore" style="height: 40px;" name="ReferralDisclosureDocBefore"
                            class="upload" type="file" multiple="true">

                        </div>

                      </div>

                      <div class="flexibleContainer" id="ReferralDocument" style="display: none;">
                        <div class="flexible" style="margin-top: 0; height: 10px">
                          
                        </div>
                        <div class="flexible" style="margin-left: 28px; margin-top: 0; height: 0px">
                          <label class="documentDone"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
                        </div>
                      </div>

                      <label class="SecondLabelType NewSection" style="margin-left: 8px; margin-top: 60px;">Referring
                        Agent</label>

                      <hr style="border: 0;
                      background: #29c1e1;
                      height: 2px;
                      margin-right: 4px;">

                      <p id="ReferralStep1Error" class="ErrorEmpty" style="display:none; ">Complete all required
                        fields before proceeding.</p>

                      <div class="flexibleContainer NewSectionSmall">

                        <div class="flexible itemLongerLawFirm">

                          <label class="MandentorySign"></label><label>First Name</label>

                          <input class="inlineInput" type="text" id="PayeeFirstName" name="PayeeFirstName" maxlength="45">
                        </div>

                        <div class="flexible ">

                          <label class="MandentorySign"></label><label>Last Name</label>

                          <input class="inlineInput" type="text" id="PayeeLastName" name="PayeeLastName" maxlength="45">
                        </div>

                      </div>

                      <div class="flexibleContainer">

                        <div class="itemFullEmail flexible">

                          <label class="MandentorySign"></label><label>Co-operating Brokerage</label>

                          <input class="inlineInput" type="text" id="PayeeRealStateBrokerage" maxlength="60"
                            name="PayeePRealStateBrokerage">
                        </div>

                        <div class="flexible"></div>

                      </div>

                      <div class="vendorLawyerAddress NewSection">

                        <div class="flexibleContainer">

                          <div class="flexible ">

                            <label class="NoMandatoryTwo">Unit</label>

                            <input class="inlineInput" type="text" id="PayeeUnit" name="PayeeUnit" maxlength="10">
                          </div>

                          <div class="flexible ">

                            <label class="MandentorySign"></label><label>Street Number</label>

                            <input class="inlineInput" type="text" id="PayeeStreetNumber" name="PayeeStreetNumber" maxlength="10">
                          </div>

                          <div class="flexible ">

                            <label class="MandentorySign"></label><label>Street Name</label>

                            <input class="inlineInput" type="text" id="PayeeStreetName" name="PayeeStreetName" maxlength="40">
                          </div>

                        </div>

                        <div class="flexibleContainer">

                          <div class="flexible ">

                            <label class="MandentorySign"></label><label>City</label>

                            <input class="inlineInput" type="text" id="PayeeCity" name="PayeeCity" maxlength="30">
                          </div>

                          <div class="flexible itemLongProvince">

                            <label class="MandentorySign"></label><label>Province</label>

                            <div class="custom-select" id="PayeeProvinceCustom">

                              <select class="inputSelection" id="PayeeProvince" name="PayeeProvince">

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

                              </select>

                            </div>



                            <input class="input3" type="text" id="PayeeProvince" name="PayeeProvince" value=""
                              style="display:none">
                          </div>

                          <div class="flexible ">

                            <label class="MandentorySign"></label><label>Postal Code</label>

                            <input class="inlineInput" type="text" id="PayeePostalCode" name="PayeePostalCode" onblur="postalCorrect(this.id)" maxlength="11">
                            <!-- onblur="postalCorrect(this.id);" -->
                          </div>

                        </div>

                      </div>

                      <div class="flexibleContainer NewSection">

                        <div class="itemFullEmail flexible">

                          <label class="MandentorySign"></label><label>Email</label>

                          <input onblur="emailCorrect(this.id)" class="input inlineInput" type="text" id="PayeeEmail" maxlength="50"
                            name="PayeeEmail">

                        </div>

                      </div>

                      <div class="flexibleContainer">

                        <div class="flexible itemLongerPhone">

                          <label class="MandentorySign"></label><label>Phone</label>

                          <input class="input inlineInput" type="text" id="PayeePhone" name="PayeePhone" maxlength="14"
                            onkeydown="phoneNumberFormatter(this.id)" >
                        </div>

                        <div class="flexible itemShortPhone">

                          <div class="custom-select">

                            <select class="inputSelection1" id="PayeeExtraContactInformationLabel"
                              name="PayeeExtraContactInformationLabel">

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

                          <input class="input inlineInput" type="text" id="PayeeExtraContactInformation" maxlength="32"
                            name="PayeeExtraContactInformation" value="">
                        </div>

                      </div>

                    </div>
                    <!-- Closing ReferralDisclosureUpload -->

                  </div>
                  <!-- Closing ReferralDisclosedToALL -->

                </div>
                <!-- Closing DetailDisclosureandAgentInformation -->

              </div><!-- Closing Disclosure-->

            </div><!-- Closing ReferralSection -->

          </div><!-- Closing Disclosure and Agent -->

        </div><!-- Closing Main Referral -->

        <div class="Footer FooterButton" id="Referralbuttons">

          <div class="FooterButtonSpan">

            <span id="ReferralSteps1">

              <span class="buttonDiscard floatDataLefttSide">

                <!-- <button style="display: none;" id="ReferralDiscard1" type="button" class="dropbtnDiscard" >Discard</button> -->

                <span class="buttonBack">

                  <button type="button" id="Referralback1" class="buttonBlue"
                    onclick="TabsHandleler(event,'Invoice','tabcontent','tablinks1','InvoiceTab');">Back</button>

                </span>

              </span>

              <span class="secondSpan">

                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn13">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_13" >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving13">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn13">Save and close</button>
    
                <span class="savespan" id="savespan13">
    
                  <button class="buttonSaveOne" type="button" id="ReferralSave1" name="ReferralSave1"  >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving13', 'Deletebtn13', 'Savebtn13', 'savespan13', 'Deletebtn1_13', 1, event)" type="button">&nbsp;</button>
    
                </span>

                <button id="ReferralNext1" type="button" class="buttonBlue"
                  onclick="Referralnext()">Next</button>
              </span>

            </span>

            <span style="display:none;" id="ReferralSteps2">

              <span class="buttonDiscard floatDataLefttSide">

                <button style="display: none;" id="ReferralDiscard2" type="button" class="dropbtnDiscard" >Discard</button>

                <span class="buttonBack">

                  <button id="Referralback2" type="button" class="buttonBlue"
                    onclick="TabsHandleler(event,'Invoice','tabcontent','tablinks1','InvoiceTab');">Back</button>

                </span>

              </span>

              <span class="secondSpan">

                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn14">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_14" >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving14">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn14">Save and close</button>
    
                <span class="savespan" id="savespan14">
    
                  <button class="buttonSaveOne" type="button" id="ReferralSave2" >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving14', 'Deletebtn14', 'Savebtn14', 'savespan14', 'Deletebtn1_14', 1, event)" type="button">&nbsp;</button>
    
                </span>

                <button class="buttonBlue" id="ReferralNext2" type="button"
                  onclick="ReferralAgentStep1();">Next</button>

              </span>

            </span>

          </div>

        </div><!-- Closing Referral buttons -->

      </div><!-- Closing Agent -->

      <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="Amount" class="tabcontent3 extraStyling">

        <div id="ReferralFeeAmountSection">

          <p id="Help4" style="display:none; color:black; height:10px;">
            The HST number include nine digits followed by
            RT0001</p>

          <p id="HSTError" class="ErrorEmptyYellow" style="display:none;">
            The HST number
            was not provided. The referring agent will not be paid HST. Would you like to proceed without HST number?
          </p>

          <p id="ReferralEmptyFieldsError" class="ErrorEmpty" style="display:none;">
            Please enter the
            referral fee amount.</p>

          <p id="TotalReferralAllocationError" class="ErrorEmpty" style="display:none;">
            Referral
            fee does not add up to 100%, Please
            check amounts!</p>

          <p id="ReferralExceedError" class="ErrorEmpty" style="display:none;">
            Make sure that referral fee does not exceed agent's net commission.</p>

          <div class="flexibleContainer NewSectionSmall">

            <div class="flexible itemLongerLawFirm">

              <label class="MandentorySign"></label><label>Referral Fee Amount (net of HST)</label>
              <br>

              <span class="percent inlineInput" style="float:left;">
                <label style="margin-left: 5px; margin-top: 1px; float: left;">$</label>
                <input class="inlineInput" onblur="limiting(this); " maxlength="15"
                  style="width: 70%;    float: right;    text-align: right; padding-top: 3px;"
                  oninput="CalcluationOfAmounts('ReferralPercentageAmountToAgent1','ReferralPercentageAmountToAgent2','ReferralFeeAmount','ReferralAgent1','ReferralAgent2');"
                  type="text" id="ReferralFeeAmount" name="ReferralFeeAmount" value="0.00" Placeholder="0.00" step=0.01>
              </span>
            </div>

            <div class="flexible ">

              <label class="MandentorySign"></label><label> Payee's HST Number</label>

                <div class="flexibleContainer" id="HSTSectionDiv">
                  <input class="inlineInput flexible" type="text" style="text-align: right; padding-top: 3px;" id="ReferralPayeeHSTNumber" name="ReferralPayeeHSTNumber" value="" placeholder="123456789" maxlength="9">
                  <label class="flexible" for="" style="flex: 0.09; margin-top: 6px; margin-right: 0;">RT</label>
                  <input class="inlineInput flexible" style="flex: 0.5; text-align: right; margin-right: 0; padding-top: 3px;" placeholder="0001" type="text" id="ReferralPayeeHSTNumber2" name="ReferralPayeeHSTNumber2" value="0001" maxlength="4"></div>

              <!-- <input class="inlineInput" type="text" id="" name="ReferralPayeeHSTNumber"> -->
            </div>

          </div>

          <br>

          <div id="AgentsRefferalPayments" style="display:none;">


            <label class="HeadLinesSecondary" style="padding-top:0px; margin-left: 0px;">Referral
              Fee Allocation</label>

            <hr style="margin-right: 4px;">

            <div id="Agent1ReferralSection" class="flexibleContainer">

              <div class="flexible" style="flex: 2.1;">

                <label class="MandentorySign floatDataLefttSide"></label>

                <label id="ReferralToAgent1" name="ReferralToAgent1">First Agent Name</label>

              </div>

              <div class=" percent inlineInput flexible">

                <label>%</label>

                <input class="input5" style="background: none;" onblur="limiting(this)"
                  oninput="maxLengthCheck100(this); TotalPercentageCalculation('ReferralPercentageAmountToAgent1','ReferralPercentageAmountToAgent2');
                  CalcluationOfAmounts('ReferralPercentageAmountToAgent1','ReferralPercentageAmountToAgent2','ReferralFeeAmount','ReferralAgent1','ReferralAgent2');  "
                  id="ReferralPercentageAmountToAgent1" name="ReferralPercentageAmountToAgent1" type="number" step="0.01" min=0.00
                  placeholder="100.00" value="100.00" max="100.00">

              </div>

              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label style="float: left;">$</label>

                <input class="input5" oninput="" style="background: #f3f3f3; " id="ReferralAgent1" name="ReferralAgent1"
                  type="number" step="0.01" min=0 placeholder=" " value="" readonly="readonly">

              </div>


            </div>

            <div id="Agent2ReferralSection" class="flexibleContainer">


              <div class="flexible" style="flex: 2.1; ">
                <label style="margin-left: 20px;" id="ReferralToAgent2" name="ReferralToAgent2">Second Agent
                  Name</label>
              </div>

              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label>%</label>

                <input class="input5" style="background: #f3f3f3;" id="ReferralPercentageAmountToAgent2"
                  name="ReferralPercentageAmountToAgent2" type="number" min=0.00 step="0.01" placeholder="0.00"
                  value="0.00" max="100.00" readonly="readonly">

              </div>

              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label style="float: left;">$</label>

                <input class="input5" id="ReferralAgent2" style="background: #f3f3f3;" name="ReferralAgent2"
                  type="number" step="0.01" value="" readonly="readonly">

              </div>

            </div>


          </div><!-- Closing AgentsRefferalPayments -->

        </div><!-- closing Referral Fee Amount -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide" id="ReferralSteps">

              <!-- <button style="display: none;" id="Referralstep2Discard" type="button" class="dropbtnDiscard" >Discard</button> -->

              <span class="buttonBack">
                <button id="Referralstep2Back" type="button" class="buttonBlue"
                  onclick="TabsHandleler(event,'Agent','tabcontent3','tablinks3','ReferralAgentTab');">Back</button>
              </span>
            </span>

            <span class="secondSpan">

                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn15">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_15" >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving15">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn15">Save and close</button>
    
                <span class="savespan" id="savespan15">
    
                  <button class="buttonSaveOne" type="button" id="Referralstep2Save"  name="Referralstep2Save" >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving15', 'Deletebtn15', 'Savebtn15', 'savespan15', 'Deletebtn1_15', 1, event)" type="button">&nbsp;</button>
    
                </span>

              <button class="buttonBlue" id="Referralstep2Next" type="button"
                onclick="ReferralAgentStep2(1);">Next</button>
            </span>

          </div>

        </div>

      </div><!-- Closing Amount -->

    </div><!-- Closing Referral Fee TabContent -->

    <!--***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************-->

    <div id="Customer Rebate" class="tabcontent content" style="display: none;">

      <label class="HeadLines">TRADE RECORD SHEET</label>

      <!-- This Span contains the Property information -->

      <div class="forAddressTop">

        <label id="Property3"></label>

      </div>

      <hr class="addressHr" style="margin-right: 4px;">
      <!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->


      <div class="PartiesNavBar" id="RebateNavBar">

        <button id="RebateClientSection" type="button" class="tablinks4" style="width: 120px;">Rebate</button>

        <button id="RebateAmountSection" type="button" style="display:none; width: 120px;" class="tablinks4">Payment</button>

      </div>
      <!-- Closing RebateNavBar->

       <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->


      <div id="Client" class="tabcontent4">

        <div id="MainRebateSection">

          <div id="RebateDisclosure">
            <p id="RebateEmptyFieldsError" class="ErrorEmpty" style="display:none;">Complete all required fields
              before proceeding.</p>

            <p class="ErrorEmpty" style="display:none" id="NotPartyToThisTradeError">A rebate may not be provided to an
              individual or entity who is not a party to the trade.</p>


            <p id="EthicCodeRebateError" class="ErrorEmpty" style="display: none;">
              Rebates require a written rebate agreement, that complies with the Code of Ethics.
            </p>

            <div style="height:30px; padding-top: 10px; width:100%;">

              <label class="AddRebateReferralTwo">Add Rebate</label>

              <label class="container"><input class="Checkmark1"
                  onclick="CheckForRebate('AddRebate','RebateDisclosureDetailInformation','RebateAmountSection','Rebaeps1','Rebaeps2');"
                  type="checkbox" class="checkbox" id="AddRebate" name="AddRebate"><span
                  class="checkmark"></span></label>



            </div>

            <div id="RebateDisclosureDetailInformation" style="display:none; height:auto; width:100%;">

              <div style="height:30px; width:100%;" class="NewSectionSmall">

                <label class="AddRebateReferralTwo">Is the recipient a party to this trade?<span
                    class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp"
                      width="16" height="16" loading="lazy"><span class="tooltiptext">Rebates can only be provided to party to this
                      trade.</span></span></label>

                <label class="container" style="width: 3%;"><input class="Checkmark1"
                    onclick="ReferralRebate('RecipientAPartyYes','RecipientAPartyYes','RecipientAPartyNO','ReebateComplywiththeCodeofEthics','NotPartyToThisTradeError','','RecipientAPartyYes');"
                    type="checkbox" class="checkbox" id="RecipientAPartyYes" name="RecipientAPartyYes" value="YES"><span
                    class="checkmark"></span></label><label>YES</label>

                <label class="container" style="width: 3%;"><input class="Checkmark1"
                    onclick="ReferralRebate('RecipientAPartyNO','RecipientAPartyYes','RecipientAPartyNO','ReebateComplywiththeCodeofEthics','NotPartyToThisTradeError','EthicCodeRebateError','RecipientAPartyYes'); ReferralRebateAdditional('ComplyWithEthicNO', 'ComplyWithEthicYes');"
                    type="checkbox" class="checkbox" id="RecipientAPartyNO" name="RecipientAPartyNO" value="NO"><span
                    class="checkmark"></span></label><label>NO</label>

              </div>

              <div style="display:none" id="ReebateComplywiththeCodeofEthics" class="NewSectionSmall">

                <label class="AddRebateReferralTwo">Does the rebate agreement comply with the Code of Ethics?<span
                    class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp"
                      width="16" height="16" loading="lazy"><span class="tooltiptext">Rebates must comply with the Code of
                      Ethics.</span></span></label>


                <label class="container" style="width: 3%;"><input class="Checkmark1"
                    onclick="ReferralRebate('ComplyWithEthicYes','ComplyWithEthicYes','ComplyWithEthicNO','RebateAgreementUpload','EthicCodeRebateError','','ComplyWithEthicYes');"
                    type="checkbox" class="checkbox" id="ComplyWithEthicYes" name="ComplyWithEthicYes"><span
                    class="checkmark"></span></label><label>YES</label></span>

                <label class="container" style="width: 3%;"><input class="Checkmark1"
                    onclick="ReferralRebate('ComplyWithEthicNO','ComplyWithEthicYes','ComplyWithEthicNO','RebateAgreementUpload','EthicCodeRebateError','','ComplyWithEthicYes');"
                    type="checkbox" class="checkbox" id="ComplyWithEthicNO" name="ComplyWithEthicNO" value="NO"><span
                    class="checkmark"></span></label><label>NO</label>




                <div style="display:none; height:auto; width:100%" id="RebateAgreementUpload">

                  <div class="flexibleContainer NewSectionSmall">

                    <label class="AddRebateReferral flexible" style="margin-top: 27px;">Upload
                      a written
                      rebate
                      agreement</label>

                    <div class="flexible">

                      <label style="border-width: 1px; height: 40px; width: 200px; float: left; margin-left: 27px;"
                        for="RebateAgreementDoc" class="custom-file-upload inlineInput">
                        <img src="../ImagesUsed/Upload.png" alt="Upload Document" style="height: 25px;" loading="lazy"> <label for="RebateAgreementDoc" class="UploadDocumentLabel">Upload
                          Document</label>
                      </label>

                      <input style="height: 40px;" class="upload" type="file" value="upload" id="RebateAgreementDocBefore"
                        accept=".pdf" name="RebateAgreementDocBefore" multiple="true">

                    </div>
                  </div>

                  <div class="flexibleContainer" id="RebateDocument" style="display: none;">
                    <div class="flexible" style="margin-top: 0; height: 10px">
                      
                    </div>
                    <div class="flexible" style="margin-left: 28px; margin-top: 0; height: 0px">
                      <label class="documentDone"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
                    </div>
                  </div>
                </div>

              </div>
              <!-- Closing  ReebateComplywiththeCodeofEthics -->

            </div>
            <!-- Closing RebateDisclosureDetailInformation -->

          </div><!-- Closing RebateDisclosure -->

        </div><!--  Closing MainRebate -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span id="Rebaeps1">

              <span class="buttonDiscard floatDataLefttSide">

                <!-- <button style="display: none;" id="RebateDiscard1" type="button" class="dropbtnDiscard" >Discard</button> -->

                <span class="buttonBack">
                  <button id="RebateBack1" type="button" class="buttonBlue"
                    onclick="TabsHandleler(event,'Referral Fee','tabcontent','tablinks1','ReferralFeeTab'); ">Back</button>
                </span>
              </span>

              <span class="secondSpan">

                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn5">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_5" >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving5">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn5">Save and close</button>
    
                <span class="savespan" id="savespan5">
    
                  <button class="buttonSaveOne" type="button" id="RebateSave1" name="RebateSave1"  >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving5', 'Deletebtn5', 'Savebtn5', 'savespan5', 'Deletebtn1_5', 1, event)" type="button">&nbsp;</button>
    
                </span>

                <button id="RebateNext1" type="button" class="buttonBlue" onclick="RebateNext('<%=MyInformation.User_Split%>','<%=0%>', '<%=MyInformation.User_Split2%>', '<%=MyInformation.User_Split3%>', '<%=MyInformation.User_Cap%>', '<%=MyInformation.User_Cap2%>', '<%=MyInformation.User_Cap3%>', '<%=Mycompany.Temp%>');">Next</button>

              </span>

            </span>

            <span style="display:none;" id="Rebaeps2">

              <span class="buttonDiscard floatDataLefttSide">

                <!-- <button style="display: none;" id="RebateDiscard2" type="button" class="dropbtnDiscard" >Discard</button> -->
                <span class="buttonBack">
                  <button id="RebateBack2" type="button" class="buttonBlue"
                    onclick=" TabsHandleler(event,'Referral Fee','tabcontent','tablinks1','ReferralFeeTab'); ">Back</button>
                </span>
              </span>

              <span class="secondSpan">
                
                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn6">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_6" >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving6">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn6">Save and close</button>
    
                <span class="savespan" id="savespan6">
    
                  <button class="buttonSaveOne" type="button" id="RebateSave2" >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving6', 'Deletebtn6', 'Savebtn6', 'savespan6', 'Deletebtn1_6', 1, event)" type="button">&nbsp;</button>
    
                </span>


                <button class="buttonBlue" id="RebateNext2" type="button" onclick="Step1Rebate('<%=MyInformation.User_Split%>','<%=0%>', '<%=MyInformation.User_Split2%>', '<%=MyInformation.User_Split3%>', '<%=MyInformation.User_Cap%>', '<%=MyInformation.User_Cap2%>', '<%=MyInformation.User_Cap3%>', '<%=Mycompany.Temp%>');">Next</button>

              </span>

            </span>

          </div>

        </div>

      </div><!-- Closing Client -->

      <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

      <div id="RebateAmount" class="tabcontent4 ">


        <p id="rebateExceedError" class="ErrorEmpty" style="display:none;">
          Make sure that rebate does not exceed agent's net commission after referral fee payment</p>

        <p class="ErrorEmpty" style="display:none;" id="EmptyRebateError">Complete all required fields before
          proceeding.</p>

        <div id="MainRebateAmountSection">

          <span class="floatDataRightSide" style="display: none;">
            <!-- 
            <span class="tooltip">

              <img src="../ImagesUsed/Subtract.png" alt="MasterBroker" type="button"
                onclick="RemoveOneParties('SelectRebate2','SelectRebate3','SelectRebate4','SecondRebate','ThirdRebate','ForthRebate','AddMoreRebate','RemoveOneRebate');"
                class="lineButton manageListButton" id="RemoveOneRebate" name="RemoveOneRebate" style="display:none;">

              <span class="tooltiptext">Remove Payment</span>

            </span> -->



          </span>


          <div class="EachRebate NewSectionSmall" id="RebateOne">

            <div class="flexibleContainer">

              <div class="flexible itemLongerLawFirm">

                <label class="MandentorySign"></label><label>Rebate amount</label><br>

                <div class="percent inlineInput">

                  <label>$</label> <input class="input5 floatDataRightSide" onblur="limiting(this); "
                    oninput="TotalRebates();" type="number" step="0.01" placeholder="0.00" min="0" id="FirstRebateAmount" maxlength="15"
                    value="0.00" name="FirstRebateAmount">

                </div>

              </div>



              <div class="flexible ">

                <label class="MandentorySign"></label><label>Customer receiving rebate</label>

                <div class="custom-select">

                  <select class="inputSelection" id="RebateCustomerReciever1" name="RebateCustomerReciever1">

                    <option value="">-- Please choose an option --</option>

                  </select>

                </div>
              </div>

              <div class="flexible" style="flex: 0.1 ;">

                <span class="tooltip floatDataRightSide" style="margin-top: 7px;">

                  <img src="../ImagesUsed/AddSVG.svg" alt="MasterBroker" type="button"
                    onclick="AddParties('SecondRebate','ThirdRebate','ForthRebate','AddMoreRebate','RemoveOneRebate');"
                    class="lineButton manageListButton" id="AddMoreRebate" name="AddMoreRebate" loading="lazy">

                  <span class="tooltiptext">Add Payment</span>

                </span>
              </div>

            </div>

          </div>
          <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div style="display:none;" id="SecondRebate" class="EachRebate">

            <div class="flexibleContainer">

              <div class="flexible itemLongerLawFirm">

                <label class="MandentorySign"></label><label>Rebate amount</label><br>

                <div class="percent inlineInput">

                  <label>$</label> <input class="input5 floatDataRightSide" oninput="TotalRebates();" type="number" step="0.01"  onblur="limiting(this); " maxlength="15"
                    placeholder="0.00" min="0" value="0.00" id="SecondRebateAmount" name="SecondRebateAmount">

                </div>
              </div>

              <div class="flexible ">

                <label class="MandentorySign"></label><label>Customer receiving rebate</label>

                <div class="custom-select">

                  <select class="inputSelection" id="RebateCustomerReciever2" name="RebateCustomerReciever2">

                    <option value="">-- Please choose an option --</option>

                    <option value="one">one
                    </option>

                  </select>

                </div>

              </div>

              <div class="flexible" style="flex: 0.1;">

                <span class="tooltip floatDataRightSide" style="margin-top: 24px;">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick=" RemoveOneParty('SecondRebate','ThirdRebate','ForthRebate','AddMoreRebate');"
                    style="display: inline;" id="RemoveRebate2" name="RemoveRebate2" loading="lazy">
                  <span class="tooltiptext">Remove Rebate</span>
                </span>
              </div>

            </div>

          </div><!-- Closing SecondRebate -->

          <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

          <div style="display:none" id="ThirdRebate" class="EachRebate">

            <div class="flexibleContainer">

              <div class="flexible itemLongerLawFirm">


                <label class="MandentorySign"></label><label>Rebate amount</label>

                <br>

                <div class="percent inlineInput">

                  <label>$</label> <input class="input5 floatDataRightSide" oninput="TotalRebates();" type="number" step="0.01" onblur="limiting(this); " maxlength="15"
                    placeholder="0.00" min="0" value="0.00" id="ThirdRebateAmount" name="ThirdRebateAmount">

                </div>

              </div>

              <div class="flexible ">

                <label class="MandentorySign"></label><label>Customer receiving rebate</label>

                <div class="custom-select">

                  <select class="inputSelection" id="RebateCustomerReciever3" name="RebateCustomerReciever3">

                    <option value="">-- Please choose an option --</option>

                  </select>

                </div>

              </div>

              <div class="flexible" style="flex: 0.1;">
                <span class="tooltip floatDataRightSide" style="margin-top: 24px;">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick=" RemoveOneParty('ThirdRebate','SecondRebate','ForthRebate','AddMoreRebate');"
                    style="display: inline;" id="RemoveRebate3" name="RemoveRebate3" loading="lazy">
                  <span class="tooltiptext">Remove Rebate</span>
                </span>
              </div>

            </div>

          </div><!-- Closing Third Rebate -->

          <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->


          <div style="display:none" id="ForthRebate" class="EachRebate">

            <div class="flexibleContainer">

              <div class="flexible itemLongerLawFirm">

                <label class="MandentorySign"></label><label>Rebate amount</label><br>

                <div class="percent inlineInput">

                  <label>$</label> <input class="input5 floatDataRightSide" oninput="TotalRebates();" type="number" step="0.01" onblur="limiting(this);" maxlength="15"
                    placeholder="0.00" min="0" value="0.00" id="ForthRebateAmount" name="ForthRebateAmount">

                </div>

              </div>

              <div class="flexible ">

                <label class="MandentorySign"></label><label>Customer receiving rebate</label>

                <div class="custom-select">

                  <select class="inputSelection" id="RebateCustomerReciever4" name="RebateCustomerReciever4">

                    <option value="">-- Please choose an option --</option>

                    <option value="one">One</option>
                  </select>

                </div>

              </div>

              <div class="flexible" style="flex: 0.1;">
                <span class="tooltip floatDataRightSide" style="margin-top: 24px;">
                  <img src="../ImagesUsed/RemoveSVG.svg" class="lineButtonMinus manageListButton" alt="-" type="button"
                    onclick="RemoveOneParty('ForthRebate','ThirdRebate','SecondRebate','AddMoreRebate');"
                    style="display: inline;" id="RemoveDeposit4" name="RemoveDeposit4" loading="lazy">
                  <span class="tooltiptext">Remove Rebate</span>
                </span>
              </div>

            </div>

          </div><!-- Closing ForthRebate-->


          <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
          <div class="flexibleContainer">

            <div class="flexible itemLongerLawFirm">

              <label class="NoMandatoryTwo"></label><label>Total Rebates Amounts</label><br>

              <div class="percent inlineInput" style="background: #f3f3f3;"> <label>$</label>
                <input class="input5" type="text" value="0.00" id="TotalRebats" name="TotalRebats"
                  style="background: #f3f3f3;" readonly>
              </div>

            </div>

            <div class="flexible"></div>

            <div class="flexible" style="flex: 0.1;"></div>

          </div>

          <div style="display:none;   padding-top:0px; " id="RebateAgentsAllocations">

            <label class="HeadLinesSecondary" style="padding-top: 60px;    margin-left: 8px;">Rebate Fee
              Allocation</label>

            <hr style="margin-right: 4px;">

            <div class="flexibleContainer">

              <div class="flexible" style="flex: 1.9;">

                <label class="MandentorySign floatDataLefttSide" style="margin-top: 7px;"></label>

                <label id="RebateAgentName1" name="RebateAgentName1">First Agent Name</label>

              </div>

              <div class="percent inlineInput flexible">

                <label>%</label>

                <input class="input5" onblur="limiting(this); " oninput="maxLengthCheck100(this); TotalPercentageCalculation('RebateAgent1amount','RebateAgent2amount');  
                
                
                CalcluationOfAmounts('RebateAgent1amount','RebateAgent2amount','TotalRebats','RebateAmounts1','RebateAmounts2')
                
                
                " type="number" step="0.01" min="0" placeholder="100.00" value="100.00" max="100" id="RebateAgent1amount"
                  name="RebateAgent1amount">

              </div>



              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label>$</label>

                <input class="input5" type="text" value="" id="RebateAmounts1" name="RebateAmounts1"
                  style="background: none;" readonly="readonly">
              </div>

            </div>

            <div class="flexibleContainer">

              <div class="flexible" style="flex: 1.9;">

                <label style="margin-left: 21px;" id="RebateAgentName2">Second Agent Name</label>

              </div>

              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label>%</label>

                <input class="input5" type="number" step="0.01" placeholder="0.00" value="0.00" id="RebateAgent2amount"
                  style="background: none;" name="RebateAgent2amount" readonly="readonly">

              </div>

              <div class="percent inlineInput flexible" style="background: #f3f3f3;">

                <label>$</label>

                <input class="input5" type="text" value="" id="RebateAmounts2" name="RebateAmounts2"
                  style="background: none;" readonly="readonly">

              </div>

            </div>

          </div><!-- Closing RebateAgentsAllocations -->

        </div><!-- Closing MainRebateAmountSection -->

        <div class="Footer FooterButton">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide" id="Reba eps">

              <!-- <button style="display: none;" id="Rebate2Discard" type="button" class="dropbtnDiscard" >Discard</button> -->
              <span class="buttonBack">
                <button id="Rebate2back" type="button" class="buttonBlue"
                  onclick="TabsHandleler(event,'Client','tabcontent4','tablinks4','RebateClientSection');">Back</button>
              </span>
            </span>

            <span class="secondSpan">

              <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn17">Delete</button>
              <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_17" >Discard</button>
              <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving17">Exit without saving</button>
              <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn17">Save and close</button>
  
              <span class="savespan" id="savespan17">
  
                <button class="buttonSaveOne" type="button" id="Rebate2Save" name="Rebate2Save">Save</button>
                
                <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving17', 'Deletebtn17', 'Savebtn17', 'savespan17', 'Deletebtn1_17', 1, event)" type="button">&nbsp;</button>
  
              </span>

              <button class="buttonBlue" id="Rebate2next" type="button" onclick="Step2Rebate('<%=MyInformation.User_Split%>','<%=0%>', '<%=MyInformation.User_Split2%>', '<%=MyInformation.User_Split3%>', '<%=MyInformation.User_Cap%>', '<%=MyInformation.User_Cap2%>', '<%=MyInformation.User_Cap3%>', '<%=Mycompany.Temp%>');">Next</button>
            </span>

          </div>

        </div>

      </div><!-- Closing Rebate Amount -->

    </div><!-- Closing Customer Rebate Tab Content -->

    <!-- ***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************8 -->

    <div id="TRS" class="tabcontent content" style="max-width: 800px; display: none;">

      <label style="box-sizing: content-box; width: auto;" class="HeadLines">TRADE RECORD SHEET</label>
      
      <span class="floatDataRightSide">

        <span class="tooltip">
          <!-- <button class="lineButton manageListButton" type="button" id="invoicep" onclick="onClick('invoicep');"> -->
          <img class="lineButton printButton" type="button" id="TRSPrint" src="../ImagesUsed/Print.png"
            alt="Print">
          <span class="tooltiptext">Print page</span>
        </span>

      </span>

      <!-- This Span contains the Property information -->

      <div class="forAddressTop">

        <label id="Property6"></label>

      </div>

      <hr class="addressHr" style="margin-right: 4px; margin-bottom: 22px;">

      <p id="WarningClosingFinalize" class="ErrorEmpty" style="display: none;">The deal can only be finalized after closing</p>

      <div id="MainTRSsection">

        <label id="TRStopLabel" style="font-weight: bold; margin-bottom: 10px;">TRADE RECORD SHEET</label>

        <div id="Transaction Information" class="cardsDetails flexibleContainer" style="width: 100%; max-width: 800px;">


          <div class="columnSmall flexible" style="padding-left: 0;">

            <div class="card" >

              <label class="TRSlabel">Transaction
                Price</label>

              <span class="cardSpan"><label class="TRSinput" type="text" id="TRSPrice" name="TRSPrice"></label></span>
              <br>

              <label class="TRSlabel" style="margin-top: 7px;">List
                Commission</label>

              <span class="cardSpan"><label style="text-align: right; height: 25px; margin-top: 6px;"  class="TRSinput" type="text" id="TRSListCommissionPercent"
                  name="TRSListCommissionPercent"></label></span>

              <br>

              <label class="TRSlabel">Sell
                Commission</label>

              <span class="cardSpan"><label class="TRSinput" type="text" id="TRSSellCommissionPercent"
                  name="TRSSellCommissionPercent"></label></span>

            </div>

          </div>

          <div class="columnSmall flexible">

            <div class="card">

              <label class="TRSlabel">Status</label>

              <span class="cardSpan"><label class="TRSinput" type="text" id="TRSStatus" name="TRSStatus"
                  value=""></label></span>

              <br>

              <label style="margin-top: 7px;" class="TRSlabel">Listing</label>

              <span class="cardSpan"><label class="TRSinput" style=" text-align: right; height: 25px; margin-top: 6px;"  type="text" id="TRSListingSide" name="TRSListingSide"
                  value=""></label></span>

              <br>

              <label class="TRSlabel">Source</label>

              <span class="cardSpan"><label class="TRSinput" type="text" id="TRSSource" name="TRSSource"
                  value=""></label></span>

            </div>

          </div>

          <div class="columnSmall flexible" style="padding-right: 10px;">

            <div class="card" >

              <label class="TRSlabel">Closing</label>

              <span class="cardSpan"><label class="TRSinput" type="text" id="TRSClosingDate" name="TRSClosingDate"
                  value=""></label></span>

              <br>

              <label class="TRSlabel" style="margin-top: 7px;">MLS</label>

              <span class="cardSpan"><label style="text-align: right; height: 25px; margin-top: 6px;" class="TRSinput" type="text" id="TRSMLS" name="TRSMLS"
                  value=""></label></span>


              <br>

              <label class="TRSlabel" style="width: 80px; " id="ReceivableLabel" name="ReceivableLabel">
                Receivable
                </label>

              <span class="cardSpan"><label class="TRSinput" style="text-align:right; " id="ReciveOrRefoundAmount"
                  name="ReciveOrRefoundAmount" type="text" value="check"></label></span>
            </div>

          </div>

        </div><!-- Closing Transaction Information -->


        <div id="DetailsParties&ContactInformation" class="DetailsPartiesAndContactInformation"
          style="margin-left: -14px; margin-top: 30px;">

          <p class="heavyfont headerTRS" >
            Parties and Contact Details</p>

          <table style="width:100%;" id="tableOne" class="NewSectionSmall">

            <tr>
              <th width="16%" style="padding-left:14px; text-align: left;">Party</th>

              <th width="22%">Name</th>

              <th width="22%">Company</th>

              <th width="27%">Address</th>

              <th width="13%">Phone</th>
            </tr>

            <tr id="displayVendor1">

              <td><input class="inlineInput" style="padding-left: 8px;" type="text" id="VendorLandlord1" value="Vendor" readonly>
              </td>

              <td><textarea class="inlineInput" id="TRSVendorName1" style="resize: none; height: 30px;"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSVendorCompany1"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSVendorAddress1" name="TRSVendorAddress1" value=""
                  style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSVendorPhone1" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="displayVendor2" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="VendorLandlord2" value="Vendor" readonly>
              </td>

              <td><textarea class="inlineInput" id="TRSVendorName2" style="resize: none; height: 30px;"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSVendorCompany2"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSVendorAddress2" name="TRSVendorAddress2" value=""
                  style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" class="textRight" id="TRSVendorPhone2" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="displayVendor3" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="VendorLandlord3" value="Vendor" readonly>
              </td>

              <td><input class="inlineInput" id="TRSVendorName3" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSVendorCompany3"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSVendorAddress3" name="TRSVendorAddress3" value=""
                  style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSVendorPhone3" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="displayVendor4" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="VendorLandlord4" value="Vendor" readonly>
              </td>

              <td><input class="inlineInput" id="TRSVendorName4" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSVendorCompany4"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSVendorAddress4" name="TRSVendorAddress4" value=""
                  style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSVendorPhone4" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="displayVendorlawyer" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="VendorLandlordLawyer" value="Vendor's Lawyer" readonly>
              </td>

              <td><input class="inlineInput" id="TRSVendorLawyerName" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSVendorLawyerCompany"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSVendorLawyerAddress" name="TRSVendorLawyerAddress"
                  value="" style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSVendorLawyerPhone" value="" style="padding: 0;" readonly></td>
            </tr>

            <tr>
              <td><input class="inlineInput" style="padding-left:8px" type="text" id="PurchaserTenant1" value="Purchaser" readonly>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserName1" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSPurchaserCompany1"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSPurchaserAddress1" name="TRSPurchaserAddress1"
                  value="" style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSPurchaserPhone1" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="DisplayPurchaser2"  style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="PurchaserTenant2" value="Purchaser" readonly>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserName2" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSPurchaserCompany2"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSPurchaserAddress2" name="TRSPurchaserAddress2"
                  value="" style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSPurchaserPhone2" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="DisplayPurchaser3" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="PurchaserTenant3" value="Purchaser" readonly>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserName3" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSPurchaserCompany3"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSPurchaserAddress3" name="TRSPurchaserAddress3"
                  value="" style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" class="textRight" id="TRSPurchaserPhone3" value="" style="padding: 0;" readonly>
              </td>

            </tr>

            <tr id="DisplayPurchaser4" style="display: none;">

              <td> <input class="inlineInput" style="padding-left:8px" type="text" id="PurchaserTenant4" value="Purchaser" readonly>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserName4" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSPurchaserCompany4"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSPurchaserAddress4" name="TRSPurchaserAddress4"
                  value="" style="resize: none; height: 30px;" readonly></textarea></td>

              <td><input class="inlineInput" id="TRSPurchaserPhone4" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="displayPurchaserLawyer" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" value="Purchaser's Lawyer" readonly>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserLawyerName" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSPurchaserLawyerCompany"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSPurchaserLawyerAddress"
                  name="TRSPurchaserLawyerAddress" value="" style="resize: none; height: 30px;" readonly></textarea>
              </td>

              <td><input class="inlineInput" id="TRSPurchaserLawyerPhone" value="" style="padding: 0;" readonly></td>

            </tr>

            <tr id="OtherBrokerageDisplay" style="display: none;">

              <td><input class="inlineInput" style="padding-left:8px" type="text" value="Other Brokerage" readonly>
              </td>

              <td><input class="inlineInput" id="TRSOtherBrokerageName" value="" readonly></td>

              <td><textarea class="inlineInput" style="resize: none; height: 30px;" id="TRSOtherBrokerageCompany"
                  value="" readonly></textarea></td>

              <td><textarea class="inlineInput" type="text" id="TRSOtherBrokerageAddress"
                  name="TRSOtherBrokerageAddresss" value="" style="resize: none; height: 30px;" readonly></textarea>
              </td>

              <td><input class="inlineInput" id="TRSOtherBrokeragePhone" value="" style="padding: 0;" readonly></td>
            </tr>

          </table>

        </div><!-- Closing DetailsParties&ContactInformation -->

        <div class="depRow DetailsPartiesAndContactInformation flexibleContainer" id="Agent&Deposit"
          style="margin-left: -18px; margin-top: 14px; width: calc(100% + 26px);">

          <div class="depColumn flexible" id="Agents" style="flex: 1.3;">

            <p id="AgentLabelTRS" class="heavyfont headerTRS">Agents</p>

            <table id="AgentTable" class="NewSectionSmall">

              <tr style="text-align: center;">

                <th width="40%" style="text-align: left; padding-left: 14px;">Name</th>

                <th width="7%" class="headlineright" id="AgentsAllocationHeader">Allocation</th>

                <th width="15%" class="headlineright">Split</th>

                <!-- <th class="underLine" width="2%"></th> -->

                <th width="20%" class="headlineright">Base</th>

                <!-- <th class="underLine" width="2%"></th> -->

                <th width="23%" class="headlineright">Net</th>

              </tr>

              <tr>

                <td><input class="inlineInput" type="text" style="padding-left:8px" id="TRSAgentName1" value="" readonly>
                </td>

                <td class="underLine" id="AgentAllocationRow1"><input class="inlineInput" type="text" id="Allocation1"
                    style="text-align: right;" value="" readonly>
                </td>

                <td><input class="inlineInput" type="text" id="TRSSplit1" name="TRSSplit1" value="" style="text-align: right;" readonly>
                </td>

                <!-- <td>$</td> -->

                <td><input class="inlineInput numberclass textRight" type="text" id="TRSAgentCommision1"  name="TRSAgentCommision1" value="" readonly>
                </td>

                <!-- <td>$</td> -->

                <td><input class="inlineInput numberclass textRight" type="text" id="TRSAgentNet1" name="TRSAgentNet1"
                    value="" readonly>
                </td>

              </tr>

              <tr id="Agent2Details">

                <td> <input class="inlineInput" style="padding-left:8px" type="text" id="TRSAgentName2" value="" readonly>
                </td>

                <td id="AgentAllocationRow2"><input class="inlineInput" type="text" id="Allocation2"
                    style="text-align: right;" value="" readonly>
                </td>

                <td><input class="inlineInput" type="text" id="TRSSplit2" value="" style="text-align: right;" readonly>
                </td>

                <!-- <td class="underLine"></td> -->

                <td><input class="inlineInput textRight numberclass underLine" type="text" id="TRSAgentCommision2" name="TRSAgentCommision2"
                    value="" readonly>
                </td>

                <!-- <td class="underLine"></td> -->

                <td><input class="inlineInput textRight numberclass underLine" type="text" id="TRSAgentNet2" value="" readonly>
                </td>
              </tr>

              <tr class="topLine">

                <td> <input class="inlineInput" id="" value="Total" style="padding-left:8px" readonly></td>

                <td class="underLine" id="AgentAllocationRowTotal"><input class="inlineInput" type="number" step="0.01"
                    id="Allocation2" value="" readonly>
                </td>

                <td><input class="inlineInput" type="text" id="TRSSplit2" readonly></td>

                <!-- <td>$</td> -->

                <td><input class="inlineInput numberclass textRight" type="text" id="TRSAgentCommision3" value="" readonly></td>

                <!-- <td>$</td> -->

                <td><input class="inlineInput numberclass textRight" type="text" id="TRSAgentNet3" value="" readonly>
                </td>
              </tr>

            </table>

          </div><!-- Closing Agents -->

          <div id="TRSDeposits" class="depColumn flexible" >

            <p class="heavyfont headerTRS"> Deposit</p>

            <table id="depositsTable" class="NewSectionSmall">

              <tr id="Deposit1Row">

                <th width="46%" style="padding-left:14px; text-align: left;">Name</th>

                <th width="27%">Date</th>

                <!-- <th class="underLine" width="2%"></th> -->

                <th width="27%" class="headlineright">Amount</th>

                <!-- <th>Type</th> -->

              </tr>

              <tr>

                <td><textarea class="inlineInput" style="resize: none; height: 30px; padding-left: 8px;" type="text"
                    id="DepositsName1" value="" readonly></textarea>
                </td>

                <td><input class="inlineInput" type="text" id="DepositsDate1" value="" readonly>
                </td>

                <!-- <td>$</td> -->

                <td><input class="textRight numberclass inlineInput" type="text" id="DepositsAmount1" value="" readonly>
                </td>

                <!-- <td><input type="text" id="DepositsType1"
                                                                               value=""></td> -->

              </tr>

              <tr id="Displaydeposit2">

                <td><textarea class="inlineInput" style="resize: none; height: 30px;padding-left:8px" type="text"
                    id="DepositsName2" value="" readonly></textarea>
                </td>

                <td><input class="inlineInput" type="text" id="DepositsDate2" value="" readonly>
                </td>

                <!-- <td></td> -->

                <td><input class="inlineInput numberclass textRight" type="text" id="DepositsAmount2" value="" readonly>
                </td>
                <!-- <label class="floatDataLefttSide" style="margin-left: 0;margin-right: 0;"></label> -->
               

              </tr>

              <tr id="Displaydeposit3">

                <td><textarea class="inlineInput" style="resize: none; height: 30px;padding-left:8px" type="text"
                    id="DepositsName3" value="" readonly></textarea>
                </td>

                <td><input class="inlineInput" type="text" id="DepositsDate3" value="" readonly>
                </td>

                <!-- <td></td> -->

                <td><input class="textRight numberclass inlineInput" type="text" id="DepositsAmount3" value="" readonly>
                </td>

                <!-- <td><input type="text" id="DepositsType3"
                                                                               value=""></td> -->

              </tr>

              <tr id="Displaydeposit4">

                <td><textarea class="inlineInput" style="resize: none; height: 30px; padding-left:8px" type="text"
                    id="DepositsName4" value="" readonly></textarea>
                </td>

                <td><input class="inlineInput" type="text" id="DepositsDate4" value="" readonly>
                </td>

                <!-- <td></td> -->

                <td><input class="textRight numberclass inlineInput" type="text" id="DepositsAmount4" value="" readonly>
                </td>


              </tr>

              <tr id="" class="topLine">

                <td><input style="padding-left:8px" class="inlineInput" type="text" value="Total" readonly></td>

                <td><input class="inlineInput" type="text" id="" value="" readonly>
                </td>

                <!-- <td class="topLine">$</td> -->

                <td><input class="textRight numberclass inlineInput" type="text" id="TRSTotalDeposits"
                    name="TRSTotalDeposits" value="10000.00" step=".01" readonly>
                </td>

              </tr>

            </table>


          </div><!-- Closing Deposits -->

        </div><!-- Closing Agent&Deposit -->


        <div class="DetailsPartiesAndContactInformation" style="margin-left: -14px; ">

          <button id="Editbtn" type="button" class="EditButton" onclick="editHST();" style="background-color: white">Edit HST</button>
          <button id="EditSubmit" type="button" style="display: none;" class="EditButton"
            onclick="submitHST();">Confirm</button>
          <button id="EditDiscard" type="button" style="display: none;" class="EditButton"
            >Reset</button>
            
          <p class="heavyfont headerTRS" style="margin-top: 8px;">Commission Income</p>

          <table id="CommisionsIncome" class="NewSectionSmall">

            <tr style="text-align: center;">

              <th width="28%" class="underLine" style="text-align: left;padding-left: 14px;">Name</th>

              <th width="20%" class="underLine" style="text-align: left;     padding-left: 5px;">Description</th>

              <!-- <th class="underLine" width="2%"></td> -->

              <th width="12%" class="underLine headlineright">Commission</th>

              <!-- <th class="underLine" width="2%"></td> -->

              <th width="17%" id="CommissionHeader" class="underLine headlineright">HST</th>

              <th width="9%" id="HSTHead1" style="display: none;" class="underLine headlineright ChangedHST">HST (%)</th>

              <!-- <th class="underLine" width="2%"></td> -->

              <th width="17%" class="underLine headlineright">Total</th>

            </tr>

            <tr id="List">

              <td><input class="inlineInput" style="padding-left:8px" id="TRSListCommissionName" type="text" value="" readonly>
              </td>

              <td> <input class="inlineInput" type="text" value="Listing commissions"  readonly> </td>

              <!-- <td class="dollar"></td> -->

              <td><input class="inlineInput textRight numberclass" id="TRSListCommission"
                  name="TRSListCommission" type="text" value="0" readonly>
              </td>

              <!-- <td class="dollar"></td> -->

              <td><input class="inlineInput  textRight numberclass" type="text" id="TRSListHTS"
                  name="TRSListHTS" value="0" readonly></td>

              <td style="display: none;" class="ChangedHST" id="TRSListHTSPercentTD"><input
                  class="inlineInput  textRight numberclass withBorder" onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="TRSListHTSPercent" name="TRSListHTSPercent" value="13.00"></td>

              <!-- <td class="dollar"></td> -->

              <td><input class="inlineInput textRight numberclass" type="text" id="TRSTotalListCommission"
                  name="TRSTotalListCommission" value="0" readonly> </td>

            </tr>

            <tr id="sell">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="TRSSellCommissionName"
                  name="TRSSellCommissionName" value="" readonly>
              </td>

              <td><input class="inlineInput" type="text" value="Selling commissions" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="TRSSellCommission"
                  name="TRSSellCommission" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" id="TRSSellCommissionHTS"
                  name="TRSSellCommissionHTS" value="0" readonly>
              </td>

              <td style="display: none;" class="ChangedHST" id="TRSSellCommissionHTSPercentTD"><input
                  class="withBorder inlineInput textRight numberclass" onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="TRSSellCommissionHTSPercent" name="TRSSellCommissionHTSPercent" value="13.00"></td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="TRSTotalSellCommission"
                  name="TRSTotalSellCommission" value="0" readonly></td>

            </tr>

            <tr class="topLine">

              <td><input class="inlineInput" style="padding-left:8px" type="text" value="Receivable" readonly></td>

              <td></td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="TRSTotalCommissions"
                  name="TRSTotalCommissions" value="" readonly>
              </td>


              <td><input class="inlineInput textRight numberclass" type="text" id="TRSTotaHST" name="TRSTotaHST"
                  value="" readonly>
              </td>

              <td style="display: none;" id="EmptyPercent"></td>


              <td><input class="inlineInput  textRight numberclass " type="text" id="TRSTotalFinalCommissions"
                  name="TRSTotalFinalCommissions" value="" readonly>
              </td>

            </tr>

          </table>

        </div>


        <div class="DetailsPartiesAndContactInformation" style="margin-left: -14px; margin-top: 30px;">
          
          <p class="heavyfont headerTRS">Expenses</p>

          <table id="tableExpenses" class="NewSectionSmall">

            <tr style="text-align: center">
              <th width="28%" style="text-align: left; padding-left: 14px;">Name</th>

              <th width="20%" style="text-align: left;     padding-left: 5px;">Description</th>

              <th width="12%" class="headlineright">Payment</th>

              <th id="ExpensesHeader" class="headlineright" width="17%">HST</th>

              <th style="display: none;" class="headlineright" id="HSTHead" width="9%">HST (%)</th>

              <th width="17%" class="headlineright">Total</th>

            </tr>

            <tr id="ExpensesCo-operatingBrokerage">

              <td><input class="inlineInput" style="padding-left:8px" type="text"
                  id="Co-operatingBrokerageExpensesName" value="" readonly>
              </td>

              <td><input class="inlineInput " type="text" id="Cooperatingcommission" value="Cooperating commission" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text"
                  id="Co-operatingBrokerageExpensesNet" name="Co-operatingBrokerageExpensesNet" value="0" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text"
                  id="Co-operatingBrokerageExpensesHST" name="Co-operatingBrokerageExpensesHST" value="0" readonly>
              </td>

              <td id="Co-operatingBrokerageExpensesHSTPercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="Co-operatingBrokerageExpensesHSTPercent" name="Co-operatingBrokerageExpensesHSTPercent" value="13.00"> </td>

              <td><input class="inlineInput  textRight numberclass" type="text"
                  id="Co-operatingBrokerageExpensesTotalAmount" name="Co-operatingBrokerageExpensesTotalAmount" value="0" readonly>
              </td>

            </tr>

            <tr id="ExpensesReferral">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="ExpensesReferralAgentName"
                  value="Referral fee" readonly>
              </td>

              <td><input class="inlineInput" type="text" id="ExpensesReferralfee" value="Referral fee" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="ExpensesReferralAgentNet"
                  name="ReferralAgentNet" value="0" readonly></td>

              <td><input class="inlineInput textRight numberclass" type="text" id="ExpensesReferralAgentHST"
                  name="ReferralAgentHST" value="0" readonly>
              </td>

              <td id="ExpensesReferralAgentHSTPercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="ExpensesReferralAgentHSTPercent" name="ExpensesReferralAgentHSTPercent" value="13.00"> </td>

              <td><input class="inlineInput  textRight numberclass" type="text"
                  id="ExpensesReferralAgentTotalAmount" name="ReferralAgentTotalAmount" value="0" readonly>
              </td>

            </tr>

            <tr id="Expensescustomer1">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="CustomerName1" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="CustomerRebate1" value="Rebate" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerNet1"
                  name="CustomerNet1" id="Rebate1" name="Rebate1" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" value="0.00" id="CustomerHST1"
                  name="CustomerHST1" readonly>
              </td>

              <td id="CustomerHST1PercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="CustomerHST1Percent" name="CustomerHST1Percent" value="0.00"> </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerTotalAmount1"
                  name="CustomerTotalAmount1" value="" readonly>
              </td>

            </tr>

            <tr id="Expensescustomer2">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="CustomerName2" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="CustomerRebate2" value="Rebate" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerNet2"
                  name="CustomerNet2" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" value="0.00" id="CustomerHST2"
                  name="CustomerHST2" readonly>
              </td>

              <td id="CustomerHST2PercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="CustomerHST2Percent" name="CustomerHST2Percent" value="0.00"> </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerTotalAmount2"
                  name="CustomerTotalAmount2" value="" readonly>
              </td>

            </tr>

            <tr id="Expensescustomer3">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="CustomerName3" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="CustomerRebate3" value="Rebate" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerNet3"
                  name="CustomerNet3" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" value="0.00" id="CustomerHST3"
                  name="CustomerHST3" readonly>
              </td>

              <td id="CustomerHST3PercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="CustomerHST3Percent" name="CustomerHST3Percent" value="0.00"> </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerTotalAmount3"
                  name="CustomerTotalAmount3" value="" readonly>
              </td>

            </tr>

            <tr id="Expensescustomer4">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="CustomerName4" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="CustomerRebate4" value="Rebate" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerNet4"
                  name="CustomerNet4" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" value="0.00" id="CustomerHST4"
                  name="CustomerHST4" readonly>
              </td>

              <td id="CustomerHST4PercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="CustomerHST4Percent" name="CustomerHST4Percent" value="0.00"></td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="CustomerTotalAmount4"
                  name="CustomerTotalAmount4" value="" readonly>
              </td>

            </tr>

            <tr id="ExpensesAgent1">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="AgentExpenses1" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="AgentExpensesCommission1" value="Commission" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="AgentExpensesNet1"
                  name="AgentExpensesNet1" value="0" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" id="AgentExpensesHST1"
                  name="AgentExpensesHST1" value="0" readonly>
              </td>

              <td id="AgentExpensesHST1PercentTD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)"  type="text"
                  id="AgentExpensesHST1Percent" name="AgentExpensesHST1Percent" value="13.00">
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="AgentExpensesTotalAmount1"
                  name="AgentExpensesTotalAmount1" value="0" readonly>
              </td>

            </tr>

            <tr id="ExpensesAgent2">

              <td><input class="inlineInput" style="padding-left:8px" type="text" id="AgentExpenses2" value="" readonly></td>

              <td><input class="inlineInput" type="text" id="AgentExpensesCommission2" value="Commission" readonly>
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="AgentExpensesNet2"
                  name="AgentExpensesNet2" value="0" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" id="AgentExpensesHST2"
                  name="AgentExpensesHST2" name="AgentExpensesHST2" value="0" readonly>
              </td>

              <td id="AgentExpensesHST2Percent2TD" class="ChangedHST" style="display: none;"><input
                  class="withBorder inlineInput textRight numberclass" type="text"onblur="addPercent(this.id);" oninput="maxlengthCheckHST(this)" 
                  id="AgentExpensesHST2Percent" name="AgentExpensesHST2Percent" value="13.00">
              </td>

              <td><input class="inlineInput  textRight numberclass" type="text" id="AgentExpensesTotalAmount2"
                  name="AgentExpensesTotalAmount2" value="0" readonly>
              </td>

            </tr>

            <tr class="topLine">

              <td><input class="inlineInput" style="padding-left:8px" type="text" value="Payable" readonly>
              </td>

              <td></td>

              <td><input class="inlineInput   textRight numberclass" type="text" id="TotalExpensesPurAmounts"
                  name="TotalExpensesPurAmounts" value="" readonly>
              </td>

              <td><input class="inlineInput textRight numberclass" type="text" id="HSTExpensesAmounts"
                  name="HSTExpensesAmounts" value="" readonly>
              </td>

              <td id="EmptyPercent2" style="display: none;"></td>


              <td><input class="inlineInput  textRight numberclass" type="text" id="TotalExpensesAmount"
                  name="TotalExpensesAmount" value="" readonly>
              </td>

            </tr>

            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td id="EmptyPercent3" style="display: none;"></td>
              <td></td>
            </tr>

            <tr>

              <td><input class="inlineInput" style="padding-left:8px" type="text" value="Net To Brokerage" readonly></td>

              <td></td>

              <!-- <td>$</td> -->

              <td><input class="inlineInput   textRight numberclass" type="text" id="TotalNetToBrokeragePurAmounts"
                  name="TotalNetToBrokeragePurAmounts" value="" readonly>
              </td>

              <!-- <td>$</td> -->

              <td><input class="inlineInput  textRight numberclass" type="text" id="HSTNetToBrokerageAmounts"
                  name="HSTNetToBrokerageAmounts" value="" readonly>
              </td>

              <td id="EmptyPercent4" style="display: none;"></td>

              <!-- <td>$</td> -->

              <td><input class="inlineInput   textRight numberclass" type="text" id="TotalNetToBrokerageAmount"
                  name="TotalNetToBrokerageAmount" value="" readonly>
              </td>

            </tr>

          </table>

        </div>

        <div>


          <p id="TermsError" class="ErrorEmpty" style="display: none;">You need to accept terms and conditions before you can finalize this deal. </p>

          <div class="NewSectionSmall flexibleContainer" id="ConfirmationRecordCheckbox">
            <label class="container flexible" style="flex: 0.01;"><input class="inlineInput" onclick="completeRecord()" type="checkbox" id="ConfirmationRecordSheet"
                name="ConfirmationRecordSheet" value="YES"><span class="checkmark" style="top: 13px;"></span></label>
            <label class="flexible" style="line-height: 1.5;margin-left: 26px; margin-top: 10px;">
              <!-- <label class="MandentorySign"></label> -->
              It is understood between all parties that this
              agreement shall constitute a Commission Trust Agreement as set out in
              the contract.
              <br>
              To the best of my knowledge the information provided in this trade
              record is correct.</label></div>

        </div>

        <div class="NewSectionSmall flexibleContainer" style="margin-top: 40px; display: none;">

          <label class="flexible" style="flex: 0.4;">DATED at</label>

          <input class="inlineInput flexible" style="margin-top: 1px;" type="text">

          <label class="flexible" style="flex: 1; text-align: center;" for="">Ontario, on
            28-Jul-2021</label>

          <input class="inlineInput flexible" style=" margin-top: 1px; " type="text">

          <label class="flexible" style="flex: 0.4; text-align: right;" for="">First
            Agent</label>

        </div>

      
        <div class="FooterButton" id="TRSFooterSection">

          <div class="FooterButtonSpan">

            <span class="buttonDiscard floatDataLefttSide">

              <!-- <button style="display: none;" type="button" id="TRSDiscard" class="dropbtnDiscard" >Discard</button> -->

              <span class="buttonBack">

                <button class="buttonBlue" id="TRSBack" type="button"
                  onclick="	TabsHandleler(event, 'Customer Rebate','tabcontent','tablinks1','CustomerRebateTab');	TabsHandleler(event,'Client','tabcontent4','tablinks4','RebateClientSection');">Back</button>

              </span>
            </span>



            <span class="secondSpan" style="margin-right: -114px;">

              <span class="savespan">
   
                <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn7">Delete</button>
                <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_7"  >Discard</button>
                <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving7">Exit without saving</button>
                <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn7">Save and close</button>
    
                <span class="savespan" id="savespan7">
    
                  <button class="buttonSaveOne" type="button" id="RecordsheetSave" name="RecordsheetSave" >Save</button>
                  <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving7', 'Deletebtn7', 'Savebtn7', 'savespan7', 'Deletebtn1_7', 1, event); closefinalize(event)" type="button">&nbsp;</button>
    
                </span>

              </span>

              
              <button class="dropdownMenubtn buttonBlue sendtoclosedbtn" type="button" id="SendtoClsed" name="SendtoClsed" >Send to closed</button>

              <span class="savespan" id="finalizeSpan">
                <button class="buttonBlue" id="TRSNExt" name="TRSNExt"
                  type="button">Finalize</button>
                <button id="TRSNextExpand" class="buttonSaveTwo" style="background: #29c1e1; display: none;" onclick="openFinlizeWindow('finalizeSpan',event)"
                  type="button">&nbsp;</button>

              

            </span>
            </span>
          </div>

        </div>

      </div><!-- Closing Main TRS section -->

    </div><!-- Closing  TRS Section -->

    <!--***************************************************************************************************************************************************************************************************************************************************************************************************************************************-->
 

    <div id="Documents" class="tabcontent content" style="display: none;">

      <label class="HeadLines">TRADE RECORD SHEET</label>

      <div class="forAddressTop">

        <label id="Property4"></label>

      </div>

      <span style="font-weight: bold; display: none;">99</span>

      <hr class="addressHr" style="margin-right: 4px;">
      
      <p id="saveError" class="ErrorEmpty" style="display: none;">Complete the Transaction Details before saving the deal.</p>

      <label style="font-weight: bold; margin-top: 22px;">DOCUMENTS</label>

      <div id="MainDocumentSection" class="extraStyling flexibleContainer"
        style="height: 85px; border: 1px solid lightgrey; margin-top: 20px;">

        <div class="flexible itemLongerLawFirm" style="padding-top: 20px; margin: 5PX 4PX 0PX 6PX; margin-left: 13px; flex: 0.45; margin-right: 12px;">

          <label id="doclab" style="text-align: left; background-color: #f3f3f3; height: 31px; margin-top: 1px; padding-top: 9px; padding-right: 0;" for="FileName0"
            class="custom-file-upload inlineInput">Select
            document to upload
          </label>
          <span id="noDocumentError" class="fieldError" style="display: none;">Please select a document</span>
          

        </div>

        <div class="flexible itemShortLawyer" style="margin-top: 26px;">
          
          <!-- <label class="MandentorySign"></label><label></label> -->

          <input style="    height: 31px;" class="inlineInput" type="text" id="EXtraDocumentName1" name="EXtraDocumentName1" placeholder="Document Name">

          <span id="noNameDocumentError" class="fieldError" style="display: none;">Please enter a document name</span>
        </div>
        <label class="flexible" style="flex: 0.2; margin-top: 26px;"><button type="submit" id="documentSubmitbtn" name="documentSubmitbtn" class="buttonSave" onclick="getdocName()" >Save</button></label>

      </div>



      <div id="UploadedDocuments" style="    margin-top: 22px;">

        <!-- <label class="SomeMarginbottom heavyfont">Documents</label> -->

        <div id="storedDocuments">
          <div class="oneDocument" id="RebateAgreementDocSection" style="display: none;">
            <input type="file" id="RebateAgreementDoc" name="RebateAgreementDoc" accept=".pdf" onchange="changeDateLabel('RebateAgreementDocSection', 'RebateDocument')" multiple="true">
            <label for="">Rebate Agreement</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('RebateAgreementDoc')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" id="ReferralDisclosureDocSection" style="display: none;">
            <input type="file" id="ReferralDisclosureDoc" name="ReferralDisclosureDoc" accept=".pdf" onchange="changeDateLabel('ReferralDisclosureDocSection', 'ReferralDocument')" multiple="true">
            <label for="">Referral Disclosure</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('ReferralDisclosureDoc')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" id="DepositDepositReceipt1Section" style="display: none;">
            <input type="file" id="DepositDepositReceipt1" name="DepositDepositReceipt1" accept=".pdf" onchange="changeDateLabel('DepositDepositReceipt1Section', 'deposit1Document')" multiple="true">
            <label for="">Deposit Receipt</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('DepositDepositReceipt1')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" id="DepositDepositReceipt2Section" style="display: none;">
            <input type="file" id="DepositDepositReceipt2" name="DepositDepositReceipt2" accept=".pdf" onchange="changeDateLabel('DepositDepositReceipt2Section', 'deposit2Document')" multiple="true">
            <label for="">Deposit Receipt</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('DepositDepositReceipt2')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" id="DepositDepositReceipt3Section" style="display: none;">
            <input type="file" id="DepositDepositReceipt3" name="DepositDepositReceipt3" accept=".pdf" onchange="changeDateLabel('DepositDepositReceipt3Section', 'deposit3Document')" multiple="true">
            <label for="">Deposit Receipt</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('DepositDepositReceipt3')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" id="DepositDepositReceipt4Section" style="display: none;">
            <input type="file" id="DepositDepositReceipt4" name="DepositDepositReceipt4" accept=".pdf" onchange="changeDateLabel('DepositDepositReceipt4Section', 'deposit4Document')" multiple="true">
            <label for="">Deposit Receipt</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('DepositDepositReceipt4')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
          <div class="oneDocument" style="display: none;">
            <input type="file" id="FileName0" name="FileName0" accept=".pdf" multiple="true" onchange="docNameFill(this.id)">
            <label for="">File Name</label><br>
            <label for="">Uploaded on 2022/05/11</label>
            <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('FileName0')"></button>
            <img src="../ImagesUsed/Upload.png" class="uploadImgDoc" loading="lazy">
          </div>
        </div>
       
      </div><!-- Closing UploadedDocuments -->

      <div class="NewSection" style="margin-bottom: 40px;">

        <label style="font-weight: bold; margin-top: 22px; margin-bottom: 22px;">NOTES</label>

        <div class="noteBox">

          <textarea class="forNotes" type="text" id="ExteraNotes" ></textarea>

          <button class="buttonSave" type="submit" id="savenote" name="savenote" onclick="saveNotes('<%= MyInformation.Firstname %>', '<%= MyInformation.Lastname %>')">Save</button>

        </div>

      </div>

      <div id="forNotes"></div>

      <input type="hidden" name="allNotesDocuments" id="allNotesDocuments">

      <div class="Footer FooterButton">

        <div class="FooterButtonSpan">

          <span class="buttonDiscard floatDataLefttSide">

            <button style="display: none;" id="DocumentsDiscard" type="button" class="dropbtnDiscard" >Discard</button>

            <!-- <span class="buttonBack">
              <button id="DocumentsBack" type="button" class="buttonBlue"
                onclick="TabsHandleler(event, 'Customer Rebate','tabcontent','tablinks1','CustomerRebateTab'); "
                style="display:none">Back</button>
            </span> -->
          </span>

          <span class="secondSpan">

                            
            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn8">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_8" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving8">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3"  type="button" id="Savebtn8">Save and close</button>

            <span class="savespan" id="savespan8">

              <button class="buttonSaveOne" type="button" id="DocumentsSave" >Save</button>
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving8', 'Deletebtn8', 'Savebtn8', 'savespan8', 'Deletebtn1_8', 1, event)" type="button">&nbsp;</button>

            </span>

            <!-- <button class="buttonBlue" id="DocumentsFinished" type="button" onclick="NextSetepDocument();"
              style="display:none">Next</button> -->

          </span>

        </div>

      </div>

    </div><!-- Closing Document -->

    <!-- ------------------------------------------------------------------------------------------------ -->

    <div id="AuditTrail" class="tabcontent content" style="display: none;">

      <div id="AuditTrailMainSection">

        <label id="Title4" class="HeadLines">Trade Record Sheet</label>

        <span style="display: none;" class="tooltip floatDataRightSide">
          <img class="lineButton printButton" type="button" id="Docs" onclick="onClick('Docs');"
            src="../ImagesUsed/Print.png" alt="Print">
          <span class="tooltiptext">Print page</span>
        </span>

        <div class="forAddressTop">
          <label id="Property8"></label>
        </div>

        <span style="font-weight: bold; display: none;">99</span>


        <hr style="margin-top: 4px; margin-right: 4px;">

        <p id="saveError2" class="ErrorEmpty" style="display: none;">Complete the Transaction Details before saving the deal.</p>


        <label style="font-weight: bold; margin-top: 22px;">AUDIT TRAIL</label>

        <div class="PartiesNavBar" id="Partiesnav" style="display: none;">

          <button id="" class="tablinks2 active" style="width: 120px;"> Activity </button>

          <button id="" class="tablinks2" style="width: 120px; "> Payments </button>

        </div>

        <input type="hidden" name="allNotesInput" id="allNotesInput">

        <div id="AuditNotes" class="forAuditTrail NewSectionMedium"></div>

        </div><!-- Closing AuditTrailMainSection  -->

      <div class="FooterButton">

        <div class="FooterButtonSpan">

          <span class="buttonDiscard floatDataLefttSide">

            <!-- <button  style="display: none;" type="button" id="AuditTrailDiscard" class="dropbtnDiscard" >Discard</button> -->

            <button class="buttonBlue" id="AuditTrailBack" type="button"
              onclick="TabsHandleler(event, 'Documents','tabcontent','tablinks1','DocumentsTab');"
              style="display:none">Back</button>

          </span>

          <span class="secondSpan" style="margin-left: 344px;">

            <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn9">Delete</button>
            <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_9" >Discard</button>
            <button  class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving9">Exit without saving</button>
            <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn9">Save and close</button>

            <span class="savespan" id="savespan9">

              <button class="buttonSaveOne" type="button" id="SaveButtomAuditTrail" >Save</button>
              <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving9', 'Deletebtn9', 'Savebtn9', 'savespan9', 'Deletebtn1_9', 1, event)" type="button">&nbsp;</button>

            </span>

          </span>
        </div>

      </div>

    </div>

    <!-- ************************************************************************************************************************************************************************************************************-->

    <div id="PreviewTRS"></div>
    <div class="loadingmodal"></div>
    <input id="bnHidden" type="hidden" value="<%=Mycompany.BusinessName%>">

    <input type="hidden" id="progressMarks"name='progressMarks' value = '0'>
    <input id="finalizDate" name="finalizDate" type="hidden" value="">
    <input id="createddate" name="createddate" type="hidden" value="">
    </form>
  </form>

  </div>
  
  <script>
    $(".buttonSaveTwo").on('click', function(event){
      event.stopPropagation();
      event.stopImmediatePropagation();
      if($(this).parent().hasClass('savedopenedspan')){
        $(this).parent().removeClass('savedopenedspan');
      }else{
        $(this).parent().addClass('savedopenedspan');
      }
    });
    
    $(document).ready(function() {
      $.getScript("../Scripts/TRS.js").then(function() {
        $.getScript("../Scripts/TRSOnLoad.js").then(function() {
          $("#EmailForm").removeClass("loading");  
          fileOpened('<%= MyInformation.Firstname %> <%= MyInformation.Lastname %>');

          fillLawfirm('VendorLawyerFirmList', '<%= LawFirmCont %>');  
          document.querySelector("#VendorLawyerFirm").onchange = (event) => { fillFunctionFirm('VendorLawyerFirm', 'VendorLawyerFirmList','VendorLawyerUnit','VendorLawyerStreetNumber','VendorLawyerStreetName' ,'VendorLawyerCity', 'VendorLawyerPostalCode', 'VendorLawyerProvince', 'VendorLawyerNameList', '<%= LawFirmCont %>' )};
          document.querySelector("#VendorLawyerName").onchange = (event) => { fillFunctionLawyer('VendorLawyerName','VendorLawyerFirm', 'VendorLawyerEmail', 'VendorLawyerPhone', 'VendorLawyerExteraContact', '<%= LawFirmCont %>' )};
         
          fillLawfirm('PurchaserLawyerFirmList', '<%= LawFirmCont %>');
          document.querySelector("#PurchaserLawyerFirm").onchange = (event) => { fillFunctionFirm("PurchaserLawyerFirm", "PurchaserLawyerFirmList","PurchaserLawyerUnit","PurchaserLawyerStreetNumber","PurchaserLawyerStreetName" ,"PurchaserLawyerCity", "PurchaserLawyerPostalCode", "PurchaserLawyerProvince", "PurchaserLawyerNameList", '<%= LawFirmCont %>' )};
          document.querySelector("#PurchaserLawyerName").onchange = (event) => { fillFunctionLawyer("PurchaserLawyerName","PurchaserLawyerFirm", "PurchaserLawyerEmail", "PurchaserLawyerPhone", "PurchaserLawyerExteraContact", '<%= LawFirmCont %>' )};
    

         $.getScript("../Scripts/CropImage.js")
        })
      });
    }); 
    
    function emailonload(){
      $.getScript("../Scripts/FillEmail.js").then(function() {
        createEmails('');
      });
    }

  </script>
  
  <Script>
    // String button_param = request.getParameter("button");
    // RequestDispatcher rd = null;

    // if(button_param .equals("SendEmailInvoice"))
    // {   rd=request.getRequestDispatcher("../SendEmailInvoice"); }
    
    // else{ rd=request.getRequestDispatcher("");}
    // rd.forward(request, response);
  
  
  </Script>

</body>


</html>