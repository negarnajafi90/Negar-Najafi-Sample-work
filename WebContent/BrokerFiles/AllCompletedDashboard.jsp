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
String filterDeals = request.getParameter("parameters"); 
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
Connection con=null;
RDSFunctions myRDS=new RDSFunctions();

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
}
			   	   
//String JsonString = "{\"PTransactions\": [{\"ID\": 172, \"City\": \"\", \"Unit\": \"\", \"Notes\": \"Note\", \"Price\": \"10000.00\", \"AuthorID\": 8, \"BrokerID\": 8, \"Province\": \"\", \"MLSNumber\": \"\", \"OfferDate\": \"\", \"Permanent\": \"0\", \"AgentSign1\": \"0\", \"AgentSign2\": \"0\", \"AuthorType\": 1, \"BrokerSign\": \"0\", \"CreateDate\": \"2022-12-22\", \"OfficeLead\": 1, \"StreetName\": \"\", \"postalCode\": \"\", \"ClosingDate\": \"2022-12-26\", \"ListingDate\": \"2022-12-23\", \"ListingType\": \"Lender/Mortgage Referral\", \"Descriptions\": \"Referral Fee\", \"FirstAgentID\": 8, \"PropertyType\": \"Semi-detached\", \"StreetNumber\": \"\", \"FinalizedDate\": \"2022-12-25\", \"OffMarketDate\": \"\", \"ProgressMarks\": \"3\", \"SecondAgentID\": 0, \"ExpirationDate\": \"2022-12-28\", \"FirstAgentRole\": \"Role1\", \"InspectionDate\": \"\", \"ListCommission\": \"0.00\", \"PropertyStatus\": \"PropertyStatus\", \"SellCommission\": \"0.00\", \"ReferralFeeNote\": \"121212\", \"SecondAgentRole\": \"Role2\", \"LastCommissionID\": 172, \"ListingOfficeLead\": 0, \"SellingOfficeLead\": 0, \"TransactionSource\": \"Agent-lead\", \"TransactionStatus\": \"Incomplete\", \"OfferWithrawalDate\": \"\", \"OfferAcceptanceDate\": \"\", \"OfferExpiretionDate\": \"\", \"LastCommissionDealID\": 172, \"ConditionExpirationDate\": \"\", \"ConditionCompletationDate\": \"\", \"OfficeLeadGrossCommission\": \"50\", \"ListingOfficeLeadGrossCommission\": \"\", \"SellingOfficeLeadGrossCommission\": \"\"}, {\"ID\": 176, \"City\": \"1\", \"Unit\": \"1\", \"Notes\": \"Note\", \"Price\": \"1000.00\", \"AuthorID\": 8, \"BrokerID\": 8, \"Province\": \"ON\", \"MLSNumber\": \"MLS\", \"OfferDate\": \"\", \"Permanent\": \"0\", \"AgentSign1\": \"1\", \"AgentSign2\": \"1\", \"AuthorType\": 1, \"BrokerSign\": \"1\", \"CreateDate\": \"2022-12-22\", \"OfficeLead\": 1, \"StreetName\": \"1\", \"postalCode\": \"a1a1a1\", \"ClosingDate\": \"2022-12-26\", \"ListingDate\": \"2022-12-23\", \"ListingType\": \"Letter of Opinion\", \"Descriptions\": \"Letter of Opinion\", \"FirstAgentID\": 8, \"PropertyType\": \"Semi-detached\", \"StreetNumber\": \"1\", \"FinalizedDate\": \"2022-12-25\", \"OffMarketDate\": \"\", \"ProgressMarks\": \"3\", \"SecondAgentID\": 0, \"ExpirationDate\": \"2022-12-28\", \"FirstAgentRole\": \"Role1\", \"InspectionDate\": \"\", \"ListCommission\": \"0.00\", \"PropertyStatus\": \"Status\", \"SellCommission\": \"0.00\", \"ReferralFeeNote\": \"\", \"SecondAgentRole\": \"Role2\", \"LastCommissionID\": 176, \"ListingOfficeLead\": 0, \"SellingOfficeLead\": 0, \"TransactionSource\": \"Office-lead\", \"TransactionStatus\": \"Complete\", \"OfferWithrawalDate\": \"\", \"OfferAcceptanceDate\": \"\", \"OfferExpiretionDate\": \"\", \"LastCommissionDealID\": 176, \"ConditionExpirationDate\": \"\", \"ConditionCompletationDate\": \"\", \"OfficeLeadGrossCommission\": \"50.00\", \"ListingOfficeLeadGrossCommission\": \"0\", \"SellingOfficeLeadGrossCommission\": \"0\"}]}";
JSONParser parser = new JSONParser();  
String JsonString = myRDS.SearchTransactionsForUser(BrokerID,"1",con);
JSONObject object = (JSONObject) parser.parse(JsonString);  
JSONArray compDeals = (JSONArray) object.get("PTransactions");
if(compDeals==null){
    return;
}
int Counter=0;
%>

<body>

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
            for (int i = 0, size = compDeals.size(); i < size; i++) { 
                JSONObject oneDeal = (JSONObject) compDeals.get(i);
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
</body>

</html>