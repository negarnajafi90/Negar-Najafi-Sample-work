<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- <%@ page import="java.util.ArrayList"  %> --%>
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

<%

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

//MyCompanies=myRDS.GetaCompanyBuyBrokerID(BrokerID);
//
if( session.getAttribute("Userid")==null  ){
  //response.sendRedirect("../NoPermission.jsp");
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
    String JsonString = myRDS.GetSortedReports(BrokerID,"1",searchVal,dateType,dateFromSort,dateToSort,SortBy,searchVal,1,20,con);

    if(!(JsonString.equals("Error") || JsonString.equals("Empty"))){
        JSONObject object = (JSONObject) parser.parse(JsonString);  
        JSONArray compDeals = (JSONArray) object.get("PTransactions");

        //System.out.println("DEALS: "+compDeals);
        if(compDeals==null){
            return;
        }

%>

<html>

    <% for( int i = 0, size = compDeals.size(); i < size; i++ ){ JSONObject oneDeal = (JSONObject) compDeals.get(i);%>

        <div class="NewSectionSmall MainSpan2">
            <div class="mainDiv">
                <div class="flexibleContainer">
                    <span class="completedSpan" style="flex: 3" >
                        <div class="flexibleContainer">
                            <% if(oneDeal.get("Descriptions").equals("Referral Fee")){ %>
                                <label class="flexible addressCompleted heavyfont" onclick='SetId("<%=oneDeal.get("ID") %>", "<%=oneDeal.get("Descriptions") %>");'>Referral Fee Receipt</label>

                            <% } else if(oneDeal.get("ListingType").equals("Other") || oneDeal.get("ListingType").equals("Consulting")){ String h2 = ""; %>
                                <label class="flexible addressCompleted heavyfont" onclick='SetId("<%=oneDeal.get("ID") %>", "<%=oneDeal.get("Descriptions")%>");'><%= h2 = (String) oneDeal.get("Description")%></label>

                            <% } else { String h2 = (String)oneDeal.get("Unit"); if (!h2.isEmpty()){h2 = h2 + "-";} %>
                                <label class="flexible addressCompleted heavyfont" onclick='SetId("<%=oneDeal.get("ID") %>", "<%=oneDeal.get("Descriptions") %>");'><%= h2+oneDeal.get("StreetNumber") +" "+oneDeal.get("StreetName") +", "+oneDeal.get("City") +", "+oneDeal.get("Province") +", "+oneDeal.get("PostalCode")  %></label>
                            <% } %>
                            <label class="flexible heavyfont"><%= oneDeal.get("Price")  %></label>
                            <span class="tColRaw flexible">
                                <label class="span4Label refBackg1 <%= oneDeal.get("PropertyStatus")  %>"><%= oneDeal.get("ID")  %></label>
                            </span>
                        </div>
                        <div class="flexibleContainer">
                            <label class="flexible addressCompleted" style="flex: 5" id="Type"><%= oneDeal.get("ListingType")  %></label>
                            <% if(oneDeal.get("Descriptions").equals("Referral Fee")){ %>
                                <label class="flexible">Referral: </label>
                            <% } else if(oneDeal.get("Descriptions").equals("TRS")){ %>
                                <label class="flexible">Closed: </label>
                            <% } else { %>
                                <label class="flexible">Report: </label>
                            <% } %>
                            <label class="closingDateLabel flexible" ><%= oneDeal.get("ClosingDate")  %></label>
                            <%-- <label class="closingDateLabel flexible" ><%= sdf.format(new Date(Trans2.ClosingDate)).replace(".","") %></label> --%>
                        </div>
                        <div class="flexibleContainer noMargin">
                            <label class="flexible addressCompleted" style="flex: 5"></label>
                            <label class="flexible">Finalized:</label>
                            <label class="flexible" ><%=oneDeal.get("FinalizedDate")  %></label>
                            <%-- <label class="flexible" ><%= sdf.format(new Date( Trans2.FinalizedDate )).replace(".","") %></label> --%>
                        </div>
                    </span>
                </div>
            </div>
        </div>
        <% }%> 
</html>
<%}else{
        return;
    }
}

//System.out.println(pendDeals.get(1));
%>