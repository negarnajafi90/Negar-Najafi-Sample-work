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
String InvData = myRDS.GetTRSOtherData(BrokerID,TransactionID,con);
JSONObject object = (JSONObject) parser.parse(InvData);  
//JSONArray InvoiceJSONArr = (JSONArray) object.get("TRS");
//JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);

JSONObject dealInfo = (JSONObject) object.get("RecordSheet");
JSONArray dealParties = (JSONArray) object.get("Parties");
JSONArray dealFees = (JSONArray) object.get("FeeBreakdown");
System.out.println(dealInfo);
%>

<body>
<div id="myModalTRS" class="modal" style="z-index: 10;">

    <div class="modal-content" style="z-index: 10;" id="ScrollingPreview">

        <div id="printing" class="trsPrintSpecial">

            <div id="TRSPreview" style="width: 100%; margin-left: 20px; box-sizing: border-box; padding-right: 20px;">

                <div style="width: 100%;">

                    <label
                        style="box-sizing: border-box; padding: 0; padding-top: 7px; height: 14px; margin: 0; text-align: center; padding-left: 80px;width:calc(100% - 80px);"
                        class="HeadLines">RECORD SHEET</label>
                    <button class="buttonsprint" style="float: right; border: none; background: none;  " type="button"
                        id="closeTRS"><img src="../ImagesUsed/Add.png" alt=""
                            style="height: 19px; transform: rotateZ(45deg); cursor: pointer;"></button>
                    <button class="buttonsprint" style="float: right; border: none; background: none;  " id=""
                        type="button"><img src="../ImagesUsed/Print.png" alt="Print" style="height: 20px; cursor: pointer;"
                            onclick="simplePrintOther('printing')"></button>
                </div>

                <!-- This Span contains the Property information -->

                <div class="forAddressTop">

                    <label id="PropertyPreview"></label>

                    <span id="dealID"><%= TransactionID %></span>

                </div>

                <hr class="addressHr" style="margin-bottom: 22px;">

                <div id="MainTRSPreviewsection" class="AppraisalTRSPrint">

                    <div id="RecordSheetPropertyDetailInformation" class="cardsDetails flexibleContainer">

                        <div class="columnSmall flexible" style="padding-left: 0;">

                            <div class="card heavyfont">

                                <label class="TRSlabel">Report Date</label>

                                 <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("ReportDate") %></label></span>

                            </div>

                        </div>


                        <div class="columnSmall flexible" style="box-sizing: border-box">

                            <div class="card heavyfont">

                                <label class="TRSlabel">Source</label>

                                <span class="cardSpan"><label class="TRSinput heavyfont"><%= dealInfo.get("Source") %></label></span>

                            </div>

                        </div>

                        <div class="columnSmall flexible" style="box-sizing: border-box; padding-right: 10px;">
                            <div class="card heavyfont">

                                <label class="TRSlabel">Fee</label>

                                <span class="cardSpan" style="text-align: center;">
                                    <label class="TRSinput heavyfont" style="float: none; padding-left: 0; width: 80%;">$ <%= dealInfo.get("Fee") %></label>
                                </span>

                            </div>
                        </div>

                    </div><!-- Close RecordSheetPropertyDetailInformation -->

                    <div id="warnings" style="display: none;">
                        <label class="warningHeader">Compliance Warning(s)</label>

                        <div class="invoiceBox">
                            <div class="flexibleContainer" id="WarningClosingDate">
                                <div class="flexible" style="flex: 0.3;"><label class="warningInsideHeader">Report
                                        Date</label></div>
                                <div class="flexible">
                                    <p class="warningInsideBody">Report date was more than 60 days ago.</p>
                                </div>
                            </div>
                            <div class="flexibleContainer" id="WarningHST">
                                <div class="flexible" style="flex: 0.3;"><label
                                        class="warningInsideHeader">GST/HST</label></div>
                                <div class="flexible">
                                    <p class="warningInsideBody">GST/HST rate was changed. Please double check.</p>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div id="RecordSheetPartiesInformation" class="NewSectionMedium" style="margin-left: -14px;">

                        <p class="headerTRS">Parties and Contact Details</p>


                        <table style="width:100%;" id="tableOne" class="NewSectionSmall">

                            <tr>
                                <th width="15%" style="padding-left: 14px;     text-align: left;">Party</th>

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

                                    <td><label class="inlineInput"><%= oneParty.get("Party") %></label></td>

                                    <td><label class="inlineInput"><%= oneParty.get("Name") %></label></td>

                                    <td><label class="inlineInput"><%= oneParty.get("Company") %></label></td>

                                    <td><label class="inlineInput"><%= oneParty.get("Address") %></label></td>

                                    <td><label class="inlineInput" style="padding: 0; "><%= oneParty.get("Phone") %></label></td>
                                </tr>

                            <% }} %>

                       
                        </table>

                    </div><!-- Close RecordSheetPartiesInformation -->

                    <div class="NewSectionSmall">

                        <p class="headerTRS" style="margin-left: -14px;">Fee Breakdown</p>

                        <table style="width: calc(100% + 14px); margin-left: -14px;" id="tableTwo" class="NewSectionSmall">

                            <tr>
                                <th width="27%"></th>

                                <th width="9%" id="allocaionTd" class="headlineright" style="display: none;">Allocation</th>

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
                                        <td><label class="inlineInput" style="text-align: left; padding-left: 8px;"><%= oneFeePart.get("Name") %></label></td>
                                    <%}else{%>
                                        <td><label class="inlineInput" style="text-align: left; padding-left: 8px;"><%= oneFeePart.get("Description") %></label></td>
                                    <%}%>

                                    <td><label class="inlineInput textRight numberclass" style="padding-right: 0;"><%= oneFeePart.get("Split") %></label></td>

                                    <td><label class="inlineInput textRight numberclass"><%= oneFeePart.get("Fee") %></label></td>

                                    <td><label class="inlineInput textRight numberclass"><%= oneFeePart.get("HST") %></label></td>

                                    <td><label class="inlineInput textRight numberclass"><%= oneFeePart.get("HSTPercent") %></label></td>

                                    <td><label class="inlineInput textRight numberclass" style="padding: 0; "><%= oneFeePart.get("Total") %></label></td>
                                </tr>

                            <% } }%>


                            <%-- <tr id="DisplayBreakdownGrossFee">

                                <td><input class="inlineInput" type="text" id="BreakdownGrossFeeLabel"
                                        name="BreakdownGrossFeeLabel" value="Gross Fee"
                                        style="text-align: left; padding-left: 8px;" readonly>
                                </td>

                                <td id="allocaionTd1" style="display: none;"><input class="inlineInput" type="text"
                                        id="BreakdownGrossAllocation" style="padding-right: 0;" step=".1"
                                        name="BreakdownGrossFeeSplit"  readonly></td>

                                <td><input class="inlineInput" type="text" id="BreakdownGrossFeeSplit"
                                        style="padding-right: 0;" step=".1" name="BreakdownGrossFeeSplit" 
                                        readonly></td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownGrossFeeAmount" step=".01" name="BreakdownGrossFeeAmount" 
                                        readonly></td>

                                <td><input class="inlineInput textRight numberclass" type="text" step=".01"
                                        id="BreakdownGrossFeeAmountHST" name="BreakdownGrossFeeAmountHST" value="0"
                                        readonly>
                                </td>

                                <td style="display: none;" class="ChangedHST" id="BreakdownGrossFeeAmountHSTPercentTD">
                                    <input class="inlineInput  textRight numberclass withBorder"
                                        oninput="maxlengthCheckHST(this)" onblur="addPercent(this.id);" type="text"
                                        id="BreakdownGrossFeeAmountHSTPercent" name="BreakdownGrossFeeAmountHSTPercent"
                                        ></td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownGrossFeeTotal" step=".01" name="BreakdownGrossFeeTotal" value="0"
                                        readonly></td>

                            </tr>

                            <tr id="DisplayBreakdownAgent1">

                                <td><input class="inlineInput" type="text" id="BreakdownAgent1Name"
                                        name="BreakdownAgent1Name" value="First Agent"
                                        style="text-align: left; padding-left: 8px;" readonly>
                                </td>

                                <td id="allocaionTd2" style="display: none;"><input class="inlineInput" type="text"
                                        id="BreakdownGrossAllocation1" style="padding-right: 0;" step=".1"
                                        name="BreakdownGrossFeeSplit"  readonly></td>

                                <td><input class="inlineInput" type="text" id="BreakdownAgent1Split"
                                        style="padding-right: 0;" step=".1" name="BreakdownAgent1Split" 
                                        readonly>
                                </td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownAgent1Amount" step=".01" name="BreakdownAgent1Amount" 
                                        readonly> </td>

                                <td><input class="inlineInput textRight numberclass" type="text" id="BreakdownAgent1HST"
                                        step=".01" name="BreakdownAgent1HST" value="0" readonly>
                                </td>

                                <td style="display: none;" class="ChangedHST" id="BreakdownAgent1HSTPercentTD"><input
                                        class="inlineInput  textRight numberclass withBorder"
                                        oninput="maxlengthCheckHST(this)" onblur="addPercent(this.id);" type="text"
                                        id="BreakdownAgent1HSTPercent" name="BreakdownAgent1HSTPercent" ></td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownAgent1Total" step=".01" name="BreakdownAgent1Total" value="0"
                                        readonly>
                                </td>


                            </tr>

                            <tr id="DisplayBreakdownAgent2">

                                <td><input class="inlineInput" type="text" id="BreakdownAgent2Name"
                                        name="BreakdownAgent2Name" value="Second Agent"
                                        style="text-align: left; padding-left: 8px;" readonly>
                                </td>

                                <td id="allocaionTd3" style="display: none;"><input class="inlineInput" type="text"
                                        id="BreakdownGrossAllocation2" style="padding-right: 0;" step=".1"
                                        name="BreakdownGrossFeeSplit"  readonly></td>

                                <td><input class="inlineInput" type="text" id="BreakdownAgent2Split"
                                        style="padding-right: 0;" step=".1" name="BreakdownAgent2Split" 
                                        readonly>
                                </td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownAgent2Amount" step=".01" name="BreakdownAgent2Amount" value="0"
                                        readonly></td>

                                <td><input class="inlineInput textRight numberclass" type="text" id="BreakdownAgent2HST"
                                        step=".01" name="BreakdownAgent2HST" value="0" readonly>
                                </td>

                                <td style="display: none;" class="ChangedHST" id="BreakdownAgent2HSTPercentTD"><input
                                        class="inlineInput  textRight numberclass withBorder"
                                        oninput="maxlengthCheckHST(this)" onblur="addPercent(this.id);" type="text"
                                        id="BreakdownAgent2HSTPercent" name="BreakdownAgent2HSTPercent" ></td>

                                <td><input class="inlineInput textRight numberclass" type="text"
                                        id="BreakdownAgent2Total" step=".01" name="BreakdownAgent2Total" value="0"
                                        readonly>
                                </td>


                            </tr>

                            <tr id="DisplayNetToBrokerage" class="topLine">

                                <td><input class="inlineInput" type="text" id="BreakdownNetLabel"
                                        name="BreakdownNetLabel" value="Net To Brokerage"
                                        style="text-align: left; padding-left: 8px;"></td>

                                <td id="allocaionTd4" style="display: none;"><input class="inlineInput" type="text"
                                        id="BreakdownGrossAllocation3" style="padding-right: 0;" step=".1"
                                        name="BreakdownGrossFeeSplit"  readonly></td>

                                <td><input class="inlineInput" type="text" id="BreakdownNetSplit"
                                        style="padding-right: 0;" step=".1" name="BreakdownNetSplit"  readonly>
                                </td>

                                <td><input class="inlineInput textRight numberclass" type="text" id="BreakdownNetFee"
                                        step=".01" name="BreakdownNetFee"  readonly></td>

                                <td><input class="inlineInput textRight numberclass" type="text" id="BreakdownNetHST"
                                        step=".01" name="BreakdownNetHST" value="0" readonly></td>

                                <td style="display: none;" class="ChangedHST" id="EmptyPercent"></td>

                                <td><input class="inlineInput textRight numberclass" type="text" id="BreakdownNetTotal"
                                        step=".01" name="BreakdownNetTotal" value="0" readonly>
                                </td>
                            </tr> --%>

                        </table>

                    </div>

                </div><!-- Closing Main TRS section -->

             
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
                            <label>Submitted by <span id="AgentNameSubmitted"></span> on <span id="submittedDate">Feb
                                    12, 2022 02:00 pm</span></label>
                            <label class="PrintedOn">Printed on <span id="printedDate2"></span></label>
                        </div>
                    </div>

                    <div class="approved">
                        <div>
                            <label>Real Estate Brokerage Corporation</label>
                        </div>
                        <div>
                            <label>Submitted by <span id="AgentNameSubmittedApproved">James Bond</span> on <span
                                    id="submittedDateApproved1">Feb 14, 2022 03:00 pm</span></label>
                        </div>
                        <div>
                            <label>Approved by <span id="AgentNameSubmittedApprovedBroker">James Bond</span> on <span
                                    id="submittedDateApproved2">Feb 12, 2022 02:00 pm</span></label>
                            <label class="PrintedOn">Printed on <span id="printedDate3">Feb 17, 2022 12:26
                                    pm</span></label>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>