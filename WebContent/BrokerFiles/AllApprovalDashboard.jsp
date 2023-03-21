<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="java.text.NumberFormat" %>

<%@ page import="java.util.Locale" %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="java.util.Date"  %>

<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.sql.Connection" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<%

SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
SimpleDateFormat sdf2 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");

int UserID=0;//(int)session.getAttribute("Userid") ;

int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
   
String Type="0";//(String)session.getAttribute("Type") ;

String Email=""; //(String)session.getAttribute("Email") ;

String isBroker = "1";

Connection con=null;

if( session.getAttribute("Userid")==null  ){
	
  //response.sendRedirect("../NoPermission.jsp");
  return;

}

else{
	
	 UserID=(int)session.getAttribute("Userid"); 
	
	 BrokerID=(int)session.getAttribute("Brokerid") ;
			   	   
     Type=(String)session.getAttribute("Type") ;
     
     Email=(String)session.getAttribute("Email") ;
     
     con=(Connection) session.getAttribute("Connection");

}

%>

<%
	//int timeout = session.getMaxInactiveInterval();

	//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp");
	int Sale = 0;
	int Lease = 0;
	int Other = 0;
	int Ref = 0;

	int ClSale = 0;
	int ClLease = 0;
	int ClOther = 0;
	int ClRef = 0;

	double SalePrice = 0;
	double LeasePrice = 0;
	double OtherPrice = 0;
	double RefPrice = 0;

	double ClSalePrice = 0;
	double ClLeasePrice = 0;
	double ClOtherPrice = 0;
	double ClRefPrice = 0;


	RDSFunctions myRDS=new  RDSFunctions();
	
	Users MyBrokerInfo=new Users();

	MyBrokerInfo=myRDS.GetAnyUserById(BrokerID ,con);

	//ArrayList<Transaction> AllPendingMyDeals = new ArrayList<Transaction>();
	
	//AllPendingMyDeals=myRDS.GetAllPendingBrokerDeals( 1,BrokerID, BrokerID ,"0","",con );
	
	
	ArrayList<Transaction> AllCompleteDeals = new ArrayList<Transaction>();
	
	AllCompleteDeals = myRDS.GetAllCompletedBrokerDeals(1,BrokerID, BrokerID ,"0","",con);

%>

<body>

    <table id="DbdDealsTableApproval" class="DbdDealsT">
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
</body>

</html>