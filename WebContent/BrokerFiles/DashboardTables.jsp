<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%-- <%@ page import="java.text.DecimalFormat"  %> --%>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<%-- <%@ page import="java.util.Formatter"  %> --%>

<%@ page import="org.json.*"  %>
<%@ page import="org.json.simple.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"  %>

<%@ page import="RDS.RDSFunctions"  %>
<%@ page import="java.sql.Connection" %>


<%
SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
SimpleDateFormat sdftime = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");

NumberFormat CanadaVal = NumberFormat.getCurrencyInstance(Locale.CANADA);
NumberFormat nf = NumberFormat.getInstance(new Locale("en", "US"));
nf.setMinimumFractionDigits(2);
nf.setMaximumFractionDigits(2);


int UserID=0;
int BrokerID=0;
String Type="0";
String FirstName = "";
String LastName = "";
String isBroker = "1";
Connection con=null;
RDSFunctions myRDS=new RDSFunctions();

if( session.getAttribute("Userid")==null  ){
  response.sendRedirect("../Logout.jsp");
  return;
}
else{
	 UserID=(int)session.getAttribute("Userid"); 
	 BrokerID=(int)session.getAttribute("Brokerid") ;	   	   
     Type=(String)session.getAttribute("Type") ;
     FirstName =(String)session.getAttribute("UserFirstname") ;
     LastName =(String)session.getAttribute("UserLastname") ;  
     con=(Connection) session.getAttribute("Connection");
}

//String JsonString = "{\"PTransactions\": [{\"ID\": 172, \"City\": \"\", \"Unit\": \"\", \"Notes\": \"Note\", \"Price\": \"10000.00\", \"AuthorID\": 8, \"BrokerID\": 8, \"Province\": \"\", \"MLSNumber\": \"\", \"OfferDate\": \"\", \"Permanent\": \"0\", \"AgentSign1\": \"0\", \"AgentSign2\": \"0\", \"AuthorType\": 1, \"BrokerSign\": \"0\", \"CreateDate\": \"2022-12-22\", \"OfficeLead\": 1, \"StreetName\": \"\", \"postalCode\": \"\", \"ClosingDate\": \"2022-12-26\", \"ListingDate\": \"2022-12-23\", \"ListingType\": \"Lender/Mortgage Referral\", \"Descriptions\": \"Referral Fee\", \"FirstAgentID\": 8, \"PropertyType\": \"Semi-detached\", \"StreetNumber\": \"\", \"FinalizedDate\": \"2022-12-25\", \"OffMarketDate\": \"\", \"ProgressMarks\": \"3\", \"SecondAgentID\": 0, \"ExpirationDate\": \"2022-12-28\", \"FirstAgentRole\": \"Role1\", \"InspectionDate\": \"\", \"ListCommission\": \"0.00\", \"PropertyStatus\": \"PropertyStatus\", \"SellCommission\": \"0.00\", \"ReferralFeeNote\": \"121212\", \"SecondAgentRole\": \"Role2\", \"LastCommissionID\": 172, \"ListingOfficeLead\": 0, \"SellingOfficeLead\": 0, \"TransactionSource\": \"Agent-lead\", \"TransactionStatus\": \"Incomplete\", \"OfferWithrawalDate\": \"\", \"OfferAcceptanceDate\": \"\", \"OfferExpiretionDate\": \"\", \"LastCommissionDealID\": 172, \"ConditionExpirationDate\": \"\", \"ConditionCompletationDate\": \"\", \"OfficeLeadGrossCommission\": \"50\", \"ListingOfficeLeadGrossCommission\": \"\", \"SellingOfficeLeadGrossCommission\": \"\"}, {\"ID\": 176, \"City\": \"1\", \"Unit\": \"1\", \"Notes\": \"Note\", \"Price\": \"1000.00\", \"AuthorID\": 8, \"BrokerID\": 8, \"Province\": \"ON\", \"MLSNumber\": \"MLS\", \"OfferDate\": \"\", \"Permanent\": \"0\", \"AgentSign1\": \"1\", \"AgentSign2\": \"1\", \"AuthorType\": 1, \"BrokerSign\": \"1\", \"CreateDate\": \"2022-12-22\", \"OfficeLead\": 1, \"StreetName\": \"1\", \"postalCode\": \"a1a1a1\", \"ClosingDate\": \"2022-12-26\", \"ListingDate\": \"2022-12-23\", \"ListingType\": \"Letter of Opinion\", \"Descriptions\": \"Letter of Opinion\", \"FirstAgentID\": 8, \"PropertyType\": \"Semi-detached\", \"StreetNumber\": \"1\", \"FinalizedDate\": \"2022-12-25\", \"OffMarketDate\": \"\", \"ProgressMarks\": \"3\", \"SecondAgentID\": 0, \"ExpirationDate\": \"2022-12-28\", \"FirstAgentRole\": \"Role1\", \"InspectionDate\": \"\", \"ListCommission\": \"0.00\", \"PropertyStatus\": \"Status\", \"SellCommission\": \"0.00\", \"ReferralFeeNote\": \"\", \"SecondAgentRole\": \"Role2\", \"LastCommissionID\": 176, \"ListingOfficeLead\": 0, \"SellingOfficeLead\": 0, \"TransactionSource\": \"Office-lead\", \"TransactionStatus\": \"Complete\", \"OfferWithrawalDate\": \"\", \"OfferAcceptanceDate\": \"\", \"OfferExpiretionDate\": \"\", \"LastCommissionDealID\": 176, \"ConditionExpirationDate\": \"\", \"ConditionCompletationDate\": \"\", \"OfficeLeadGrossCommission\": \"50.00\", \"ListingOfficeLeadGrossCommission\": \"0\", \"SellingOfficeLeadGrossCommission\": \"0\"}]}";
JSONParser parser = new JSONParser();  
String JsonString = myRDS.GetDashboardDeals(BrokerID,con);
//System.out.println(JsonString);
JSONObject object = (JSONObject) parser.parse(JsonString);  
JSONArray approvalDeals = (JSONArray) object.get("ApprovalDeals");
JSONArray CompletedDeals = (JSONArray) object.get("CompletedDeals");
JSONArray PendingDeals = (JSONArray) object.get("PendingDeals");

