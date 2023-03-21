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

int dealid = Integer.parseInt(request.getParameter("id")); 
session.setAttribute("ThisTransactionID", dealid);
int brokerid = Integer.parseInt(request.getParameter("brokerId")); 
String subject = request.getParameter("subject"); 
String dealtype = request.getParameter("dealtype"); 
String balance = request.getParameter("balance"); 

//Getting the Existing Parties from the data base

Connection con=(Connection) session.getAttribute("Connection");
AmazonS3 s3client=(AmazonS3) session.getAttribute("S3");
RDSFunctions myRDS= new RDSFunctions();
ConnectionToS3 S3= new ConnectionToS3();

//Parsing data from JSON

JSONParser parser = new JSONParser();  
String InvData = myRDS.GetTRSData(brokerid,dealid,con);

JSONObject object = (JSONObject) parser.parse(InvData);  
JSONArray dealParties = (JSONArray) object.get("Parties");


String InvDataDeal = myRDS.GetInvoiceData(brokerid,dealid,con);
JSONObject object2 = (JSONObject) parser.parse(InvDataDeal);  

JSONArray InvoiceJSONArr = (JSONArray) object2.get("Invoices");
JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);
JSONObject DealInf = (JSONObject) InvoiceJSON.get("Deal");
JSONArray DealLawyers = (JSONArray) InvoiceJSON.get("Lawyers");

System.out.println("DealLawyers");
System.out.println(DealLawyers);

//JSONObject object = (JSONObject) parser.parse(InvData);  
//JSONArray InvoiceJSONArr = (JSONArray) object.get("Invoices");
//JSONObject InvoiceJSON = (JSONObject) InvoiceJSONArr.get(0);
//
//JSONObject bankDetails = (JSONObject) InvoiceJSON.get("Bank");
//JSONObject DealInf = (JSONObject) InvoiceJSON.get("Deal");
//JSONObject PropertyInf = (JSONObject) InvoiceJSON.get("Property");
//
//JSONObject ClientInf = (JSONObject) InvoiceJSON.get("Client");
//JSONObject ClientAddress = (JSONObject) ClientInf.get("Address");
//
//JSONObject ProfileInf = (JSONObject) InvoiceJSON.get("Profile");
//JSONObject ReferralInf = (JSONObject) InvoiceJSON.get("Referral");
//
//JSONObject CompanyInf = (JSONObject) InvoiceJSON.get("Company");
//JSONObject CompanyAddress = (JSONObject) CompanyInf.get("Address");
%>

