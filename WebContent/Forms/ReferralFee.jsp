<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Contacts"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="ProMasterClasses.Companies" %>

<%@ page import="ProMasterClasses.RecordSheet"  %>

<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

       <meta http-equiv="Content-Type"
              content="text/html; charset=UTF-8, width=device-width, maximum-scale=1.0, user-scalable=0">

         <!-- Scripts to add jQuerry and bootrstrap -->
       <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

       <script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>

       <link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

       <!-- Our scripts/css -->

       <link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

       <link rel="stylesheet" type="text/css" href="../CSS/Appraisal.css">

       <link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

       <link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

       <link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

       <link rel="stylesheet" type="text/css" href="../CSS/TRSAndTable.css">

       <link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

       <link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

       <link rel="stylesheet" type="text/css" href="../CSS/forModals.css">

       <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">
       
       <title>Referral Fee Receipt - Masterre</title>

</head>



<%
int UserID=0;//(int)session.getAttribute("Userid") ;

int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
   
String Type="0";//(String)session.getAttribute("Type") ;

String Email="";//(String)session.getAttribute("Email") ;

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
     
     con=(Connection) session.getAttribute("Connection");

}
  
  RDSFunctions myRDS= new RDSFunctions();

  Users MyInformation=new Users();
  
  MyInformation=myRDS.GetAnyUserById(UserID,con);
  
  

  Companies Mycompany=myRDS.GetaCompanyBuyBrokerID(BrokerID,con);
  
  
  //System.out.println(Mycompany.Temp);
  
  int  TransactionID= Mycompany.TransactionID +1;

  //System.out.println( "TransactionID" + " " + TransactionID);
  
  session.setAttribute("TransactionID",TransactionID);
  
  
  String Companylogo="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+Mycompany.ID;
  
  RecordSheet Record=new RecordSheet();
  
  Record=myRDS.SearchTradeRecordes( TransactionID , BrokerID ,con) ;
  
  %>

