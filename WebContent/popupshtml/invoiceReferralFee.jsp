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

<html>
<%

String ContactID=(String)request.getParameter("ID");

int TransactionID=Integer.parseInt(ContactID) ;

//Getting the Existing Parties from the data base
if( session.getAttribute("Userid")==null  ){
  response.sendRedirect("../Logout.jsp");
  return;
}else{
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

JSONObject ClientInf = (JSONObject) InvoiceJSON.get("Client");
JSONObject ClientAddress = (JSONObject) ClientInf.get("Address");

JSONObject ProfileInf = (JSONObject) InvoiceJSON.get("Profile");
JSONObject RefAddress = (JSONObject) ProfileInf.get("Address");

JSONObject PropInfo = (JSONObject) InvoiceJSON.get("Property");

JSONObject ReferralInf = (JSONObject) InvoiceJSON.get("Referral");

JSONObject CompanyInf = (JSONObject) InvoiceJSON.get("Company");
JSONObject CompanyAddress = (JSONObject) CompanyInf.get("Address");


String val = String.valueOf(CompanyInf.get("ID"));
String Companylogo="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+val;
%>

<body>
<div id="myModalTRS" class="modal" style="z-index: 10;padding-top: 2vh;">

       <div id="ScrollingPreview" class="modal-content" style="z-index: 10; padding: 60px; padding-top: 40px; padding-bottom: 50px; margin-bottom: 150px;">

              <div id="printing">

                     <div id="TRSPreview"
                            style="width: 100%; margin-left: 20px; box-sizing: border-box; padding-right: 20px;">

                            <div id="Invoice" class="">

                     <div id="InvoiceMainSection">

                            <label id="Title3" class="HeadLines">REFERRAL FEE RECEIPT</label>

                            <span class="floatDataRightSide buttonsprint">

                                   <button style="float: right; border: none; background: none; cursor: pointer;" type="button" id="closeTRS"><img
                                          src="../ImagesUsed/Add.png" alt="" style="height: 19px; transform: rotateZ(45deg); cursor: pointer;"></button>
                            
                                   <button style="float: right; border: none; background: none; cursor: pointer;" id="" type="button"><img
                                          src="../ImagesUsed/Print.png" alt="Print" style="height: 20px; cursor: pointer;" onclick="simplePrintOther('printing')"></button>

                                   <button style="float: right; border: none; background: none; cursor: pointer;" type="button" id="emailBtn" onclick='getDataEmailPreview("<%=TransactionID%>", "<%=BrokerID%>", "Referral", "", "<%=(String) DealInf.get("Balance")%>")'><img
                                          src="../ImagesUsed/Email.png" alt="print" style="height: 20px; cursor: pointer;"></button>

                            </span>

                            <div class="forAddressTop">
                                   <label class="reftypedisp"></label>
                                   <label style="font-weight: bold; float: right"><%= TransactionID %></label>
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

                                          <label type="text" class="flexibleDate NewSectionSmall"
                                                 style="font-weight: bold; margin-right: auto; padding-left: 0;"><%= (String) InvoiceJSON.get("Date") %></label>

                                          <label class="flexibleDate floatDataRightSide" type="text"
                                                 style="font-weight: bold; display: none;">Reference</label>
                                   </div>

                                   <div class="flexibleContainer NewSectionSmall" style="width: 70%;">

                                          <label type="text" class="flexibleZero"><%= (String) ProfileInf.get("Name")%></label>

                                   </div>

                                   <div class="flexibleContainer" style="width: 70%;">
                                   
                                          <label id="InvoiceReciverNameBusiness" name="InvoiceReciverNameBusiness"><%= (String) RefAddress.get("Street") %></label>
                                   </div>

                                   <div class="flexibleContainer" style="width: 70%;">

                                          <label type="text" class="flexibleZero"><%= (String) RefAddress.get("City")%></label>

                                   </div>



                                   <div id="InvoicePropertyInformation" class="invoiceBox NewSectionSmall"
                                          style="height: auto; margin-top: 24px !important; margin-bottom: 32px;">

                                          <div class="flexibleContainer" style="margin-top: 3px;">

                                                 <label
                                                        style="margin: 0; width: 130px;  margin-left: 15px; font-weight: bold;">Referral:</label>

                                                 <label type="text" class="inlineInput flexibleZero" id="InvoiceReferralType"
                                                        style="margin-top: 0;" name="InvoiceReferralType"><%= (String) ReferralInf.get("Referral")%></label>

                                          </div>

                                          <div class="flexibleContainer" style="margin-top: 7px;">

                                                 <label
                                                        style="margin: 0; width: 130px; margin-left: 15px; font-weight: bold;">Client(s):</label>

                                                 <label type="text" class="inlineInput flexibleZero" 
                                                        style="margin-top: 0;"><%= (String) ReferralInf.get("Client")%></label>

                                          </div>

                                          <div class="flexibleContainer" style="margin-top: 7px;">

                                                 <label style="margin: 0; width: 130px; margin-left: 15px; font-weight: bold;">Referral Date:</label>

                                                 <label type="date" id="InvoicePropertyReportDate" style="margin-top: 0;"
                                                        class="inlineInput flexibleZero" name="InvoicePropertyReportDate"
                                                        value=""><%= (String) PropInfo.get("ClosingDate")%></label>

                                          </div>
                                   </div>
                                   </div><!-- Closing InvoicePropertyInformation -->





                                   <div id="SomeDetailInformation" style="padding-right: 15px">

                                          <div class="flexibleContainer">

                                                 <label class="flexible" style="flex: 6;" id="InvoiveFeeLabel">Referral
                                                        Fee</label>

                                                 <label style="flex: 0.1;" class="flexible">$</label>

                                                 <label class="flexible" style="text-align: right; font-variant-numeric: tabular-nums;"
                                                        type="text" id="PropertyFeeInvoice" name="PropertyFeeInvoice"><%=(String) DealInf.get("SalesPrice")%></label>
                                          </div>

                                          <div class="flexibleContainer" style="margin-top: 4px;">

                                                 <label class="flexible" style="flex: 6;">HST (<%= (String) CompanyInf.get("HSTNumber") %>)</label>

                                                 <label class="flexible" style="flex: 0.1;"></label>

                                                 <label class="flexible"
                                                        style="text-align: right; font-variant-numeric: tabular-nums;"
                                                        id="PropertyHSTInvoice"
                                                        name="PropertyHSTInvoice"><%=  (String) DealInf.get("HST")%></label>
                                                        

                                          </div>

                                          <div class="flexibleContainer" style="margin-top: 4px;">

                                                 <label class="flexible heavyfont"
                                                        style="flex: 6;"><b>Balance</b></label>

                                                 <label class="flexible heavyfont"
                                                        style="flex: 0.1;">$</label>

                                                 <label class="flexible heavyfont"
                                                        style="text-align: right; font-variant-numeric: tabular-nums;"
                                                        id="BalanceInvoice"><%= (String) DealInf.get("Balance")%></label>

                                          </div>
                                   </div><!-- Closing SomeDetailInformation" -->

                                   <div class="invoiceBox NewSectionSmall" style="padding: 0; ">
                                          <p class="noticePayment" style=" margin-bottom: 0; color: black;">
                                                 Please mail a
                                                 cheque payable to "<%=(String) CompanyInf.get("BusinessName")%>" or make an electronic
                                                 payment to our commission trust account: </p>

                                          <div id="BankInformation" class="noticePayment" style="margin-top: 0;    padding-top: 0;">

                                                 <div style="width: 100%;">

                                                        <label style="width: 100px;  font-weight: bold;">Bank:</label>

                                                        <label type="text" class="inlineInput" id="InvoiceBank" name="InvoiceBank"
                                                               value="" style="padding: 0;"><%= (String) bankDetails.get("Bank")%></label>
                                                 </div>

                                                 <div style="width: 100%; margin-top: 1px;">

                                                        <label style="width: 100px; font-weight: bold;">Transit:</label>

                                                        <label type="text" class="inlineInput" id="InvoiceTransit"
                                                               name="InvoiceTransit" style="padding: 0;"><%= (String) bankDetails.get("Transit")%></label>
                                                               
                                                 </div>

                                                 <div style="width: 100%; margin-top: 1px; ">

                                                        <label style="width: 100px;  font-weight: bold;">Account:</label>

                                                        <label class="inlineInput" style="padding: 0;"><%= (String) bankDetails.get("Account")%></label>

                                                 </div>

                                          </div><!-- Closing BankInformation" -->       
                                   </div>
                                   


                                   <div id="SenderInformation">

                                          <label style="margin-top: 35px;">Sincerely,</label>

                                          <br>

                                          <label style="padding-left: 0;margin-top: 34px;" class="inlineInput"><%=(String) CompanyInf.get("FName")%><%=" "%><%=(String) CompanyInf.get("LName")%></label>

                                          <br>

                                          <label style="margin-top: 4px;">Broker of Record</label>

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
                            </div>
                     </div><!-- Closing InvoiceMainSection -->


                            </div><!-- Closing Invoice tab Content -->
                     </div>
              </div>
       </div>
</div>

</html></body>
<% } %>