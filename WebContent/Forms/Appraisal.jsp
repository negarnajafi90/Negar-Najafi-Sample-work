 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%@ page import="java.sql.*" %>

 <%@ page import="java.util.ArrayList" %>

 <%@ page import="RDS.RDSFunctions"  %>

 <%@ page import="ProMasterClasses.Users"  %>

 <%@ page import="ProMasterClasses.Transaction"  %>

 <%@ page import="ProMasterClasses.Companies" %>
 
 <%@ page import="ProMasterClasses.CommissionDetails"  %>
 
 <%@ page import="java.sql.Connection" %>



<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

       <html>

        <head>

               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

               <!-- Scripts to add jQuerry and bootrstrap -->

               <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

               <script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>

               <link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

               <link rel="stylesheet"
                      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

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

               <!-- <script type="text/javascript" src="../Scripts/AmountsFix.js"></script> -->

               <!-- <script type="text/javascript" src="../Scripts/Appraisal.js"></script> -->

               <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

               <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

               <title>Other Form - Masterre</title>

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

  int  TransactionID= Mycompany.TransactionID +1;

  //System.out.println( "TransactionID" + " " + TransactionID);
  
  session.setAttribute("TransactionID",TransactionID);
 
  
  String Companylogo="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+Mycompany.ID;
  


  %>

        <body>

               <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
               <script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
               <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/polyfills.umd.js"></script>

               <!-- <script type="text/javascript" src="AppraisalScript.js"></script> -->
              <div class='flexBody'>
                     <div class="navBar">
                            <div class="logo">
                                          <img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">
                                          <img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">
                            </div>
                            <button id="TransactionDetailsTab" class="tablinks active"
                                          onclick="TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');"><img
                                                 id="TransactionDetailsTabIMG" class="accept"
                                                 src="../ImagesUsed/Didnotaccept.png" alt="X">
                                          Transaction Details </button>

                            <button id="PartiesTab" class="tablinks"
                                          onclick="  TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');"
                                          disabled><img id="PartiesTabIMG" class="accept" src="../ImagesUsed/Didnotaccept.png"
                                                 alt="YesOrNo">
                                          Parties </button>

                            <button id="InvoiceTab" class="tablinks"
                                          onclick="  TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');"><img
                                                 id="InvoiceTabIMG" class="accept" src="../ImagesUsed/Didnotaccept.png"
                                                 alt="YesOrNo"> Invoice </button>

                            <button id="ApprasialRecordSheetTab" class="tablinks"
                                          onclick="  TabsHandleler(event, 'ApprasialRecordSheet', 'tabcontent', 'tablinks', 'ApprasialRecordSheetTab');"
                                          disabled><img class="accept" id="ApprasialRecordSheetTabIMG" src="../ImagesUsed/Didnotaccept.png" alt="YesOrNo"> Record Sheet</button>

                            <button id="DocumentsTab" class="tablinks" style="padding-left: 45px;" onclick="PropertyAddress('Propertyaddress4'); TabsHandleler(event, 'Documents', 'tabcontent', 'tablinks', 'DocumentsTab');">Documents </button>
                            <button id="AuditTrailTab" class="tablinks" style="padding-left: 45px;" onclick=" PropertyAddress('Propertyaddress6'); TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks', 'AuditTrailTab'); "> Audit Trail </button>
                     </div>

                     <iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>

                     <form name="EmailForm" action="../Appraisal" id="EmailForm" method="post" enctype="multipart/form-data" target='hiddenFrame' class='RightSideFlex loading'>

                                   <div class="loadingmodal"></div>

                             <div id="myModalEmail" class="modal">

                                    <div class="modal-content">
                                           <span class="close"><i class="bi bi-x-lg"></i></span>
                                           <div class="emailBody">

                                                  <div class="HeaderDashboard flexibleContainer">

                                                         <label class="DealsHeader flexible">Email Commission
                                                                Statement</label>

                                                  </div>

                                                  <div class="errors">
                                                         <p id="comissionEmailed" class="ErrorEmpty greedBack"
                                                                style='display: none'>Commission statement was emailed.
                                                                See <span
                                                                       style="text-decoration:underline; cursor: pointer"
                                                                       onclick="PropertyAddress('Propertyaddress6'); TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks', 'AuditTrailTab'); closeEmailPopup()">Audit
                                                                       Trail</span> for additional details.</p>
                                                         <p id="emptyAdresseeError" class="ErrorEmpty"
                                                                style='display: none'>Select at least one email
                                                                recipient.</p>
                                                         <p id="emptyEmailFields" class="ErrorEmpty"
                                                                style='display: none'>Complete all required fields
                                                                before proceeding.</p>
                                                         <p class="ErrorEmpty blueBack">Balance due to Broker: $<span
                                                                       id="paysumEmail"></span></p>
                                                  </div>

                                                  <div id="Addressee">
                                                         <div class="Addressee">
                                                                <label for="" class="headlineEmail">Addressee</label>
                                                                <div class="flexibleContainer">

                                                                </div>
                                                         </div>

                                                         <div class="optional">
                                                                <label for="" class="headlineEmail">Optional Parties
                                                                       <img src="../ImagesUsed/Arrow.png"
                                                                              onclick="showAddParties()"
                                                                              id="iconEmailPreview" alt=""
                                                                              loading="lazy"></label>

                                                                <div id="optionalDIV" class="remove">

                                                                       <div class="flexibleContainer">

                                                                       </div>

                                                                </div>

                                                         </div>
                                                  </div>
                                                  <div class="message">
                                                         <div class="subject">
                                                                <label class="MandentorySign"></label><label
                                                                       for="">Subject Line</label>
                                                                <input id="subjectLineEmail" name="subjectLineEmail"
                                                                       type="text" class="inlineInput">
                                                         </div>
                                                         <div class="notes">
                                                                <label class="MandentorySign"></label><label
                                                                       for="">Email Notes</label>
                                                                <textarea id="messageEmail" name="messageEmail"
                                                                       class="inlineInput TextArea" cols="30"
                                                                       rows="10">Please see attached our commission statement. &#10;&#10;&#10;&#10;Kind regards, &#10;&#10;The Best Brokerage</textarea>
                                                         </div>
                                                  </div>

                                                  <div class="popUpContainer" style='display: flex'>
                                                         <label class="container flexible emailCopy"><input
                                                                       class="inlineInput" type="checkbox"
                                                                       id="Secondary7" name="Secondary7" value=""><span
                                                                       class="checkmark"></span>Email me a copy</label>
                                                         <label class="container flexible emailCopy"><input
                                                                       class="inlineInput" type="checkbox"
                                                                       id="Secondary8" name="Secondary8" value=""><span
                                                                       class="checkmark"></span>Save to
                                                                documents</label>
                                                         <button style='width: auto;' class="submitButton" type="button"
                                                                id="SendEmailInvoice" name="SendEmailInvoice"
                                                                onclick="validateSendInvoice()">Send</button>
                                                  </div>

                                           </div>
                                    </div>
                             </div>


                             <input type="hidden" id="agentNameHidden" value='<%=MyInformation.Firstname%> <%=MyInformation.Lastname%>'>

                             <form action="../Appraisal" id="AgentApprasialForm" name="AgentApprasialForm" method="post" enctype="multipart/form-data" target="hiddenFrame" class="loading">

                                    <div id="myModal2" class="modal">

                                           <!-- Modal content -->
                                           <div class="modal-content">
                                                  <p>You sure you want to exit?</p>
                                                  <div class="popUpContainer">
                                                         <span class="close">No</span>
                                                         <button class="submitButton" type="submit" id="Exit"
                                                                name="Exit">Yes</button>
                                                  </div>
                                                  <!-- <span>Cancel</span> -->
                                           </div>

                                    </div>
                                    <div id="myModalSaveClose" class="modal">

                                           <!-- Modal content -->
                                           <div class="modal-content">
                                                  <div class="modalHeader">Save and close</div>
                                                  <p>Do you want to save and close?</p>
                                                  <div class="popUpContainer">
                                                         <span class="close">No</span>
                                                         <button class="submitButton" type="submit" id="SaveExit"
                                                                name="SaveExit">Yes</button>
                                                  </div>
                                                  <!-- <span>Cancel</span> -->
                                           </div>

                                    </div>
                                    <div id="myModalHST" class="modal">

                                           <div class="modal-content">
                                                  <div class="modalHeader">HST Reset</div>
                                                  <p>Do you want to reset HST to original rates?</p>
                                                  <div class="popUpContainer">
                                                         <span class="close">No</span>
                                                         <button class="submitButton" onclick="discardHST();"
                                                                id='ResetHSTbutton' type="button">Yes</button>
                                                  </div>
                                           </div>

                                    </div>
                                    <div id="myModalExit" class="modal">

                                           <!-- Modal content -->
                                           <div class="modal-content">
                                                  <div class="modalHeader">Exit without saving</div>
                                                  <p>Do you want to leave without saving?</p>
                                                  <div class="popUpContainer">
                                                         <span class="close">No</span>
                                                         <a href="../BrokerFiles/Dashboard.jsp"><button
                                                                       class="submitButton" type="button"
                                                                       id="ExitwithNosaving"
                                                                       name="ExitwithNosaving">Yes</button></a>
                                                  </div>
                                                  <!-- <span>Cancel</span> -->
                                           </div>

                                    </div>
                                    <div id="myModalDiscard" class="modal">

                                           <!-- Modal content -->
                                           <div class="modal-content">
                                                  <div class="modalHeader">Discard</div>
                                                  <p>Do you want to leave without saving?</p>
                                                  <div class="popUpContainer">
                                                         <span class="close">No</span>
                                                         <a href="../BrokerFiles/Dashboard.jsp"><button
                                                                       class="submitButton" type="button" id="Discard"
                                                                       name="Discard">Yes</button></a>
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

                                                         <button class="submitButton" type="submit" id="Delete"
                                                                name="Delete">Yes</button>
                                                  </div>
                                                  <!-- <span>Cancel</span> -->
                                           </div>

                                    </div>
                                    <div id="myModalSave" class="modal">

                                           <!-- Modal content -->
                                           <div class="modal-content">

                                                  <img src="../ImagesUsed/checkmarkGreen.png"
                                                         style="width: 20px; float: left;" alt=""><label>Document
                                                         saved</label>
                                           </div>

                                    </div>
                                    <div id="myModalEmailSent" class="modal">
                                           <div class="modal-content">
                                                  <img src="../ImagesUsed/checkmarkGreen.png"
                                                         style="width: 20px; float: left;" alt=""><label>Email sent</label>
                                           </div>
                                    </div>

                                    <div id="TransactionDetails" class="tabcontent">

                                           <div id="TransactionMainSection">

                                                  <label class="HeadLines" id="Title1">Other</Label>

                                                  <hr style="margin-right: 4px;">


                                                  <p id="ErrorEmpty1" class="ErrorEmpty" style="display: none;">
                                                         <label>Please
                                                                complete all fields before proceeding to the next
                                                                section</label></p>

                                                  <div class="flexibleContainer" style="margin-top: 24px;">

                                                         <div class="flexible">

                                                                <label class="MandentorySign"></label><label>Service
                                                                       Type</label>

                                                                <div id="DealTypeCustom" class="custom-select" onclick="DealTypeTitleSet()">

                                                                       <select id="DealType" name="DealType">

                                                                              <option value="">-- Please choose an
                                                                                     option --</option>

                                                                              <option value="Appraisal">Appraisal
                                                                              </option>

                                                                              <option value="Letter of Opinion">Letter
                                                                                     of Opinion</option>

                                                                              <option value="Valuation">Valuation
                                                                              </option>

                                                                              <option value="Consulting">Consulting
                                                                              </option>

                                                                              <option value="Other">Other</option>

                                                                       </select>

                                                                </div>
                                                         </div>



                                                         <div class="flexible">
                                                                <!-- <label class="NoMandatory" id="ServiceMandatory"></label><label></label> -->

                                                                <span>
                                                                       <label class="NoMandatory"
                                                                              id="ServiceMandatory"></label><label>Service
                                                                              Description</label>

                                                                       <span class="tooltipHelp"><img
                                                                                     src="../ImagesUsed/HelpIcone.png"
                                                                                     alt="MasterProBrokerHelp"
                                                                                     width="16" height="16"><span
                                                                                     class="tooltiptext"
                                                                                     style="width: 200px">Service
                                                                                     description that will appear on the
                                                                                     invoice</span></span>

                                                                       <input class="inlineInput"
                                                                              style="margin-top: -1px;" type="text"
                                                                              id="ServiceDescription" maxlength="45"
                                                                              name="ServiceDescription" value=""
                                                                              placeholder="Provide service description">
                                                                </span>

                                                         </div>

                                                  </div>

                                                  <div class="flexibleContainer">

                                                         <div class="flexible">
                                                                <label class="MandentorySign"></label><label>Our
                                                                       Fee</label>

                                                                <div class="inlineInput shortValue" id="AppraisalFeeDiv"
                                                                       style="padding: 1px 5px 1px 0">
                                                                       <label>$</label>
                                                                       <input class="input5" type="number" step="0.01"
                                                                              id="AppraisalFee" name="AppraisalFee"
                                                                              step="0.01" placeholder="0.00"
                                                                              maxlength="15"
                                                                              onblur="clearing(this.id); limiting(this)">
                                                                </div>

                                                         </div>

                                                         <div class="flexible">
                                                                <label
                                                                       class="MandentorySign"></label><label>Source</label>

                                                                <div id="AppraisalSourceCustom" class="custom-select" onclick="PropertySource();">

                                                                       <select id="AppraisalSource" name="AppraisalSource" >

                                                                              <option value="">-- Please choose an
                                                                                     option --</option>

                                                                              <option value="Agent-lead"
                                                                                     id="Agent's own">Agent lead
                                                                              </option>

                                                                              <option value="Office-lead">Office lead
                                                                              </option>

                                                                       </select>

                                                                </div>
                                                         </div>

                                                  </div>

                                                  <div class="flexibleContainer">

                                                         <div class="flexible">
                                                                <label class="MandentorySign"></label><label>Completion
                                                                       Date</label>

                                                                <div class="input-group">
                                                                       <input id="CompletionDate" name="CompletionDate"
                                                                              type="text"
                                                                              class="form-control date-input"
                                                                              placeholder="DD MM YYYY"
                                                                              readonly="readonly" />
                                                                       <label class="input-group-btn"
                                                                              for="CompletionDate"
                                                                              id="CompletionDateLabel">
                                                                              <span class="btn btn-default">
                                                                                     <span
                                                                                            class="glyphicon glyphicon-calendar"></span>
                                                                              </span>
                                                                       </label>
                                                                </div>

                                                         </div>

                                                         <div class="flexible">
                                                                <label id="field"
                                                                       class="MandentorySign"></label><label>Property
                                                                       Type</label>

                                                                <div class="custom-select">

                                                                       <select id="PropertyType" name="PropertyType">

                                                                              <option value="">-- Please choose an
                                                                                     option --</option>

                                                                              <option value="Detached">Detached</option>

                                                                              <option value="Semi-detached">
                                                                                     Semi-detached</option>

                                                                              <option value="Townhouse">Townhouse
                                                                              </option>

                                                                              <option value="Condominium">Condominium
                                                                              </option>

                                                                              <option value="Commercial">Commercial
                                                                              </option>

                                                                              <option value="Land">Land</option>

                                                                              <option value="Othert">Other</option>

                                                                       </select>

                                                                </div>

                                                         </div>

                                                  </div>


                                                  <div id="OfficeLeadCommisisonSection"
                                                         class="NewSectionSmall Notification"
                                                         style="display:none; padding-top: 16px; margin-top: 42px; padding-bottom: 4px;">

                                                         <label style="font-weight: bold;">Office lead allocation
                                                         </label>

                                                         <div style="display: flex;">

                                                                <label class="flexible"
                                                                       style="flex: 3; margin-top: 15px;">Gross
                                                                       commission
                                                                       allocation to office</label>

                                                                <div class="percent inlineInput flexible"
                                                                       style="background: white;">
                                                                       <label>%</label> <input class="input5"
                                                                              type="number" step="0.01" min="0.00"
                                                                              onblur="limiting(this)" placeholder="0.00"
                                                                              step="0.01" maxlength="10" value="50.00"
                                                                              id="OfficeLeadAllocatonPercentage"
                                                                              name="OfficeLeadAllocatonPercentage"
                                                                              oninput="maxLengthCheck100(this);">
                                                                </div>

                                                         </div>

                                                         <div style="display: flex;">

                                                                <label class="flexible" style="flex: 3;">Apply against
                                                                       agent's commission
                                                                       cap</label>

                                                                <div class="flexible">
                                                                       <label style="float: right; margin-right: 11px; margin-bottom: 0px;"
                                                                              class="container"
                                                                              style="margin-bottom: 0;">
                                                                              <input class="inlineInput" type="checkbox"
                                                                                     id="OfficeLeadAgainstCap"
                                                                                     name="OfficeLeadAgainstCap"
                                                                                     checked><span class="checkmark"
                                                                                     style="left: -5px;     top: -8px;">
                                                                       </label>
                                                                </div>
                                                         </div>


                                                  </div> <!-- Closing OfficeLeadCommisisonSection -->

                                                  <div class="NewSection">

                                                         <div class="flexibleContainer">

                                                                <div class="flexible">

                                                                       <label class="NoMandatory"
                                                                              id="SignUnitNumber"></label><label>Unit</label>

                                                                       <input class="inlineInput" type="text"
                                                                              id="UnitNumber" name="UnitNumber" value=""
                                                                              maxlength="10">
                                                                </div>

                                                                <div class="flexible">
                                                                       <label id="AddressField1"
                                                                              class="MandentorySign"></label><label>Street
                                                                              Number</label>

                                                                       <input class="inlineInput" type="text"
                                                                              id="StreetNumber" name="StreetNumber"
                                                                              value="" maxlength="10">
                                                                </div>

                                                                <div class="flexible">
                                                                       <label id="AddressField2"
                                                                              class="MandentorySign"></label><label>Street
                                                                              Name</label>

                                                                       <input class="inlineInput" type="text"
                                                                              id="StreetName" name="StreetName" value=""
                                                                              maxlength="40">
                                                                </div>

                                                         </div>

                                                         <div class="flexibleContainer">

                                                                <div class="flexible">
                                                                       <label id="AddressField3"
                                                                              class="MandentorySign"></label><label>City</label>

                                                                       <input class="inlineInput" type="text" id="City"
                                                                              name="City" value="" maxlength="30">
                                                                </div>

                                                                <div class="flexible">
                                                                       <label id="AddressField5"
                                                                              class="MandentorySign"></label><label>Province</label>

                                                                       <div class="custom-select"
                                                                              onclick="ifProvinceOther('PropertyProvince','Country'); fillHST();  Display('PropertyProvince', 'PropertyState')">

                                                                              <select id="PropertyProvince"
                                                                                     name="PropertyProvince" readonly>

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

                                                                                     <option value="Other">Other
                                                                                     </option>

                                                                              </select>

                                                                       </div>

                                                                </div>

                                                                <div class="flexible">

                                                                       <label id="AddressField4"
                                                                              class="MandentorySign"></label><label>Postal
                                                                              Code</label>

                                                                       <input class="inlineInput" type="text"
                                                                              id="PostalCode" maxlength="11"
                                                                              name="PostalCode" value="">
                                                                       <!-- onblur="postalCorrect(this.id);" -->
                                                                </div>

                                                                <div class="flexible">

                                                                       <label id="AddressField6"
                                                                              class="MandentorySign"></label><label>Country</label>

                                                                       <input class="inlineInput" type="text"
                                                                              id="Country" name="Country" maxlength="20"
                                                                              value="Canada" readonly>
                                                                </div>

                                                         </div>

                                                         <div class="flexibleContainer" style="display: none;"
                                                                id="PropertyState">
                                                                <div class="flexible">
                                                                       <label class="MandentorySign"></label><label>Other
                                                                              province or
                                                                              state</label>

                                                                       <input type="text" class="inlineInput"
                                                                              id="PropertyOtherProvince" maxlength="20"
                                                                              name="PropertyOtherProvince" value="">
                                                                </div>
                                                                <div class="flexibleotherProvince"></div>
                                                         </div>

                                                  </div>

                                                  <div class="flexibleContainer" style="display:none;">
                                                         <span class="flexible"
                                                                style="display:block; margin-right: auto; margin-top: 16px;">

                                                                <label class="container">

                                                                       <input onclick="HSTView();" class="checkbox"
                                                                              type="checkbox" id="HSTViewcheckmark"
                                                                              name="HSTViewcheckmark"
                                                                              style="border-color: lightgrey;"><span
                                                                              class="checkmark"></span></label>

                                                                <label style="margin-left: 16px;">View GST/HST</label>

                                                                <span id="HSTSection"
                                                                       class="inlineInput percentSpan percent"
                                                                       style="display:none; margin-top: 17px; width: calc(50% - 4px); margin-right: 2px;">

                                                                       <label id="" style="margin-top: 1px;">%</label>

                                                                       <input class="input5" type="number" step="0.01"
                                                                              placeholder="0.00" id="HSTAMount"
                                                                              name="HSTAMount" value="13.00"
                                                                              oninput="maxlengthCheckHST(this)"
                                                                              onblur="addPercent(this.id);">

                                                                </span>

                                                         </span>
                                                         <div class="flexible"></div>
                                                  </div>


                                                  <div id="AddingSecondAgentSection" class="NewSectionMedium">

                                                         <div id="FirstAgentIDCustomDiv" class="NewSection flexible "
                                                                style="width:50%; display:none;">

                                                                <label class="MandentorySign"></label><label>First
                                                                       Agent</label>

                                                                <div class="custom-select" id="FirstAgentIDCustom" onclick="SetSecondAgentLists('SecondAgentID');"
                                                                       style="width:99%;">

                                                                       <select class="inputFull" id="FirstAgentID" name="FirstAgentID">

                                                                              <option
                                                                                     value="<%=MyInformation.id%><%=" "%><%=MyInformation.Firstname%><%=" "%><%=MyInformation.Lastname%>">
                                                                                     <%=MyInformation.Firstname%><%=" "%><%=MyInformation.Lastname%>
                                                                              </option>

                                                                       </select>
                                                                </div>
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

                                                                var agents = ['agent1', 'agent2', 'agent3'];

                                                                var IDs = [1, 2, 3];

                                                                // <% 

                                                                // for (int i = 0; i < AgentList.size(); i++) { %> 


                                                                // agents.push(addelemet);

                                                                // IDs.push( MyId);




                                                                // var select1 = document.getElementById("FirstAgentID");

                                                                //In the following for loop , the agents list is assigin to select option list  

                                                                /* for (var i = 0; i < agents.length; i++) {

                                                                       var opt = agents[i]; //Setting the data for an option

                                                                       var el1 = document.createElement("option");

                                                                       el1.textContent = opt;

                                                                       el1.value = IDs[i] + " " + opt;

                                                                       select1.appendChild(el1);

                                                                } */ //Closing the for loop 
                                                         </script>


                                                         <div class="flexible" style="display:none">

                                                                <label class="container"
                                                                       style="margin-left: 7px;"><input
                                                                              class="inlineInput"
                                                                              onclick="AddSecondAgent();"
                                                                              type="checkbox"
                                                                              id="AddSecondAgentCheckBox"
                                                                              name="AddSecondAgentCheckBox">
                                                                       <span class="checkmark"
                                                                              style="top: 16px; left: -7px;"></span></label>

                                                                <label style="margin-left: 6px;">Add another
                                                                       agent</label>

                                                                <span class="tooltipHelp"><img
                                                                              src="../ImagesUsed/HelpIcone.png"
                                                                              alt="MasterProBrokerHelp" width="16"
                                                                              height="16"><span
                                                                              class="tooltiptext">Second agent must be
                                                                              from your
                                                                              brokerage.</span></span>

                                                         </div>




                                                         <div id="SecondAgentDetailInformation" class="flexible"
                                                                style="display:none;">

                                                                <p id="ErrorEmptySecondAgentComission"
                                                                       class="ErrorEmpty" style="display: none;">
                                                                       <label>Commission amount should be between 0.01%
                                                                              and 99.99%</label></p>

                                                                <p id="ErrorEmptySecondAgent" class="ErrorEmpty"
                                                                       style="display: none;">
                                                                       <label>Please chose second agent.</label></p>

                                                                <div class="flexibleContainer">

                                                                       <div class="flexible">

                                                                              <label
                                                                                     class="MandentorySign"></label><label>Second
                                                                                     Agent</label>

                                                                              <div class="custom-select" id="SecondAgentIDCustom" onclick="">

                                                                                     <select id="SecondAgentID"
                                                                                            name="SecondAgentID">

                                                                                            <option value="">-- Please
                                                                                                   choose an option --
                                                                                            </option>

                                                                                            <option value="Agent2">
                                                                                                   Agent2</option>

                                                                                            <option value="Agent3">
                                                                                                   Agent3</option>

                                                                                            <option value="Agent4">
                                                                                                   Agent4</option>

                                                                                     </select>

                                                                              </div>

                                                                       </div>

                                                                       <div class="flexible"></div>

                                                                </div>

                                                                <div class="flexibleContainer">

                                                                       <div class="flexible lowMargign flexibleContainer"
                                                                              style="margin-bottom: 2px;">

                                                                              <label class="SomelabelStyle flexible NoMandatoryMove"
                                                                                     id="Agent1ID">First Agent</label>

                                                                              <span class="inlineInput shortValuePercent flexible"
                                                                                     style="margin-bottom: 0px; float: right; margin: 0;">
                                                                                     <label
                                                                                            style="float: right;">%</label>
                                                                                     <input class="input5"
                                                                                            style="background: none;"
                                                                                            onblur="limiting(this); "
                                                                                            oninput="maxLengthCheck(this); CommissionAllocations();"
                                                                                            type="number" step="0.01"
                                                                                            id="FirstAgentCommissionPercentage"
                                                                                            value="100.00"
                                                                                            name="FirstAgentCommissionPercentage"
                                                                                            placeholder="50.00"></span>
                                                                       </div>
                                                                       <div class="flexible lowMargign"></div>

                                                                </div>
                                                                <!-- onblur="clearingPercent(this.id); clearingPercent('SecondAgentCommissionPercentage');" -->
                                                                <div class="flexibleContainer">

                                                                       <div class="flexible lowMargign flexibleContainer"
                                                                              style="margin-top: 2px;">
                                                                              <label class="SomelabelStyle flexible NoMandatoryMove"
                                                                                     id="Agent2ID">Second
                                                                                     Agent</label>

                                                                              <span class="inlineInput shortValuePercent flexible"
                                                                                     style="background-color: #f3f3f3; border-color:lightgray; margin: 0; float: right;"><label
                                                                                            style="float: right;">%</label>
                                                                                     <input class="input5" type="number"
                                                                                            step="0.01"
                                                                                            style="background: none;"
                                                                                            style="background-color: #f3f3f3; cursor: auto;"
                                                                                            id="SecondAgentCommissionPercentage"
                                                                                            value="0.00"
                                                                                            name="SecondAgentCommissionPercentage"
                                                                                            placeholder="50.00"
                                                                                            readonly="readonly"></span>
                                                                       </div>
                                                                       <div class="flexible lowMargign"></div>
                                                                </div>


                                                         </div><!-- Closing SecondAgentDetailInformation -->





                                                  </div><!-- Closing AddingSecondAgentSection -->

                                           </div><!-- Close TransactionMainSection -->

                                           <div id="TransactionButtonSection" class="FooterButton">

                                                  <div class="FooterButtonSpan">

                                                         <span class="buttonDiscard floatDataLefttSide">

                                                         </span>

                                                         <span class="secondSpan">

                                                                <button class="dropdownMenubtn dropBtn1" type="button"
                                                                       id="Deletebtn1"
                                                                       style="display: none;">Delete</button>
                                                                <button class="dropdownMenubtn dropbtnDiscard"
                                                                       type="button" id="Deletebtn1_1">Discard</button>
                                                                <button class="dropdownMenubtn dropBtn2" type="button"
                                                                       id="ExitWithoutSaving1">Exit without
                                                                       saving</button>
                                                                <button class="dropdownMenubtn dropBtn3" type="button"
                                                                       id="Savebtn1">Save and
                                                                       close</button>

                                                                <span class="savespan" id="savespan1">

                                                                       <button class="buttonSaveOne" type="button"
                                                                              id="TransactionSave"
                                                                              name="TransactionSave">Save</button>
                                                                       <input type="button" id="somebutton" name='somebutton' value="saveSubmit">
                                                                       <button class="buttonSaveTwo"
                                                                              onclick="openWindow('ExitWithoutSaving1', 'Deletebtn1', 'Deletebtn1_1', 1, 'Savebtn1', 'savespan1', event)"
                                                                              type="button">&nbsp;</button>

                                                                </span>

                                                                <button id="TransactionNext" class="buttonBlue"
                                                                       type="button" onclick="NextStepTransaction(1);">
                                                                       Next </button>

                                                         </span>
                                                  </div>

                                           </div><!-- Closing TransactionButtonSection -->

                                    </div><!-- Closing TransactionDetails tab Content -->

                                    <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

                                    <div id="Parties" class="tabcontent" style="display: none;">

                                           <div id="MainPartiesContent">

                                                  <label id="Title2" class="HeadLines">Other</label>

                                                  <div class="forAddressTop">

                                                         <label id="Propertyaddress2"></label>

                                                  </div>

                                                  <span style="font-weight: bold; display: none;">99</span>

                                                  <hr style="margin-top: 4px; margin-right: 4px;">

                                                  <div class="PartiesNavBar">

                                                         <button id="ClientTab" type="button" class="tablinks1"
                                                                style="width: 120px;" onclick="BackStepOwner();"> Client
                                                         </button>

                                                         <button id="OwnerTab" type="button" class="tablinks1"
                                                                style="width: 120px;" onclick="NextStepClient();"> Owner
                                                         </button>

                                                         <span id="ClientProcess">

                                                                <span class="tooltip">
                                                                       <img src="../ImagesUsed/AddSVG.svg"
                                                                              class="lineButton manageListButton"
                                                                              alt="+" type="button"
                                                                              onclick="AddOneParty('client2', 'AddClient');"
                                                                              id="AddClient" name="AddClient"><span
                                                                              class="tooltiptext">Add
                                                                              client</span>
                                                                </span>

                                                         </span>




                                                         <span style="display:none" id="OwnerProcess">


                                                                <span class="tooltip">
                                                                       <img src="../ImagesUsed/AddSVG.svg" type="button"
                                                                              id="AddOwner"
                                                                              onclick="AddOneParty('Owner2', 'AddOwner');"
                                                                              name="AddOwner"
                                                                              class="lineButton manageListButton"
                                                                              alt="+"><span class="tooltiptext">Add
                                                                              owner</span>
                                                                </span>

                                                         </span>

                                                  </div>

                                                  <div class="tabcontent1" id="Client">

                                                         <div id="MainClientSection">

                                                                <p id="ErrorEmpty2" class="ErrorEmpty"
                                                                       style="display:none;">

                                                                       <label> Complete all fields
                                                                              before proceeding to the next
                                                                              section</label></p>

                                                                <div id="client1">
                                                                       <div class="flexibleContainer NewSectionSmall">

                                                                              <div class="flexible">

                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Type</label>

                                                                                     <div id="ClientType1Custom" class="custom-select" onclick="ChecksPartiesType('ClientType1', 'Individusal1','NotAnIndividusal1');">

                                                                                            <select id="ClientType1" name="ClientType1">

                                                                                                   <option value="">--
                                                                                                          Please choose
                                                                                                          an
                                                                                                          option --
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Individual">
                                                                                                          Individual
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Corporation">
                                                                                                          Corporation
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Partnership">
                                                                                                          Partnership
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Trust">
                                                                                                          Trust</option>

                                                                                            </select>
                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <span id='poaV1'>
                                                                                            <label
                                                                                                   class="NoMandatoryTwo">Power
                                                                                                   of attorney</label>

                                                                                            <input class="input inlineInput"
                                                                                                   type="text"
                                                                                                   id="poaVendor1"
                                                                                                   maxlength="45"
                                                                                                   name="poaVendor1"
                                                                                                   value="">
                                                                                     </span>
                                                                              </div>

                                                                       </div>

                                                                       <div id="NotAnIndividusal1" style="display:none"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Business
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="ClientBusinessName1"
                                                                                            name="ClientBusinessName1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Authorised
                                                                                            Signing Officer</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="ClientSigningOfficere1"
                                                                                            name="ClientSigningOfficere1"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing NotAnIndividusal1 -->

                                                                       <div id="Individusal1"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>First
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="ClientFirstName1"
                                                                                            name="ClientFirstName1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Last
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="ClientLastName1"
                                                                                            name="ClientLastName1"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing Individusal1 -->


                                                                       <div id="CopyPropertyAddress1"
                                                                              class="NewSectionCopy">

                                                                              <label class="container"><input
                                                                                            class="inlineInput"
                                                                                            onclick="CopyAddress('ClientUnitNumber1','ClientStreetNumber1','ClientStreetName1','ClientProvince1','ClientPostalCode1','ClientCity1','ClientCountry1', 'ClientState1');"
                                                                                            type="checkbox"
                                                                                            id="AddSecondAgentCheckBox"
                                                                                            name="AddSecondAgentCheckBox">
                                                                                     <span class="checkmark"
                                                                                            style="top: 16px;left: 8px;"></span></label>


                                                                              <label style="margin-left: 22px;">Copy
                                                                                     Property
                                                                                     Address</label>

                                                                       </div>



                                                                       <div name="address" id="ClientAddress">

                                                                              <div class="flexibleContainer ">

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="NoMandatoryTwo">Unit</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   id="ClientUnitNumber1"
                                                                                                   name="ClientUnitNumber1"
                                                                                                   value=""
                                                                                                   maxlength="10">
                                                                                     </div>

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>Street
                                                                                                   Number</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   id="ClientStreetNumber1"
                                                                                                   maxlength="10"
                                                                                                   name="ClientStreetNumber1"
                                                                                                   value="">
                                                                                     </div>

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>Street
                                                                                                   Name</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   id="ClientStreetName1"
                                                                                                   maxlength="40"
                                                                                                   name="ClientStreetName1"
                                                                                                   value="">
                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexibleContainer">

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>City</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   id="ClientCity1"
                                                                                                   name="ClientCity1"
                                                                                                   maxlength="30"
                                                                                                   value="">
                                                                                     </div>

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>Province</label>

                                                                                            <div class="custom-select"
                                                                                                   onclick="ifProvinceOther('ClientProvince1','ClientCountry1'); Display('ClientProvince1', 'ClientState1')">

                                                                                                   <select id="ClientProvince1"
                                                                                                          name="ClientProvince1"
                                                                                                          readonly>

                                                                                                          <option
                                                                                                                 value="ON">
                                                                                                                 ON
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="AB">
                                                                                                                 AB
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="BC">
                                                                                                                 BC
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="MB">
                                                                                                                 MB
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="NB">
                                                                                                                 NB
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="NL">
                                                                                                                 NL
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="NT">
                                                                                                                 NT
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="NS">
                                                                                                                 NS
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="NU">
                                                                                                                 NU
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="ON">
                                                                                                                 ON
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="PE">
                                                                                                                 PE
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="QC">
                                                                                                                 QC
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="SK">
                                                                                                                 SK
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="YT">
                                                                                                                 YT
                                                                                                          </option>

                                                                                                          <option
                                                                                                                 value="Other">
                                                                                                                 Other
                                                                                                          </option>

                                                                                                   </select>
                                                                                            </div>
                                                                                     </div>

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>Postal
                                                                                                   Code</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   id="ClientPostalCode1"
                                                                                                   maxlength="11"
                                                                                                   name="ClientPostalCode1"
                                                                                                   value="">
                                                                                            <!-- onblur="postalCorrect(this.id);" -->
                                                                                     </div>

                                                                                     <div class="flexible">
                                                                                            <label
                                                                                                   class="MandentorySign"></label><label>Country</label>

                                                                                            <input class="inlineInput"
                                                                                                   type="text"
                                                                                                   maxlength="20"
                                                                                                   id="ClientCountry1"
                                                                                                   name="ClientCountry1"
                                                                                                   value="Canada"
                                                                                                   readonly>
                                                                                     </div>

                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              style="display: none;" id="ClientState1">
                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Other
                                                                                            province or state</label>

                                                                                     <input type="text"
                                                                                            class="inlineInput"
                                                                                            id="ClientOtherProvince1"
                                                                                            maxlength="20"
                                                                                            name="ClientOtherProvince1"
                                                                                            value="">
                                                                              </div>
                                                                              <div class="flexibleotherProvince"></div>
                                                                       </div>

                                                                       <div class="flexibleContainer NewSection">


                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Email</label>

                                                                                     <input onblur="emailCorrect(this.id)"
                                                                                            class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientEmail1"
                                                                                            name="ClientEmail1"
                                                                                            maxlength="50" value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Phone</label>


                                                                                     <input onkeydown="phoneNumberFormatter(this.id)"
                                                                                            class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientPhone1"
                                                                                            maxlength="14"
                                                                                            name="ClientPhone1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible itemShortPhone">

                                                                                     <div
                                                                                            class="custom-select NoMandatoryPhone">

                                                                                            <select id="ClientExteraContactInformationLabel1"
                                                                                                   name="ClientExteraContactInformationLabel1">


                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="International Phone">
                                                                                                          International
                                                                                                          Phone</option>

                                                                                            </select>
                                                                                     </div>

                                                                                     <input class="inlineInput"
                                                                                            class="input" type="number"
                                                                                            step="0.01"
                                                                                            id="ClientExteraContact1"
                                                                                            maxlength="32"
                                                                                            name="ClientExteraContact1"
                                                                                            value="">
                                                                              </div>
                                                                       </div>

                                                                </div><!-- Closing Client1 -->

                                                                <div id="client2" style="display:none;">

                                                                       <div class="NewSection">
                                                                              <span>
                                                                                     <label
                                                                                            style="margin-left: 8px; font-weight: bold;">Second
                                                                                            Client</label>

                                                                                     <span
                                                                                            class="tooltip floatDataRightSide">
                                                                                            <img src="../ImagesUsed/RemoveSVG.svg"
                                                                                                   class="lineButtonMinus manageListButton"
                                                                                                   alt="-" type="button"
                                                                                                   onclick="RemoveOneParty('client2','AddClient')"
                                                                                                   style="display: inline;"
                                                                                                   id="RemoveOneDeposit"><span
                                                                                                   class="tooltiptext">Remove
                                                                                                   Client</span>
                                                                                     </span>

                                                                                     <hr style="margin-right: 4px;">
                                                                              </span>

                                                                       </div>

                                                                       <div class="flexibleContainer NewSectionSmall">

                                                                              <div class="flexible ">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Type</label>

                                                                                     <div id="ClientType2Custom"
                                                                                            class="custom-select" onclick="ChecksPartiesType('ClientType2', 'Individusal2','NotAnIndividusal2');">

                                                                                            <select id="ClientType2"
                                                                                                   name="ClientType2">

                                                                                                   <option value="">--
                                                                                                          Please choose
                                                                                                          an
                                                                                                          option --
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Individual">
                                                                                                          Individual
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Corporation">
                                                                                                          Corporation
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Partnership">
                                                                                                          Partnership
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Trust">
                                                                                                          Trust</option>

                                                                                            </select>

                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <span id='poaV2'>
                                                                                            <label
                                                                                                   class="NoMandatoryTwo">Power
                                                                                                   of attorney</label>

                                                                                            <input class="input inlineInput"
                                                                                                   type="text"
                                                                                                   id="poaVendor2"
                                                                                                   maxlength="45"
                                                                                                   name="poaVendor2"
                                                                                                   value="">
                                                                                     </span>
                                                                              </div>

                                                                       </div>

                                                                       <div id="NotAnIndividusal2" style="display:none"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Business
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="ClientBusinessName2"
                                                                                            name="ClientBusinessName2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Authorised
                                                                                            Signing Officer</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="ClientSigningOfficere2"
                                                                                            name="ClientSigningOfficere2"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing NotAnIndividusal2 -->

                                                                       <div id="Individusal2"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>First
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="ClientFirstName2"
                                                                                            name="ClientFirstName2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Last
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="ClientLastName2"
                                                                                            name="ClientLastName2"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing Individusal2 -->
                                                                       <div id="CopyPropertyAddress2"
                                                                              class="NewSectionCopy">

                                                                              <label class="container"><input
                                                                                            class="inlineInput"
                                                                                            onclick="CopyAddress('ClientUnitNumber2','ClientStreetNumber2','ClientStreetName2','ClientProvince2','ClientPostalCode2','ClientCity2','ClientCountry2', 'ClientState2');"
                                                                                            type="checkbox" id=""
                                                                                            name="">
                                                                                     <span class="checkmark"
                                                                                            style="top: 16px;left: 8px;"></span></label>

                                                                              <label style="margin-left: 22px;">Copy
                                                                                     Property Address</label>

                                                                       </div>


                                                                       <div class="flexibleContainer"
                                                                              id="ClientAddress2">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="NoMandatoryTwo">Unit</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientUnitNumber2"
                                                                                            name="ClientUnitNumber2"
                                                                                            value="" maxlength="10">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Number</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientStreetNumber2"
                                                                                            maxlength="10"
                                                                                            name="ClientStreetNumber2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="40"
                                                                                            id="ClientStreetName2"
                                                                                            name="ClientStreetName2"
                                                                                            value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>City</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" id="ClientCity2"
                                                                                            maxlength="30"
                                                                                            name="ClientCity2" value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Province</label>

                                                                                     <div class="custom-select"
                                                                                            onclick="ifProvinceOther('ClientProvince2','ClientCountry2'); Display('ClientProvince2', 'ClientState2')">

                                                                                            <select id="ClientProvince2"
                                                                                                   name="ClientProvince2"
                                                                                                   readonly>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="AB">AB
                                                                                                   </option>

                                                                                                   <option value="BC">BC
                                                                                                   </option>

                                                                                                   <option value="MB">MB
                                                                                                   </option>

                                                                                                   <option value="NB">NB
                                                                                                   </option>

                                                                                                   <option value="NL">NL
                                                                                                   </option>

                                                                                                   <option value="NT">NT
                                                                                                   </option>

                                                                                                   <option value="NS">NS
                                                                                                   </option>

                                                                                                   <option value="NU">NU
                                                                                                   </option>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="PE">PE
                                                                                                   </option>

                                                                                                   <option value="QC">QC
                                                                                                   </option>

                                                                                                   <option value="SK">SK
                                                                                                   </option>

                                                                                                   <option value="YT">YT
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Other">
                                                                                                          Other</option>

                                                                                            </select>
                                                                                     </div>
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Postal
                                                                                            Code</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="11"
                                                                                            id="ClientPostalCode2"
                                                                                            name="ClientPostalCode2"
                                                                                            value="">
                                                                                     <!-- onblur="postalCorrect(this.id);" -->
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Country</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="20"
                                                                                            id="ClientCountry2"
                                                                                            name="ClientCountry2"
                                                                                            value="Canada" readonly>
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              style="display: none;" id="ClientState2">
                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Other
                                                                                            province or state</label>

                                                                                     <input type="text"
                                                                                            class="inlineInput"
                                                                                            id="ClientOtherProvince2"
                                                                                            maxlength="20"
                                                                                            name="ClientOtherProvince2"
                                                                                            value="">
                                                                              </div>
                                                                              <div class="flexibleotherProvince"></div>
                                                                       </div>

                                                                       <div class="flexibleContainer NewSection">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Email</label>

                                                                                     <input onblur="emailCorrect(this.id)"
                                                                                            class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientEmail2"
                                                                                            name="ClientEmail2"
                                                                                            maxlength="50" value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Phone</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="ClientPhone2"
                                                                                            onkeydown="phoneNumberFormatter(this.id)"
                                                                                            maxlength="14"
                                                                                            name="ClientPhone2"
                                                                                            value="">
                                                                              </div>


                                                                              <div class="flexible itemShortPhone">

                                                                                     <div
                                                                                            class="custom-select NoMandatoryPhone">

                                                                                            <select id="ClientExteraContactInformationLabel2"
                                                                                                   name="ClientExteraContactInformationLabel2">

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="International Phone">
                                                                                                          International
                                                                                                          Phone</option>

                                                                                            </select>
                                                                                     </div>

                                                                                     <input class="inlineInput"
                                                                                            class="input" type="number"
                                                                                            step="0.01"
                                                                                            id="ClientExteraContact2"
                                                                                            maxlength="32"
                                                                                            name="ClientExteraContact2"
                                                                                            value="">
                                                                              </div>

                                                                       </div>

                                                                </div><!-- Closing Client2 -->

                                                         </div><!-- Closing MainClientSection -->

                                                         <div id="ClientSection" class="FooterButton">

                                                                <div class="FooterButtonSpan">

                                                                       <span class="buttonDiscard floatDataLefttSide">

                                                                              <span class="buttonBack">
                                                                                     <button id="ClientDiscard"
                                                                                            class="buttonBlue"
                                                                                            type="button"
                                                                                            onclick="TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');">
                                                                                            Back </button>
                                                                              </span>

                                                                       </span>



                                                                       <span class="secondSpan">

                                                                              <button class="dropdownMenubtn dropBtn1"
                                                                                     type="button"
                                                                                     id="Deletebtn2">Delete</button>
                                                                              <button class="dropdownMenubtn dropbtnDiscard"
                                                                                     type="button"
                                                                                     id="Deletebtn2_2">Discard</button>
                                                                              <button class="dropdownMenubtn dropBtn2"
                                                                                     type="button"
                                                                                     id="ExitWithoutSaving2">Exit
                                                                                     without saving</button>
                                                                              <button class="dropdownMenubtn dropBtn3"
                                                                                     type="button" id="Savebtn2">Save
                                                                                     and close</button>

                                                                              <span class="savespan" id="savespan2">

                                                                                     <button class="buttonSaveOne"
                                                                                            type="button"
                                                                                            id="ClientSave"
                                                                                            name="ClientSave">Save</button>
                                                                                     <button class="buttonSaveTwo"
                                                                                            onclick="openWindow('ExitWithoutSaving2', 'Deletebtn2', 'Deletebtn2_2', 1, 'Savebtn2', 'savespan2', event)"
                                                                                            type="button">&nbsp;</button>

                                                                              </span>

                                                                              <button id="ClientNext" class="buttonBlue"
                                                                                     type="button"
                                                                                     onclick="NextStepClient();"> Next
                                                                              </button>
                                                                       </span>

                                                                </div>

                                                         </div><!-- Closing PartiesbuttonSection -->

                                                  </div>

                                                  <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

                                                  <div class="tabcontent1" id="Owner">

                                                         <div id="MainOwnerSection">

                                                                <p id="ErrorEmpty3" class="ErrorEmpty"
                                                                       style="display:none;">
                                                                       <label>Please
                                                                              complete all fields before proceeding to
                                                                              the next
                                                                              section</label></p>

                                                                <div id="Owner1">

                                                                       <div class="flexibleContainer"
                                                                              style="margin: 0px 0px;">

                                                                              <div class="flexible"
                                                                                     style="margin-bottom: 0;">

                                                                                     <span>
                                                                                            <label class="container">

                                                                                                   <input class="inlineInput"
                                                                                                          onclick="SameOwerClient();   SetClients();"
                                                                                                          id="OwnerDifferance1"
                                                                                                          name="OwnerDifferance1"
                                                                                                          type="checkbox">

                                                                                                   <span class="checkmark"
                                                                                                          style="top: 16px;left: 8px;"></span></label>

                                                                                            <label
                                                                                                   style="margin-left: 22px;">Property
                                                                                                   owner
                                                                                                   same as
                                                                                                   client</label>

                                                                                     </span>

                                                                              </div>
                                                                              <div class="flexible"></div>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              id="SelectClientsDiv"
                                                                              style="display: none;">

                                                                              <div id="SelectClientsCustom"
                                                                                     class="flexible"
                                                                                     style="display: none;">

                                                                                     <div class="custom-select"
                                                                                            onclick="AddOwnerInformation();">

                                                                                            <select id="SelectClients"
                                                                                                   name="SelectClients">

                                                                                                   <option value="">--
                                                                                                          Please choose
                                                                                                          an option
                                                                                                          --</option>

                                                                                            </select>

                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexible"></div>

                                                                       </div>


                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">

                                                                                     <label class="MandentorySign"
                                                                                            id="Owner1feild1"></label><label>Type</label>

                                                                                     <div id="OwnerType1Custom" class="custom-select" onclick="ChecksPartiesType('OwnerType1', 'OwnerIndividusal1', 'OwnerNotAnIndividusal1');">

                                                                                            <select id="OwnerType1"
                                                                                                   name="OwnerType1">

                                                                                                   <option value="">--
                                                                                                          Please choose
                                                                                                          an option
                                                                                                          --</option>

                                                                                                   <option
                                                                                                          value="Individual">
                                                                                                          Individual
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Corporation">
                                                                                                          Corporation
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Partnership">
                                                                                                          Partnership
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Trust">
                                                                                                          Trust</option>

                                                                                            </select>
                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexible"></div>

                                                                       </div>



                                                                       <div id="OwnerNotAnIndividusal1"
                                                                              style="display:none"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild2"
                                                                                            class="MandentorySign"></label><label>Business
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="OwnerBusinessName1"
                                                                                            name="OwnerBusinessName1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild3"
                                                                                            class="MandentorySign"></label><label>Authorised
                                                                                            Signing Officer</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="OwnerSigningOfficere1"
                                                                                            name="OwnerSigningOfficere1"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing OwnerNotAnIndividusal1 -->



                                                                       <div id="OwnerIndividusal1"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild4"
                                                                                            class="MandentorySign"></label><label>First
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="OwnerFirstName1"
                                                                                            name="OwnerFirstName1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild5"
                                                                                            class="MandentorySign"></label><label>Last
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="OwnerLastName1"
                                                                                            name="OwnerLastName1"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing OwnerIndividusal1 -->
                                                                       <div id="OwnerCopyPropertyAddress1"
                                                                              class="NewSectionCopy">

                                                                              <label class="container"><input
                                                                                            class="inlineInput"
                                                                                            onclick="CopyAddress('OwnerUnitNumber1','OwnerStreetNumber1','OwnerStreetName1','OwnerProvince1','OwnerPostalCode1','OwnerCity1','OwnerCountry1', 'OwnerState1');"
                                                                                            type="checkbox"
                                                                                            id="AddSecondAgentCheckBox"
                                                                                            name="AddSecondAgentCheckBox">
                                                                                     <span class="checkmark"
                                                                                            style="top: 16px;left: 8px;"></span></label>

                                                                              <label style="margin-left: 22px;">Copy
                                                                                     Property
                                                                                     Address</label>
                                                                       </div>


                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="NoMandatoryTwo">Unit</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="OwnerUnitNumber1"
                                                                                            name="OwnerUnitNumber1"
                                                                                            value="" maxlength="10">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild6"
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Number</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="10"
                                                                                            id="OwnerStreetNumber1"
                                                                                            name="OwnerStreetNumber1"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild7"
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="40"
                                                                                            id="OwnerStreetName1"
                                                                                            name="OwnerStreetName1"
                                                                                            value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild8"
                                                                                            class="MandentorySign"></label><label>City</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" id="OwnerCity1"
                                                                                            maxlength="30"
                                                                                            name="OwnerCity1" value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild10"
                                                                                            class="MandentorySign"></label><label>Province</label>

                                                                                     <div class="custom-select"
                                                                                            onclick="ifProvinceOther('OwnerProvince1','OwnerCountry1'); Display('OwnerProvince1', 'OwnerState1')">

                                                                                            <select id="OwnerProvince1"
                                                                                                   name="OwnerProvince1"
                                                                                                   readonly>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="AB">AB
                                                                                                   </option>

                                                                                                   <option value="BC">BC
                                                                                                   </option>

                                                                                                   <option value="MB">MB
                                                                                                   </option>

                                                                                                   <option value="NB">NB
                                                                                                   </option>

                                                                                                   <option value="NL">NL
                                                                                                   </option>

                                                                                                   <option value="NT">NT
                                                                                                   </option>

                                                                                                   <option value="NS">NS
                                                                                                   </option>

                                                                                                   <option value="NU">NU
                                                                                                   </option>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="PE">PE
                                                                                                   </option>

                                                                                                   <option value="QC">QC
                                                                                                   </option>

                                                                                                   <option value="SK">SK
                                                                                                   </option>

                                                                                                   <option value="YT">YT
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Other">
                                                                                                          Other</option>

                                                                                            </select>

                                                                                     </div>
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild9"
                                                                                            class="MandentorySign"></label><label>Postal
                                                                                            Code</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="11"
                                                                                            id="OwnerPostalCode1"
                                                                                            name="OwnerPostalCode1"
                                                                                            value="">
                                                                                     <!-- onblur="postalCorrect(this.id);" -->
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild11"
                                                                                            class="MandentorySign"></label><label>Country</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="OwnerCountry1"
                                                                                            maxlength="20"
                                                                                            name="OwnerCountry1"
                                                                                            value="Canada" readonly>
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              style="display: none;" id="OwnerState1">
                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Other
                                                                                            province or state</label>

                                                                                     <input type="text"
                                                                                            class="inlineInput"
                                                                                            id="OwnerOtherProvince1"
                                                                                            maxlength="20"
                                                                                            name="OwnerOtherProvince1"
                                                                                            value="">
                                                                              </div>
                                                                              <div class="flexibleotherProvince"></div>
                                                                       </div>

                                                                       <div class="flexibleContainer NewSection">
                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild12"
                                                                                            class="MandentorySign"></label><label>Email</label>

                                                                                     <input onblur="emailCorrect(this.id)"
                                                                                            class="inlineInput"
                                                                                            type="text" id="OwnerEmail1"
                                                                                            name="OwnerEmail1"
                                                                                            maxlength="50" value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label id="Owner1feild13"
                                                                                            class="MandentorySign"></label><label>Phone</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" id="OwnerPhone1"
                                                                                            onkeydown="phoneNumberFormatter(this.id)"
                                                                                            maxlength="14"
                                                                                            name="OwnerPhone1" value="">
                                                                              </div>

                                                                              <div class="flexible itemShortPhone">

                                                                                     <div
                                                                                            class="custom-select NoMandatoryPhone">

                                                                                            <select id="OwnerExteraContactInformationLabel1"
                                                                                                   name="OwnerExteraContactInformationLabel1">

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="International Phone">
                                                                                                          International
                                                                                                          Phone</option>

                                                                                            </select>

                                                                                     </div>

                                                                                     <input class="inlineInput"
                                                                                            class="input" type="number"
                                                                                            step="0.01"
                                                                                            id="OwnerExteraContact1"
                                                                                            maxlength="32"
                                                                                            name="OwnerExteraContact1"
                                                                                            value="">
                                                                              </div>

                                                                       </div>

                                                                </div><!-- Closing Owner1 -->

                                                                <div id="Owner2" style="display:none;">

                                                                       <div class="flexible ">
                                                                              <div class="NewSection">
                                                                                     <label
                                                                                            style="margin-left: 8px; font-weight: bold;">Second
                                                                                            Owner</label>

                                                                                     <span
                                                                                            class="tooltip floatDataRightSide">
                                                                                            <img src="../ImagesUsed/RemoveSVG.svg"
                                                                                                   class="lineButtonMinus manageListButton"
                                                                                                   alt="-" type="button"
                                                                                                   onclick="RemoveOneParty('Owner2','AddOwner')"
                                                                                                   style="display: inline;"
                                                                                                   id="RemoveOneDeposit"><span
                                                                                                   class="tooltiptext">Remove
                                                                                                   Owner</span>
                                                                                     </span>


                                                                              </div>

                                                                              <hr style="margin-right: 4px;">
                                                                       </div>
                                                                       <div class="flexibleContainer NewSectionSmall">
                                                                              <div class="flexible">

                                                                                     <label id="Owner2feild1"
                                                                                            class="MandentorySign"></label><label>Type</label>

                                                                                     <div id="OwnerType2Custom" class="custom-select" onclick="ChecksPartiesType('OwnerType2', 'OwnerIndividusal2', 'OwnerNotAnIndividusal2');">

                                                                                            <select id="OwnerType2" name="OwnerType2">

                                                                                                   <option value="">--
                                                                                                          Please choose
                                                                                                          an option
                                                                                                          --</option>

                                                                                                   <option
                                                                                                          value="Individual">
                                                                                                          Individual
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Corporation">
                                                                                                          Corporation
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Partnership">
                                                                                                          Partnership
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Trust">
                                                                                                          Trust</option>

                                                                                            </select>
                                                                                     </div>

                                                                              </div>

                                                                              <div class="flexible"></div>

                                                                       </div>



                                                                       <div class="flexibleContainer  "
                                                                              style="display:none"
                                                                              id="OwnerNotAnIndividusal2">

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild2"
                                                                                            class="MandentorySign"></label><label>Business
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="60"
                                                                                            id="OwnerBusinessName2"
                                                                                            name="OwnerBusinessName2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild3"
                                                                                            class="MandentorySign"></label><label>Authorised
                                                                                            Signing Officer</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="OwnerSigningOfficere2"
                                                                                            maxlength="60"
                                                                                            name="OwnerSigningOfficere2"
                                                                                            value="">
                                                                              </div>

                                                                       </div><!-- Closing OwnerNotAnIndividusal2 -->



                                                                       <div id="OwnerIndividusal2"
                                                                              class="flexibleContainer ">

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild4"
                                                                                            class="MandentorySign"></label><label>First
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="OwnerFirstName2"
                                                                                            name="OwnerFirstName2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild5"
                                                                                            class="MandentorySign"></label><label>Last
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="45"
                                                                                            id="OwnerLastName2"
                                                                                            name="OwnerLastName2"
                                                                                            value="">
                                                                              </div>



                                                                       </div><!-- Closing OwnerIndividusal2 -->

                                                                       <div id="OwnerCopyPropertyAddress2"
                                                                              class="NewSectionCopy">

                                                                              <label class="container"><input
                                                                                            class="inlineInput"
                                                                                            onclick="CopyAddress('OwnerUnitNumber2','OwnerStreetNumber2','OwnerStreetName2','OwnerProvince2','OwnerPostalCode2','OwnerCity2','OwnerCountry2', 'OwnerState2');"
                                                                                            type="checkbox"
                                                                                            id="AddSecondAgentCheckBox"
                                                                                            name="AddSecondAgentCheckBox">
                                                                                     <span class="checkmark"
                                                                                            style="top: 16px;left: 8px;"></span></label>

                                                                              <label style="margin-left: 22px;">Copy
                                                                                     Property
                                                                                     Address</label>

                                                                       </div>


                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">

                                                                                     <label
                                                                                            class="NoMandatoryTwo">Unit</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="OwnerUnitNumber2"
                                                                                            name="OwnerUnitNumber2"
                                                                                            value="" maxlength="10">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild6"
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Number</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="10"
                                                                                            id="OwnerStreetNumber2"
                                                                                            name="OwnerStreetNumber2"
                                                                                            value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild7"
                                                                                            class="MandentorySign"></label><label>Street
                                                                                            Name</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="40"
                                                                                            id="OwnerStreetName2"
                                                                                            name="OwnerStreetName2"
                                                                                            value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild8"
                                                                                            class="MandentorySign"></label><label>City</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" id="OwnerCity2"
                                                                                            maxlength="30"
                                                                                            name="OwnerCity2" value="">
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild10"
                                                                                            class="MandentorySign"></label><label>Province</label>

                                                                                     <div class="custom-select"
                                                                                            onclick="ifProvinceOther('OwnerProvince2','OwnerCountry2');  Display('OwnerProvince2', 'OwnerState2')">

                                                                                            <select id="OwnerProvince2"
                                                                                                   name="OwnerProvince2"
                                                                                                   readonly>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="AB">AB
                                                                                                   </option>

                                                                                                   <option value="BC">BC
                                                                                                   </option>

                                                                                                   <option value="MB">MB
                                                                                                   </option>

                                                                                                   <option value="NB">NB
                                                                                                   </option>

                                                                                                   <option value="NL">NL
                                                                                                   </option>

                                                                                                   <option value="NT">NT
                                                                                                   </option>

                                                                                                   <option value="NS">NS
                                                                                                   </option>

                                                                                                   <option value="NU">NU
                                                                                                   </option>

                                                                                                   <option value="ON">ON
                                                                                                   </option>

                                                                                                   <option value="PE">PE
                                                                                                   </option>

                                                                                                   <option value="QC">QC
                                                                                                   </option>

                                                                                                   <option value="SK">SK
                                                                                                   </option>

                                                                                                   <option value="YT">YT
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Other">
                                                                                                          Other</option>

                                                                                            </select>

                                                                                     </div>
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild9"
                                                                                            class="MandentorySign"></label><label>Postal
                                                                                            Code</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" maxlength="11"
                                                                                            id="OwnerPostalCode2"
                                                                                            name="OwnerPostalCode2"
                                                                                            value="">
                                                                                     <!-- onblur="postalCorrect(this.id);" -->
                                                                              </div>

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild11"
                                                                                            class="MandentorySign"></label><label>Country</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text"
                                                                                            id="OwnerCountry2"
                                                                                            maxlength="20"
                                                                                            name="OwnerCountry2"
                                                                                            value="Canada" readonly>
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              style="display: none;" id="OwnerState2">
                                                                              <div class="flexible">
                                                                                     <label
                                                                                            class="MandentorySign"></label><label>Other
                                                                                            province or state</label>

                                                                                     <input type="text"
                                                                                            class="inlineInput"
                                                                                            id="OwnerOtherProvince2"
                                                                                            maxlength="20"
                                                                                            name="OwnerOtherProvince2"
                                                                                            value="">
                                                                              </div>
                                                                              <div class="flexibleotherProvince"></div>
                                                                       </div>

                                                                       <div class="flexibleContainer NewSection">


                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild12"
                                                                                            class="MandentorySign"></label><label>Email</label>

                                                                                     <input onblur="emailCorrect(this.id)"
                                                                                            class="inlineInput"
                                                                                            type="text" id="OwnerEmail2"
                                                                                            name="OwnerEmail2"
                                                                                            maxlength="50" value="">
                                                                              </div>

                                                                       </div>

                                                                       <div class="flexibleContainer">

                                                                              <div class="flexible">
                                                                                     <label id="Owner2feild13"
                                                                                            class="MandentorySign"></label><label>Phone</label>

                                                                                     <input class="inlineInput"
                                                                                            type="text" id="OwnerPhone2"
                                                                                            onkeydown="phoneNumberFormatter(this.id)"
                                                                                            maxlength="14"
                                                                                            name="OwnerPhone2" value="">
                                                                              </div>

                                                                              <div class="flexible itemShortPhone">

                                                                                     <div
                                                                                            class="custom-select NoMandatoryPhone">

                                                                                            <select id="OwnerExteraContactInformationLabel2"
                                                                                                   name="OwnerExteraContactInformationLabel2">

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="Mobile">
                                                                                                          Mobile
                                                                                                   </option>

                                                                                                   <option
                                                                                                          value="International Phone">
                                                                                                          International
                                                                                                          Phone</option>

                                                                                            </select>

                                                                                     </div>

                                                                                     <input class="inlineInput"
                                                                                            class="input" type="number"
                                                                                            step="0.01"
                                                                                            id="OwnerExteraContact2"
                                                                                            maxlength="32"
                                                                                            name="OwnerExteraContact2"
                                                                                            value="">
                                                                              </div>
                                                                       </div>
                                                                </div><!-- Closing Owner2 -->

                                                         </div><!-- Closing MainOwnerSection -->

                                                         <div id="OwnerButtonSection" class="FooterButton">
                                                                <div class="FooterButtonSpan">


                                                                       <span class="buttonDiscard floatDataLefttSide">

                                                                              <a href="Dashboard.jsp"><button
                                                                                            class="buttonDiscard "
                                                                                            style="display: none;"
                                                                                            id="OwnerDiscard"
                                                                                            type="button" onclick=" ">
                                                                                            Discard </button></a>

                                                                              <span class="buttonBack">
                                                                                     <button id="OwnerDiscard"
                                                                                            class="buttonBlue"
                                                                                            type="button"
                                                                                            onclick="BackStepOwner();">
                                                                                            Back
                                                                                     </button>
                                                                              </span>
                                                                       </span>



                                                                       <span class="secondSpan">

                                                                              <button class="dropdownMenubtn dropBtn1"
                                                                                     type="button"
                                                                                     id="Deletebtn3">Delete</button>
                                                                              <button class="dropdownMenubtn dropbtnDiscard"
                                                                                     type="button"
                                                                                     id="Deletebtn3_3">Discard</button>
                                                                              <button class="dropdownMenubtn dropBtn2"
                                                                                     type="button"
                                                                                     id="ExitWithoutSaving3">Exit
                                                                                     without saving</button>
                                                                              <button class="dropdownMenubtn dropBtn3"
                                                                                     type="button" id="Savebtn3">Save
                                                                                     and close</button>

                                                                              <span class="savespan" id="savespan3">

                                                                                     <button class="buttonSaveOne"
                                                                                            type="button"
                                                                                            id="OwnerSave" name="OwnerSave" >Save</button>
                                                                                     <button class="buttonSaveTwo"
                                                                                            onclick="openWindow('ExitWithoutSaving3', 'Deletebtn3', 'Deletebtn3_3', 1, 'Savebtn3', 'savespan3', event)"
                                                                                            type="button">&nbsp;</button>

                                                                              </span>


                                                                              <button id="OwnerNext" class="buttonBlue"
                                                                                     type="button"
                                                                                     onclick="NextStepOwner();"> Next
                                                                              </button>
                                                                       </span>
                                                                </div>

                                                         </div><!-- Closing PartiesbuttonSection -->

                                                  </div>

                                           </div><!-- Closing MainPartiesContent -->

                                    </div><!-- Closing Parties tab Content -->

                                    <!--**********************************************************************************************************************************************************************************************************************************************************************************************************************-->

                                    <div id="Invoice" class="tabcontent" style="display: none;">

                                           <div id="InvoiceMainSection">

                                                  <label id="Title3" class="HeadLines">Other</label>

                                                  <span class="floatDataRightSide">
                                                         <span class="tooltip">
                                                                <!-- <button class="lineButton manageListButton" type="button" id="EmailInvoice" onclick=" "> -->
                                                                <img class="lineButton" type="button"
                                                                       id="emailInvoicebtn"
                                                                       src="../ImagesUsed/Email.png" alt="Email"
                                                                       onclick=" " style="width: 22px;">
                                                                <span class="tooltiptext">Email invoice</span>

                                                                <!-- </button> -->
                                                         </span>
                                                         <span class="tooltip ">

                                                                <img class="lineButton printButton" type="button"
                                                                       id="invoicep"
                                                                       onclick="simplePrint('MainInvoiceSection')"
                                                                       src="../ImagesUsed/Print.png" alt="Print">
                                                                <span class="tooltiptext">Print page</span>
                                                         </span>
                                                  </span>

                                                  <div class="forAddressTop">

                                                         <label id="Propertyaddress3"></label>

                                                  </div>

                                                  <span style="font-weight: bold; display: none;">99</span>
                                                  <hr style="margin-bottom: 22px;     margin-top: 4px; margin-right: 4px;">

                                                  <div id="MainInvoiceSection">

                                                         <div id="printMainInvoice">
                                                                <div class="frontImageLogo">
                                                                       <img src="<%=Companylogo%>?math=<%=Math.random()%>"
                                                                              alt="House" class="insideImglogo">
                                                                </div>

                                                                <div class="appraisalInvLogo">
                                                                       <label class="heavyfont"
                                                                              style="color:black;  text-transform: uppercase;"
                                                                              class="heavyfont"
                                                                              id="MainTitle">INVOICE</label>
                                                                </div>

                                                                <div class="flexibleContainer heavyfont NewSectionSmall"
                                                                       style="width: 70%;">
                                                                       <label class="flexibleDate NewSectionSmall"
                                                                              id="InvoiceCuttentDate"
                                                                              name="InvoiceCuttentDate"
                                                                              style="margin-right: auto; padding-left: 0;"></label>
                                                                       <label class="flexibleDate heavyfont floatDataRightSide"
                                                                              style="display: none;">Reference</label>
                                                                </div>

                                                                <div class="flexibleContainer NewSectionSmall"
                                                                       style="width: 70%;">
                                                                       <label class=" flexibleZero"
                                                                              id="InvoiceReciverName"
                                                                              name="InvoiceReciverName"></label>
                                                                </div>

                                                                <div class="flexibleContainer" style="width: 70%;">
                                                                       <label id="InvoiceReciverNameBusiness"
                                                                              name="InvoiceReciverNameBusiness"></label>
                                                                </div>

                                                                <div class="flexibleContainer" style="width: 70%;">

                                                                       <label id="invoiceClientAddress"></label>

                                                                </div>

                                                                <div class="flexibleContainer" style="width: 70%;">

                                                                       <label id="invoiceClientAddressTwo"></label>

                                                                </div>

                                                                <div id="InvoicePropertyInformation"
                                                                       class="invoiceBox NewSectionSmall"
                                                                       style="margin-top: 24px; margin-bottom: 32px;">

                                                                       <div class="flexibleContainer" id="propertyInfo">

                                                                              <label
                                                                                     style=" margin:0; margin-left: 15px; width: 130px; font-weight: bold;">Property:
                                                                              </label>

                                                                              <label id="invoicePropertyAddress"
                                                                                     class="inlineInput flexibleZero"
                                                                                     style="margin-top: 0;"></label>

                                                                       </div>

                                                                       <div class="flexibleContainer"
                                                                              style="margin-top: 5px;"
                                                                              id="propertyInfo2">
                                                                              <label
                                                                                     style="margin:0; margin-left: 15px; padding-top: 2px; width: 130px;  font-weight: bold;">Report
                                                                                     Date: </label>
                                                                              <label style="margin-top: 2px;"
                                                                                     class="inlineInput flexibleZero "
                                                                                     type="text"
                                                                                     id="InvoicePropertyReportDate"
                                                                                     name="InvoicePropertyReportDate"
                                                                                     value="Report Date"></label>

                                                                              <input type="Hidden"
                                                                                     id="HiddenInvoicePropertyReportDate"
                                                                                     name="HiddenInvoicePropertyReportDate"
                                                                                     value="">
                                                                       </div>

                                                                </div><!-- Closing InvoicePropertyInformation -->

                                                                <div id="SomeDetailInformation" class="NewSectionSmall"
                                                                       style="padding-right: 15px;">

                                                                       <div class="flexibleContainer">
                                                                              <!-- <input class="inlineInput flexible" style="flex: 6;" type="text"
                                                                                    id="InvoiceFeeLabel" value="Our Appraisal Fee"> -->
                                                                              <label class="flexible" style="flex: 6;"
                                                                                     id="InvoiceFeeLabel">Our
                                                                                     Appraisal
                                                                                     Fee</label>

                                                                              <label class="flexible"
                                                                                     style="flex: 0.1;">$</label>

                                                                              <label class="flexible"
                                                                                     style="text-align: right; font-variant-numeric: tabular-nums;"
                                                                                     id="PropertyFeeInvoice"
                                                                                     name="PropertyFeeInvoice"></label>

                                                                              <input type="hidden"
                                                                                     id="HiddenPropertyFeeInvoice"
                                                                                     name="HiddenPropertyFeeInvoice"
                                                                                     value="">
                                                                       </div>

                                                                       <div class="flexibleContainer" style="margin-top: 4px;">
                                                                              <label class="flexible"
                                                                                     style="flex: 6;">HST
                                                                                     (<%=Mycompany.HSTNumberPart1%> RT
                                                                                     <%=Mycompany.HSTNumberPart2%>)</label>
                                                                              <label class="flexible"
                                                                                     style="flex: 0.1;"></label>
                                                                              <label class="flexible"
                                                                                     style="text-align: right; font-variant-numeric: tabular-nums;"
                                                                                     id="PropertyHSTInvoice"
                                                                                     name="PropertyHSTInvoice"></label>
                                                                              <input type="hidden"
                                                                                     id="HiddenPropertyHSTInvoice"
                                                                                     name="HiddenPropertyHSTInvoice"
                                                                                     value="">
                                                                       </div>

                                                                       <div class="flexibleContainer" style="margin-top: 4px;">
                                                                              <label class="flexible"
                                                                                     style="flex: 6; font-weight: bold;"><b>Balance</b></label>
                                                                              <label class="flexible"
                                                                                     style="flex: 0.1; font-weight: bold;">$</label>
                                                                              <label class="flexible"
                                                                                     style="text-align: right; font-weight: bold;"
                                                                                     id="BalanceInvoice"
                                                                                     name="BalanceInvoice"></label>
                                                                              <input type="hidden"
                                                                                     id="HiddenBalanceInvoice"
                                                                                     name="HiddenBalanceInvoice">
                                                                       </div>

                                                                </div><!-- Closing SomeDetailInformation" -->

                                                                <div class="invoiceBox NewSectionSmall" style="padding: 0;">
                                                                       <p class="noticePayment"
                                                                              style=" margin-bottom: 0;">
                                                                              Please mail a
                                                                              cheque payable to
                                                                              "<%=Mycompany.BusinessName%>" or make an
                                                                              electronic
                                                                              payment to our commission trust account:
                                                                       </p>

                                                                       <div id="BankInformation" class="noticePayment"
                                                                              style="margin-top: 0;    padding-top: 0;">

                                                                              <div style="width:100%">
                                                                                     <label
                                                                                            style="width:100px;  font-weight: bold;">Bank:</label>
                                                                                     <label style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            for=""><%=Mycompany.CommissionBankNumber%></label>
                                                                                     <input style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            type="hidden"
                                                                                            id="InvoiceBank"
                                                                                            name="InvoiceBank"
                                                                                            value="Bank" readonly>
                                                                              </div>

                                                                              <div style="width:100%; margin-top: 1px">
                                                                                     <label style="width:100px;  font-weight: bold;">Transit:</label>
                                                                                     <label style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            for=""><%=Mycompany.CommissionTransitNumber%></label>
                                                                                     <input style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            type="hidden"
                                                                                            id="InvoiceTransit"
                                                                                            name="InvoiceTransit"
                                                                                            value="Transit" readonly>
                                                                              </div>

                                                                              <div style="width:100%; margin-top: 1px">
                                                                                     <label
                                                                                            style="width:100px;  font-weight: bold;">Account:</label>
                                                                                     <label style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            for=""><%=Mycompany.CommissionAccountNumber%></label>
                                                                                     <input style="padding: 0;"
                                                                                            class="inlineInput"
                                                                                            type="hidden"
                                                                                            id="InvoiceAccount"
                                                                                            name="InvoiceAccount"
                                                                                            value="Account" readonly>
                                                                              </div>

                                                                       </div><!-- Closing BankInformation" -->
                                                                </div>

                                                                <div id="SenderInformation">

                                                                       <label style="margin-top: 35px;">Sincerely,</label>

                                                                       <br>

                                                                       <label style="padding-left: 0;margin-top: 34px;"
                                                                              class="inlineInput" type="text"
                                                                              id="InvoiceBroker" name="InvoiceBroker"
                                                                              value="Broker Name"><%=MyInformation.Firstname%><%=" "%><%=MyInformation.Lastname%></label>

                                                                       <br>


                                                                       <label style="margin-top: 4px;">Broker of
                                                                              Record</label>

                                                                       <br><br>

                                                                       <label style="margin-top: 4px;"><%=Mycompany.BusinessName%></label>

                                                                       <br>

                                                                       <label style="margin-top: 4px;"><%=Mycompany.Unit%>
                                                                              <%=Mycompany.StreetNumber%>
                                                                              <%=Mycompany.StreetName %></label>

                                                                       <br>

                                                                       <label style="margin-top: 4px;"><%=Mycompany.City%>,
                                                                              <%=Mycompany.Province%>,
                                                                              <%=Mycompany.PostalCode%></label>

                                                                       <br>
                                                                       <br>

                                                                       <label style="margin-top: 4px;"><%=Mycompany.Phone%></label>

                                                                       <br>

                                                                       <label style="margin-top: 4px;"><a target="_blank" href="mailto:<%=Mycompany.Email%>"><%=Mycompany.Email%></a></label>

                                                                </div><!-- Closing SenderInformation -->
                                                         </div>
                                                         
                                                         
                                                  </div><!-- Closing InvoiceMainSection -->

                                                  <div id="InvoiceButtonSection" class="FooterButton">
                                                         <div class="FooterButtonSpan">
                                                                <span class="buttonDiscard floatDataLefttSide">
                                                                       <a href="Dashboard.jsp"><button
                                                                                     id="InvoiceDiscard"
                                                                                     class="buttonDiscard"
                                                                                     style="display: none;"
                                                                                     type="button" onclick=" ">
                                                                                     Discard </button></a>
                                                                       <span class="buttonBack">
                                                                              <button id="InvoiceDiscard"
                                                                                     class="buttonBlue" type="button"
                                                                                     onclick="TabsHandleler(event,'Parties','tabcontent','tablinks','PartiesTab');">
                                                                                     Back </button>
                                                                       </span>
                                                                </span>

                                                                <span class="secondSpan">
                                                                       <button class="dropdownMenubtn dropBtn1"
                                                                              type="button"
                                                                              id="Deletebtn4">Delete</button>
                                                                       <button class="dropdownMenubtn dropbtnDiscard"
                                                                              type="button"
                                                                              id="Deletebtn4_4">Discard</button>
                                                                       <button class="dropdownMenubtn dropBtn2"
                                                                              type="button" id="ExitWithoutSaving4">Exit
                                                                              without
                                                                              saving</button>
                                                                       <button class="dropdownMenubtn dropBtn3"
                                                                              type="button" id="Savebtn4">Save and
                                                                              close</button>

                                                                       <span class="savespan" id="savespan4">
                                                                              <button class="buttonSaveOne"
                                                                                     type="button"
                                                                                     id="InvoiceSave" name="InvoiceSave" >Save</button>
                                                                              <button class="buttonSaveTwo"
                                                                                     onclick="openWindow('ExitWithoutSaving4', 'Deletebtn4','Deletebtn4_4', 1, 'Savebtn4', 'savespan4', event)"
                                                                                     type="button">&nbsp;</button>
                                                                       </span>

                                                                       <button id="InvoiceNext" class="buttonBlue"
                                                                              type="button"
                                                                              onclick="NextStepInvoice('<%=MyInformation.User_Split%>','<%=0%>','<%= MyInformation.User_Split2%>','<%= MyInformation.User_Split3%>','<%=MyInformation.User_Cap%>',  '<%= MyInformation.User_Cap2%>','<%= MyInformation.User_Cap3 %>','<%=Mycompany.Temp%>' );">
                                                                              Next </button>

                                                                </span>
                                                         </div>
                                                  
                                                 </div><!-- Closing InvoiceButtonSection -->
                                          </div>
                                    </div><!-- Closing Invoice tab Content -->

                                   <div id="ApprasialRecordSheet" class="tabcontent" style="display: none;">

                                          <div id="MainSectionApprasialRecordSheet">

                                                 <label id="Title5" class="HeadLines" style="width: auto;">Other</label>


                                                 <button class="buttonCover floatDataRightSide tooltip" type="button" id="PrintTRS"
                                                        style="  margin-bottom: 20px;"> <img class="printButton"
                                                               src="../ImagesUsed/Print.png" alt="MasterBroker"><span
                                                               class="tooltiptext">Print page</span></button>



                                                 <div class="forAddressTop">

                                                        <label id="Propertyaddress5"></label>

                                                 </div>

                                                 <span style="font-weight: bold; display: none;">99</span>

                                                 <hr style="margin-bottom: 22px; margin-top: 4px;">

                                                 <label style="font-weight: bold; margin-bottom: 10px;">RECORD SHEET</label>


                                                 <div id="RecordSheetPropertyDetailInformation" class="cardsDetails flexibleContainer">

                                                        <div class="columnSmall flexible" style="padding-left: 0;">

                                                               <div class="card heavyfont">

                                                                      <label class="TRSlabel">Report Date</label>

                                                                      <span class="cardSpan"><input class="TRSinput heavyfont" type="text"
                                                                                    id="RecordsheetReportDate" name="RecordsheetReportDate"
                                                                                    value="" readonly></span>

                                                               </div>

                                                        </div>


                                                        <div class="columnSmall flexible" style="box-sizing: border-box">

                                                               <div class="card heavyfont">

                                                                      <label class="TRSlabel">Source</label>

                                                                      <span class="cardSpan"><input class="TRSinput heavyfont" type="text"
                                                                                    id="RecordsheetSource" name="RecordsheetSource"
                                                                                    value="Not inserted" readonly></span>

                                                               </div>

                                                        </div>

                                                        <div class="columnSmall flexible"
                                                               style="box-sizing: border-box; padding-right: 10px;">

                                                               <div class="card heavyfont">

                                                                      <label class="TRSlabel">Fee</label>

                                                                      <span class="cardSpan" style="text-align: center;">
                                                                             <!-- <span style="color: #21c1e1;">$</span> -->
                                                                             <input class="TRSinput heavyfont" type="text"
                                                                                    style="float: none; padding-left: 0; width: 80%;"
                                                                                    id="RecordsheetAppraisalfee"
                                                                                    name="RecordsheetAppraisalfee" value="Not inserted"
                                                                                    readonly></span>

                                                               </div>

                                                        </div>

                                                 </div><!-- Close RecordSheetPropertyDetailInformation -->

                                                 <div id="RecordSheetPartiesInformation" class="NewSectionMedium"
                                                        style="margin-left: -14px;">

                                                        <p class="headerTRS">Parties and Contact Details</p>


                                                        <table style="width:100%;" id="tableOne" class="NewSectionSmall">

                                                               <tr>
                                                                      <th width="15%" style="padding-left: 14px;     text-align: left;">
                                                                             Party</th>

                                                                      <th width="22%">Name</th>

                                                                      <th width="22%">Company</th>

                                                                      <th width="27%">Address</th>

                                                                      <th width="15%">Phone</th>
                                                               </tr>

                                                               <tr id="DisplayClient1">

                                                                      <td onclick="NextStepTransaction(1);" style="cursor: pointer; ">
                                                                             <input class="inlineInput" type="text" id="RecordSheetParty1"
                                                                                    style="cursor: pointer; padding-left: 8px;"
                                                                                    name="RecordSheetParty1" value="Client" readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetClientName1"
                                                                                    name="RecordSheetClientName1" value="" readonly></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetClientCompany1"
                                                                                    style="resize: none; height: 30px;"
                                                                                    name="RecordSheetClientCompany1" value=""
                                                                                    readonly></textarea></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetClientAddress1"
                                                                                    name="RecordSheetClientAddress1" value=""
                                                                                    style="resize: none; height: 30px;" readonly></textarea>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text"
                                                                                    id="RecordSheetClientPhone1" style="padding: 0;"
                                                                                    name="RecordSheetClientPhone1" value="" readonly></td>

                                                               </tr>

                                                               <tr id="DisplayClient2">

                                                                      <td onclick="NextStepTransaction(1);" style="cursor: pointer">
                                                                             <input class="inlineInput" type="text" id="RecordSheetParty2"
                                                                                    style="cursor: pointer; padding-left: 8px;"
                                                                                    name="RecordSheetParty2" value="Client" readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetClientName2"
                                                                                    name="RecordSheetClientName2" value="" readonly></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetClientCompany2"
                                                                                    style="resize: none; height: 30px;"
                                                                                    name="RecordSheetClientCompany2" value=""
                                                                                    readonly></textarea></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetClientAddress2"
                                                                                    name="RecordSheetClientAddress2" value=""
                                                                                    style="resize: none; height: 30px;" readonly></textarea>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text"
                                                                                    id="RecordSheetClientPhone2" style="padding: 0;"
                                                                                    name="RecordSheetClientPhone2" value="" readonly></td>


                                                               </tr>

                                                               <tr id="DisplayOwner1">

                                                                      <td onclick="TabsHandleler(event,'Parties','tabcontent','tablinks','PartiesTab');"
                                                                             style="cursor: pointer">
                                                                             <input class="inlineInput" type="text"
                                                                                    id="RecordOwnerSheetParty1"
                                                                                    style="cursor: pointer; padding-left: 8px;"
                                                                                    name="RecordSheetOwnerParty1" value="Owner" readonly>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetOwnerName1"
                                                                                    name="RecordSheetOwnerName1" value="" readonly></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetOwnerCompany1"
                                                                                    style="resize: none; height: 30px;"
                                                                                    name="RecordSheetOwnerCompany1" value=""
                                                                                    readonly></textarea></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetOwnerAddress1"
                                                                                    name="RecordSheetClientAddress1" value=""
                                                                                    style="resize: none; height: 30px;" readonly></textarea>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetOwnerPhone1"
                                                                                    style="padding: 0;" name="RecordSheetOwnerPhone1"
                                                                                    value="" readonly></td>
                                                               </tr>

                                                               <tr id="DisplayOwner2">

                                                                      <td onclick="TabsHandleler(event,'Parties','tabcontent','tablinks','PartiesTab');"
                                                                             style="cursor: pointer">
                                                                             <input class="inlineInput" type="text"
                                                                                    id="RecordSheetOwnerParty2"
                                                                                    style="cursor: pointer; padding-left: 8px;"
                                                                                    name="RecordSheetOwnerParty2" value="Owner" readonly>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetOwnerName2"
                                                                                    name="RecordSheetOwnerName2" value="" readonly></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetOwnerCompany2"
                                                                                    style="resize: none; height: 30px;"
                                                                                    name="RecordSheetOwnerCompany2" value=""
                                                                                    readonly></textarea></td>

                                                                      <td><textarea class="inlineInput" type="text"
                                                                                    id="RecordSheetOwnerAddress2"
                                                                                    name="RecordSheetOwnerAddress2" value=""
                                                                                    style="resize: none; height: 30px;" readonly></textarea>
                                                                      </td>

                                                                      <td><input class="inlineInput" type="text" id="RecordSheetOwnerPhone2"
                                                                                    style="padding: 0;" name="RecordSheetOwnerPhone2"
                                                                                    value="" readonly></td>
                                                               </tr>

                                                        </table>

                                                 </div><!-- Close RecordSheetPartiesInformation -->

                                                 <div class="NewSectionSmall">


                                                        <button id="Editbtn" type="button" class="EditButton" onclick="editHST();">Edit
                                                               HST</button>
                                                        <button id="EditSubmit" type="button" style="display: none;" class="EditButton"
                                                               onclick="submitHST();">Confirm</button>
                                                        <button id="EditDiscard" type="button" style="display: none;" class="EditButton"
                                                               onclick="discardHST();">Reset</button>

                                                        <p class="headerTRS" style="margin-left: -14px;">Fee Breakdown</p>

                                                        <table style="width: calc(100% + 14px); margin-left: -14px;" id="tableTwo"
                                                               class="NewSectionSmall">

                                                               <tr style="background: white;">
                                                                      <th width="27%"></th>

                                                                      <th width="9%" id="allocaionTd" class="headlineright"
                                                                             style="display: none;">Allocation</th>

                                                                      <th width="11%" class="headlineright">Split</th>

                                                                      <th width="13%" class="headlineright">Fee</th>

                                                                      <th width="14%" class="headlineright">HST</th>

                                                                      <th width="12%" id="HSTHead1" class="headlineright ChangedHST"
                                                                             style="display: none;">HST (%)</th>

                                                                      <th width="14%" class="headlineright">Total</th>
                                                               </tr>

                                                               <tr id="DisplayBreakdownGrossFee">

                                                                      <td><input class="inlineInput" type="text" id="BreakdownGrossFeeLabel"
                                                                                    name="BreakdownGrossFeeLabel" value="Gross Fee"
                                                                                    style="text-align: left; padding-left: 8px;" readonly>
                                                                      </td>

                                                                      <td id="allocaionTd1" style="display: none;"><input
                                                                                    class="inlineInput" type="text"
                                                                                    id="BreakdownGrossAllocation" style="padding-right: 0;"
                                                                                    step=".1" name="BreakdownGrossFeeSplit" value=""
                                                                                    readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="BreakdownGrossFeeSplit"
                                                                                    style="padding-right: 0;" step=".1"
                                                                                    name="BreakdownGrossFeeSplit" value="" readonly></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownGrossFeeAmount" step=".01"
                                                                                    name="BreakdownGrossFeeAmount" value="" readonly></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    step=".01" id="BreakdownGrossFeeAmountHST"
                                                                                    name="BreakdownGrossFeeAmountHST" value="0" readonly>
                                                                      </td>

                                                                      <td style="display: none;" class="ChangedHST"
                                                                             id="BreakdownGrossFeeAmountHSTPercentTD"><input
                                                                                    class="inlineInput  textRight numberclass withBorder"
                                                                                    oninput="maxlengthCheckHST(this)"
                                                                                    onblur="addPercent(this.id);" type="text"
                                                                                    id="BreakdownGrossFeeAmountHSTPercent"
                                                                                    name="BreakdownGrossFeeAmountHSTPercent" value=""></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownGrossFeeTotal" step=".01"
                                                                                    name="BreakdownGrossFeeTotal" value="0" readonly></td>

                                                               </tr>

                                                               <tr id="DisplayBreakdownAgent1">

                                                                      <td><input class="inlineInput" type="text" id="BreakdownAgent1Name"
                                                                                    name="BreakdownAgent1Name" value="First Agent"
                                                                                    style="text-align: left; padding-left: 8px;" readonly>
                                                                      </td>

                                                                      <td id="allocaionTd2" style="display: none;"><input
                                                                                    class="inlineInput" type="text"
                                                                                    id="BreakdownGrossAllocation1" style="padding-right: 0;"
                                                                                    step=".1" name="BreakdownGrossFeeSplit" value=""
                                                                                    readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="BreakdownAgent1Split"
                                                                                    style="padding-right: 0;" step=".1"
                                                                                    name="BreakdownAgent1Split" value="" readonly>
                                                                      </td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent1Amount" step=".01"
                                                                                    name="BreakdownAgent1Amount" value="" readonly> </td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent1HST" step=".01"
                                                                                    name="BreakdownAgent1HST" value="0" readonly>
                                                                      </td>

                                                                      <td style="display: none;" class="ChangedHST"
                                                                             id="BreakdownAgent1HSTPercentTD"><input
                                                                                    class="inlineInput  textRight numberclass withBorder"
                                                                                    oninput="maxlengthCheckHST(this)"
                                                                                    onblur="addPercent(this.id);" type="text"
                                                                                    id="BreakdownAgent1HSTPercent"
                                                                                    name="BreakdownAgent1HSTPercent" value=""></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent1Total" step=".01"
                                                                                    name="BreakdownAgent1Total" value="0" readonly>
                                                                      </td>


                                                               </tr>

                                                               <tr id="DisplayBreakdownAgent2">

                                                                      <td><input class="inlineInput" type="text" id="BreakdownAgent2Name"
                                                                                    name="BreakdownAgent2Name" value="Second Agent"
                                                                                    style="text-align: left; padding-left: 8px;" readonly>
                                                                      </td>

                                                                      <td id="allocaionTd3" style="display: none;"><input
                                                                                    class="inlineInput" type="text"
                                                                                    id="BreakdownGrossAllocation2" style="padding-right: 0;"
                                                                                    step=".1" name="BreakdownGrossFeeSplit" value=""
                                                                                    readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="BreakdownAgent2Split"
                                                                                    style="padding-right: 0;" step=".1"
                                                                                    name="BreakdownAgent2Split" value="" readonly>
                                                                      </td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent2Amount" step=".01"
                                                                                    name="BreakdownAgent2Amount" value="0" readonly></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent2HST" step=".01"
                                                                                    name="BreakdownAgent2HST" value="0" readonly>
                                                                      </td>

                                                                      <td style="display: none;" class="ChangedHST"
                                                                             id="BreakdownAgent2HSTPercentTD"><input
                                                                                    class="inlineInput  textRight numberclass withBorder"
                                                                                    oninput="maxlengthCheckHST(this)"
                                                                                    onblur="addPercent(this.id);" type="text"
                                                                                    id="BreakdownAgent2HSTPercent"
                                                                                    name="BreakdownAgent2HSTPercent" value=""></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownAgent2Total" step=".01"
                                                                                    name="BreakdownAgent2Total" value="0" readonly>
                                                                      </td>


                                                               </tr>

                                                               <tr id="DisplayNetToBrokerage" class="topLine">

                                                                      <td><input class="inlineInput" type="text" id="BreakdownNetLabel"
                                                                                    name="BreakdownNetLabel" value="Net To Brokerage"
                                                                                    style="text-align: left; padding-left: 8px;"></td>

                                                                      <td id="allocaionTd4" style="display: none;"><input
                                                                                    class="inlineInput" type="text"
                                                                                    id="BreakdownGrossAllocation3" style="padding-right: 0;"
                                                                                    step=".1" name="BreakdownGrossFeeSplit" value=""
                                                                                    readonly></td>

                                                                      <td><input class="inlineInput" type="text" id="BreakdownNetSplit"
                                                                                    style="padding-right: 0;" step=".1"
                                                                                    name="BreakdownNetSplit" value="" readonly>
                                                                      </td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownNetFee" step=".01" name="BreakdownNetFee"
                                                                                    value="" readonly></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownNetHST" step=".01" name="BreakdownNetHST"
                                                                                    value="" readonly></td>

                                                                      <td style="display: none;" class="ChangedHST" id="EmptyPercent"></td>

                                                                      <td><input class="inlineInput textRight numberclass" type="text"
                                                                                    id="BreakdownNetTotal" step=".01"
                                                                                    name="BreakdownNetTotal" value="" readonly>
                                                                      </td>
                                                               </tr>

                                                        </table>

                                                 </div>

                                                 <div>
                                                        <p id="TermsError" class="ErrorEmpty" style="display: none;">You need to accept
                                                               terms
                                                               and conditions before you can finalize this deal. </p>

                                                        <div class="NewSectionSmall flexibleContainer" id="ConfirmationRecordCheckbox">
                                                               <label class="container flexible" style="flex: 0.01;"><input
                                                                             class="inlineInput" type="checkbox" onclick="completeRecord()"
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

                                                 <!-- <div class="NewSectionSmall flexibleContainer" id="Signingdiv" style="margin-top: 40px; display: none;">

                                                                      <label class="flexible" style="flex: 0.4;">DATED at</label>

                                                                      <input class="inlineInput flexible" style="margin-top: 1px;" type="text">

                                                                      <label class="flexible" style="flex: 1; text-align: center;" for="">Ontario, on
                                                                             28-Jul-2021</label>

                                                                      <input class="inlineInput flexible" style=" margin-top: 1px; " type="text">

                                                                      <label class="flexible" style="flex: 0.4; text-align: right;" for="">First
                                                                             Agent</label>

                                                               </div> -->

                                          </div> <!-- Closing MainSectionApprasialRecordSheet -->

                                          <div id="myModal" class="modal">
                                                 <div class="modal-content">
                                                        <span id="beforeApproved">
                                                               <div style="box-sizing: initial;" class="modalHeader">Finalize<span
                                                                             class="closeSign"><i class="bi bi-x-lg"></i></span></div>
                                                               <p style="line-height: 1.5;">Are you ready to finalize this deal?</p>

                                                               <div class="popUpContainer">
                                                                      <span class="close">Cancel</span>
                                                                      <button class="submitButton" type="submit" onclick="submitted();"
                                                                             id="Finalized" name="Finalized">Finalize</button>
                                                               </div>
                                                        </span>

                                                        <div id="afterApproved" style="display: none; height: 210px;">
                                                               <div style="box-sizing: initial;" class="modalHeader">Finalized<span
                                                                             class="closeSign"><i class="bi bi-x-lg"></i></span>
                                                               </div>

                                                               <div class="finalizedIcon">
                                                                      <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                                                                             class="bi bi-check2-circle" viewBox="0 0 16 16">
                                                                             <path
                                                                                    d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z">
                                                                             </path>
                                                                             <path
                                                                                    d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z">
                                                                             </path>
                                                                      </svg>
                                                                      <p style='color: green; text-align: center; font-size: 20px; padding-top: 0;     padding-bottom: 0; margin-top: 5px; margin-bottom: 5px;'>Successfuly finalized</p>
                                                               </div>


                                                               <div class="popUpContainer">
                                                                      <a class='totheLeft' href="../BrokerFiles/NewDeal.jsp">
                                                                             <div class="finalButtons">New deal</div>
                                                                      </a>
                                                                      <a class='totheRight' href="../BrokerFiles/Dashboard.jsp">
                                                                             <div class="finalButtons">Dashboard</div>
                                                                      </a>
                                                               </div>

                                                        </div>
                                                 </div>

                                          </div>

                                          <div class="FooterButton">
                                                 <div class="FooterButtonSpan">


                                                        <span class="buttonDiscard floatDataLefttSide">

                                                               <span class="buttonBack">

                                                                      <button id="ApprasialRecordSheetBack" class="buttonBlue" type="button"
                                                                             onclick="TabsHandleler(event,'Invoice','tabcontent','tablinks','InvoiceTab');">
                                                                             Back </button>
                                                               </span>
                                                        </span>


                                                        <span class="secondSpan">

                                                               <button class="dropdownMenubtn dropBtn1" type="button"
                                                                      id="Deletebtn5" name="Deletebtn5">Delete</button>
                                                               <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                                      id="Deletebtn5_5">Discard</button>
                                                               <button class="dropdownMenubtn dropBtn2" type="button"
                                                                      id="ExitWithoutSaving5">Exit without saving</button>
                                                               <button class="dropdownMenubtn dropBtn3" type="button" id="Savebtn5">Save and
                                                                      close</button>

                                                               <span class="savespan" id="savespan5">

                                                                      <button class="buttonSaveOne" type="button"
                                                                             id="ApprasialRecordSheetSave" name="ApprasialRecordSheetSave">Save</button>
                                                                      <button class="buttonSaveTwo"
                                                                             onclick="openWindow('ExitWithoutSaving5', 'Deletebtn5', 'Deletebtn5_5', 1, 'Savebtn5', 'savespan5', event)"
                                                                             type="button">&nbsp;</button>

                                                               </span>

                                                               <button id="ApprasialRecordSheetNext" class="buttonBlue"
                                                                      style="width: 150px; padding: 8px 10px;"
                                                                      type="button">Finalize</button>

                                                        </span>
                                                 </div>

                                          </div><!-- Closing  ApprasialRecordSheetButtonSection -->

                                   </div><!-- Closing ApprasialRecordSheet tab Content -->


                                   <div id="Documents" class="tabcontent content" style="display: none;">

                                          <label class="HeadLines" id='Title6'>RECORD SHEET</label>

                                          <div class="forAddressTop">

                                                 <label id="Propertyaddress4"></label>

                                          </div>

                                          <span style="font-weight: bold; display: none;">99</span>

                                          <hr class="addressHr" style="margin-right: 4px;">

                                          <p id="saveError" class="ErrorEmpty" style="display: none;">Complete the Transaction Details
                                                 before saving the deal.</p>

                                          <label style="font-weight: bold; margin-top: 22px;">DOCUMENTS</label>

                                          <div id="MainDocumentSection" class="extraStyling flexibleContainer"
                                                 style="height: 85px; border: 1px solid lightgrey; margin-top: 20px;">

                                                 <div class="flexible itemLongerLawFirm"
                                                        style="padding-top: 20px; margin: 5PX 4PX 0PX 6PX; margin-left: 13px; flex: 0.45; margin-right: 12px;">

                                                        <label id="doclab"
                                                               style="text-align: left; background-color: #f3f3f3; height: 31px; margin-top: 1px; padding-top: 9px; padding-right: 0;"
                                                               for="FileName0" onchange="docNameFill(this.id)"
                                                               class="custom-file-upload inlineInput">Select
                                                               document to upload
                                                        </label>
                                                        <span class="formats">(PDF)</span>
                                                        <span id="noDocumentError" class="fieldError" style="display: none;">Please select a
                                                               document</span>


                                                 </div>

                                                 <div class="flexible itemShortLawyer" style="margin-top: 26px;">

                                                        <!-- <label class="MandentorySign"></label><label></label> -->

                                                        <input style="    height: 31px;" class="inlineInput" type="text"
                                                               id="EXtraDocumentName1" name="EXtraDocumentName1"
                                                               placeholder="Document Name">

                                                        <span id="noNameDocumentError" class="fieldError" style="display: none;">Please
                                                               enter a document name</span>
                                                 </div>
                                                 <label class="flexible" style="flex: 0.2; margin-top: 26px;"><button type="submit"
                                                               id="documentSubmitbtn" name="documentSubmitbtn" class="buttonSave" onclick="getdocName()" >Save</button></label>

                                          </div>



                                          <div id="UploadedDocuments" style="    margin-top: 22px;">
                                                 <div id="storedDocuments">
                                                        <div class="oneDocument" style="display: none;">
                                                               <input type="file" id="FileName0" name="FileName0" accept=".pdf"
                                                                      multiple="true">
                                                               <label for="">File Name</label><br>
                                                               <label for="">Uploaded on 2022/05/11</label>
                                                               <button class="deleteDoc bi bi-trash floatDataRightSide"
                                                                      onclick="deleteDocument('FileName0')"></button>
                                                               <img src="../ImagesUsed/Upload.png" class="uploadImgDoc">
                                                        </div>
                                                 </div>

                                          </div><!-- Closing UploadedDocuments -->

                                          <div class="NewSection" style="margin-bottom: 40px;">

                                                 <label style="font-weight: bold; margin-top: 22px; margin-bottom: 22px;">NOTES</label>

                                                 <div class="noteBox">

                                                        <textarea class="forNotes" type="text" id="ExteraNotes"
                                                               name="ExteraNotes"></textarea>

                                                        <button class="buttonSave" type="submit" id="savenote" name="savenote"
                                                               onclick="saveNotes('<%= MyInformation.Firstname %>', '<%= MyInformation.Lastname %>')">Save</button>

                                                 </div>

                                                 <input type="hidden" name="allNotesDocuments" id="allNotesDocuments">

                                                 <!-- <label for="myfile">Select a File</label>
                                                        <input type="file" id="myfile" name="myfile"> -->
                                                 <div id="selected-file">
                                                 </div>
                                                 <!-- <button>Upload</button> -->

                                                 <div id="forNotes"></div>



                                                 <div class="Footer FooterButton">

                                                        <div class="FooterButtonSpan">

                                                               <span class="buttonDiscard floatDataLefttSide">

                                                                      <button style="display: none;" id="DocumentsDiscard" type="button"
                                                                             class="dropbtnDiscard">Discard</button>

                                                                      <!-- <span class="buttonBack">
                                                               <button id="DocumentsBack" type="button" class="buttonBlue"
                                                               onclick="TabsHandleler(event, 'Customer Rebate','tabcontent','tablinks1','CustomerRebateTab'); "
                                                               style="display:none">Back</button>
                                                        </span> -->
                                                               </span>

                                                               <span class="secondSpan">


                                                                      <button class="dropdownMenubtn dropBtn1" type="button"
                                                                             id="Deletebtn8">Delete</button>
                                                                      <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                                             id="Deletebtn1_8">Discard</button>
                                                                      <button class="dropdownMenubtn dropBtn2" type="button"
                                                                             id="ExitWithoutSaving8">Exit without saving</button>
                                                                      <button class="dropdownMenubtn dropBtn3" type="button"
                                                                             id="Savebtn8">Save and close</button>

                                                                      <span class="savespan" id="savespan8">

                                                                             <button class="buttonSaveOne" type="button" id="DocumentsSave"
                                                                                    name="DocumentsSave">Save</button>
                                                                             <button class="buttonSaveTwo"
                                                                                    onclick="openWindow('ExitWithoutSaving8', 'Deletebtn8', 'Deletebtn1_8', 1, 'Savebtn8', 'savespan8', event)"
                                                                                    type="button">&nbsp;</button>

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

                                                        <label id="Title4" class="HeadLines">Record Sheet</label>

                                                        <span style="display: none;" class="tooltip floatDataRightSide">
                                                               <img class="lineButton printButton" type="button" id="Docs"
                                                                      onclick="onClick('Docs');" src="../ImagesUsed/Print.png" alt="Print">
                                                               <span class="tooltiptext">Print page</span>
                                                        </span>

                                                        <div class="forAddressTop">
                                                               <label id="Propertyaddress6"></label>
                                                        </div>

                                                        <span style="font-weight: bold; display: none;">99</span>


                                                        <hr style="margin-top: 4px;margin-right: 4px;">

                                                        <p id="saveError2" class="ErrorEmpty" style="display: none;">Complete the
                                                               Transaction Details before saving the deal.</p>

                                                        <label style="font-weight: bold; margin-top: 22px;">AUDIT TRAIL</label>

                                                        <div class="PartiesNavBar" id="Partiesnav" style="display: none;">

                                                               <button id="" class="tablinks2 active" style="width: 120px;"> Activity
                                                               </button>

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

                                                                      <button class="dropdownMenubtn dropBtn1" type="button"
                                                                             id="Deletebtn9">Delete</button>
                                                                      <button class="dropdownMenubtn dropbtnDiscard" type="button"
                                                                             id="Deletebtn1_9">Discard</button>
                                                                      <button class="dropdownMenubtn dropBtn2" type="button"
                                                                             id="ExitWithoutSaving9">Exit without saving</button>
                                                                      <button class="dropdownMenubtn dropBtn3" type="button"
                                                                             id="Savebtn9">Save and close</button>

                                                                      <span class="savespan" id="savespan9">

                                                                             <button class="buttonSaveOne" type="button"
                                                                                    id="SaveButtomAuditTrail">Save</button>
                                                                             <button class="buttonSaveTwo"
                                                                                    onclick="openWindow('ExitWithoutSaving9', 'Deletebtn9', 'Deletebtn1_9', 1, 'Savebtn9', 'savespan9', event)"
                                                                                    type="button">&nbsp;</button>

                                                                      </span>

                                                               </span>
                                                        </div>

                                                 </div>

                                   </div>

                                   <div id="PreviewTRS"></div>
                                   <input id="bnHidden" type="hidden" value="<%=Mycompany.BusinessName%>">

                                   <input type="hidden" id="progressMarks" name="progressMarks" value='0'>
                                   <input id="finalizDate" name="finalizDate" type="hidden" value="">
                                   <input id="createddate" name="createddate" type="hidden" value="">

                            </form>

                     </form>
              </div>
              <script>
                            $(document).ready(function () {
                                   $('#EmailForm').on("submit", function(e) {
                                          e.preventDefault();//preventing default submission 
                                          //your code
                                   });
                                  
                                   $("#somebutton").on("click", function(event){
                                          const buttonName=event.target.name;
                                          //console.log($("#EmailForm").serialize());
                                          console.log('start');
                                          $.ajax({
                                                 type: "POST",
                                                 url: "/SecondSampleCore2", //process to mail
                                                 data: $("#EmailForm").serialize()+"&buttonClicked="+buttonName,
                                                 success: function(msg){
                                                        console.log("success")
                                                        console.log(msg);
                                                 },
                                                 error: function(msg2){
                                                        console.log(msg2);
                                                        console.log("FAIL")
                                                        //alert("failure editing account. User name already taken "+msg2);
                                                 }
                                          });
                                   });

                                   $.getScript("../Scripts/Appraisal.js").then(function () {
                                          $.getScript("../Scripts/AppraisalOnLoad.js").then(
                                                 function () {
                                                        $("#EmailForm").removeClass("loading");  
                                                        fileOpened(
                                                               '<%= MyInformation.Firstname %> <%= MyInformation.Lastname %>');

                                                 })
                                   });
                            });
                            $('#EmailForm').submit(function (e) {
                                   // e.preventDefault();

                                   // do ajax now
                                   if (!($('#EmailForm').attr('target') == 'hiddenFrame')) {
                                          window.location.href = "../BrokerFiles/Dashboard.jsp";
                                   }
                            });
              </script>

              <script>
                                   var tempA = '';

                                   function a() {
                                          window.jsPDF = window.jspdf.jsPDF;
                                          // window.html2canvas = html2canvas;
                                          var doc = new jsPDF('portrait', 'px', [1166, 825], 'true');
                                          var elementHandler = {};
                                          var iframe = document.getElementById('frameid');
                                          var source = window.document.getElementById("MainInvoiceSection");

                                          doc.html(source, {
                                                 'x': 75,
                                                 'y': 100,
                                                 'width': 700,
                                                 'scale': 2,
                                                 callback: function (pdf) {
                                                        // window.open(pdf.output('bloburl'));

                                                        // pdf.save("cv-a4.pdf");
                                                        tempA = pdf.output('datauristring');
                                                 }
                                          });

                                          // doc.save("a.pdf");
                                          var pdfBase64 = doc.output('datauristring');
                                          console.log(1);
                                          console.log(tempA);

                                          var delayInMilliseconds2 = 2000; //1 second

                                          setTimeout(function () {
                                                 console.log(2);
                                                 console.log(tempA);
                                                 //your code to be executed after 1 second
                                          }, delayInMilliseconds2);


                                   }

                                   function ab() {
                                          window.jsPDF = window.jspdf.jsPDF;
                                          // window.html2canvas = html2canvas;
                                          var doc = new jsPDF('portrait', 'px', [1166, 825], 'true');
                                          var elementHandler = {};
                                          var iframe = document.getElementById('frameid');
                                          var source = window.document.getElementById("MainInvoiceSection");
                                          var testvar = '';

                                          doc.html(source, {
                                                 'x': 75,
                                                 'y': 100,
                                                 'width': 700,
                                                 'scale': 2,
                                                 callback: function (pdf) {
                                                        // window.open(pdf.output('bloburl'));

                                                        // pdf.save("cv-a4.pdf");
                                                        testvar = pdf.output('blob');
                                                 }
                                          });

                                          waitForElement();


                                          function waitForElement() {
                                                 if (typeof testvar == "object") {

                                                        var reader = new FileReader();
                                                        reader.readAsDataURL(testvar);
                                                        reader.onloadend = function () { // for blob to base64
                                                               base64data = reader.result;
                                                               console.log("base64 data is ");
                                                               console.log(base64data);
                                                        }
                                                 } else {
                                                        setTimeout(waitForElement, 250);
                                                 }
                                          }

                                   }

                                   function b() {

                                          var pdf = new jsPDF('p', 'pt', 'a4');

                                          pdf.html(document.getElementById('doc'), {
                                                 callback: function (pdf) {

                                                        // example text
                                                        pdf.text(20, 20, 'Hello world!');
                                                        pdf.text(20, 30,
                                                               'This is client-side Javascript, pumping out a PDF.'
                                                               );

                                                        var base = pdf.output(
                                                        'datauri'); // directly to base664

                                                        console.log("base64 is  ");
                                                        console.log(base);

                                                        // you can generate in another format also  like blob
                                                        var out = pdf.output('blob');
                                                        var reader = new FileReader();


                                                        reader.readAsDataURL(out);
                                                        reader.onloadend =
                                                 function () { // for blob to base64
                                                               base64data = reader.result;
                                                               console.log("base64 data is ");
                                                               console.log(base64data);
                                                        }
                                                        pdf.save('DOC.pdf');

                                                 }
                                          })

                                   }

                                   function dataURItoBlob(dataURI) {
                                          // convert base64 to raw binary data held in a string
                                          // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
                                          var byteString = atob(dataURI.split(',')[1]);

                                          // separate out the mime component
                                          var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

                                          // write the bytes of the string to an ArrayBuffer
                                          var ab = new ArrayBuffer(byteString.length);
                                          var ia = new Uint8Array(ab);
                                          for (var i = 0; i < byteString.length; i++) {
                                                 ia[i] = byteString.charCodeAt(i);
                                          }

                                          //Old Code
                                          //write the ArrayBuffer to a blob, and you're done
                                          //var bb = new BlobBuilder();
                                          //bb.append(ab);
                                          //return bb.getBlob(mimeString);

                                          //New Code
                                          return new Blob([ab], {
                                                 type: mimeString
                                          });


                                   }
              </script>
       </body>

        </html>