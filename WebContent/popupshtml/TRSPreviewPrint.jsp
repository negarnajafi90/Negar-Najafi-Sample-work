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
String InvData = myRDS.GetTRSData(BrokerID,TransactionID,con);
System.out.println(InvData);
JSONObject object = (JSONObject) parser.parse(InvData); 
//JSONArray InvoiceJSONArr = (JSONArray) object.get("TRS");
//JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);

JSONObject dealInfo = (JSONObject) object.get("RecordSheet");
JSONArray dealAgents = (JSONArray) object.get("Agents");
JSONArray dealParties = (JSONArray) object.get("Parties");
JSONArray dealExp = (JSONArray) object.get("Expenses");
JSONArray dealCom = (JSONArray) object.get("Commissions");

JSONArray dealDepos = (JSONArray) object.get("Deposit");
JSONObject dealTotalDepos = (JSONObject) object.get("TotalDeposits");
//System.out.println(object);
//System.out.println(object.get("RecordSheet"));
//System.out.println(dealInfo);
%>
<body>

<div id="myModalTRS" class="modal" style="z-index: 10;">

    <div class="modal-content" style="z-index: 10;" id="ScrollingPreview">

        <div id="printing" class="TRSDealPreview trsPrintSpecial">

            <div id="TRSPreview" style="width: 100%; margin-left: 20px; box-sizing: border-box; padding-right: 20px;">

                <div style="width: 100%;">

                    <label style="box-sizing: border-box; padding: 0; color: #054d6a; padding-top: 7px; height: 14px; margin: 0; text-align: center; padding-left: 80px;width:calc(100% - 80px);"
                        class="HeadLines">TRADE RECORD SHEET</label>
                    <button class="buttonsprint" style="float: right; border: none; background: none; cursor: pointer;"
                        type="button" id="closeTRS"><img src="../ImagesUsed/Add.png" alt=""
                            style="height: 19px; transform: rotateZ(45deg); cursor: pointer;"></button>
                    <button class="buttonsprint" style="float: right; border: none; background: none; cursor: pointer;" type="button">
                        <img src="../ImagesUsed/Print.png" alt="Print" style="height: 20px; cursor: pointer;" onclick="simplePrintTRS('printing')">
                    </button>
                </div>

                <!-- This Span contains the Property information -->

                <div class="forAddressTop" style="margin-top: 10px;">

                    <label id="PropertyPreview"></label>

                    <span id="dealID" style="color: white;"><%= TransactionID %></span>

                </div>

                <hr class="addressHr" style="margin-bottom: 22px;">

                <div id="MainTRSPreviewsection">

                    <div id="TransactionInformation" class="cardsDetails flexibleContainer">


                        <div class="columnSmall flexible" style="padding-left: 0; flex: 1.2;">

                            <div class="card">

                                <label class="TRSlabel">Transaction Price:</label>
                                <span class="cardSpan"><label class="TRSinput">$<%= dealInfo.get("Price") %></label></span>

                                <label class="TRSlabel" style="margin-top: 6px;">List
                                    Commission:</label>
                                <span class="cardSpan"><label style="text-align: right; height: 25px; margin-top: 6px;"
                                        class="TRSinput"><%= dealInfo.get("ListCommission") %>%</label></span>

                                <label class="TRSlabel">Sell
                                    Commission:</label>
                                <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("SellCommission") %>%</label></span>

                            </div>

                        </div>

                        <div class="columnSmall flexible">

                            <div class="card">

                                <label class="TRSlabel">Status:</label>
                                <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("Status") %></label></span>

                                <label style="margin-top: 6px;" class="TRSlabel">Listing:</label>
                                <span class="cardSpan"><label class="TRSinput"
                                        style="  text-align: right; height: 25px; margin-top: 6px;"><%= dealInfo.get("Listing") %></label></span>

                                <label class="TRSlabel">Source:</label>
                                <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("Source") %></label></span>

                            </div>

                        </div>

                        <div class="columnSmall flexible" >

                            <div class="card">

                                <label class="TRSlabel">Closing:</label>
                                <span class="cardSpan"><label class="TRSinput"><%= dealInfo.get("Closing") %></label></span>

                                <label class="TRSlabel" style="margin-top: 6px;">MLS:</label>
                                <span class="cardSpan"><label style="text-align: right; height: 25px; margin-top: 6px;" class="TRSinput"><%= dealInfo.get("MLS") %></label></span>

                                <label class="TRSlabel" style="text-align: left; padding-left: 0px; color: black; font-weight: 100;">Receivable:</label>
                                <span class="cardSpan"><label class="TRSinput" style="text-align:right; "><%= dealInfo.get("Receivable") %></label></span>
                            </div>

                        </div>

                    </div><!-- Closing Transaction Information -->


                    <div id="DetailsParties&ContactInformation" class="DetailsPartiesAndContactInformation"
                        style="margin-left: -14px; margin-top: 30px;">

                        <p class="heavyfont headerTRS">
                            Parties and Contact Details</p>

                        <table style="width:100%;" id="tableOne" class="NewSectionSmall firstTDpadd">

                            <tr>
                                <th width="16%" style="padding-left:14px; text-align: left;">Party</th>

                                <th width="22%">Name</th>

                                <th width="22%">Company</th>

                                <th width="27%">Address</th>

                                <th width="13%">Phone</th>
                            </tr>
                            
                            <%  for (int i = 0, size = dealParties.size(); i < size; i++) {
				JSONObject oneParty = (JSONObject) dealParties.get(i); %>
									
				<tr>

	                                <td><%= oneParty.get("Party") %></td>
	
	                                <td><%= oneParty.get("Name") %></td>
	
	                                <td><%= oneParty.get("Company") %></td>
	
	                                <td><%= oneParty.get("Address") %></td>
	
	                                <td><%= oneParty.get("Phone") %></td>

                            	</tr>
									
			    <% } %>

                          
                        </table>

                    </div><!-- Closing DetailsParties&ContactInformation -->

                    <div class="depRow DetailsPartiesAndContactInformation flexibleContainer" id="Agent&Deposit"
                        style="margin-left: -18px; margin-top: 14px; width: calc(100% + 26px);">

                        <div class="depColumn flexible" id="Agents" style="flex: 1.3;">

                            <p id="AgentLabelTRS" class="heavyfont headerTRS">Agents</p>

                            <table id="AgentTable" class="NewSectionSmall">

                                <tr style="text-align: center;">

                                    <th width="40%" style="text-align: left; padding-left: 14px;">Name</th>

                                    <th width="7%" class="" id="AgentsAllocationHeader">Allocation</th>

                                    <th width="15%" class="">Split</th>

                                    <th width="20%" class="">Base</th>

                                    <th width="23%" class="">Net</th>
                                        <%-- headlineright --%>
                                </tr>
                                
                                 <%  for (int i = 0, size = dealAgents.size(); i < size; i++) {
								JSONObject oneAgent = (JSONObject) dealAgents.get(i); %>
				
								<tr>

                                    <td><%= oneAgent.get("Name") %></td>

                                    <td></td>

                                    <td><%= oneAgent.get("Split") %></td>

                                    <td><%= oneAgent.get("Base") %></td>

                                    <td><%= oneAgent.get("Net") %></td>

                                </tr>
								
 								<% } %>


                            </table>

                        </div><!-- Closing Agents -->

                        <div id="TRSDeposits" class="depColumn flexible">

                            <p class="heavyfont headerTRS"> Deposit</p>

                            <table id="depositsTable" class="NewSectionSmall">

                                <tr id="Deposit1Row">

                                    <th width="46%" style="padding-left:14px; text-align: left;">Name</th>

                                    <th width="27%">Date</th>

                                    <th width="27%" class="">Amount</th>
                                        <%-- headlineright --%>         
                                </tr>
                                
                                <%  for (int i = 0, size = dealDepos.size(); i < size; i++) { JSONObject oneDep = (JSONObject) dealDepos.get(i); %>
				
					<tr>

                                                <td><%= oneDep.get("Name") %></td>

                                                <td><%= oneDep.get("Date") %></td>

                                                <td><%= oneDep.get("Amount") %></td>


                                        </tr>
								
 				<% } %>

                                <tr class="topLine">
                                        <td>Total</td>
                                        <td></td>
                                        <td><%= dealTotalDepos.get("Amount") %></td>
                                </tr>

                            </table>


                        </div><!-- Closing Deposits -->

                    </div><!-- Closing Agent&Deposit -->


                    <div class="DetailsPartiesAndContactInformation" style="margin-left: -14px; ">              

                        <p class="heavyfont headerTRS" style="margin-top: 8px;">Commission Income</p>

                        <table id="CommisionsIncome" class="NewSectionSmall">

                            <tr style="text-align: center;">

                                <th width="28%" class="underLine" style="text-align: left;padding-left: 14px;">Name</th>

                                <th width="20%" class="underLine" style="text-align: left;     padding-left: 5px;">
                                    Description</th>

                                <th width="12%" class="underLine ">Commission</th>

                                <th width="17%" id="CommissionHeader" class="underLine ">HST</th>

                                <th width="9%" id="HSTHead1" class="underLine  ChangedHST">HST (%)</th>

                                <th width="17%" class="underLine ">Total</th>
                                <%-- headlineright --%>
                            </tr>
                            
                            <%  for (int i = 0, size = dealCom.size(); i < size; i++) {
				JSONObject oneCom = (JSONObject) dealCom.get(i); %>
				
				<tr>

                                    <td><%= oneCom.get("Name") %></td>
	
	                                <td><%= oneCom.get("Description") %></td>
	
	                                <td><%= oneCom.get("Commission") %></td>
	
	                                <td><%= oneCom.get("HST") %></td>
	
	                                <td><%= oneCom.get("HSTPercent") %></td>
	
	                                <td><%= oneCom.get("Total") %></td>
                                

                                </tr>
								
 				<% } %>


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

                                <th  class="headlineright" id="HSTHead" width="9%">HST (%)</th>

                                <th width="17%" class="headlineright">Total</th>

                            </tr>


                             <%if(dealExp!=null){for (int i = 0, size = dealExp.size(); i < size; i++) {
				JSONObject oneCom = (JSONObject) dealExp.get(i); %>
				
				<tr>

                                        <td><%= oneCom.get("Name") %></td>
	
	                                <td><%= oneCom.get("Description") %></td>
	
	                                <td class="textRight"><%= oneCom.get("Payment") %></td>
	
	                                <td class="textRight"><%= oneCom.get("HST") %></td>
	
	                                <td class="textRight"><%= oneCom.get("HSTPercent") %></td>
	
	                                <td class="textRight"><%= oneCom.get("Total") %></td>
                                

                                </tr>
								
 			    <% }}%> 

                        </table>

                    </div>

                </div><!-- Closing Main TRS section -->

            </div>
        </div>
    </div>
</div>

</body>

</html>