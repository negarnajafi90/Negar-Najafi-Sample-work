<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<%@ page import="java.util.Formatter"  %>

<%@ page import="org.json.*"  %>
<%@ page import="org.json.simple.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"  %>

<%@ page import="ProMasterClasses.Users"  %>
<%@ page import="ProMasterClasses.Transaction"  %>
<%@ page import="RDS.RDSFunctions"  %>
<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
NumberFormat CanadaVal = NumberFormat.getInstance(new Locale("en", "US"));
CanadaVal.setMinimumFractionDigits(2);
CanadaVal.setMaximumFractionDigits(2);

String dateType = request.getParameter("type"); 
String dateFromSort = request.getParameter("datefrom"); 
String dateToSort = request.getParameter("dateto"); 
String dealStatus = request.getParameter("dealstatus"); 
String classes = request.getParameter("classes"); 
//System.out.println("??????");
//System.out.println(classes);
String[] ClassArray = classes.split(",");
//System.out.println("??????");
//System.out.println(ClassArray[8]);
//System.out.println(ClassArray[9]);
//System.out.println(ClassArray[10]);

if(dealStatus==null){dealStatus="";}

RDSFunctions myRDS=new  RDSFunctions();

SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
SimpleDateFormat sdftime = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");

int UserID=0;//(int)session.getAttribute("Userid") ;
int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
String Type="0";//(String)session.getAttribute("Type") ;
String Email="";//(String)session.getAttribute("Email") ;
Connection con=null;

