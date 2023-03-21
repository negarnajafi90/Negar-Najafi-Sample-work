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


<%@ page import="S3.ConnectionToS3"  %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.amazonaws.services.s3.AmazonS3"%>



  <%

String ContactID=(String)request.getParameter("ID");

int TransactionID=Integer.parseInt(ContactID) ;

//Getting the Existing Parties from the data base

int ID=(int)session.getAttribute("Userid");
int BrokerID=(int)session.getAttribute("Userid");
String Type=(String)session.getAttribute("Type");
Connection con=(Connection) session.getAttribute("Connection");
AmazonS3 s3client=(AmazonS3) session.getAttribute("S3");
RDSFunctions myRDS= new RDSFunctions();

//Getting the company information ob the Broker

//Companies mycompany=new Companies();
//mycompany= myRDS.GetaCompanyBuyBrokerID(BrokerID,con);

ConnectionToS3 S3= new ConnectionToS3();

JSONParser parser = new JSONParser();  
String InvData = myRDS.GetInvoiceData(BrokerID,TransactionID,con);
JSONObject object = (JSONObject) parser.parse(InvData);  

JSONArray InvoiceJSONArr = (JSONArray) object.get("Invoices");

JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);

JSONObject bankDetails = (JSONObject) InvoiceJSON.get("Bank");
//JSONObject Dateinf = (JSONObject) InvoiceJSON.get("Date");
JSONObject DealInf = (JSONObject) InvoiceJSON.get("Deal");
JSONObject DealAddress = (JSONObject) DealInf.get("Address");

//JSONObject ClientInf = (JSONObject) InvoiceJSON.get("Client");
//JSONObject ClientAddress = (JSONObject) ClientInf.get("Address");

JSONObject PropertyInf = (JSONObject) InvoiceJSON.get("Property");

JSONObject ProfileInf = (JSONObject) InvoiceJSON.get("Profile");
JSONObject ReferralInf = (JSONObject) InvoiceJSON.get("Referral");

JSONObject CompanyInf = (JSONObject) InvoiceJSON.get("Company");
JSONObject CompanyAddress = (JSONObject) CompanyInf.get("Address");

String TotalCom = (String)DealInf.get("TotalCommission");
String Deposits = (String)DealInf.get("Deposit");

String labelVendorLandlord = "";
String labelTenantPurchaser = "";

if(InvoiceJSON.get("ListingType").equals("Lease-DoubleSided") || InvoiceJSON.get("ListingType").equals("Landlord-Side") || InvoiceJSON.get("ListingType").equals("Tenant-Side") || InvoiceJSON.get("ListingType").equals("TenantSide-Self-Represented-Landlord")){
    labelVendorLandlord = "Landlord(s)";
    labelTenantPurchaser = "Tenant(s)";
 }else{
    labelVendorLandlord = "Vendor(s)";
    labelTenantPurchaser = "Purchaser(s)";
 }

//Float TotalCom = Float.parseFloat(DealHST.replace(",",""))+Float.parseFloat(DealCom.replace(",",""));


String val = String.valueOf(CompanyInf.get("ID"));
String Companylogo="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+val;
%>
<html>