<form name="EmailForm" action="../EmailInvoice" id="EmailForm" method="post" enctype="multipart/form-data"  class="loading RightSideFlex">
    <div class="modal-content">
        <span class="close"><img alt="Close" style='width: 20px;' src="../ImagesUsed/Close.png"><i class="bi bi-x-lg"></i></span>
        <div class="emailBody">
            <div class="HeaderDashboard flexibleContainer">
                <label class="DealsHeader flexible">Email Commission Statement</label>
            </div>

            <div class="errors">
                <p id="comissionEmailed" class="ErrorEmpty greedBack" style='display: none'>Commission statement was emailed. See <span style="text-decoration:underline; cursor: pointer"
                        onclick="TabsHandleler(event, 'AuditTrail','tabcontent','tablinks1','AuditTrailTab'); PropertyLabel('Property8'); closeEmailPopup()">Audit Trail</span> for additional details.</p>
                <p id="emptyAdresseeError" class="ErrorEmpty" style='display: none'>Select at least one email recipient.</p>
                <p id="emptyEmailFields" class="ErrorEmpty" style='display: none'>Complete all required fields before proceeding.</p>
                <p class="ErrorEmpty blueBack">Balance due to Broker: $<span id="paysumEmail"><%=balance%></span></p>
            </div>

            <div id="Addressee">
                <div class="Addressee">
                    <label for="" class="headlineEmail">Addressee</label>
                    <div class="flexibleContainer">
                       
                        <div class="flexible flexibleContainer">
                            <div class="flexible check">
                                <label class="container flexible">
                                    <input class="inlineInput" type="checkbox" id="Addressee" name="Addressee">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            
                            <div class="flexible names">
                                <label class="heavyfont">Client</label>
                                
                                <label for="Addressee0"><%=DealInf.get("RecieverFirstName") + " "+ DealInf.get("RecieverLastName")%></label>
                                <input class="ref" id="emailValueAddressee" name="emailValueAddressee" value='<%=DealInf.get("RecieverEmail")%>' readonly="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="optional">
                    <label for="" class="headlineEmail">Optional Parties <img src="../ImagesUsed/Arrow.png"
                            onclick="showAddParties()" id="iconEmailPreview" alt="" loading="lazy"></label>
                    <div id="optionalDIV" class="remove">
                        <div class="flexibleContainer">
                            <% 
                                for (int i = 0, size = dealParties.size(); i < size; i++) {
                                    
                                	
                                JSONObject oneParty = (JSONObject) dealParties.get(i);
                                String partyType = (String) oneParty.get("Party");
                            %>

                                <div class="flexible flexibleContainer">
                                    <div class="flexible check">
                                        <label class="container flexible">
                                            <input class="inlineInput" type="checkbox" id=" OptionalAddressee<%=i%>" name="OptionalAddressee<%=i%>">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    
                                    <div class="flexible names">
                                        <label class="heavyfont" for="OptionalAddressee<%=i%>">Owner</label>
                                        <label for="Addressee0"><%=oneParty.get("Name")%></label>
                                        <input class="ref" id="OptionalemailValueAddressee<%=i%>" name="OptionalemailValueAddressee<%=i%>" value='<%=oneParty.get("Email")%>' readonly="">
                                    </div>
                                </div>

                            <% }%>

                             <% 
                                if(DealLawyers != null){
                                for (int j = 0, size = DealLawyers.size(); j < size; j++) {
              
                                JSONObject oneParty = (JSONObject) DealLawyers.get(j);
                            %>

                                <div class="flexible flexibleContainer">


                                    <div class="flexible check">
                                        <label class="container flexible">
                                            <input class="inlineInput" type="checkbox" id=" OptionalAddresseeLaw<%=j%>" name="OptionalAddresseeLaw<%=j%>">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>

                                    <div class="flexible names">
                                        <% if(oneParty.get("Type").equals("1")){  %>
                                            <label class="heavyfont" for="Addressee2<%=j%>">Vendor's/Landlord's Lawyer</label>
                                        <%}else{%>
                                            <label class="heavyfont" for="Addressee2<%=j%>">Purchaser's/Tenant's Lawyer</label>
                                        <%}%>
                                        <label for="OptionalAddresseeLaw<%=j%>"><%=oneParty.get("LawFirm")%></label>
                                        <label for="OptionalAddressee2Law<%=j%>"><%=oneParty.get("Lawyer")%></label>
                                        <input class="ref" id="OptionalemailValueAddresseeLaw<%=j%>" name="OptionalemailValueAddresseeLaw<%=j%>" readonly value='<%=oneParty.get("Email")%>'>
                                    </div>
                                    
                                    <%-- <div class="flexible names">
                                        <label class="heavyfont" for="OptionalAddressee<%=j%>">Owner</label>
                                        <label for="Addressee0"><%=oneParty.get("Name")%></label>
                                        <input class="ref" id="OptionalemailValueAddresseeLaw<%=j%>" name="OptionalemailValueAddresseeLaw<%=j%>" value='<%=oneParty.get("Email")%>' readonly="">
                                    </div> --%>
                                </div>

                            <% }}%>
                        </div>
                    </div>
                </div>
            </div>

            <div class="message">
                <div class="subject">
                    <label class="MandentorySign"></label><label for="">Subject Line</label>
                    <input id="subjectLineEmail"  name="subjectLineEmail" type="text" class="inlineInput"
                        style="padding-left: 10px; height: 29px; border-color: #8badbd;"
                        value="Commission statement for <%=subject%>">
                </div>
                <div class="notes">
                    <label class="MandentorySign"></label><label for="">Email Notes</label>
                    <textarea id="messageEmail" name="messageEmail" class="inlineInput TextArea"
                        style="height: 200px; border-color: #8badbd;line-height: 1.5;   padding: 15px; padding-left: 10px; resize: none;"
                        cols="30"
                        rows="10">Please see attached our commission statement. &#10;&#10;&#10;&#10;Kind regards, &#10;&#10;The Best Brokerage</textarea>
                </div>
            </div>

            <div class="popUpContainer" style="display: flex;">
                <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary7"
                        name="Secondary7" value=""><span class="checkmark"></span>Email me a copy</label>
                <label class="container flexible emailCopy"><input class="inlineInput" type="checkbox" id="Secondary8"
                        name="Secondary8" value=""><span class="checkmark"></span>Save to documents</label>
                <button style='width: auto;' class="submitButton" type="submit" id="SendEmailInvoice"
                    name="SendEmailInvoice" >Send</button>
            </div>

        </div>
    </div>
</form>