<body>
<div class='flexBody'>
       <div class="navBar">

              <%-- <div class="logo">
                     <img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"  class="masterre1">
                     <label class="masterre2" for="">MASTERRE</label>
              </div> --%>

              <div class="logo">

			<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

			<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

	       </div>

              <button id="TransactionDetailsTab" class="tablinks"
                     onclick="TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');"><img
                            id="TransactionDetailsTabIMG" class="accept" src="../ImagesUsed/Didnotaccept.png" alt="X">
                     Transaction Details </button>

              <button id="PartiesTab" class="tablinks"
                     onclick="TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');" disabled><img
                            id="PartiesTabIMG" class="accept" src="../ImagesUsed/Didnotaccept.png" alt="X"> Parties
              </button>

              <button id="InvoiceTab" class="tablinks"
                     onclick="TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');" ><img
                            id="InvoiceTabIMG" class="accept" src="../ImagesUsed/Didnotaccept.png" alt="X"> Invoice
              </button>

              <button id="ReferralFeeRecordSheetTab"
                     onclick="TabsHandleler(event, 'ReferralFeeRecordSheet', 'tabcontent', 'tablinks', 'ReferralFeeRecordSheetTab');"
                     class="tablinks" disabled> <img class="accept" id="ReferralFeeRecordSheetTabIMG"
                            src="../ImagesUsed/Didnotaccept.png" alt="X">
                     Referral Fee Summary </button>

              <button id="DocumentsTab" class="tablinks" onclick="Documents();" style="padding-left: 45px;"> Documents
              </button>

              <button id="AuditTrailTab" class="tablinks"
                     onclick="TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks', 'AuditTrailTab'); "
                     style="padding-left: 45px;"> Audit Trail </button>

       </div>

       <form name="EmailForm" action="../ReferralFeeReciepent" id="EmailForm" method="post" enctype="multipart/form-data" target='hiddenFrame' class='RightSideFlex loading'>
   
              <div id="myModalEmail" class="modal">
             
                <div class="modal-content">

                     <span class="close"><i class="bi bi-x-lg"></i></span>
                     <div class="emailBody">
                
                            <div class="HeaderDashboard flexibleContainer">
                                   <label class="DealsHeader flexible">Email Commission Statement</label>
                            </div>
              
                            <div class="errors">
                                   <p id="comissionEmailed" class="ErrorEmpty greedBack" style='display: none'>Commission statement was emailed. See <span style="text-decoration:underline; cursor: pointer" onclick="TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks', 'AuditTrailTab'); closeEmailPopup()">Audit Trail</span> for additional details.</p>
                                   <p id="emptyAdresseeError" class="ErrorEmpty" style='display: none'>Select at least one email recipient.</p>
                                   <p id="emptyEmailFields" class="ErrorEmpty" style='display: none'>Complete all required fields before proceeding.</p>
                                   <p class="ErrorEmpty blueBack">Balance due to Broker: $<span id="paysumEmail"></span></p>
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
                                   <input id="subjectLineEmail" name="subjectLineEmail"  type="text" class="inlineInput" value="Commission statement for 1010-123 Main Street, Toronto">
                            </div>
                            <div class="notes">
                                   <label class="MandentorySign"></label><label for="">Email Notes</label>
                                   <textarea id="messageEmail"  name="messageEmail"  class="inlineInput TextArea" cols="30" rows="10" >Please see attached our commission statement. &#10;&#10;&#10;&#10;Kind regards, &#10;&#10;The Best Brokerage</textarea>
                            </div>
                            </div>
              
                            <div class="popUpContainer" style='display: flex'>
                                   <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary7"
                                          name="Secondary7" value=""><span class="checkmark"></span>Email me a copy</label>
                                   <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary8"
                                          name="Secondary8" value=""><span class="checkmark"></span>Save to documents</label>
                                   <button style='width: auto;' class="submitButton" type="button" id="SendEmailInvoice" name="SendEmailInvoice" onclick="validateSendInvoice();">Send</button>
                            </div>
                            <!-- simplePrint('MainInvoiceSection'); -->
                     </div>
                </div>

              </div>


       <input type="hidden" id="agentNameHidden" value = '<%=MyInformation.Firstname %> <%=MyInformation.Lastname%>'>
    

              <iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
              
       <form action="../ReferralFeeReciepent" id="ReferralFeeForm" name="ReferralFeeForm" method="post" target="hiddenFrame"  enctype="multipart/form-data" class="loading">     

              <div id="myModalSaveClose" class="modal">

                     <!-- Modal content -->
                     <div class="modal-content">
                            <div class="modalHeader">Save and close</div>
                            <p>Do you want to save and close?</p>
                            <div class="popUpContainer">
                                   <span class="close">No</span>
                                   <button class="submitButton" type="submit" id="SaveExit" name="SaveExit" onclick="changeFormTarget(this);" >Yes</button>
                            </div>
                            <!-- <span>Cancel</span> -->
                     </div>

              </div>


              <div id="myModalExit" class="modal">

                     <!-- Modal content -->
                     <div class="modal-content">
                            <div class="modalHeader">Exit without saving</div>
                            <p>Do you want to leave without saving?</p>
                            <div class="popUpContainer">
                                   <span class="close">No</span>
                                 <a href="../BrokerFiles/Dashboard.jsp"> <button class="submitButton" type="button" id="ExitWithNoSaving" name="ExitWithNoSaving"  >Yes</button></a> 
                            </div>
                            <!-- <span>Cancel</span> -->
                     </div>

              </div>

              <div id="myModalHST" class="modal" >

                     <!-- Modal content -->
                     <div class="modal-content">
                            <div class="modalHeader">HST Reset</div>
                            <p>Do you want to reset HST to original rates?</p>
                            <div class="popUpContainer">
                            <span class="close">No</span>
                            <button class="submitButton" onclick="discardHST( '<%=MyInformation.User_Province%>' ); " id='ResetHSTbutton' type="button">Yes</button>
                            </div>
                     </div>

              </div>

              <div id="myModalDiscard" class="modal">

                     <!-- Modal content -->
                     <div class="modal-content">
                            <div class="modalHeader">Discard</div>
                            <p>Do you want to leave without saving?</p>
                            <div class="popUpContainer">
                                   <span class="close">No</span>
                                  <a href="../BrokerFiles/Dashboard.jsp"><button class="submitButton" type="button" id="Discard" name="Discard">Yes</button></a>
                            </div>
                            <!-- <span>Cancel</span> -->
                     </div>

              </div>

              <div id="myModalDelete" class="modal">

                     <!-- Modal content -->
                     <div class="modal-content">
                     
                            <div class="modalHeader">Delete</div>
                            
                            <p>Are you sure you want to delete this deal?</p>
                            <div class="popUpContainer">
                                   <span class="close">No</span>
                                   <button class="submitButton" type="submit" name="Delete" id="Delete" onclick="changeFormTarget(this);">Yes</button>
                            </div>
                            <!-- <span>Cancel</span> -->
                     </div>

              </div>


              <div id="myModalSave" class="modal">

                     <!-- Modal content -->
                     <div class="modal-content">

                            <img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;"
                                   alt=""><label>Document saved</label>
                     </div>

              </div>

              <div id="myModalEmailSent" class="modal">
                     <div class="modal-content">
                            <img src="../ImagesUsed/checkmarkGreen.png" style="width: 20px; float: left;"
                                   alt=""><label>Email sent</label>
                     </div>
              </div>

              <div id="TransactionDetails" class="tabcontent" style="width: 100%;">

                     <div id="TransactionMainSection">

                            <label class="HeadLines" id="Title1">REFERRAL FEE RECEIPT</Label>

                            <hr style="margin-right: 4px;">

                            <p id="ErrorEmpty1" class="ErrorEmpty" style="display: none;">
                                   <!-- <img src="../ImagesUsed/Redalert.png" width="12" height="12"
                                          style="margin-right: 7px;"> -->
                                   <label>Please
                                          complete all fields before proceeding to the next section</label></p>

                            <div class="flexibleContainer" style="margin-top: 24px;">

                                   <div class="flexible">

                                          <label class="MandentorySign"></label><label>Referral Type</label>

                                          <div class="custom-select" id="ReferralDealTypeCustom">

                                                 <select oninput="DealTypeTitleSet();" id="ReferralDealType"
                                                        name="ReferralDealType">

                                                        <option value="">-- Please choose an option --</option>

                                                        <option value="Trade in Real Estate">Trade in Real Estate
                                                        </option>

                                                        <option value="Lender/Mortgage Referral">Lender/Mortgage
                                                               Referral
                                                        </option>

                                                        <option value="Other">Other</option>

                                                 </select>

                                          </div>

                                   </div>

                                   <div class="flexible"></div>
                            </div>

                            <div class="flexibleContainer">

                                   <div class="flexible">
                                          <label class="MandentorySign"></label><label>Referral Fee Amount</label>

                                          <div class="inlineInput shortValue" style="padding: 1px 5px 1px 0;"
                                                 id="ReferralFeeDiv">
                                                 <label>$</label>
                                                 <input class="input5" type="number" step="0.01" id="ReferralFee" name="ReferralFee" maxlength="15"
                                                        placeholder="0.00" onblur="clearing(this.id); limiting(this);">
                                          </div>
                                          <!-- <input class="inlineInput" id="ReferralFee" name="ReferralFee" type="number" step="0.01"
                                                 min=0> -->
                                   </div>

                                   <div class="flexible">
                                          <label class="MandentorySign"></label><label>Source</label>
                                          <div class="custom-select" id="ReferralSourceCustom" onclick="PropertySource();">

                                                 <select id="ReferralSource" name="ReferralSource" >

                                                        <option value="">-- Please choose an option --</option>

                                                        <option value="Agent-lead" id="Agent's own">Agent lead
                                                        </option>

                                                        <option value="Office-lead">Office lead</option>

                                                 </select>

                                          </div>
                                   </div>

                            </div>

                            <div class="flexibleContainer">

                                   <div class="flexible">
                                          <label class="MandentorySign"></label><label>Referral Date</label>

                                          <div class="input-group">
                                                 <input id="ReferralDate" name="ReferralDate" type="text"
                                                        class="form-control date-input" placeholder="DD MM YYYY"
                                                        readonly="readonly" />
                                                 <label class="input-group-btn" for="ReferralDate"
                                                        id="ReferralDateLabel">
                                                        <span class="btn btn-default">
                                                               <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                 </label>
                                          </div>

                                          <!-- <input class="inlineInput" type="date" id="ReferralDate" name="ReferralDate"> -->
                                   </div>

                                   <div class="flexible">
                                          <label class="MandentorySign"></label><label>Property Type</label>

                                          <div class="custom-select">

                                                 <select id="ReferralPropertyType" name="ReferralPropertyType">

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
                                   </div>

                            </div>

                            <div class="flexibleContainer" style="display:none;">
                                   <span class="flexible" style="display:none; margin-right: auto; margin-top: 16px;">

                                          <label class="container">

                                                 <input onclick="HSTView();" class="checkbox" type="checkbox"
                                                        id="HSTViewcheckmark" name="HSTViewcheckmark"
                                                        style="border-color: lightgrey;"><span
                                                        class="checkmark"></span></label>

                                          <label style="margin-left: 16px;">View GST/HST</label>

                                          <span id="HSTSection" class="inlineInput percentSpan percent"
                                                 style="display:none; margin-top: 17px; width: calc(50% - 3px); margin-right: 2px;">

                                                 <label id="" style="margin-top: 1px;">%</label>

                                                 <input class="input5" type="number" placeholder="0.00" step="0.01"
                                                        id="HSTAMount" name="HSTAMount" value="13.00"
                                                        oninput="maxlengthCheckHST(this)">

                                          </span>

                                   </span>
                                   <div class="flexible"></div>
                            </div>

                            <div id="ReferralOfficeLeadCommisisonSection" class="NewSectionSmall Notification"
                                   style="display:none; margin-top: 34px; padding-top: 16px; padding-bottom: 4px;">


                                   <label style="font-weight: bold;">Office lead allocation </label>

                                   <div>
                                          <div style="display: flex;">

                                                 <label class="flexible" style="flex: 3; margin-top: 15px;">Gross
                                                        commission allocation to
                                                        office</label>

                                                 <div class="percent inlineInput flexible" style="background: white;">
                                                        <label>%</label><input class="input5" type="number" step="0.01" min="0.00" maxlength="10"
                                                               placeholder="0.00" step="0.01" value="50.00"
                                                               onblur="limiting(this)"
                                                               id="ReferralOfficeLeadAllocatonPercentage"
                                                               name="ReferralOfficeLeadAllocatonPercentage"
                                                               oninput="maxLengthCheck100(this);"></div>

                                          </div>

                                          <div style="display: flex;">
                                                 <!-- <label style="margin-top: 15px;     flex: 0.8;"
                                                        class="flexible"></label> -->

                                                 <label class="flexible" style="flex: 3;">Apply against agent's
                                                        commission cap</label>

                                                 <div class="flexible">
                                                        <label style="float: right; margin-right: 11px; margin-bottom: 0;"
                                                               class="container">
                                                               <input type="checkbox" class="checkbox"
                                                                      id="ReferralOfficeLeadAgainstCap" name="ReferralOfficeLeadAgainstCap" value="yes"
                                                                      checked><span class="checkmark"
                                                                      style="left: -5px;     top: -8px;"></span></label>
                                                 </div>
                                          </div>
                                   </div>





                            </div> <!-- Closing OfficeLeadCommisisonSection -->

                            <div class="NewSectionSmall">
                                   <label class="MandentorySign"></label><label>Compensation agreement disclosed to all
                                          parties?</label>


                                   <label class="container containerextra" style="width: 3%;"><input
                                                 onclick="Checkdisclosure('ReferralDiscloseYES');" type="checkbox"
                                                 class="checkbox" id="ReferralDiscloseYES"
                                                 name="ReferralDiscloseYES"><span
                                                 class="checkmark"></span></label><label
                                          style="margin-left: -4px;">Yes</label>

                                   <label class="container" style="width: 3%; margin-left: 13px;"><input
                                                 onclick="Checkdisclosure('ReferralDiscloseNo');" type="checkbox"
                                                 class="checkbox" id="ReferralDiscloseNo"
                                                 name="ReferralDiscloseNo"><span class="checkmark"></span></label><label
                                          style="margin-left: -4px;">No</label>

                            </div>



                            <div class="flexibleContainer" id="DisclosureNO" style="display:none;">

                                   <div class="flexible">
                                          <label class="MandentorySign"></label><label>Provide explanation</label>

                                          <textarea style="height: 40px; margin-top: 5px; resize: none" maxlength="50"
                                                 class="inlineInput" id="ReferralExplanation" name="ReferralExplanation"
                                                 type="text" value=""></textarea>
                                   </div>

                                   <div class="flexible"></div>

                            </div>

                            <div class="flexibleContainer" id="DisclosureYes" style="display:none;">

                                   <div class="flexible">

                                          <label class="NoMandatoryTwo"></label><label for="ReferralDisclosureAgreementDocument">Upload written disclosure
                                                 agreement</label>

                                          <label style="border-width: 1px; height: 40px;"
                                                 for="ReferralDisclosureAgreementDocument"
                                                 class="custom-file-upload inlineInput">
                                                 <img src="../ImagesUsed/Upload.png" alt="Upload Document"
                                                        style="height: 25px;"> <label class="UploadDocumentLabel">Upload
                                                        Document</label>
                                          </label>
                                          <span class="formats">(PDF)</span>

                                          <input id="ReferralDisclosureAgreementDocument"
                                                 name="ReferralDisclosureAgreementDocument" type="file" accept=".pdf" value="" onchange="displayUploaded('WrittenAgreementLabel')" multiple="true">
                                   </div>

                                   <div class="flexible">
                                          <label class="documentDone"  id="WrittenAgreementLabel" style="display: none; padding-top: 42px;"><img src="../ImagesUsed/checkmarkGreen.png" alt=""><span>Document Uploaded</span></label>
                                   </div>

                            </div>

                            <div id="AddingSecondAgentSection" style="display:none;" >

                                   <!--  <div class="flexibleContainer">

                                          <input class="flexible" id="FirstAgentID" name="FirstAgentID" type="text"
                                                 value="1" style="display:none">

                                          <div class="flexible"></div>
                                   </div>
                                    -->
                                   <div class="flexibleContainer">

                                          <div id="FirstAgentIDCustom" class="NewSection flexible" style="width:50%;">

                                                 <label class="MandentorySign"></label><label>First Agent</label>

                                                 <div class="custom-select" id="FirstAgentIDCustom"  onclick="SetSecondAgentLists('SecondAgentID');">

                                                        <select class="inputFull" id="FirstAgentID" name="FirstAgentID">

                                                               <option value="<%=MyInformation.id%><%=" "%><%=MyInformation.Firstname%><%=" "%><%=MyInformation.Lastname%> " > <%=MyInformation.Firstname%><%=MyInformation.Lastname%></option>

                                                        </select>
                                                 </div>
                                          </div>

                                          <div class="flexible"></div>

                                   </div>






                                   <div class="flexible" style="margin-top: 2px;">

                                          <label class="container" style="margin-left: 7px;"><input
                                                        onclick="AddSecondAgent();" type="checkbox"
                                                        id="AddSecondAgentCheckBox" name="AddSecondAgentCheckBox"><span
                                                        class="checkmark" style="top: 16px; left: -7px;"></span></label>

                                          <label style="margin-left: 6px;">Add another agent</label>

                                          <span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png"
                                                        alt="MasterProBrokerHelp" width="16" height="16"><span
                                                        class="tooltiptext">Second agent must be from your
                                                        brokerage.</span></span>

                                   </div>


                                   <div id="SecondAgentDetailInformation" class="flexible" style="display:none;">

                                          <p id="ErrorEmptySecondAgentComission" class="ErrorEmpty"
                                                 style="display: none;">
                                                 <label>Commission amount should be between 0.01% and 99.99%</label></p>

                                          <p id="ErrorEmptySecondAgent" class="ErrorEmpty" style="display: none;">
                                                 <label>Please chose second agent.</label></p>

                                          <div class="flexibleContainer">

                                                 <div class="flexible">

                                                        <label class=" MandentorySign"></label><label>Second
                                                               Agent</label>

                                                        <div class="custom-select">

                                                               <select id="SecondAgentID" name="SecondAgentID">

                                                                      <option value="">-- Please choose an option --
                                                                      </option>

                                                                      <option value="2">2</option>

                                                                      <option value="3">3</option>

                                                                      <option value="4">4</option>

                                                               </select>

                                                        </div>

                                                 </div>

                                                 <div class="flexible"></div>

                                          </div>



                                          <script>
                                                 //  <%
                                                 //  int id=1;
                                                 //  RDSFunctions myRDS= new RDSFunctions();
                                                 //  Users MyInformation=new Users();
                                                 // //MyInformation=myRDS.GetAgentsById(Agent_id); 
                                                 //  ArrayList<Users> AgentList= new ArrayList<Users>(); //This is an arrayList to keep the agents information
                                                 //  // int Myid=(Integer)session.getAttribute("Broker_id"); //Getting the id of the broker who has login into th esystem
                                                 //   AgentList=myRDS.GetAgents(id);//Calling the function to get the agents related to the specific broker and keep save them in agent ArrayList%>
                                                 //  //This is the First sets of agents 
                                                 //var agents = ['agent1', 'agent2', 'agent3'];
                                                 //var IDs = [1, 2, 3];
                                                 //  <% 
                                                 // for (int i = 0; i < AgentList.size(); i++) { %> 
                                                 // agents.push(addelemet);
                                                 // IDs.push( MyId);
                                                // var select1 = document.getElementById("FirstAgentID");
                                                 //In the following for loop , the agents list is assigin to select option list  
                                                 //for (var i = 0; i < agents.length; i++) {
                                                        //var opt = agents[i]; //Setting the data for an option
                                                        //var el1 = document.createElement("option");
                                                        //el1.textContent = opt;
                                                        //el1.value = IDs[i] + " " + opt;
                                                        //select1.appendChild(el1);
                                                 //} //Closing the for loop 
                                          </script>











                                          <div class="flexibleContainer">

                                                 <div class="flexible flexibleContainer" style="margin-bottom: 2px;">

                                                        <label class="SomelabelStyle flexible NoMandatoryMove"
                                                               id="Agent1ID">First Agent</label>

                                                        <span class="inlineInput shortValuePercent flexible"
                                                               style="margin: 0px;  float: right;">
                                                               <label style="float: right;">%</label>
                                                               <input class="input5" onblur="limiting(this); "
                                                                      oninput="maxLengthCheck(this); CommissionAllocations();"
                                                                      type="number" step="0.01" id="FirstAgentCommissionPercentage"
                                                                      name="FirstAgentCommissionPercentage"
                                                                      value="100.00" min="0" max="100"></span>
                                                 </div>

                                                 <div class="flexible"></div>

                                          </div>

                                          <div class="flexibleContainer">

                                                 <div class="flexible flexibleContainer" style="margin-top: 2px;">

                                                        <label class="SomelabelStyle flexible NoMandatoryMove"
                                                               id="Agent2ID">Second Agent</label>

                                                        <span class="inlineInput shortValuePercent flexible"
                                                               style="margin: 0px;  float: right; background: #f3f3f3;">
                                                               <label style="float: right;">%</label>
                                                               <input class="input5" type="number" step="0.01"
                                                                      id="SecondAgentCommissionPercentage"
                                                                      name="SecondAgentCommissionPercentage"
                                                                      value="0.00" min="0" max="100"
                                                                      readonly="readonly"></span>

                                                 </div>

                                                 <div class="flexible"></div>

                                          </div>

                                   </div><!-- Closing SecondAgentDetailInformation -->

                            </div><!-- Closing AddingSecondAgentSection -->

                     </div><!-- Close TransactionMainSection -->

                     <div id="TransactionButtonSection" class="FooterButton">

                            <div class="FooterButtonSpan">

                                   <!-- <span class="buttonDiscard floatDataLefttSide">
                                          <button style="display: none;" id="TransactionDiscard" type="button" onclick=" "> Discard </button>
                                   </span> -->

                                   <span class="secondSpan">

                                          <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn1"
                                                 style="display: none;">Delete</button>
                                          <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                 id="Deletebtn1_1">Discard</button>
                                          <button class="dropdownMenubtn dropBtn2"
                                                 type="button" id="ExitWithoutSaving1">Exit without saving</button>
                                          <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn1">Save and
                                                 close</button>

                                          <span class="savespan" id="savespan1">

                                                 <button class="buttonSaveOne" type="button" id="TransactionSave" name="TransactionSave" >Save</button>
                                                 <button class="buttonSaveTwo"
                                                        onclick="openWindow('ExitWithoutSaving1', 'Deletebtn1', 'Savebtn1', 'savespan1','Deletebtn1_1', 1, event)"
                                                        type="button">&nbsp;</button>

                                          </span>

                                          <!-- <button id="TransactionSave" type="button" onclick=" "> Save and close </button> -->

                                          <button class="buttonBlue" id="TransactionNext" type="button"
                                                 onclick="NextStepTransaction(1);"> Next
                                          </button>

                                   </span>

                            </div>

                     </div><!-- Closing TransactionButtonSection -->

              </div><!-- Closing TransactionDetails tab Content -->

              <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div id="Parties" class="tabcontent" style="display: none;">

                     <div id="MainPartiesContent">

                            <label id="Title2" class="HeadLines">REFERRAL FEE RECEIPT</label><br>

                            <!-- <div class="forAddressTop">

                                   <label id="SelectedPropertyStreetUnit2">Unit</label> &#8211;

                                   <label id="SelectedPropertyStreetName2">Street Number</label>

                                   <label id="SelectedPropertyStreetNumber2">Street Name</label>,

                                   <label id="SelectedPropertyStreetCity2">City</label>,

                                   <label id="SelectedPropertyStreetProvince2">Province</label>,

                                   <label id="SelectedPropertyStreetPostalCode2">Postal Code</label>

                            </div> -->

                            <!-- <span style="font-weight: bold;">99</span> -->
                            <div class="forAddressTop">

                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"></label>
                            </div>

                            <hr style="margin-top: 4px; margin-right: 4px;">

                            <div class="PartiesNavBar" id="Partiesnav">

                                   <button id="ClientTab" type="button" class="tablinks1" style="width: 120px;"
                                          onclick="BackStepReferralSource();"> Client </button>

                                   <button id="ReferralSourceTab" type="button" class="tablinks1" style="width: 120px;"
                                          onclick="NextStepClient(1);">Referral Recipient</button>

                                   <span id="ClientProcess" style="float: right;">

                                          <span class="tooltip">
                                                 <img src="../ImagesUsed/AddSVG.svg" class="lineButton manageListButton"
                                                        alt="+" type="button"
                                                        onclick="AddOneParty('client2','AddClient')" id="AddClient"
                                                        name="AddClient"><span class="tooltiptext">Add
                                                        client</span>
                                          </span>

                            </div>

                            <!-- <hr class="underTablink"> -->

                            <div class="tabcontent1" id="Client">

                                   <p id="ErrorEmpty2" class="ErrorEmpty" style="display: none;">
                                          <!-- <img src="../ImagesUsed/Redalert.png" width="12" height="12"
                                          style="margin-right: 7px;"> -->
                                          <label>Please
                                                 complete all fields before proceeding to the next section</label></p>

                                   <div id="MainClientSection">

                                          <div id="client1">

                                                 <div class="flexibleContainer NewSectionSmall">

                                                        <div class="flexible">

                                                               <label class="MandentorySign"></label><label>Type</label>

                                                               <div class="custom-select" id="ClientType1Custom">

                                                                      <select onchange="ChecksPartiesType('ClientType1','Individusal1','NotAnIndividusal1');"
                                                                             id="ClientType1" name="ClientType1">

                                                                             <option value="">-- Please choose an option
                                                                                    --</option>

                                                                             <option value="Individual">Individual
                                                                             </option>

                                                                             <option value="Corporation">Corporation
                                                                             </option>

                                                                             <option value="Partnership">Partnership
                                                                             </option>

                                                                             <option value="Trust">Trust</option>

                                                                      </select>
                                                               </div>

                                                        </div>

                                                        <div class="flexible"></div>

                                                 </div>

                                                 <div id="NotAnIndividusal1" style="display:none"
                                                        class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Business
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ClientBusinessName1"
                                                                      name="ClientBusinessName1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Authorised
                                                                      Signing Officer</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ClientSigningOfficere1"
                                                                      name="ClientSigningOfficere1" value="">
                                                        </div>

                                                 </div><!-- Closing NotAnIndividusal1 -->

                                                 <div id="Individusal1" class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>First
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ClientFirstName1" name="ClientFirstName1"
                                                                      value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Last
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ClientLastName1" name="ClientLastName1"
                                                                      value="">
                                                        </div>

                                                 </div><!-- Closing Individusal1 -->

                                                 <div class="flexibleContainer NewSection">
                                                        <div class="flexible">
                                                               <label class="NoMandatoryTwo">Unit</label>

                                                               <input type="text" class="inlineInput" maxlength="10"
                                                                      id="ClientUnitNumber1" name="ClientUnitNumber1"
                                                                      value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Street
                                                                      Number</label>

                                                               <input type="text" class="inlineInput"
                                                                      id="ClientStreetNumber1" maxlength="10"
                                                                      name="ClientStreetNumber1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Street
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="40"
                                                                      id="ClientStreetName1" name="ClientStreetName1"
                                                                      value="">
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>City</label>

                                                               <input type="text" class="inlineInput" id="ClientCity1" maxlength="30"
                                                                      name="ClientCity1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Province/State</label>

                                                               <div class="custom-select"
                                                                      onclick="ifProvinceOther('ClientProvince1','ClientCountry1'); Display('ClientProvince1', 'ClientState1')">

                                                                      <select id="ClientProvince1"
                                                                             name="ClientProvince1" readonly>

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
                                                               <label class="MandentorySign"></label><label>Postal
                                                                      Code</label>

                                                               <input type="text" class="inlineInput" maxlength="11"
                                                                      id="ClientPostalCode1" name="ClientPostalCode1"
                                                                      value="">
                                                               <!-- onblur="postalCorrect(this.id);" -->
                                                        </div>

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Country</label>

                                                               <input type="text" class="inlineInput" maxlength="20"
                                                                      id="ClientCountry1" name="ClientCountry1"
                                                                      value="Canada" readonly>
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer" style="display: none;"
                                                        id="ClientState1">
                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Other
                                                                      province or state</label>

                                                               <input type="text" class="inlineInput" maxlength="20"
                                                                      id="ClientOtherProvince1"
                                                                      name="ClientOtherProvince1" value="">
                                                        </div>
                                                        <div class="flexibleotherProvince"></div>
                                                 </div>

                                                 <div class="flexibleContainer NewSection">

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Email</label>

                                                               <input onblur="emailCorrect(this.id)" type="text" maxlength="50"
                                                                      class="inlineInput" id="ClientEmail1"
                                                                      name="ClientEmail1" value="">
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Phone</label>

                                                               <input onkeydown="phoneNumberFormatter(this.id)" maxlength="14"
                                                                      type="text" class="inlineInput" id="ClientPhone1"
                                                                      name="ClientPhone1" value="">
                                                        </div>

                                                        <div class="flexible itemShortPhone">

                                                               <div class="custom-select NoMandatoryPhone">
                                                                      <select id="ClientExteraContactInformationLabel1"
                                                                             name="ClientExteraContactInformationLabel1">

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="International Phone">
                                                                                    International Phone</option>
                                                                      </select>

                                                               </div>

                                                               <input class="inlineInput" type="text" maxlength="32"
                                                                      id="ClientExteraContact1"
                                                                      name="ClientExteraContact1" value="">
                                                        </div>

                                                 </div>

                                          </div><!-- Closing Client1 -->

                                          <div id="client2" style="display:none;" class="NewSection">


                                                 <div>
                                                        <span>

                                                               <!-- <label class="container"><input type="checkbox"
                                                                             id="AddClient2"><span class="checkmark"
                                                                             style="top: 16px"></span></label> -->

                                                               <label style="margin-left: 8px; font-weight: bold;">Second
                                                                      Client</label>

                                                               <span class="tooltip floatDataRightSide">
                                                                      <img src="../ImagesUsed/RemoveSVG.svg"
                                                                             class="lineButtonMinus manageListButton"
                                                                             alt="-" type="button"
                                                                             onclick="RemoveOneParty('client2','AddClient');"
                                                                             style="display: inline;"
                                                                             id="RemoveOneDeposit"
                                                                             name="RemoveOneDeposit"><span
                                                                             class="tooltiptext">Remove
                                                                             Client</span>
                                                               </span>

                                                               <hr style="margin-right: 4px;">

                                                        </span>


                                                 </div>

                                                 <div class="flexibleContainer NewSectionSmall">

                                                        <div class="flexible">

                                                               <label class="MandentorySign"></label><label>Type</label>

                                                               <div class="custom-select" id="ClientType2Custom">

                                                                      <select onchange="ChecksPartiesType('ClientType2','Individusal2','NotAnIndividusal2');"
                                                                             id="ClientType2" name="ClientType2">

                                                                             <option value="">-- Please choose an option
                                                                                    --</option>

                                                                             <option value="Individual">Individual
                                                                             </option>

                                                                             <option value="Corporation">Corporation
                                                                             </option>

                                                                             <option value="Partnership">Partnership
                                                                             </option>

                                                                             <option value="Trust">Trust</option>

                                                                      </select>

                                                               </div>

                                                        </div>

                                                        <div class="flexible"></div>

                                                 </div>



                                                 <div id="NotAnIndividusal2" style="display:none"
                                                        class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Business
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ClientBusinessName2"
                                                                      name="ClientBusinessName2" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Authorised
                                                                      Signing Officer</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ClientSigningOfficere2"
                                                                      name="ClientSigningOfficere2" value="">
                                                        </div>

                                                 </div><!-- Closing NotAnIndividusal2 -->

                                                 <div id="Individusal2" class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>First
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ClientFirstName2" name="ClientFirstName2"
                                                                      value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Last
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ClientLastName2" name="ClientLastName2"
                                                                      value="">
                                                        </div>

                                                 </div><!-- Closing Individusal2 -->

                                                 <!--  <button  id="CopyPropertyAddress2"   type="button"  onclick="CopyAddress('ClientUnitNumber2','ClientStreetNumber2','ClientStreetName2','ClientProvince2','ClientPostalCode2','ClientCity2','ClientCountry2');">Copy Property Address</button>
                                        -->
                                                 <div class="flexibleContainer NewSection">
                                                        <div class="flexible">
                                                               <label class="NoMandatoryTwo">Unit</label>

                                                               <input type="text" class="inlineInput" maxlength="10"
                                                                      id="ClientUnitNumber2" name="ClientUnitNumber2"
                                                                      value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Street
                                                                      Number</label>

                                                               <input type="text" class="inlineInput" maxlength="10"
                                                                      id="ClientStreetNumber2"
                                                                      name="ClientStreetNumber2" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Street
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="40"
                                                                      id="ClientStreetName2" name="ClientStreetName2"
                                                                      value="">
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>City</label>

                                                               <input type="text" class="inlineInput" id="ClientCity2" maxlength="30"
                                                                      name="ClientCity2" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Province/State</label>

                                                               <div class="custom-select"
                                                                      onclick="ifProvinceOther('ClientProvince2','ClientCountry2'); Display('ClientProvince2', 'ClientState2')">

                                                                      <select id="ClientProvince2"
                                                                             name="ClientProvince2" readonly>

                                                                             <option value=" ">ON</option>

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
                                                               <label class="MandentorySign"></label><label>Postal
                                                                      Code</label>

                                                               <input type="text" class="inlineInput" maxlength="11"
                                                                      id="ClientPostalCode2" name="ClientPostalCode2"
                                                                      value="">
                                                               <!-- onblur="postalCorrect(this.id);" -->
                                                        </div>

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Country</label>

                                                               <input type="text" class="inlineInput" maxlength="20"
                                                                      id="ClientCountry2" name="ClientCountry2"
                                                                      value="Canada" readonly>
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer" style="display: none;"
                                                        id="ClientState2">
                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Other
                                                                      province or state</label>

                                                               <input type="text" class="inlineInput"
                                                                      id="ClientOtherProvince2" maxlength="20"
                                                                      name="ClientOtherProvince2" value="">
                                                        </div>
                                                        <div class="flexibleotherProvince"></div>
                                                 </div>


                                                 <div class="flexibleContainer NewSection">
                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Email</label>

                                                               <input onblur="emailCorrect(this.id)" type="text" maxlength="50"
                                                                      class="inlineInput" id="ClientEmail2"
                                                                      name="ClientEmail2" value="">
                                                        </div>



                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label
                                                                      class="MandentorySign"></label><label>Phone</label>

                                                               <input onkeydown="phoneNumberFormatter(this.id)"
                                                                      
                                                                      type="text" class="inlineInput" id="ClientPhone2" maxlength="14"
                                                                      name="ClientPhone2" value="">
                                                        </div>


                                                        <div class="flexible itemShortPhone">

                                                               <div class="custom-select NoMandatoryPhone">

                                                                      <select id="ClientExteraContactInformationLabel2"
                                                                             name="ClientExteraContactInformationLabel2">

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="International Phone">
                                                                                    International Phone</option>
                                                                      </select>

                                                               </div>

                                                               <input class="inlineInput" type="text" maxlength="32"
                                                                      id="ClientExteraContact2"
                                                                      name="ClientExteraContact2" value="">
                                                        </div>

                                                 </div>

                                          </div><!-- Closing Client2 -->

                                   </div><!-- Closing MainClientSection -->



                                   <div id="ClientSection" class="FooterButton">

                                          <div class="FooterButtonSpan">

                                                 <span class="buttonDiscard floatDataLefttSide">

                                                        <!-- <button style="display: none;" id="ClientDiscard" type="button" onclick=" "> Discard
                                                        </button> -->

                                                        <span class="buttonBack"><button id="ClientDiscard"
                                                                      type="button" class="buttonBlue "
                                                                      onclick="TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');">
                                                                      Back </button>
                                                        </span>
                                                 </span>

                                                 <span class="secondSpan">

                                                        <button class="dropdownMenubtn dropBtn1" type="button"
                                                               id="Deletebtn2" style="display: none;">Delete</button>
                                                        <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                               id="Deletebtn1_2">Discard</button>
                                                        <button class="dropdownMenubtn dropBtn2" type="button"
                                                               id="ExitWithoutSaving2">Exit without saving</button>
                                                        <button class="dropdownMenubtn dropBtn3" type="button"
                                                               id="Savebtn2">Save and close</button>

                                                        <span class="savespan" id="savespan2">

                                                               <button class="buttonSaveOne" type="button"
                                                                      id="ClientSave" name="ClientSave" >Save</button>
                                                               <button class="buttonSaveTwo"
                                                                      onclick="openWindow('ExitWithoutSaving2', 'Deletebtn2', 'Savebtn2', 'savespan2','Deletebtn1_2', 1, event)"
                                                                      type="button">&nbsp;</button>

                                                        </span>



                                                        <button id="ClientNext" class="buttonBlue" type="button"
                                                               onclick="NextStepClient(1);"> Next
                                                        </button>
                                                 </span>

                                          </div>

                                   </div><!-- Closing PartiesbuttonSection -->

                            </div>

                            <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

                            <div class="tabcontent1" id="ReferralSourceContent">

                                   <div id="MainReferralSourceSection">

                                          <div id="ReferralSource1">

                                                 <p id="ErrorEmpty3" class="ErrorEmpty" style="display: none;">
                                                        <!-- <img src="../ImagesUsed/Redalert.png" width="12" height="12"
                                          style="margin-right: 7px;"> -->
                                                        <label>Please
                                                               complete all fields before proceeding to the next
                                                               section</label></p>

                                                 <div class="flexibleContainer NewSectionSmall">

                                                        <div class="flexible">

                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild1"></label><label>Type</label>

                                                               <div class=" custom-select"
                                                                      id="ReferralSourceType1Custom">

                                                                      <select onchange="ChecksPartiesType('ReferralSourceType1','ReferralSourceIndividusal1','ReferralSourceNotAnIndividusal1');"
                                                                             id="ReferralSourceType1"
                                                                             name="ReferralSourceType1">

                                                                             <option value="">-- Please choose an option
                                                                                    --</option>

                                                                             <option value="Individual">Individual
                                                                             </option>

                                                                             <option value="Corporation">Corporation
                                                                             </option>

                                                                             <option value="Partnership">Partnership
                                                                             </option>

                                                                             <option value="Trust">Trust</option>

                                                                      </select>

                                                               </div>

                                                        </div>

                                                        <div class="flexible"></div>

                                                 </div>

                                                 <div id="ReferralSourceNotAnIndividusal1" style="display:none"
                                                        class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild2"></label><label>Business
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ReferralSourceBusinessName1"
                                                                      name="ReferralSourceBusinessName1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild3"></label><label>Authorised
                                                                      Signing Officer</label>

                                                               <input type="text" class="inlineInput" maxlength="60"
                                                                      id="ReferralSourceSigningOfficere1"
                                                                      name="ReferralSourceSigningOfficere1" value="">
                                                        </div>

                                                 </div><!-- Closing ReferralSourceNotAnIndividusal1 -->

                                                 <div class="flexibleContainer" id="ReferralSourceIndividusal1">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild4"></label><label>First
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ReferralSourceFirstName1"
                                                                      name="ReferralSourceFirstName1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild5"></label><label>Last
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="45"
                                                                      id="ReferralSourceLastName1"
                                                                      name="ReferralSourceLastName1" value="">
                                                        </div>

                                                 </div><!-- Closing ReferralSourceIndividusal1 -->



                                                 <div class="flexibleContainer NewSection">

                                                        <div class="flexible">
                                                               <label class="NoMandatoryTwo">Unit</label>

                                                               <input type="text" class="inlineInput" maxlength="10"
                                                                      id="ReferralSourceUnitNumber1"
                                                                      name="ReferralSourceUnitNumber1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild6"></label><label>Street
                                                                      Number</label>

                                                               <input type="text" class="inlineInput" maxlength="10"
                                                                      id="ReferralSourceStreetNumber1"
                                                                      name="ReferralSourceStreetNumber1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild7"></label><label>Street
                                                                      Name</label>

                                                               <input type="text" class="inlineInput" maxlength="40"
                                                                      id="ReferralSourceStreetName1"
                                                                      name="ReferralSourceStreetName1" value="">
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild8"></label><label>City</label>

                                                               <input type="text" class="inlineInput" maxlength="30"
                                                                      id="ReferralSourceCity1"
                                                                      name="ReferralSourceCity1" value="">
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild10"></label><label>Province/State</label>

                                                               <div class="custom-select"
                                                                      onclick="ifProvinceOther('ReferralSourceProvince1','ReferralSourceCountry1'); Display('ReferralSourceProvince1', 'ReferralState1')">

                                                                      <select id="ReferralSourceProvince1"
                                                                             name="ReferralSourceProvince1" readonly>

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
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild9"></label><label>Postal
                                                                      Code</label>

                                                               <input type="text" class="inlineInput" maxlength="11"
                                                                      id="ReferralSourcePostalCode1"
                                                                      name="ReferralSourcePostalCode1" value="">
                                                               <!-- onblur="postalCorrect(this.id);" -->
                                                        </div>

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild11"></label><label>Country</label>

                                                               <input type="text" class="inlineInput" maxlength="20"
                                                                      id="ReferralSourceCountry1"
                                                                      name="ReferralSourceCountry1" value="Canada"
                                                                      readonly>
                                                        </div>

                                                 </div>

                                                 <div class="flexibleContainer" style="display: none;"
                                                        id="ReferralState1">
                                                        <div class="flexible">
                                                               <label class="MandentorySign"></label><label>Other
                                                                      province or state</label>

                                                               <input type="text" class="inlineInput" maxlength="20"
                                                                      id="ReferralOtherProvince1"
                                                                      name="ReferralOtherProvince1" value="">
                                                        </div>
                                                        <div class="flexibleotherProvince"></div>
                                                 </div>


                                                 <div class="flexibleContainer NewSection">
                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild12"></label><label>Email</label>

                                                               <input onblur="emailCorrect(this.id)" type="text" maxlength="80"
                                                                      class="inlineInput" id="ReferralSourceEmail1"
                                                                      name="ReferralSourceEmail1" value="">
                                                        </div>



                                                 </div>

                                                 <div class="flexibleContainer">

                                                        <div class="flexible">
                                                               <label class="MandentorySign"
                                                                      id="ReferralSource1feild13"></label><label>Phone</label>

                                                               <input onkeydown="phoneNumberFormatter(this.id)"
                                                                      type="text" class="inlineInput" maxlength="14"
                                                                      id="ReferralSourcePhone1"
                                                                      name="ReferralSourcePhone1" value="">
                                                        </div>

                                                        <div class="flexible itemShortPhone">

                                                               <div class="custom-select NoMandatoryPhone">

                                                                      <select id="ReferralSourceExteraContactInformationLabel1"
                                                                             name="ReferralSourceExteraContactInformationLabel1">

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="Mobile">Mobile</option>

                                                                             <option value="International Phone">
                                                                                    International Phone</option>
                                                                      </select>

                                                               </div>

                                                               <input class="inlineInput" type="text" maxlength="32"
                                                                      id="ReferralSourceExteraContact1"
                                                                      name="ReferralSourceExteraContact1" value="">
                                                        </div>

                                                 </div>

                                          </div><!-- Closing ReferralSource1 -->



                                   </div><!-- Closing MainReferralSourceSection -->




                                   <div id="ReferralSourceButtonSection" class="FooterButton">

                                          <div class="FooterButtonSpan">

                                                 <span class="buttonDiscard floatDataLefttSide">

                                                        <!-- <button style="display: none;" id="ReferralSourceDiscard" type="button" onclick=" ">
                                                               Discard
                                                        </button> -->

                                                        <span class="buttonBack"> <button id="ReferralSourceDiscard"
                                                                      type="button" class="buttonBlue"
                                                                      onclick="BackStepReferralSource();"> Back
                                                               </button>
                                                        </span>
                                                 </span>

                                                 <span class="secondSpan">

                                                        <button class="dropdownMenubtn dropBtn1" type="button"
                                                               id="Deletebtn3" style="display: none;">Delete</button>
                                                        <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                               id="Deletebtn1_3">Discard</button>
                                                        <button class="dropdownMenubtn dropBtn2" type="button"
                                                               id="ExitWithoutSaving3">Exit without saving</button>
                                                        <button class="dropdownMenubtn dropBtn3" type="button"
                                                               id="Savebtn3">Save and close</button>

                                                        <span class="savespan" id="savespan3">

                                                               <button class="buttonSaveOne" type="button"
                                                                      id="ReferralSourceSave"  name="ReferralSourceSave" >Save</button>
                                                               <button class="buttonSaveTwo"
                                                                      onclick="openWindow('ExitWithoutSaving3', 'Deletebtn3', 'Savebtn3', 'savespan3', 'Deletebtn1_3', 1, event)"
                                                                      type="button">&nbsp;</button>

                                                        </span>

                                                        <button id="ReferralSourceNext" type="button" class="buttonBlue"
                                                               onclick="NextStepReferralSource();"> Next </button>
                                                 </span>

                                          </div>

                                   </div><!-- Closing PartiesbuttonSection -->

                            </div>

                     </div><!-- Closing MainPartiesContent -->

              </div><!-- Closing Parties tab Content -->

              <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div id="Invoice" class="tabcontent" style="display: none;">

                     <div id="InvoiceMainSection">

                            <label id="Title3" class="HeadLines">REFERRAL FEE RECEIPT</label>
                            <span class="floatDataRightSide">

                                   <span class="tooltip">
                                          <img class="lineButton" type="button" id="emailInvoicebtn" src="../ImagesUsed/Email.png" alt="Email"
                                            onclick=" " style="width: 22px;">
                                          <span class="tooltiptext">Email invoice</span>
                                
                                          <!-- </button> -->
                                   </span>

                                   <span class="tooltip ">
                                          <img class="lineButton printButton" type="button" id="PrintInvoice"
                                                 onclick="simplePrint('MainInvoiceSection');" src="../ImagesUsed/Print.png"
                                                 alt="Print">
                                          <span class="tooltiptext">Print page</span>
                                   </span>

                            </span>

                            <div class="forAddressTop">

                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"></label>
                            </div>

                             <hr style="margin-top: 4px; margin-right: 4px;    margin-bottom: 22px;">

                            <div id="MainInvoiceSection">

                                   <div id="printMainInvoice">
                                          <div class="frontImageLogo">
                                                 <img src="<%=Companylogo%>?math=<%=Math.random()%>" alt="House" class="insideImglogo">
                                          </div>
                                          <div class="referralInvLogo">
                                                 <label  class="heavyfont" style="color:black;  text-transform: uppercase;" id="MainTitle">INVOICE</label>
                                          </div>

                                          <div class="flexibleContainer NewSectionSmall" style="width: 70%;">

                                                 <label class="flexibleDate NewSectionSmall" style="font-weight: bold; margin-right: auto; padding-left: 0;"
                                                        id="InvoiceCuttentDate" name="InvoiceCuttentDate"></label>

                                                 <input type="Hidden" id="HiddenDate" name="HiddenDate" value="">

                                                 <label class="flexibleDate floatDataRightSide" style="font-weight: bold; display: none;">Reference</label>
                                          </div>

                                          <div class="flexibleContainer NewSectionSmall" style="width: 70%;">

                                                 <label class="flexibleZero" id="InvoiceReciverName" name="InvoiceReciverName"></label>

                                          </div>

                                          <div class="flexibleContainer" style="width: 70%;">
                                                 <label id="InvoiceReciverNameBusiness" name="InvoiceReciverNameBusiness"></label>
                                          </div>

                                          <div class="flexibleContainer" style="width: 70%;">

                                                 <label id="addressFirst" name="addressFirst"></label>

                                          </div>

                                          <div class="flexibleContainer" style="width: 70%;">

                                                 <label id="addressSecond" name="addressSecond"></label>

                                          </div>


                                          <div id="InvoicePropertyInformation" class="invoiceBox NewSectionSmall"
                                                 style="height: auto; margin-top: 32px; margin-bottom: 32px;">

                                                 <div class="flexibleContainer" style="margin-top: 3px;">

                                                        <label
                                                               style="margin: 0; width: 130px;  margin-left: 15px; font-weight: bold;">Referral:</label>

                                                        <label class="inlineInput flexibleZero" id="InvoiceReferralType"
                                                               style="margin-top: 0;" name="InvoiceReferralType">Referral Fee</label>

                                                 </div>

                                                 <div class="flexibleContainer" style="margin-top: 7px;">

                                                        <label
                                                               style="margin: 0; width: 130px; margin-left: 15px; font-weight: bold;">Client(s):</label>

                                                        <label class="inlineInput flexibleZero" id="InvoiceClients"
                                                               style="margin-top: 0;" name="InvoiceClients" value=""></label>

                                                 </div>

                                                 <div class="flexibleContainer" style="margin-top: 7px;">

                                                        <label style="margin: 0; width: 130px; margin-left: 15px; font-weight: bold;">Referral
                                                               Date:</label>

                                                        <label type="date" id="InvoicePropertyReportDate" style="margin-top: 0;"
                                                               class="inlineInput flexibleZero" name="InvoicePropertyReportDate"
                                                               value=""></label>

                                                 </div>

                                          </div><!-- Closing InvoicePropertyInformation -->





                                          <div id="SomeDetailInformation" style="padding-right: 15px">

                                                 <div class="flexibleContainer">

                                                        <label class="flexible" style="flex: 6;" id="InvoiveFeeLabel">Referral
                                                               Fee</label>

                                                        <label style="flex: 0.1;" class="flexible">$</label>

                                                        <label class="flexible" style="text-align: right; font-variant-numeric: tabular-nums;"
                                                               type="text" id="PropertyFeeInvoice" name="PropertyFeeInvoice"></label>
                                                        <input type="hidden" id="HiddenPropertyFeeInvoice" name="HiddenPropertyFeeInvoice">
                                                 </div>

                                                 <div class="flexibleContainer" style="margin-top: 4px;">

                                                        <label class="flexible" style="flex: 6;">HST (<%=Mycompany.HSTNumberPart1%> RT <%=Mycompany.HSTNumberPart2%>)</label>

                                                        <label class="flexible" style="flex: 0.1;"></label>

                                                        <label class="flexible"
                                                               style="text-align: right; font-variant-numeric: tabular-nums;"
                                                               id="PropertyHSTInvoice"
                                                               name="PropertyHSTInvoice"></label>
                                                               
                                                        <input type="hidden" id="HiddenPropertyHSTInvoice"
                                                               name="HiddenPropertyHSTInvoice">

                                                 </div>

                                                 <div class="flexibleContainer" style="margin-top: 4px;">

                                                        <label class="flexible heavyfont"
                                                               style="flex: 6;"><b>Balance</b></label>

                                                        <label class="flexible heavyfont"
                                                               style="flex: 0.1;">$</label>

                                                        <label class="flexible heavyfont"
                                                               style="text-align: right; font-variant-numeric: tabular-nums;"
                                                               id="BalanceInvoice"></label>
                                                               
                                                               
                                                        <input type="hidden" id="HiddenBalanceInvoice"
                                                               name="HiddenBalanceInvoice">

                                                 </div>
                                          </div><!-- Closing SomeDetailInformation" -->

                                          <div class="invoiceBox NewSectionSmall" style="padding: 0; ">
                                                 <p class="noticePayment" style=" margin-bottom: 0;">
                                                        Please mail a
                                                        cheque payable to "<%=Mycompany.BusinessName%>" or make an electronic
                                                        payment to our commission trust account: </p>

                                                        <div id="BankInformation"  class="noticePayment" style="margin-top: 0;    padding-top: 0;">

                                                               <div style="width: 100%;">
              
                                                                      <label style="width: 100px; font-weight: bold;">Bank:</label>
              
                                                                      <label class="inlineInput" id="InvoiceBank" name="InvoiceBank"
                                                                             value="" style="padding: 0;"><%=Mycompany.CommissionBankNumber%></label>
                                                                      <input type="hidden" id="HiddenInvoiceBank" name="HiddenInvoiceBank" >
                                                               </div>
              
                                                               <div style="width: 100%; margin-top: 1px;">
              
                                                                      <label style="width: 100px; font-weight: bold;">Transit:</label>
              
                                                                      <label class="inlineInput" id="InvoiceTransit"
                                                                             name="InvoiceTransit" style="padding: 0;"><%=Mycompany.CommissionTransitNumber%></label>
                                                                             
                                                                      <input type="hidden" id="hiddenInvoiceTransit" name="hiddenInvoiceTransit">
                                                               </div>
              
                                                               <div style="width: 100%; margin-top: 1px; ">
              
                                                                      <label style="width: 100px; font-weight: bold;">Account:</label>
              
                                                                      <label class="inlineInput" id="InvoiceAccount"
                                                                             name="InvoiceAccount" style="padding: 0;"><%=Mycompany.CommissionAccountNumber%></label>
              
                                                                      <input type="hidden" id="hiddenInvoiceAccount" name="hiddenInvoiceAccount" >
                                                               </div>
              
                                                        </div><!-- Closing BankInformation" -->
                                          </div>
                                          


                                          <div id="SenderInformation">

                                                 <label style="margin-top: 35px;">Sincerely,</label>

                                                 <br>

                                                 <label style="padding-left: 0; margin-top: 34px;" class="inlineInput" id="InvoiceBroker" name="InvoiceBroker" readonly><%=MyInformation.Firstname%><%=" "%><%=MyInformation.Lastname%></label>

                                                 <br>
                                                 

                                                 <label style="margin-top: 0px;">Broker of Record</label>

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

                                   </div>
                            </div>
                            
                            
                           <input  type="hidden" id="HiddenInvoiceClients"  name="HiddenInvoiceClients"     value="" >
                           
                            <input  type="hidden" id="hiddenInvoiceDate"  name="hiddenInvoiceDate"     value="" >
           
           
                     </div><!-- Closing InvoiceMainSection -->


                     <div id="InvoiceButtonSection" class="FooterButton">

                            <div class="FooterButtonSpan">

                                   <span class="buttonDiscard floatDataLefttSide">

                                          <!-- <button style="display: none;" id="InvoiceDiscard" type="button" onclick=" "> Discard </button> -->

                                          <span class="buttonBack"> <button id="InvoiceDiscard" type="button"
                                                        class="buttonBlue"
                                                        onclick="TabsHandleler(event,'Parties','tabcontent','tablinks','PartiesTab');">
                                                        Back </button>
                                          </span>
                                   </span>

                                   <span class="secondSpan">

                                          <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn4"
                                                 style="display: none;">Delete</button>
                                          <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                 id="Deletebtn1_4">Discard</button>
                                          <button class="dropdownMenubtn dropBtn2"
                                                 type="button" id="ExitWithoutSaving4">Exit without saving</button>
                                          <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn4">Save and
                                                 close</button>

                                          <span class="savespan" id="savespan4">

                                                 <button class="buttonSaveOne" type="button" id="InvoiceSave" name="InvoiceSave" >Save</button>
                                                 <button class="buttonSaveTwo"
                                                        onclick="openWindow('ExitWithoutSaving4', 'Deletebtn4', 'Savebtn4', 'savespan4','Deletebtn1_4', 1, event)"
                                                        type="button">&nbsp;</button>

                                          </span>

                                          <button id="InvoiceNext" class="buttonBlue" type="button"
                                                 onclick="NextStepInvoice( '<%=MyInformation.User_Split%>','<%=0%>','<%= MyInformation.User_Province%>','<%= MyInformation.User_Split2%>','<%= MyInformation.User_Split3%>','<%=MyInformation.User_Cap%>',  '<%= MyInformation.User_Cap2%>','<%= MyInformation.User_Cap3 %>','<%= Mycompany.Temp%>' );"> Next </button>

                                   </span>

                            </div>

                     </div><!-- Closing InvoiceButtonSection -->

              </div><!-- Closing Invoice tab Content -->


              <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div id="ReferralFeeRecordSheet" class="tabcontent" style="display: none;">

                     <div id="MainSectionReferralFeeRecordSheet" style="width: 100%;">

                            <label id="Title5" class="HeadLines" style="width: auto;">REFERRAL FEE RECEIPT</label>

                            <span class="tooltip floatDataRightSide">
                                   <img class="lineButton printButton" type="button" id="PrintRecordSheet"
                                          onclick="PrintPage('PrintRecordSheet');" src="../ImagesUsed/Print.png"
                                          alt="Print">
                                   <span class="tooltiptext">Print page</span>
                            </span>
                            
                            <div class="forAddressTop">
                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"></label>
                            </div>

                            <hr style="margin-top: 4px; margin-right: 4px;">

                            <label style="font-weight: bold; margin-bottom: 10px; margin-top: 6px;">RECORD SHEET</label>


                            <div id="RecordSheetPropertyDetailInformation" class="">

                                   <div id="RecordSheetPropertyDetailInformation"
                                          style="max-width: 700px; width: 100%; margin-left: -5px; display: flex;">

                                          <div class="columnSmall flexible" style="padding-left: 5px;">

                                                 <div class="card">

                                                        <label class="TRSlabel heavyfont">Report Date</label>

                                                        <span class="cardSpan"><input class="TRSinput heavyfont"
                                                                      type="text" id="ReferralFeeRecordSheetDate"
                                                                      name="ReferralFeeRecordSheetDate" value=""
                                                                      readonly></span>

                                                 </div>

                                          </div>


                                          <div class="columnSmall flexible" style="box-sizing: border-box">

                                                 <div class="card">

                                                        <label class="TRSlabel heavyfont">Source</label>

                                                        <span class="cardSpan"><input class="TRSinput heavyfont"
                                                                      type="text" id="ReferralFeeRecordSheetSource"
                                                                      name="ReferralFeeRecordSheetSource"
                                                                      value="Not inserted" readonly></span>

                                                 </div>

                                          </div>

                                          <div class="columnSmall flexible"
                                                 style="box-sizing: border-box; padding-right: 5px;">

                                                 <div class="card">

                                                        <label class="TRSlabel heavyfont">Referral Fee</label>

                                                        <span class="cardSpan" style="text-align: center;"><input
                                                                      class="TRSinput heavyfont" type="text"
                                                                      id="ReferralFeeRecordSheetfee"
                                                                      style="float: none; padding-left: 0; width: 80%;"
                                                                      name="ReferralFeeRecordSheetfee"
                                                                      value="Not inserted" readonly></span>

                                                 </div>

                                          </div>

                                   </div>

                            </div><!-- CloseRecordSheetPropertyDetailInformation -->

                            <div id="RecordSheetPartiesInformation" class="NewSectionMedium" style="margin-left: -14px;">

                                   <p class="headerTRS">Parties and Contact Details</p>

                                   <table style="width:100%;" id="tableOne" class='NewSectionSmall'>

                                          <tr>
                                                 <th width="15%" style="padding-left:14px;     text-align: left;">Party</th>

                                                 <th width="22%">Name</th>

                                                 <th width="22%">Company</th>

                                                 <th width="27%">Address</th>

                                                 <th width="15%">Phone</th>
                                          </tr>

                                          <tr id="DisplayClient1">

                                                 <td style='padding-left: 14px;'>Client</td>
                                                        
                                                        <!-- <input type="text" class="inlineInput" id="RecordSheetParty1"
                                                               style="padding-left:8px" name="RecordSheetParty1"
                                                               value="Client" readonly> -->

                                                 <td id="RecordSheetClientName1"></td>
                                                        <!-- <input type="text" class="inlineInput"
                                                               name="RecordSheetClientName1" value="" readonly> -->

                                                 <td id="RecordSheetClientCompany1"></td>
                                                        <!-- <textarea type="text" class="inlineInput"
                                                               id="RecordSheetClientCompany1"
                                                               style="resize: none; height: 30px;"
                                                               name="RecordSheetClientCompany1" value=""
                                                               readonly></textarea> -->

                                                 <td id="RecordSheetClientAddress1"></td>
                                                        <!-- <textarea class="inlineInput" type="text"
                                                               id="RecordSheetClientAddress1"
                                                               name="RecordSheetClientAddress1" value=""
                                                               style="resize: none; height: 30px;" readonly></textarea> -->

                                                        <!-- <input type="text" class="inlineInput"
                                                               id="RecordSheetClientAddress1"
                                                               name="RecordSheetClientAddress1" value="" readonly> -->

                                                 



                                                 <td id="RecordSheetClientPhone1" class="TRSphone"></td>

                                                 <!-- <input type="text" class="inlineInput"
                                                               style="padding: 0;" name="RecordSheetClientPhone1"
                                                               value="" readonly> -->

                                          </tr>

                                          <tr id="DisplayClient2" style="display: none;">

                                                 <td id="RecordSheetParty2" style='padding-left: 14px;'>Client</td>
                                                 <!-- <input type="text" class="inlineInput"
                                                               style="padding-left:8px" name="RecordSheetParty2"
                                                               value="Client" readonly> -->

                                                 <td id="RecordSheetClientName2"></td>
                                                 <!-- <input type="text" class="inlineInput"
                                                               name="RecordSheetClientName2" value="" readonly> -->

                                                 <td id="RecordSheetClientCompany2"></td>
                                                 <!-- <textarea type="text" class="inlineInput"
                                                               
                                                               style="resize: none; height: 30px;"
                                                               name="RecordSheetClientCompany2" value=""
                                                               readonly></textarea> -->

                                                 <td id="RecordSheetClientAddress2"></td>
                                                        <!-- <textarea class="inlineInput" type="text"
                                                               id="RecordSheetClientAddress2"
                                                               name="RecordSheetClientAddress2" value=""
                                                               style="resize: none; height: 30px;"
                                                               readonly=""></textarea> -->

                                                        <!-- <input type="text" class="inlineInput"
                                                               id="RecordSheetClientAddress2"
                                                               name="RecordSheetClientAddress2" value="" readonly> -->

                                                

                                                 <td id="RecordSheetClientPhone2" class="TRSphone"></td>
                                                        <!-- <input type="text" class="inlineInput"
                                                               style="padding: 0;" name="RecordSheetClientPhone2"
                                                               value="" readonly> -->


                                          </tr>

                                          <tr id="DisplayReferralSource1">

                                                 <td id="RecordReferralSourceSheetParty1" style='padding-left: 14px;'>Referral Recipient</td>
                                                        <!-- <input type="text" class="inlineInput" style="padding-left:8px"
                                                               id="RecordReferralSourceSheetParty1"
                                                               name="RecordSheetReferralSourceParty1"
                                                               value="Referral Source" readonly> -->

                                                 <td id="RecordSheetReferralSourceName1"></td>
                                                        <!-- <input type="text" class="inlineInput"
                                                               id="RecordSheetReferralSourceName1"
                                                               name="RecordSheetReferralSourceName1" value="" readonly> -->
                                                

                                                 <td id="RecordSheetReferralSourceCompany1"></td>
                                                        <!-- <textarea type="text" class="inlineInput"
                                                               id="RecordSheetReferralSourceCompany1"
                                                               name="RecordSheetReferralSourceCompany1" value=""
                                                               style="resize: none; height: 30px;" readonly></textarea> -->
                                                 

                                                 <td id="RecordSheetReferralSourceAddress1"></td>
                                                        <!-- <textarea class="inlineInput" type="text"
                                                               id="RecordSheetReferralSourceAddress1"
                                                               name="RecordSheetClientAddress1" value=""
                                                               style="resize: none; height: 30px;"
                                                               readonly=""></textarea> -->

                                                 

                                                 <td id="RecordSheetReferralSourcePhone1" class="TRSphone"></td>
                                                        <!-- <input type="text" class="inlineInput"
                                                               id="RecordSheetReferralSourcePhone1" style="padding: 0;"
                                                               name="RecordSheetReferralSourcePhone1" value="" readonly> -->
                                                 
                                          </tr>


                                   </table>

                            </div><!-- Close RecordSheetPartiesInformation -->

                            <div class="NewSectionMedium">

                                   <button id="Editbtn" type="button" class="EditButton"
                                          onclick="editHST();">Edit HST</button>
                                   <button id="EditSubmit" type="button" style="display: none;" class="EditButton"
                                          onclick="submitHST();">Confirm</button>
                                   <button id="EditDiscard" type="button" style="display: none;" class="EditButton"
                                          onclick="discardHST('<%=MyInformation.User_Province%>');">Reset</button>

                                   <p class="headerTRS" style="margin-left: -14px;">Fee Breakdown</p>

                                   <table style="width: calc(100% + 14px); margin-left: -14px;" id="tableTwo" class='NewSectionSmall'>

                                          <tr>
                                                 <th style='padding-left: 14px;' width="27%">Description</th>

                                                 <th width="9%" id="allocation" class="headlineright"
                                                        style="display: none;">Allocation</th>

                                                 <th width="11%" class="headlineright" style='padding-right: 8px;'>Split</th>

                                                 <th width="13%" class="headlineright">Fee</th>

                                                 <th width="14%" class="headlineright">HST</th>

                                                 <th width="12%" id="HSTHead1" class="headlineright ChangedHST"
                                                        style="display: none;">HST (%)</th>

                                                 <th width="14%" class="headlineright">Total</th>
                                          </tr>

                                          <tr id="DisplayBreakdownGrossFee">

                                                 <td><input type="text" class="inlineInput" id="BreakdownGrossFeeLabel"
                                                               style="text-align: left; padding-left: 8px;"
                                                               name="BreakdownGrossFeeLabel" value="Gross Fee" readonly>
                                                 </td>

                                                 <td id="Allocation1" style="display: none;"><input type="text"
                                                               class="inlineInput" id="Allocation1Input"
                                                               style="padding-right: 0px;" step=".1" name="Allocation1"
                                                               value="" readonly></td>

                                                 <td><input type="text" class="inlineInput" id="BreakdownGrossFeeSplit"
                                                               style="padding-right: 0px;" step=".1"
                                                               name="BreakdownGrossFeeSplit" value="" readonly></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownGrossFeeAmount" step=".01"
                                                               name="BreakdownGrossFeeAmount" value="" readonly></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               step=".01" id="BreakdownGrossFeeAmountHST"
                                                               name="BreakdownGrossFeeAmountHST" value="" readonly></td>

                                                 <td style="display: none;" class="ChangedHST" id="BreakdownNetHSTPercentTD"><input
                                                               class="inlineInput  textRight numberclass withBorder"
                                                               oninput="maxlengthCheckHST(this)"  onblur="addPercent(this.id);"
                                                                type="text"
                                                               id="BreakdownGrossFeeAmountHSTPercent"
                                                               name="BreakdownGrossFeeAmountHSTPercent" value=""></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownGrossFeeTotal" step=".01"
                                                               name="BreakdownGrossFeeTotal" value="" readonly></td>

                                          </tr>

                                          <tr id="DisplayBreakdownAgent1">

                                                 <td><input type="text" class="inlineInput" id="BreakdownAgent1Name"
                                                               style="text-align: left;  padding-left: 8px;"
                                                               name="BreakdownAgent1Name" value="First Agent" readonly>
                                                 </td>

                                                 <td id="Allocation2" style="display: none;"><input type="text"
                                                               class="inlineInput" id="Allocation2Input"
                                                               style="padding-right: 0px;" step=".1" name="Allocation2"
                                                               value="" readonly></td>

                                                 <td><input type="text" class="inlineInput" id="BreakdownAgent1Split"
                                                               style="padding-right: 0px;" step=".1"
                                                               name="BreakdownAgent1Split" value="" readonly>
                                                 </td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent1Amount" step=".01"
                                                               name="BreakdownAgent1Amount" value="" readonly></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent1HST" step=".01"
                                                               name="BreakdownAgent1HST" value="" readonly>
                                                 </td>

                                                 <td style="display: none;" class="ChangedHST" id="BreakdownAgent1HSTPercentTD"><input
                                                               class="inlineInput  textRight numberclass withBorder"
                                                               oninput="maxlengthCheckHST(this)"  onblur="addPercent(this.id);" type="text"
                                                               id="BreakdownAgent1HSTPercent"
                                                               name="BreakdownAgent1HSTPercent" value=""></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent1Total" step=".01"
                                                               name="BreakdownAgent1Total" value="" readonly>
                                                 </td>


                                          </tr>

                                          <tr id="DisplayBreakdownAgent2" style="display: none;">

                                                 <td><input type="text" class="inlineInput" id="BreakdownAgent2Name"
                                                               style="text-align: left;  padding-left: 8px;"
                                                               name="BreakdownAgent2Name" value="Second Agent" readonly>
                                                 </td>

                                                 <td id="Allocation3" style="display: none;"><input type="text"
                                                               class="inlineInput" id="Allocation3Input"
                                                               style="padding-right: 0px;" step=".1" name="Allocation3"
                                                               value="" readonly></td>

                                                 <td><input type="text" class="inlineInput" id="BreakdownAgent2Split"
                                                               style="padding-right: 0px;" step=".1"
                                                               name="BreakdownAgent2Split" value="" readonly>
                                                 </td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent2Amount" step=".01"
                                                               name="BreakdownAgent2Amount" value="" readonly></td>

                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent2HST" step=".01"
                                                               name="BreakdownAgent2HST" value="" readonly>
                                                 </td>

                                                 <td style="display: none;" class="ChangedHST" id="BreakdownAgent2HSTPercentTD"><input
                                                               class="inlineInput  textRight numberclass withBorder"
                                                               oninput="maxlengthCheckHST(this)"  onblur="addPercent(this.id);" type="text"
                                                               id="BreakdownAgent2HSTPercent"
                                                               name="BreakdownAgent2HSTPercent" value=""></td>


                                                  

                                                 <td><input type="text" class="inlineInput textRight numberclass"
                                                               id="BreakdownAgent2Total" step=".01"
                                                               name="BreakdownAgent2Total" value="" readonly>
                                                 </td>


                                          </tr>

                                          <tr id="DisplayNetToBrokerage" class="topLine">

                                                 <td><input type="text" class="inlineInput" id="BreakdownNetLabel"
                                                               style="text-align: left;  padding-left: 8px;"
                                                               name="BreakdownNetLabel" value="Net To Brokerage"
                                                               readonly></td>


                                                 <td id="Allocation4" style="display: none;"><input type="text"
                                                               class="inlineInput" id="Allocation4Input"
                                                               style="padding-right: 0px;" step=".1" name="Allocation4"
                                                               value="" readonly></td>

                                                 <td><input type="text" class="inlineInput" id="BreakdownNetSplit"
                                                               style="padding-right: 0px;" step=".1"
                                                               name="BreakdownNetSplit" value="" readonly>
                                                 </td>

                                                 <td><input type="text" class="inlineInput  textRight numberclass"
                                                               id="BreakdownNetFee" step=".01" name="BreakdownNetFee"
                                                               value="" readonly></td>

                                                 <td><input type="text" class="inlineInput  textRight numberclass"
                                                               id="BreakdownNetHST" step=".01" name="BreakdownNetHST"
                                                               value="" readonly></td>


                                                 <td style="display: none;" class="ChangedHST" id="EmptyPercent"></td>
                                                 <td><input type="text" class="inlineInput  textRight numberclass"
                                                               id="BreakdownNetTotal" step=".01"
                                                               name="BreakdownNetTotal" value="" readonly>
                                                 </td>
                                          </tr>

                                   </table>

                            </div>

                            <div  class='NewSectionMedium'>
                                   <p id="TermsError" class="ErrorEmpty" style="display: none;">You need to accept terms
                                          and conditions before you can finalize this deal. </p>

                                   <div class="NewSectionSmall flexibleContainer" id="ConfirmationRecordCheckbox">
                                          <label class="container flexible" style="flex: 0.01;"><input
                                                        class="inlineInput" onclick="completeRecord()" type="checkbox"
                                                        id="ConfirmationRecordSheet" name="ConfirmationRecordSheet"
                                                        value="YES"><span class="checkmark"
                                                        style="top: 13px;"></span></label>
                                          <label class="flexible"
                                                 style="line-height: 1.5;margin-left: 26px; margin-top: 10px;">
                                                 <!-- <label class="MandentorySign"></label> -->
                                                 It is understood between all parties that this
                                                 agreement shall constitute a Commission Trust Agreement as set out in
                                                 the contract. To the best of my knowledge the information provided in
                                                 this trade
                                                 record is correct.</label></div>
                            </div>

                            <div class="NewSectionSmall flexibleContainer" id="Signingdiv"
                                   style="margin-top: 40px; display: none;">

                                   <label class="flexible" style="flex: 0.4;">DATED at</label>

                                   <input class="inlineInput flexible"
                                          style="margin-top: 1px; border: 1px solid lightgray; width: 100%;"
                                          type="text">

                                   <label class="flexible" style="flex: 1; text-align: center;" for="">Ontario, on
                                          28-Jul-2021</label>

                                   <input class="inlineInput flexible"
                                          style=" margin-top: 1px; border: 1px solid lightgray; width: 100%;"
                                          type="text">

                                   <label class="flexible" style="flex: 0.4; text-align: right;" for="">First
                                          Agent</label>

                            </div>

                     </div> <!-- Closing MainSectionApprasialRecordSheet -->

                     <div id="myModal" class="modal">
                            <div class="modal-content">
                                   <span id="beforeApproved">
                                          <div style="box-sizing: initial;" class="modalHeader">Finalize<span
                                                        class="closeSign"><i class="bi bi-x-lg"></i></span></div>
                                          <p style="line-height: 1.5;">Are you ready to finalize this deal?</p>

                                          <div class="popUpContainer">
                                                 <span class="close">Cancel</span>
                                                 <button class="submitButton" type="submit" onclick="submitted('<%= MyInformation.Firstname %> <%= MyInformation.Lastname %>');"
                                                        id="Finalized" name="Finalized">Finalize</button>
                                          </div>
                                   </span>

                                   <div id="afterApproved" style="display: none; height: 210px;">
                                          <div style="box-sizing: initial;" class="modalHeader">Finalized<span class="closeSign"><i class="bi bi-x-lg"></i></span>
                                          </div>
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

                     <div class="FooterButton">

                            <div class="FooterButtonSpan">

                                   <span class="buttonDiscard floatDataLefttSide">

                                          <!-- <button style="display: none;" id="ReferralFeeRecordSheetDiscard" type="button" onclick=" "> Discard
                                          </button> -->

                                          <span class="buttonBack"><button id="ReferralFeeRecordSheetBack" type="button"
                                                        class="buttonBlue"
                                                        onclick="TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');">
                                                        Back </button>
                                          </span>
                                   </span>

                                   <span class="secondSpan">

                                          <button class="dropdownMenubtn dropBtn1" type="button"
                                                 style="display: none;" id="Deletebtn5">Delete</button>
                                          <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                 id="Deletebtn1_5">Discard</button>
                                          <button class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving5">Exit
                                                 without saving</button>
                                          <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn5">Save and close</button>

                                          <span class="savespan" id="savespan5">

                                                 <button class="buttonSaveOne" style="    width: 95px;" type="button"
                                                        id="ReferralFeeRecordSheetSave" name="ReferralFeeRecordSheetSave" >Save</button>
                                                 <button class="buttonSaveTwo"
                                                        onclick="openWindow('ExitWithoutSaving5', 'Deletebtn5', 'Savebtn5', 'savespan5','Deletebtn1_5', 1, event)"
                                                        type="button">&nbsp;</button>

                                          </span>

                                          <button id="ReferralFeeRecordSheetNext" class="buttonBlue" type="button"
                                                 style="width: 150px; padding: 8px 10px;">Finalize</button>

                                   </span>

                            </div>

                     </div><!-- Closing  ApprasialRecordSheetButtonSection -->

              </div><!-- Closing ApprasialRecordSheet tab Content -->

              <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

              <div id="Documents" class="tabcontent" style="display: none;">

                     <div id="DocumentsMainSection" style="margin-right: 4px;">

                            <label id="Title4" class="HeadLines">REFERRAL FEE RECEIPT</label>

                            <div class="forAddressTop">

                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"></label>
                            </div>

                            <hr style="margin-top: 4px; margin-right: 4px;">

                            <label style="font-weight: bold;margin-top: 22px; ">DOCUMENTS</label>

                            <p id="saveError" class="ErrorEmpty" style="display: none;">Complete the Transaction Details before saving the deal.</p>

                            <div id="MainDocumentSection" class="extraStyling flexibleContainer"
                                   style="height: 85px; border: 1px solid lightgrey; margin-top: 20px;">

                                   <div class="flexible itemLongerLawFirm" style="padding-top: 20px; margin: 5PX 4PX 0PX 6PX; margin-left: 13px; flex: 0.45; margin-right: 12px;">

                                   <label id="doclab" style="text-align: left; background-color: #f3f3f3; height: 31px; margin-top: 1px; padding-top: 9px; padding-right: 0;" for="FileName0" 
                                   class="custom-file-upload inlineInput">Select
                                   document to upload
                                   </label>
                                   <span class="formats">(PDF)</span>
                                   <span id="noDocumentError" class="fieldError" style="display: none;">Please select a document</span>
                                   

                                   </div>

                                   <div class="flexible itemShortLawyer" style="margin-top: 26px;">
                                   
                                   <!-- <label class="MandentorySign"></label><label></label> -->

                                   <input style="height: 31px;" class="inlineInput" type="text" id="EXtraDocumentName1" name="EXtraDocumentName1" placeholder="Document Name">

                                   <span id="noNameDocumentError" class="fieldError" style="display: none;">Please enter a document name</span>
                                   </div>
                                   <label class="flexible" style="flex: 0.2; margin-top: 26px;"><button type="submit" id="documentSubmitbtn" name="documentSubmitbtn" class="buttonSave" onclick="getdocName()">Save</button></label>

                            </div>



                            <div id="UploadedDocuments" style="    margin-top: 22px;">

                                   <!-- <label class="SomeMarginbottom heavyfont">Documents</label> -->
                           
                                   <div id="storedDocuments">
                                     <div class="oneDocument" style="display: none;">
                                       <input type="file" id="FileName0" name="FileName0" accept=".pdf" multiple="true"  onchange="docNameFill(this.id)">
                                        <input type="Hidden" id="FileName" name="FileName"  >
                                       <label for=""></label><br>
                                       <label for=""></label>
                                       <button class="deleteDoc bi bi-trash floatDataRightSide" onclick="deleteDocument('FileName0')"></button>
                                       <a href=""><img src="../ImagesUsed/Upload.png" class="uploadImgDoc"></a>
                                     </div>
                                   </div>
                                  
                                 </div><!-- Closing UploadedDocuments -->

                                 <div class="NewSection" style="margin-bottom: 40px;">

                                   <label style="font-weight: bold; margin-top: 22px; margin-bottom: 22px;">NOTES</label>
                           
                                   <div class="noteBox">
                           
                                     <textarea class="forNotes" type="text" id="ExteraNotes" name="ExteraNotes" ></textarea>
                           
                                     <button class="buttonSave" type="submit" id="savenote" name="savenote" onclick="saveNotes('<%= MyInformation.Firstname %>', '<%= MyInformation.Lastname %>')">Save</button>
                           
                                   </div>
                           
                                 </div>
                           
                                 <div id="forNotes"></div>

                                 <input type="hidden" name="allNotesDocuments" id="allNotesDocuments">

                     </div><!-- Closing DocumentsMainSection  -->



                     <div id="DocumentsButtonSection" class="FooterButton">

                            <div class="FooterButtonSpan">

                                   <span class="buttonDiscard floatDataLefttSide">

                                          <!-- <button style="display: none;" id="DocumentsDiscard" type="button" onclick=" "> Discard </button> -->

                                          <!--  <span class="buttonBack"> <button id="DocumentsDiscard" type="button"
                                                 class="buttonBlue"
                                                 onclick="TabsHandleler(event,'Invoice','tabcontent','tablinks','InvoiceTab');">
                                                 Back </button>
                                   </span> -->
                                   </span>

                                   <span class="secondSpan">

                                          <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn6"
                                                 style="display: none;">Delete</button>
                                          <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                 id="Deletebtn1_6">Discard</button>
                                          <button class="dropdownMenubtn dropBtn2"
                                                 type="button" id="ExitWithoutSaving6">Exit without saving</button>
                                          <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn6">Save and close</button>

                                          <span class="savespan" id="savespan6">

                                                 <button class="buttonSaveOne" type="button" id="DocumentsSave" name="DocumentsSave" >Save</button>
                                                 <button class="buttonSaveTwo"
                                                        onclick="openWindow('ExitWithoutSaving6', 'Deletebtn6', 'Savebtn6', 'savespan6','Deletebtn1_6', 1, event)"
                                                        type="button">&nbsp;</button>

                                          </span>

                                   </span>

                            </div>

                     </div><!-- Closing DocumentsButtonSection  -->

              </div><!-- Closing Documents tab Content -->

              <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->
              <div id="AuditTrail" class="tabcontent" style="display: none;">


                     <div id="AuditTrailMainSection">

                            <label id="Title4" class="HeadLines">Other</label>

                            <span style="display: none;" class="tooltip floatDataRightSide">
                                   <!-- <button type="button" id="Docs" onclick="onClick('Docs');">Print</button> -->
                                   <img class="lineButton printButton" type="button" id="Docs"
                                          onclick="onClick('Docs');" src="../ImagesUsed/Print.png" alt="Print">
                                   <span class="tooltiptext">Print page</span>
                            </span>

                            <div class="forAddressTop">

                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"></label>
                            </div>

                            <hr style="margin-top: 4px; margin-right: 4px;">

                            <p id="saveError2" class="ErrorEmpty" style="display: none;">Complete the Transaction Details before saving the deal.</p>

                            <label style="font-weight: bold; margin-top: 22px;">AUDIT TRAIL</label>

                            <div class="PartiesNavBar" id="Partiesnav" style="display: none;">

                                   <button id="" class="tablinks2 active" style="width: 120px;"> Activity </button>

                                   <button id="" class="tablinks2" style="width: 120px;"
                                          onclick="alert('Coming soon..');"> Payments </button>

                            </div>
                            
                            <input type="hidden" name="allNotesInput" id="allNotesInput">

                            <div id="AuditNotes" class="forAuditTrail NewSectionMedium"></div>

                     </div><!-- Closing AuditTrailMainSection  -->


                     <div id="AuditTrailButtonSection" class="FooterButton">

                            <div class="FooterButtonSpan">

                                   <span class="buttonDiscard floatDataLefttSide">

                                          <!-- <button style="display: none;" id="AuditTrailDiscard" type="button" onclick=" "> Discard </button> -->


                                   </span>

                                   <span class="secondSpan">

                                          <button class="dropdownMenubtn dropBtn1" type="button" id="Deletebtn7" style="display: none;">Delete</button>
                                          <button class="dropdownMenubtn dropbtnDiscard" type="button" id="Deletebtn1_7" >Discard</button>
                                          <button class="dropdownMenubtn dropBtn2" type="button" id="ExitWithoutSaving7">Exit without saving</button>
                                          <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn7">Save and close</button>

                                          <span class="savespan" id="savespan7">

                                                 <button class="buttonSaveOne" type="button" id="AuditTrailSave">Save</button>
                                                 <button class="buttonSaveTwo" onclick="openWindow('ExitWithoutSaving7', 'Deletebtn7', 'Savebtn7', 'savespan7','Deletebtn1_7', 1, event)" type="button">&nbsp;</button>

                                          </span>


                                   </span>

                            </div>

                     </div><!-- Closing AuditTrailButtonSection  -->

              </div> <!-- Closing Audit Trail -->

              <div id="PreviewTRS"></div>
              <div class="loadingmodal"></div>
              <input id="bnHidden" type="hidden" value="<%=Mycompany.BusinessName%>">

              <input type="hidden" id="progressMarks" name="progressMarks" value = '0'>
              <input id="finalizDate" name="finalizDate" type="hidden" value="">
              <input id="createddate" name="createddate" type="hidden" value="">
        </form>
              
       </form>

</div>
</body>

<script>



       $(document).ready(function() {
      
              $.getScript("../Scripts/ReferralFee.js").then(function() {
                     $.getScript("../Scripts/ReferralOnLoad.js").then(function() {
                            $("#EmailForm").removeClass("loading");  
                            fileOpened('<%= MyInformation.Firstname %> <%= MyInformation.Lastname %>');
                     
                     })
              });
       });
       $('#EmailForm').submit(function(e){
              // e.preventDefault();
              // do ajax now
              if(!($('#EmailForm').attr('target') == 'hiddenFrame')){
                     window.location.href = "../BrokerFiles/Dashboard.jsp";
              }
       }); 
        
</script>

</html>