<body>

    <div id="myModalTRS" class="modal" style="z-index: 10;padding-top: 2vh;">

        <div class="modal-content" id="ScrollingPreview"
            style="z-index: 10; padding: 60px; padding-top: 40px; padding-bottom: 50px; margin-bottom: 150px; min-height: 100%; height: 1400px;">

            <div id="printing">

                <div id="TRSPreview"
                    style="width: 100%; margin-left: 20px; box-sizing: border-box; padding-right: 20px;">

                    <div id="Invoice" class="tabcontent">

                        <label class="HeadLines">TRADE RECORD SHEET</label>

                        <span class="floatDataRightSide">

                            <button style="float: right; border: none; background: none; cursor: pointer;" type="button" id="closeTRS"><img
                                src="../ImagesUsed/Add.png" alt="" style="height: 19px; transform: rotateZ(45deg); cursor: pointer;"></button>

                            <span class="tooltip">
                                <img class="manageListButton" id="emailBtn"  onclick='getDataEmailPreview("<%=TransactionID%>", "<%=BrokerID%>", "TRS", "", "<%=(String) DealInf.get("Balance")%>")'
                                    src="../ImagesUsed/Email.png" alt="Email" style="width: 22px;" loading="lazy">
                                <span class="tooltiptext">Email invoice</span>
                            </span>

                            <span class="tooltip">
                                <img class="printButton" type="button" id="invoicep" style="margin: 2px 5px;"
                                    onclick="simplePrint('MainInvoiceSection')" src="../ImagesUsed/Print.png"
                                    alt="Print" loading="lazy">
                                <span class="tooltiptext">Print page</span>
                            </span>

                        </span>

                        <!-- This Span contains the Property information -->

                        <div class="forAddressTop">

                            <label id="Property5"></label><span class="tradenumspan"><%=TransactionID%></span>

                        </div>

                        <hr class="addressHr" style="margin-bottom: 22px; margin-right: 4px;">

                        <div id="MainInvoiceSection">

                            <div id="printMainInvoice">

                                <div class="frontImageLogo frontImageFlex">
                                    <img src="<%=Companylogo%>?math=<%=Math.random()%>" alt="House"
                                        class="insideImglogo" loading="lazy">
                                </div>

                                <label style="color:black;  text-transform: uppercase;" class="heavyfont"
                                    id="MainTitle">Commission Statement</label>

                                <div class="flexibleContainer NewSectionSmall" style="width: 70%;">

                                    <label class="flexibleDate heavyfont NewSectionSmall" id="Date"
                                        style="margin-right: auto; padding-left: 0;"><%= (String) InvoiceJSON.get("Date") %></label>

                                </div>


                                <div class="NewSectionSmall" style="width: 70%;">

                                    <label class="flexibleZero" id="Reciever Full Name"><%=DealInf.get("RecieverFirstName")+" "+DealInf.get("RecieverLastName")%></label>
                                    <%-- <span id="ReceiverExtraspan">
                                        <br>
                                        <label class="flexibleZero"  id="ReceiverExtraLabel"></label>
                                    </span> --%>

                                </div>

                                <div class="flexibleContainer" style="width: 70%;">
                                    <label id="RecieverAddress"><%=DealAddress.get("Top")%></label>
                                </div>

                                <div class="flexibleContainer" style="width: 70%;">
                                    <label id="RecieverAddressTwo"><%=DealAddress.get("Bottom")%></label>
                                </div>


                                <div id="SummaryOfTransaction" class="invoiceBox NewSectionSmall" style="height: auto; margin-top: 24px !important">

                                    <div class="flexibleContainer">

                                        <label class="heavyfont"
                                            style="margin: 0; width: 130px;  margin-left: 15px; padding-top: 7px;  ">Property:</label>

                                        <label id="Property7" class="inlineInput flexibleZero"><%= PropertyInf.get("Details") %></label>

                                    </div>

                                    <div class="flexibleContainer">

                                        <label id="Title1"
                                            style="margin: 0; width: 130px; padding-top: 7px; margin-left: 15px; font-weight: bold;"><%=labelVendorLandlord%>:</label>

                                        <label class="inlineInput flexibleZero" id="InvoiceVendors"><%=DealInf.get("Party1")%></label>

                                    </div>


                                    <div class="flexibleContainer">

                                        <label id="Title2"
                                            style="margin: 0; width: 130px; margin-left: 15px; padding-top: 7px;"
                                            class="heavyfont"><%=labelTenantPurchaser%>:</label>

                                        <label class="inlineInput flexibleZero" id="InvoicePuchasers"><%=DealInf.get("Party2")%></label>

                                    </div>

                                    <div class="flexibleContainer">

                                        <label style="margin: 0; width: 130px; margin-left: 15px; padding-top: 7px;"
                                            class="heavyfont">Closing:</label>

                                        <label class="inlineInput flexibleZero" id="InvoiceClosingDate"><%= PropertyInf.get("ClosingDate") %></label>

                                    </div>

                                </div><!-- Closing SummaryOfTransaction -->

                                <% if(InvoiceJSON.get("ListingType").equals("Lease-DoubleSided") || InvoiceJSON.get("ListingType").equals("Landlord-Side") || InvoiceJSON.get("ListingType").equals("Tenant-Side") || InvoiceJSON.get("ListingType").equals("TenantSide-Self-Represented-Landlord")){%>
                                    <p class="invoiceBox" id="SellingBox" style="text-align: center; color: black;">Commission for our
                                        services rendered in accordance with the relevant Rental Agreement.</p>
                                <% }else{%>
                                    <p class="invoiceBox" id="LeasingBox" style="text-align: center; color: black;">Commission for our
                                        services rendered in accordance with the relevant Agreement of Purchase and Sale.
                                    </p>
                                <%}%>

                                <div id="SomeDetailInformationTRS" class="NewSectionSmall" style="padding-right: 15px;">

                                    <div class="flexibleContainer">

                                        <label class="flexible" style="flex: 6;" id="InvoiceFeeLabelPrice">Price</label>

                                        <label class="flexible inlineInput"
                                            style="flex: 0.1; padding-top: 3px;">$</label>

                                        <label class="inlineInput flexible" style="text-align: right;"
                                            id="InvoicePrice"><%= DealInf.get("SalesPrice") %></label>

                                    </div>

                                    <div class="flexibleContainer" style="margin-top: 4px;">

                                        <label class="flexible" style="flex: 6;" id="InvoiceFeeLabel">Commission
                                            Payable</label>

                                        <label class="flexible" style="flex: 0.1; padding-top: 3px;"></label>

                                        <label class="inlineInput flexible" style="text-align: right;"
                                            id="InvoiceCommission"><%= DealInf.get("CommissionPayable")%></label>

                                    </div>

                                    <div class="flexibleContainer"
                                        style="margin-top: 4px; height: 19px; border-bottom: 1px solid lightgrey;">

                                        <label class="flexible" style="flex: 6;">HST (<%= (String) CompanyInf.get("HSTNumber")%>)</label>

                                        <label class="flexible" style="flex: 0.1; padding-top: 3px;"></label>

                                        <label class="inlineInput flexible" style="text-align: right;"
                                            id="InvoiceTaxAmount"><%= DealInf.get("HST") %></label>
                                    </div>

                                    <div class="flexibleContainer" style="margin-top: 7px;">

                                        <label class="flexible" style="flex: 6;">Total Commission</label>

                                        <label class="flexible inlineInput" style="flex: 0.1;">$</label>

                                        <label class="inlineInput flexible" style="text-align: right;"
                                            id="InvoiceTotal"><%=DealInf.get("TotalCommission")%></label>

                                    </div>

                                    <% if(!(DealInf.get("Deposit").equals("")||DealInf.get("Deposit").equals("0") || DealInf.get("Deposit").equals("0.00") || DealInf.get("Deposit")==null)){%>

                                    <div class="flexibleContainer NewSectionSmall"
                                        style=" border-bottom: 1px solid lightgrey;">

                                        <label class="flexible" style="flex: 6; height: 19px; padding-top: 3px;">Deposit
                                            held in trust:</label>

                                        <label class="flexible inlineInput"
                                            style="flex: 0.1; padding-top: 3px;">$</label>

                                        <label class="inlineInput flexible" style="text-align: right; padding-top: 3px;"
                                            id="InvoiceDeposits"><%= DealInf.get("Deposit")%></label>
                                    </div>
                                    <% }%>

                                    <div class="flexibleContainer" style="margin-top: 6px;">

                                        <label id="BalanceLabel" class="flexible"
                                            style="flex: 6; font-weight: bold; padding-top: 3px;">Balance
                                            due:</label>

                                        <label class="flexible inlineInput"
                                            style="flex: 0.1; font-weight: bold; padding-top: 3px;">$</label>

                                        <label class="inlineInput flexible"
                                            style="text-align: right; font-weight: bold; padding-top: 3px;"
                                            id="InvoiceRemaingBalance"><%= DealInf.get("Balance") %></label>
                                    </div>

                                </div>

                                <% if(Float.parseFloat(TotalCom.replace(",","")) < Float.parseFloat(Deposits.replace(",",""))){ %>
                                <div id="StatmentContects" class="noticePaymentSec">

                                    <span class="BlockDislay" id="ExtraNotice">

                                        <label style=" margin-right: 0;">A sum of $</label>

                                        <label style="" id="BalanceDueAmountRemain"><%=DealInf.get("Balance")%></label>

                                        <label style="" id="StatementReturnMessage"> is owning to the <%=labelVendorLandlord%> on
                                            closing.</label></span>

                                    <p class="BlockDislay" style=" margin-top: 5px; margin-bottom: 0; color: black;">Please
                                        contact our office if you have any questions.</p>

                                <% } %>
                                </div><!-- Closing StatmentContects  -->

                                <div id="InvoiceContects">

                                    <div class="invoiceBox NewSectionSmall" style="padding: 0">

                                        <p class="noticePayment" style=" margin-bottom: 0; color: black;"> Please mail a cheque
                                            payable to "<%=(String) CompanyInf.get("BusinessName")%>" or make
                                            an electronic payment to our commission trust
                                            account:</p>
                                        <div class="noticePayment" style="margin-top: 0;    padding-top: 0;">

                                            <div style="width: 100%;">

                                                <label style="width: 100px;  font-weight: bold;">Bank:</label>

                                                <input type="text" class="inlineInput" id="InvoiceBank"
                                                    name="InvoiceBank" value="<%=(String) bankDetails.get("Bank") %>"
                                                    style="padding: 0;" readonly>
                                            </div>

                                            <div style="width: 100%; margin-top: 1px;">

                                                <label style="width: 100px;  font-weight: bold;">Transit:</label>

                                                <input type="text" class="inlineInput" id="InvoiceTransit"
                                                    name="InvoiceTransit" value="<%=(String) bankDetails.get("Transit")%>"
                                                    style="padding: 0;" readonly>
                                            </div>

                                            <div style="width: 100%; margin-top: 1px; ">

                                                <label style="width: 100px;  font-weight: bold;">Account:</label>

                                                <input type="text" class="inlineInput" id="InvoiceAccount"
                                                    name="InvoiceAccount" value="<%=(String) bankDetails.get("Account")%>"
                                                    style="padding: 0;" readonly>
                                            </div>

                                        </div>

                                    </div>

                                </div><!-- Closing  InvoiceContects -->


                                <div id="SenderInformation">

                                    <label>Sincerely,</label>

                                    <br>

                                    <label style="padding-left: 0;margin-top: 34px;" class="inlineInput"><%=(String) CompanyInf.get("FName")%><%=" "%><%=(String) CompanyInf.get("LName")%></label>

                                    <br>

                                    <label style="margin-top: 3px;">Broker of Record</label>

                                    <br><br>

                                    <label style="margin-top: 4px;"><%=(String) CompanyInf.get("BusinessName")%></label>

                                    <br>

                                    <label style="margin-top: 4px;"><%=(String) CompanyAddress.get("Street")%></label>

                                    <br>

                                    <label style="margin-top: 4px;"><%=(String) CompanyAddress.get("City")%></label>

                                    <br><br>


                                    <label style="margin-top: 4px;"><%=(String) CompanyInf.get("Phone")%></label>

                                    <br>

                                    <label style="margin-top: 4px;"><a target="_blank" href="mailto:<%=(String) CompanyInf.get("Email")%>"><%= (String) CompanyInf.get("Email")%></a></label>

                                </div><!-- Closing SenderInformation -->

                                <!-- Hidden inputs for getting data -->

                            </div>

                        </div><!-- Closing Main Invoice Section -->


                    </div><!-- Closing Invoice -->

                </div>
            </div>
        </div>
    </div>

</body>

</html>