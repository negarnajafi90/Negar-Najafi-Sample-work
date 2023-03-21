<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="RDS.RDSFunctions"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<%@ page import="java.util.Formatter"  %>

<%@ page import="org.json.*"  %>
<%@ page import="org.json.simple.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"  %>

<%@ page import="java.sql.Connection" %>


<html>

<%
 //long startTime = System.nanoTime();
 //long elapsedTime = System.nanoTime() - startTime;
 //System.out.println("Total execution time to create 1000K objects in Java in millis: " + elapsedTime/1000000);

String ContactID=(String)request.getParameter("ID");

int TransactionID=Integer.parseInt(ContactID) ;

//Getting the Existing Parties from the data base

int ID=(int)session.getAttribute("Userid");
int BrokerID=(int)session.getAttribute("Userid");
String Type=(String)session.getAttribute("Type");
Connection con=(Connection) session.getAttribute("Connection");
RDSFunctions myRDS= new RDSFunctions();

//Parsing data from JSON

JSONParser parser = new JSONParser();  
String InvData = myRDS.GetTRSReferralData(BrokerID,TransactionID,con);
System.out.println(InvData);

JSONObject object = (JSONObject) parser.parse(InvData);  
//JSONArray InvoiceJSONArr = (JSONArray) object.get("TRS");
//JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);

JSONObject dealInfo = (JSONObject) object.get("RecordSheet");
JSONArray dealParties = (JSONArray) object.get("Parties");
JSONArray dealFees = (JSONArray) object.get("FeeBreakdown");


%>

<body>

