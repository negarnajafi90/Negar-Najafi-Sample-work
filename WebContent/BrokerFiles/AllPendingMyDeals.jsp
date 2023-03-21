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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
//String filterDeals = request.getParameter("parameters"); 

String searchVal = request.getParameter("search"); 
String SortBy = request.getParameter("sortby"); 
String dateType = request.getParameter("type"); 
String dateFromSort = request.getParameter("datefrom"); 
String dateToSort = request.getParameter("dateto"); 
//dateType="Finalized";
//System.out.println(filterDeals1+", "+filterDeals2+", "+filterDeals3 +", "+filterDeals4 +", "+filterDeals5+" end");


//SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
//SimpleDateFormat sdftime = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");

//NumberFormat CanadaVal = NumberFormat.getCurrencyInstance(Locale.CANADA);
//NumberFormat nf = NumberFormat.getInstance(new Locale("en", "US"));
//nf.setMinimumFractionDigits(2);
//nf.setMaximumFractionDigits(2);


int UserID=0;
int BrokerID=0;
String Type="0";
String FirstName = "";
String LastName = "";
Connection con=null;
RDSFunctions myRDS=new RDSFunctions();

//System.out.println((Connection) session.getAttribute("Connection"));

if( session.getAttribute("Userid")==null  ){
  //response.sendRedirect("../Logout.jsp");
  return;
}
else{

	UserID=(int)session.getAttribute("Userid"); 
	BrokerID=(int)session.getAttribute("Brokerid") ;	   	   
    Type=(String)session.getAttribute("Type") ;
    FirstName =(String)session.getAttribute("UserFirstname") ;
    LastName =(String)session.getAttribute("UserLastname") ;  
    con=(Connection) session.getAttribute("Connection");

			   	   
    JSONParser parser = new JSONParser();  
    String JsonString = myRDS.GetSortedReports(BrokerID,"0",searchVal,dateType,dateFromSort,dateToSort,SortBy,searchVal,1,20,con);

    if(!(JsonString.equals("Error") || JsonString.equals("Empty"))){
        JSONObject object = (JSONObject) parser.parse(JsonString);  
        JSONArray pendDeals = (JSONArray) object.get("PTransactions");
        if(pendDeals==null){
            return;
        }

        
    int Counter4=0;

    for (int i = 0, size = pendDeals.size(); i < size; i++) {
    JSONObject oneDeal = (JSONObject) pendDeals.get(i);
    JSONArray dates = (JSONArray) oneDeal.get("DisplayDate");
    String PropertyPic2="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/TRS/Property-Picture/Property-"+String.valueOf(oneDeal.get("ID"))+"-"+String.valueOf(BrokerID);%>

    <div class="NewSectionSmall MainSpan">

            <div class="mainDiv">
                <div class="flexibleContainer">
                    <input type="hidden" ID="test"  name="test" value="<%= oneDeal.get("Price") %>"   >
                    <%if(oneDeal.get("Descriptions").equals("TRS")){%>
                        <span class="Span1 flexible Prop<%= oneDeal.get("PropertyType") %>" style='display: none'></span>
                        <div style='overflow: hidden;' class='promImageLoaded'>
                            <img class="Span1 flexible" alt="Property" src="<%=PropertyPic2%>" onerror='this.parentElement.style.display = "none"; this.parentElement.parentElement.getElementsByClassName("Span1")[0].style.display = ""'>
                            
                        </div>
                    <% }else{ %>
                        <span class="Span1 flexible Prop<%= oneDeal.get("PropertyType") %>"></span>
                    <%}%>
                    
                    <div class="flexibleContainer flexible MaininfoColumn">

                        <div class="flexible flexibleContainer firstColumn">
                        <div class="flexible fColRaw" onclick='SetId("<%= oneDeal.get("ID") %>", "<%= oneDeal.get("Descriptions")%>" );'>
                            <%
                                String h =  (String) oneDeal.get("Unit");
                                if (!h.isEmpty()){ h = h + '-'; } 
                            %>
                        <% if(oneDeal.get("Descriptions").equals("Referral Fee")){ %>
                                    <label>Referral Fee </label>
                        <%  }else if(oneDeal.get("Descriptions").equals("TRS")){ %> 
                                    <label><%= h+oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City") %></label>                                  
                        <%  }else{ %>
                                <% if( oneDeal.get("ListingType").equals("Other") || oneDeal.get("ListingType").equals("Consulting")){ %>
                                
                                    <label><%= oneDeal.get("Descriptions") %></label>
                                    
                            <%  }else{ %>
                            
                                    <label><%= h + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")+", "+oneDeal.get("City")%></label>
                            <%   }   
                            }%> 
                        
                        </div>

                            <div class="flexible sColRaw">
                                <label><%= oneDeal.get("Price") %></label>
                            </div>

                            <div class="flexible tColRaw">
                                <label class="span4Label refBackg1 <%= oneDeal.get("PropertyStatus") %>"><%= oneDeal.get("ID") %></label>
                            </div>

                        </div>

                        <div class="flexible flexibleContainer secondColumn">

                            <div class="Span2 flexible">
                                <%  String type =  (String)oneDeal.get("ListingType"); String cleanText = type.replaceAll("[\\s\\-()]", "").replaceAll("\\d+", "").replaceAll("(.)([A-Z])", "$1 $2").replaceAll("Self ", "Self-").replaceAll("of ", " of ").replaceAll("in ", " in ");%>
                                <label><%= cleanText %></label><br>
                                <label><%= oneDeal.get("PropertyType") %></label><br>
                            </div>
                            
                            
                            <div class='flexible dealDates' style=" margin-top: 0;  margin-bottom: 0; flex: 2.1">
                            
                                <%  if(!(dates==null)){
                                    for (int j = 0, datessize = dates.size(); j < datessize; j++) { 
                                    JSONObject date = (JSONObject) dates.get(j);%>
                                  
                                    <div class="flexibleContainer"> 
                                        <label class='flexible'><%=date.get("name")%></label> 
                                        <label class='flexible closingDateLabel'><%=date.get("value")%></label>
                                    </div> 
                                <% }}  %>                               
                                        
                                <div class="flexibleContainer">
                                    <div class='flexible'></div>
                                    <div class="secondDiv flexible">
                                        <label  class="showMoreDeal"
                                            onclick="More(this);">More
                                            Details</label>
                                        <label  class="showMoreDeal" style="display:none;"
                                            onclick="Less(this );">Less
                                            Details</label>
                                    </div>    
                                </div>    
                                            
                            </div>

                        </div>

                    </div>
                </div>

                <div ID="content<%= Counter4 %>" class="contentBody" style="display:none;">

                    <div class="flexibleContainer">

                        <span class="flexible spantext">

                            <div class="spantextDiv">

                                <div class="noteBox" style='height: 92px; border: none'>

                                    <label>Notes</label>

                                    <span class="tooltipHelp"><img class="helpImg"
                                            src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp"
                                            width="16" height="16"><span class="tooltiptext">Notes will be saved in documents tab.</span></span>
        
                                    <span contenteditable="true" style='padding-top: 0; padding-left:0; background: none; border: none; height: 60px; max-width: 350px; padding-right: 92px;   overflow: overlay; display: block' class="forNotes" type="text" ID="ExteraNotes"></span>
                                    
                                    <button style='margin-top: -28px; margin-right: 3px; padding: 5px 0px; border-radius: 15px;' class="buttonSave" onclick="saveNotes()">Save</button>
                        
                                </div>
                            </div>

                        </span>

                            <%  String un = (String) oneDeal.get("Unit");
                                if (!un.isEmpty()){
                                    un = un + '-';
                                } 

                                if(oneDeal.get("Descriptions").equals("Referral Fee")){ %>
                                <% if(Integer.parseInt( (String)oneDeal.get("ProgressMarks")) >= 3){
                                %>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "invoiceReferralFee.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <% }else{ %>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst lockedInvoice">
                                <% } %>

                            <%  }else if(oneDeal.get("Descriptions").equals("TRS")){ %> 
                                <% if(Integer.parseInt( (String) oneDeal.get("ProgressMarks")) >= 3){%>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "InvoiceTRS.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <% }else{ %>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst lockedInvoice">
                                <% } %>
                            <%  }else{ %>
                                <% if(Integer.parseInt( (String) oneDeal.get("ProgressMarks")) >= 3){%>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "invoiceOther.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <% }else{ %>
                                    <span class="flexible spanInvoiceTRS spanInvoiceTRSFirst lockedInvoice">
                                <% } %>
                            <%   }   %> 

                                <% if(Integer.parseInt( (String) oneDeal.get("ProgressMarks")) >= 3){%>
                                    <label class="labelInvoice"><p>INVOICE</p></label>
                                <%  }else{ %>
                                    <label class="labelTRS"><p>INVOICE <br><span style='color: grey'>(incomplete)</span></p></label>
                                <% }  %>

                            

                            </span>

                            <% if(oneDeal.get("Descriptions").equals("Referral Fee")){ %>
                                <% if(Integer.parseInt( (String)oneDeal.get("ProgressMarks")) >= 3){%>
                                    <span class="flexible spanInvoiceTRS" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "TRSPreviewPrintReferral.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <%  }else{ %>
                                    <span class="flexible spanInvoiceTRS lockedInvoice">
                                <% }  %>
                            <%  }else if(oneDeal.get("Descriptions").equals("TRS")){ %> 
                                <% if(Integer.parseInt( (String)oneDeal.get("ProgressMarks")) >= 3){%>
                                    <span class="flexible spanInvoiceTRS" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "TRSPreviewPrint.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <%  }else{ %>
                                    <span class="flexible spanInvoiceTRS lockedInvoice">
                                <% }  %>
                            <%  }else{ %>
                                <% if(Integer.parseInt( (String)oneDeal.get("ProgressMarks")) >= 3){%>
                                    <span class="flexible spanInvoiceTRS" onclick=' getDataInvoicePreview("<%= oneDeal.get("ID") %>", "TRSPreviewPrintAppraisal.jsp", "<%= un + oneDeal.get("StreetNumber")+" "+oneDeal.get("StreetName")%>", "<%= oneDeal.get("City")+", "+oneDeal.get("Province ") %>", event)'>
                                <%  }else{%>
                                    <span class="flexible spanInvoiceTRS lockedInvoice">
                                <% }  %>
                            <%   }  %> 
                            
                            
                                <% if(Integer.parseInt( (String)oneDeal.get("ProgressMarks")) >= 3){%>
                                    <label class="labelInvoice"><p>TRS</p></label>
                                <%  }else{ %>
                                    <label class="labelTRS"><p>TRS <br><span style='color: grey'>(incomplete)</span></p></label>
                                <% }  %>
                            </span>

                    </div>

                </div><!-- Closing ExteraFilds  -->

            </div>

        </div><!-- Closing Main Span -->

    <% } %>

                                        

    </html>


    <%}else{
        return;
    }
}

//System.out.println(pendDeals.get(1));
%>