JSONObject graphInfo = (JSONObject) object.get("Graph");
JSONObject sumGraph = (JSONObject) graphInfo.get("sum");
JSONObject sumGraphCompleted = (JSONObject) graphInfo.get("sumCompleted");
JSONObject numGraph = (JSONObject) graphInfo.get("amount");
JSONObject numGraphCompleted = (JSONObject) graphInfo.get("amountCompleted");
JSONObject comGraph = (JSONObject) graphInfo.get("commission");
JSONObject comGraphCompleted = (JSONObject) graphInfo.get("commissionCompleted");

int Counter=0;
%>


<div id="MainDashboard" class="DashboardPage">

				<div class="HeaderDashboard flexibleContainer">
					<label class="DealsHeader flexible">My Brokerage</label>
					<!-- <span class="flexible" style="max-width: 50px; margin-right: -5px;">
						<img class="DashboardImgUser" src="../ImagesUsed/JB.jpg" alt="">
						<img class="UserStatus" src="../ImagesUsed/Online.png" alt="">
					</span> -->
					<label class="UserName flexible" for=""><%= FirstName %>&nbsp;<%= LastName %></label>
					<div class="avatar" data-label="<%= FirstName.charAt(0) %><%= LastName.charAt(0) %>"></div>
				</div>

				<div class="ContentDashboard flexibleContainer">
					<div class="MainConent flexible">

					<% if(isBroker == "1"){ %>
						<div class='updateCom Deals' style='    margin-bottom: 12px;'>
							<label class="DealsSecondHeader noMarPadRight">Deals for Approval</label>
                            <svg onclick="getDataApproval()" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-clockwise buttonSVG" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                                <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                            </svg>
							<img class='dropdownDash rotateimg180' alt="open" onclick='this.classList.toggle("rotateimg180"); document.querySelector("#dealsToApprove").classList.toggle("hide")' src="../ImagesUsed/collapse.png">
							<a href="Reports.jsp"><button class="ShowAllbtn" style="margin-right: 6px; width: 90px; ">Show all</button></a>
							<div id='dealsToApprove' class="tableDiv hide brokerDiv" style='padding-left: 10px;     transition: all .3s ease-in;'>
								<span id="tableApprovedSpan" style="display: none;">
									<img src="../ImagesUsed/LineCaught.png" class="noDealsTopImg" alt="">
								</span>
								<span id='AllApprovalDashboardSpan'>
                                    <table id="DbdDealsTableApproval" class="DbdDealsT" someprop="123">
                                        <thead>

                                            <tr style="border-bottom: 1px solid lightgrey; position: sticky; top: -5px; background: white;">

                                                <th class="firstLine" width="1%" style='padding-right: 10px;'>Trade</th>

                                                <th width="20%">Address</th>

                                                <th width="11%">Type</th>

                                                <th width="8%" style="text-align: right; padding-right: 5px;">Price</th>

                                                <th width="8%" style="text-align: right; padding-right: 5px;">Our Fee</th>

                                                <th width="11%" style="text-align: right;  padding-left: 0; padding-right: 5px;">Closing</th>

                                                <th width="11%" style="text-align: right;  padding-left: 0; padding-right: 5px;">Created</th>

                                                <th width="11%" style="text-align: right; padding-right: 34px;">Status</th>

                                                <th width="1%"> </th>

                                            </tr>

                                        </thead>


                                        <tbody>

                                        </tbody>

                                    </table>
                                </span>
							</div>
						</div>
					<% } %>

						<div id="DbdDeals" class="Deals">
							<label class="DealsSecondHeader noMarPadRight">Pending Deals</label>
                            <svg onclick="getDataPending()" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-clockwise buttonSVG" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                                <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                            </svg>
							<a href="Reports.jsp"><button class="ShowAllbtn" style="border-radius: 3px; width: 90px; margin-top: 8px;">Show all</button></a>

							<div class="tableDiv" style='padding-left: 10px;'>
								<span id="tablePendingSpan" style="display: none;">
									<img src="../ImagesUsed/LineCaught.png" class="noDealsTopImg" alt="">
									<%-- <label class="noDealsTopLabel">You are all caught up</label> --%>
								</span>
                                <span id="AllPendingDashboardSpan">
                                    <table id="DbdDealsTable" class="DbdDealsT">

                                        <thead>

                                            <tr style="border-bottom: 1px solid lightgrey; position: sticky; top: -5px; background: white;">

                                                <th class="firstLine" width="1%" style='padding-right: 10px;'>Trade</th>

                                                <th width="20%">Address</th>

                                                <th width="11%">Type</th>

                                                <th width="8%" style="text-align: right; padding-right: 5px;">Price</th>

                                                <th width="8%" style="text-align: right; padding-right: 5px;">Our Fee</th>

                                                <th width="11%" style="text-align: right;  padding-left: 0; padding-right: 5px;">Closing</th>

                                                <th width="11%" style="text-align: right;  padding-left: 0; padding-right: 5px;">Created</th>

                                                <th width="11%" style="text-align: right; padding-right: 34px;">Status</th>

                                                <th width="1%"> </th>

                                            </tr>

                                        </thead>


                                        <tbody>


                                            <%  for (int i = 0, size = PendingDeals.size(); i < size; i++) { 
                                                JSONObject oneDeal = (JSONObject) PendingDeals.get(i);
                                                String cleanText = "";	
                                                String type = (String) oneDeal.get("ListingType"); 		
                                                cleanText = type.replaceAll("[\\s\\-()]", "").replaceAll("\\d+", "").replaceAll("(.)([A-Z])", "$1 $2").replaceAll("Self ", "Self-").replaceAll("of ", " of ");  %> 
                                                

                                            <tr id="Row<%= Counter %>">

                                                <td><input class="inlineInput" style="padding-left: 10px;" value="<%= String.valueOf(oneDeal.get("ID")) %>"
                                                        id="TradeNumber<%= Counter %>" readonly>
                                                </td>
                                                
                                                <td>

                                                <%
                                                    String h =  (String) oneDeal.get("Unit");
                                                    if (!h.isEmpty()){ h = h + '-'; } %>
                                                    <% if(oneDeal.get("Descriptions").equals("Referral Fee")){  cleanText = "Referral Fee"; %>  
                                                    <%  }else if(oneDeal.get("Descriptions").equals("TRS")){ %>
                                                                <label><%= h+oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City") %></label>                                  
                                                    <%  }else{ %>
                                                            <% if( oneDeal.get("ListingType").equals("Other") || oneDeal.get("ListingType").equals("Consulting")){ %>
                                                                <label><%= oneDeal.get("Descriptions") %></label>
                                                        <%  }else{ %>
                                                                <label><%= h + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City")%></label>
                                                    <%  }   
                                                }%> 

                                                </td>

                                                <td><%= cleanText %></td>

                                                <td class='priceCompD'><%= oneDeal.get("Price")  %></td>

                                                <td class='priceCompD'><%= 0.00  %></td>
                                                <td style="text-align: right;"><%= (String) oneDeal.get("ClosingDate") %></td>

                                                <td style="text-align: right;"><%= (String) oneDeal.get("CreateDate") %></td>

                                                <% if(oneDeal.get("Descriptions").equals("TRS")){ %>
                                                        <td style="text-align: center;"><span class='<%= (String) oneDeal.get("PropertyStatus")%>Dash'><%= (String) oneDeal.get("PropertyStatus") %></span></td>
                                                <%  }else{ %>
                                                    <%if(oneDeal.get("PropertyStatus").equals("Reopened")){ %>
                                                        <td style="text-align: center;"><span class='refBackg1Dash <%= (String) oneDeal.get("PropertyStatus") %>Dash'><%= (String) oneDeal.get("PropertyStatus") %></span></td>
                                                    <%  }else{ %>
                                                        <td style="text-align: center;"><span class='refBackg1Dash'>Pending</span></td>
                                                    <% }%>
                                                <% }%>
                                                <td>
                                                    <img class="editDealImg" alt="contacts" src="../ImagesUsed/Contacts.png"
                                                        onclick='SetId("<%= String.valueOf(oneDeal.get("ID")) %>", "<%= (String) oneDeal.get("Descriptions")%>");'>
                                                </td>

                                            </tr>

                                            <% Counter++; } %>

                                        </tbody>

                                    </table>
                                </span>
							</div>

						</div>

						<div class="flexibleContainer">

							<div id="DbdCommissions" class="Deals flexible"
								style="text-transform: uppercase; margin-right: 6px; ">
								<label class="DealsSecondHeader">Chart <span>(<span id="typeChartopt"></span>, <span id="closedOnlyChartopt"></span>)</span></label>
								<img src="../ImagesUsed/Settings26px.png" id="modalSetup" class="settingsButton" alt="Setup" style="float: right;" onclick='openSettings()'>


								<div class="tableDiv" id="CanvasWrap" style='padding-top: 15px;padding-left: 7px;'>

									<canvas id="myChart" class="doughnutChart"
										style="width: 200px; height: 200px; max-width: 100%; max-height: 100%;"></canvas>

									<label id='chartPendingLabel' class="noDealsLabel" style="display: none;">There are no deals to display</label>
									<label id='chartDevelopingLabel' class="noDealsLabel" style="display: none;">This feature is coming soon...</label>

								</div>
							</div>

							<div id="DbdNewDeals" class="Deals flexible" style="margin-left: 6px; height: fit-content;">

								<label class="DealsSecondHeader noMarPadRight">Completed Deals</label>
                                <svg onclick="getDataCompleted()" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-clockwise buttonSVG" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                                    <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                                </svg>
								<a href="Reports.jsp"><button class="ShowAllbtn">Show all</button></a>
								<div class="tableDiv" style='padding-left: 10px;'>
									<label class="noDealsLabel" id="tableCompletedLabel" style="display: none;">There are no
										deals to display</label>
                                    <span id="AllCompletedDashboardSpan">
                                        <table id="DbdDealsTable2" class="DbdDealsT DbdDealsTSec">

                                            <thead>

                                                <tr style="border-bottom: 1px solid lightgrey; position: sticky; top: -5px; background: white;">

                                                    <th class="firstLine" width="1%" style='padding-right: 10px;'>Trade</th>

                                                    <th width="25%">Address</th>

                                                    <th width="28%" style='display: none'>Agent</th>

                                                    <th width="20%">Type</th>

                                                    <th width="18%" style="text-align: right;padding-right: 5px;">Finalized</th>

                                                    <th width="19%" style="text-align: right;    padding-right: 10px;">Price/Fee</th>

                                                    <th width="2%"> </th>
                                                </tr>
                                            </thead>

                                            <tbody>


                                                <%   
                                                int  Counter1=0;	
                                                for (int i = 0, size = CompletedDeals.size(); i < size; i++) { 
                                                    JSONObject oneDeal = (JSONObject) CompletedDeals.get(i);
                                                    String cleanText = "";	
                                                    String type = (String) oneDeal.get("ListingType"); 		
                                                // String id = (String) oneDeal.get("ID");
                                                    cleanText = type.replaceAll("[\\s\\-()]", "").replaceAll("\\d+", "").replaceAll("(.)([A-Z])", "$1 $2").replaceAll("Self ", "Self-").replaceAll("of ", " of ");  %> 

                                                <tr id="ROW<%=Counter1%>">

                                                    <td style="padding-left: 20px;"><input class="inlineInput" style="text-overflow: ellipsis;"
                                                            value="<%= String.valueOf(oneDeal.get("ID"))  %>"  readonly></td>

                                                    <%-- <td style="display: none"><%= MyBrokerInfo.Firstname %>&nbsp;<%= MyBrokerInfo.Lastname %></td> --%>

                                                    <td>
                                                        <%
                                                            String h =  (String) oneDeal.get("Unit");
                                                            if (!h.isEmpty()){ h = h + '-'; } %>
                                                            <% if(oneDeal.get("Descriptions").equals("Referral Fee")){  cleanText = "Referral Fee"; %>  
                                                            <%  }else if(oneDeal.get("Descriptions").equals("TRS")){ %>
                                                                        <label><%= h+oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City") %></label>                                  
                                                            <%  }else{ %>
                                                                    <% if( oneDeal.get("ListingType").equals("Other") || oneDeal.get("ListingType").equals("Consulting")){ %>
                                                                        <label><%= oneDeal.get("Descriptions") %></label>
                                                                <%  }else{ %>
                                                                        <label><%= h + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City")%></label>
                                                            <%  }   
                                                        }%> 
                                                    </td>

                                                    <td><%= cleanText %></td>

                                                    <td style="text-align: right;"><%= oneDeal.get("FinalizedDate") %></td>

                                                    <td class='priceCompD'><%= oneDeal.get("Price") %></td>

                                                    <td>
                                                        <span class="tooltipOpen">
                                                            <img alt='Options' class='editDealImg' src="../ImagesUsed/Dots.png" onclick='openTool(this)'>
                                                            <span class="tooltiptext">
                                                                <div class="option" onclick='SetId("<%= String.valueOf(oneDeal.get("ID")) %>", "<%= oneDeal.get("Descriptions") %>");'>View</div>
                                                                <div class="option" onclick='ReopenPopup("<%=String.valueOf(oneDeal.get("ID")) %>")'>Reopen</div>
                                                                <div class="option" onclick='DeletePopup("<%=String.valueOf(oneDeal.get("ID")) %>")'>Delete</div>
                                                            </span>
                                                        </span>

                                                    </td>

                                                </tr>

                                                <% Counter1++;} %>

                                            </tbody>

                                        </table>
                                    </span>
								</div>

								<style>
									.tooltipOpen {
									position: relative;
									}

									.tooltipOpen .tooltiptext {
									box-sizing: border-box;
									visibility: hidden;
									width: 84px;
									/* height: 33px; */
									font-family: 'ProximaNova';
									background-color: white;
									border-radius: 3px;
									border: 1px solid lightgrey;
									font-size: 11px;
									font-weight: lighter;
									color: black;
									text-align: center;
									padding: 5px 0;
									position: absolute;
									z-index: 1;
									top: 100%;
									right: 50%;
									margin-top: 5px;
									margin-left: 14px;
									}

									/* .tooltipOpen:hover .tooltiptext {
									visibility: visible;
									} */

									.tooltipOpen .option{
										padding: 7px 3px;
										cursor: pointer;
									}

									.tooltipOpen .option:hover{
										background: lightgrey;
									}

									.visible{
										visibility: visible !important;
									}
									

									
								</style>

							</div>

						</div>

					</div>

                    
					<script>
                        const allValues = {SaleNum:"<%=numGraph.get("Sale")%>", SalePrice:"<%=sumGraph.get("Sale")%>", SaleCom:"<%=comGraph.get("Sale")%>", 
                        LeaseNum:"<%=numGraph.get("Lease")%>",LeasePrice:"<%=sumGraph.get("Lease")%>", LeaseCom:"<%=comGraph.get("Lease")%>", 
                        OtherNum:"<%=numGraph.get("Other")%>", OtherPrice:"<%=sumGraph.get("Other")%>", OtherCom:"<%=comGraph.get("Other")%>",
                        RefNum:"<%=numGraph.get("Referral")%>", RefPrice:"<%=sumGraph.get("Referral")%>", RefCom:"<%=comGraph.get("Referral")%>"};
                        const CompletedValues = {SaleNum:"<%=numGraphCompleted.get("Sale")%>", SalePrice:"<%=sumGraphCompleted.get("Sale")%>", SaleCom:"<%=comGraphCompleted.get("Sale")%>", 
                        LeaseNum:"<%=numGraphCompleted.get("Lease")%>",LeasePrice:"<%=sumGraphCompleted.get("Lease")%>", LeaseCom:"<%=comGraphCompleted.get("Lease")%>", 
                        OtherNum:"<%=numGraphCompleted.get("Other")%>", OtherPrice:"<%=sumGraphCompleted.get("Other")%>", OtherCom:"<%=comGraphCompleted.get("Other")%>",
                        RefNum:"<%=numGraphCompleted.get("Referral")%>", RefPrice:"<%=sumGraphCompleted.get("Referral")%>", RefCom:"<%=comGraphCompleted.get("Referral")%>"};
					</script>

					<%-- //Chat goes here --%>

				</div>
			</div>