if( session.getAttribute("Userid")==null  ){
  //response.sendRedirect("../Logout.jsp");
  return;
}
else{
	
	UserID=(int)session.getAttribute("Userid"); 
	BrokerID=(int)session.getAttribute("Brokerid") ; 
	con=(Connection) session.getAttribute("Connection");

    JSONParser parser = new JSONParser();  
    String JsonString = myRDS.GetSortedCommissions(BrokerID,dealStatus,dateType, dateFromSort, dateToSort,con);
    JSONObject object = (JSONObject) parser.parse(JsonString);  
    JSONArray allCom = (JSONArray) object.get("Commissions");
    //JSONObject totalRow = (JSONObject) object.get("total");

//ArrayList<CommissionDetails> MyCommissions = new ArrayList<CommissionDetails>();

//MyCommissions=myRDS.GetAllCompletedBrokerDeals( BrokerID , BrokerID ,con);  


%>


<div id="table-scroll" class="tablediv" onclick="">

    <table id="commissions1">
        <thead>
            <tr style="height: 30px !important; text-align: center; position: sticky; top: 0">

                <th class="row1Comission tdMin <%= ClassArray[0] %>">
                    <div class='tdMin'>#</div>
                </th>

                <th class="row2Comission tdSm <%= ClassArray[1] %>">
                    <div class='tdSm'>Type</div>
                </th>

                <th class="row3Comission tdSm <%= ClassArray[2] %>">
                    <div class='tdSm'>Address</div>
                </th>

                <th class="row4Comission tdMed <%= ClassArray[3] %>">
                    <div class='tdMed'>Price</div>
                </th>

                <th class="row5Comission tdSm <%= ClassArray[4] %>">
                    <div class='tdSm'>Listing Commission</div>
                </th>

                <th class="row6Comission tdSm <%= ClassArray[5] %>">
                    <div class='tdSm'>Selling Commission</div>
                </th>

                <th class="row7Comission tdMed <%= ClassArray[6] %>">
                    <div class='tdMed'>Gross Commission</div>
                </th>

                <th class="row8Comission tdMed <%= ClassArray[7] %>">
                    <div class='tdMed'>Net to Brokerage</div>
                </th>

                <th class="row9Comission tdMed <%= ClassArray[8] %>">
                    <div class='tdMed'>Net to Agent</div>
                </th>

                <th class="row10Comission tdMed <%= ClassArray[9] %>">
                    <div class='tdMed'>Referral</div>
                </th>

                <th class="row11Comission tdMed <%= ClassArray[10] %>">
                    <div class='tdMed'>Rebate</div>
                </th>

                <th class="row12Comission tdMed <%= ClassArray[11] %>">
                    <div class='tdMed'>Net Fee</div>
                </th>

                <th class="row13Comission tdSm <%= ClassArray[12] %>">
                    <div class='tdSm'>Closing</div>
                </th>

                <th class="row14Comission tdSm <%= ClassArray[13] %>">
                    <div class='tdSm'>Report Date</div>
                </th>

                <th class="row15Comission tdSm <%= ClassArray[14] %>">
                    <div class='tdSm'>Finalized</div>
                </th>

            </tr>
        </thead>
        <tbody>
            
            <% 
            
            if(allCom!=null){
                System.out.println(allCom);
            for (int i = 0, size = allCom.size(); i < size; i++) { 
            JSONObject oneDeal = (JSONObject) allCom.get(i);  %>
           
            <tr class="tablerows comrow">

                <td class="row1Comission cen <%= ClassArray[0] %>"><a href='../UpdateForms/<%= oneDeal.get("DealID") %>.jsp?ID=<%= oneDeal.get("DealID")%>'><%= oneDeal.get("DealID")%></a></td>
                <td class="row2Comission cen <%= ClassArray[1] %>"><%= oneDeal.get("DealType") %></td> 
                <td class="row3Comission cen <%= ClassArray[2] %>"><%= oneDeal.get("Address") %></td>
                <td class="row4Comission num <%= ClassArray[3] %>"><%= oneDeal.get("Price") %></td>
                <td class="row5Comission cen <%= ClassArray[4] %>"><%= oneDeal.get("ListingCommission")%></td>
                <td class="row6Comission cen <%= ClassArray[5] %>"><%= oneDeal.get("SellingCommission") %></td>
                <td class="row7Comission num <%= ClassArray[6] %>"><%= oneDeal.get("GrossFee") %></td>
                <td class="row8Comission num <%= ClassArray[7] %>"><%= oneDeal.get("NetToBrokerage") %></td>
                <td class="row9Comission num <%= ClassArray[8] %>"><%= oneDeal.get("NetToAgent") %></td>
                <td class="row10Comission num <%= ClassArray[9] %>"><%= oneDeal.get("Referral") %></td>
                <td class="row11Comission num <%= ClassArray[10] %>"><%= oneDeal.get("Rebate") %></td>
                <td class="row12Comission num <%= ClassArray[11] %>"><%=oneDeal.get("NetFee")%></td>
                <td class="row13Comission cen <%= ClassArray[12] %>"><%=oneDeal.get("ClosingDate")%></td>
                <td class="row14Comission cen <%= ClassArray[13] %>"><%=oneDeal.get("ReportDate")%></td>
                <td class="row15Comission cen <%= ClassArray[14] %>"><%= oneDeal.get("FinalizedDate") %></td>

            </tr>
            <% }}  %>


        </tbody>

        <tfoot>
            <tr class="tablerowFinal comrow" data-trsnum='999999999'>
                <td class="row1Comission cen <%= ClassArray[0] %>">Total</td>
                <td class="row2Comission <%= ClassArray[1] %>"></td>
                <td class="row3Comission <%= ClassArray[2] %>"></td>
                <td class="row4Comission num <%= ClassArray[3] %>"></td>
                <td class="row5Comission <%= ClassArray[4] %>"></td>
                <td class="row6Comission <%= ClassArray[5] %>"></td>
                <td class="row7Comission num <%= ClassArray[6] %>"></td>
                <td class="row8Comission num <%= ClassArray[7] %>"></td>
                <td class="row9Comission num <%= ClassArray[8] %>"></td>
                <td class="row10Comission num <%= ClassArray[9] %>"></td>
                <td class="row11Comission num <%= ClassArray[10] %>"></td>
                <td class="row12Comission num <%= ClassArray[11] %>"></td>
                <td class="row13Comission <%= ClassArray[12] %>"></td>
                <td class="row14Comission <%= ClassArray[13] %>"></td>
                <td class="row15Comission <%= ClassArray[14] %>"></td>

            </tr>
        </tfoot>

    </table>
</div>


</html>

<% }%>