<div id="myModalTRS" class="modal" style="z-index: 10;">

    <div class="modal-content" style="z-index: 10;" id="ScrollingPreview">

        <div id="printing" class="trsPrintSpecial">

            <div id="TRSPreview"
                style="width: 100%; margin-left: 20px; box-sizing: border-box; padding-right: 20px;">

                <div style="width: 100%;">

                    <label style="box-sizing: border-box; padding: 0; padding-top: 7px; height: 14px; margin: 0; text-align: center; padding-left: 80px;width:calc(100% - 80px);"
                        class="HeadLines">RECORD SHEET</label>
                    <button class="buttonsprint" style="float: right; border: none; background: none; cursor: pointer;" type="button"
                        id="closeTRS"><img src="../ImagesUsed/Add.png" alt=""
                            style="height: 19px; transform: rotateZ(45deg);  cursor: pointer;"></button>
                    <button class="buttonsprint" style="float: right; border: none; background: none; cursor: pointer;" id=""
                        type="button"><img src="../ImagesUsed/Print.png" style="height: 20px; cursor: pointer;"
                            onclick="simplePrintReferral('printing')"></button>
                </div>

                <!-- This Span contains the Property information -->

                <div class="forAddressTop">

                    <label id="PropertyPreview">Referral Fee Receipt</label>

                    <span id="dealID"><%= TransactionID %></span>

                </div>

                <hr class="addressHr" style="margin-bottom: 22px;">

                <div id="MainTRSPreviewsection" class="ReferralTRSPrint">

                        <div  id="RecordSheetPropertyDetailInformation" class="cardsDetails flexibleContainer">

                            <div class="columnSmall flexible" style="padding-left: 5px;">

                                <div class="card">

                                    <label class="TRSlabel heavyfont">Referral Date</label>

                                    <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("ReferralDate") %></label></span>

                                </div>

                            </div>


                            <div class="columnSmall flexible" style="box-sizing: border-box">

                                <div class="card">

                                    <label class="TRSlabel heavyfont">Source</label>

                                    <span class="cardSpan"><label class="TRSinput heavyfont"><%= dealInfo.get("Source") %></label></span>

                                </div>

                            </div>

                            <div class="columnSmall flexible" style="box-sizing: border-box; padding-right: 5px;">

                                <div class="card">

                                    <label class="TRSlabel heavyfont">Referral Fee</label>

                                    <span class="cardSpan" style="text-align: center;">
                                        <label class="TRSinput heavyfont" style="float: none; padding-left: 0; width: 80%;">$ <%= dealInfo.get("ReferralFee") %></label>
                                    </span>

                                </div>

                            </div>

                        </div>

                    <div id="warnings" style="display: none;">
                        <label class="warningHeader">Compliance Warning(s)</label>

                        <div class="invoiceBox">

                            <div class="flexibleContainer" id="WarningRebate">
                                <div class="flexible" style="flex: 0.3;"><label class="warningInsideHeader">Compensation Agreement</label></div>
                                <div class="flexible"><p class="warningInsideBody"> Agent indicated that compensation agreement was not disclosed to all parties. The following explanation was provided: "
                                    <span id="explanationRebate"></span>"</p></div>
                            </div> 

                            <div class="flexibleContainer" id="WarningHST">
                                <div class="flexible" style="flex: 0.3;"><label class="warningInsideHeader">GST/HST</label></div>
                                <div class="flexible"><p class="warningInsideBody">GST/HST rate was changed. Please double check.</p></div>
                            </div>
                        
                        </div>
                    </div>

                    <div id="RecordSheetPartiesInformationPreview" class="SomeMarginTop" style="margin-left: -14px;">

                        <p style="font-weight: bold; height: 18px; margin-left: 14px;">Parties and Contact Details</p>

                        <table style="width:100%;" id="propertyTablePreview">

                               <tr class="newclass">
                                      <th width="15%" style="padding-left:14px">Party</th>

                                      <th width="22%">Name</th>

                                      <th width="22%">Company</th>

                                      <th width="27%">Address</th>

                                      <th width="15%">Phone</th>
                               </tr>

                               <% 
                                    if(dealParties!=null){
								    for (int i = 0, size = dealParties.size(); i < size; i++) {
									JSONObject oneParty = (JSONObject) dealParties.get(i);
								%>

                                    <tr>
                                        <% if(oneParty.get("Party").equals("Source")){%>
                                            <td><label class="inlineInput">Referral Recipient</label></td>
                                        <%}else{%>
                                            <td><label class="inlineInput"><%= oneParty.get("Party") %></label></td>
                                        <%}%>
                                        <td><label class="inlineInput"><%= oneParty.get("Name") %></label></td>

                                        <td><label class="inlineInput"><%= oneParty.get("Company") %></label></td>

                                        <td><label class="inlineInput"><%= oneParty.get("Address") %></label></td>

                                        <td><label class="inlineInput" style="padding: 0; "><%= oneParty.get("Phone") %></label></td>
                                    </tr>

                                <% }} %>

                        </table>

                 </div><!-- Close RecordSheetPartiesInformation -->

                 <div class="NewSection">

                        <p style="font-weight: bold; height: 18px;">Fee Breakdown</p>

                        <table style="width: calc(100% + 14px); margin-left: -14px;" id="tableFeePreview">

                               <tr class="newclass">

                                      <th width="27%"></th>

                                      <th width="9%" id="allocation" class="headlineright" style="display: none;">Allocation</th>

                                      <th width="11%" class="headlineright">Split</th>

                                      <th width="13%" class="headlineright">Fee</th>

                                      <th width="14%" class="headlineright">HST</th>

                                      <th width="12%" id="HSTHead1" class="headlineright ChangedHST">HST (%)</th>

                                      <th width="14%" class="headlineright">Total</th>
                               </tr>

                                <% 
                                    if(dealFees!=null){
								    for (int i = 0, size = dealFees.size(); i < size; i++) {
									JSONObject oneFeePart = (JSONObject) dealFees.get(i);
							    %>

                                <tr>
                                    <% if(oneFeePart.get("Description") == null){%>
                                        <td><label class="inlineInput" style="text-align: left;"><%= oneFeePart.get("Name") %></label></td>
                                    <%}else{%>
                                        <td><label class="inlineInput" style="text-align: left;"><%= oneFeePart.get("Description") %></label></td>
                                    <%}%>

                                    <td style="display: none;"></td>

                                    <td><label class="inlineInput textRight numberclass" style="padding-right: 0;"><%= oneFeePart.get("Split") %></label></td>

                                    <td><label class="inlineInput textRight numberclass"><%= oneFeePart.get("Fee") %></label></td>

                                    <td><label class="inlineInput textRight numberclass withBorder"><%= oneFeePart.get("HST") %></label></td>
                                    <td><label class="inlineInput textRight numberclass withBorder"><%= oneFeePart.get("HSTPercent") %></label></td>

                                    <td><label class="inlineInput textRight numberclass" style="padding: 0; "><%= oneFeePart.get("Total") %></label></td>
                                </tr>

                            <% }} %>

                        </table>

                 </div>

                </div><!-- Closing Main TRS section -->

                <script>
                    document.getElementById('timenow').value = new Date();
                </script>
                <input type="hidden" id="timenow">
                <div class="footerTRSPrint">
                    <div class="notSubmitted">
                        <div>
                            <label>Real Estate Brokerage Corporation</label>
                        </div>
                        <div>
                            <label>Prepared by <span id="AgentNamePrepared"></span></label>
                            <label class="PrintedOn">Printed on <span id="printedDate1"></span></label>
                        </div>
                    </div>

                    <div class="finallizedByAgent">
                        <div>
                            <label>Real Estate Brokerage Corporation</label>
                        </div>
                        <div>
                            <label>Submitted by <span id="AgentNameSubmitted"></span> on <span
                                    id="submittedDate"></span></label>
                            <label class="PrintedOn">Printed on <span id="printedDate2"></span></label>
                        </div>
                    </div>

                    <div class="approved">
                        <div>
                            <label>Real Estate Brokerage Corporation</label>
                        </div>
                        <div>
                            <label>Submitted by <span id="AgentNameSubmittedApproved"></span> on <span
                                    id="submittedDateApproved1"></span></label>
                        </div>
                        <div>
                            <label>Approved by <span id="AgentNameSubmittedApprovedBroker"></span> on <span
                                    id="submittedDateApproved2"></span></label>
                            <label class="PrintedOn">Printed on <span id="printedDate3"></span></label>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>

</html>