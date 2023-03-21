package RDS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Formatter;

import org.json.simple.JSONObject;  
import org.json.simple.JSONValue;  
import java.sql.CallableStatement;



import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
//import java.text.ParseException;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


import java.sql.Types;

import ProMasterClasses.AuditTrail;
import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Transaction;
import ProMasterClasses.Users;
import ProMasterClasses.Contacts;
import ProMasterClasses.Companies;
import ProMasterClasses.CooperatingBrokerage;
import ProMasterClasses.Deposits;
import ProMasterClasses.Invoice;
import ProMasterClasses.Lawyers;
import ProMasterClasses.Parties;
import ProMasterClasses.Rebate;
import ProMasterClasses.RecordSheet;
import ProMasterClasses.Referral;
import ProMasterClasses.PendingDeals;
//import java.util.Date;
//import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONException;
//This class is to handle the database activities and managing the data throw separate functions

public class RDSFunctions {
	
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	
//The following function named connection is responsible to create the connection to the database on AWS and return that connection
	
public 	Connection CreateConnection() {
	
	Connection con = null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");  
		
		//Creating the connection with the user name and password ad portal number
		
		con=DriverManager.getConnection( 
				
		"jdbc:mysql://probroker.clgojz1yu9qh.ca-central-1.rds.amazonaws.com:3306/ProBroker","probroker","Brokerpro2020Pollock");
		
		}
	
	catch(Exception e){ 
		
				System.out.println(e);
		}
	
	return con;
	
}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This is to search a users by email and password 

public Users SearchUsers( String Email, String Password , Connection conRDS ) {
	
	ProMasterClasses.Users User=new ProMasterClasses.Users(); //Creating a object of broker 
	
	//Connection conRDS = null; 
	
	//conRDS= CreateConnection(); //Creating a connection to the database by calling the CreateConnection function
	
	PreparedStatement pst=null; //Creating a prepared statement for searching 
	  
	String SearchStatment="SELECT * FROM Users WHERE EMAIL=? and PASSWORD=?"; //This is Prepared statement for searching in the Broker table

	 try {
		    pst = conRDS.prepareStatement(SearchStatment); //Adding and preparing the SearchStatment for executing
		    
		    //We have 2 ? in our statement which is 1 and 2 to add the value to the arguments
		
		    pst.setString(1, Email);
		    
		    pst.setString(2,Password);
		    
		    ResultSet result = pst.executeQuery(); //Executing the query 
		    
		    //In the following if condition we check if a broker exist with that specific information passed to the function and added to the statement
		    
		if ( result.next() ) {
			
			//Retrieving the data from the executed query and assigning to the broker object arguments
				
			User.id=result.getInt("ID");
			User.Broker_id=result.getInt("BrokerID");
			User.Type=result.getString("Type");
			User.Firstname=result.getString("FirstName");	
			User.Lastname=result.getString("LastName");
			User.User_Anniversary=result.getTimestamp("ANNIVERSARY");
			User.User_Split =result.getString("FIRSTSPLIT");
			User.User_Split2=result.getString("SECONDSPLIT");
			User.User_Split3=result.getString("THIRDSPLIT");
			User.User_Cap=result.getString("FIRSTCAP");	
			User.User_Cap2=result.getString("SECONDCAP");
			User.User_Cap3=result.getString("THIRDCAP");
			User.User_PaymentMethod =result.getString("PAYMENTMETHOD");	
			User.User_Bank =result.getString("BANK");
			User.User_Institution =result.getString("INSTITUTION");	
			User.User_Transit =result.getString("TRANSIT");
			User.AccountName=result.getString("ACCOUNTNAME");	
			User.User_AccountNumber=result.getString("ACCOUNTNUMBER");	
			User.User_StreetName=result.getString("STREETNAME");
			User.User_StreetNumber=result.getString("STREETNUMBER");
			User.User_Unit=result.getString("UNIT");
			User.User_City=result.getString("CITY");	
			User.User_Province=result.getString("PROVINCE");
			User.User_PostalCode=result.getString("POSTALCODE");
			User.User_Country=result.getString("COUNTRY");
			User.User_Phone=result.getString("PHONE");	
			User.User_faxOrMobile=result.getString("MOBILEFAX");	
			User.User_faxOrMobileNumber=result.getString("MOBILEFAXNUMBER");	
			User.User_Status=result.getString("MYSTATUS");
			User.User_StartDate=result.getTimestamp("STARTDATE");
			User.User_TerminateDate=result.getTimestamp("TERMINATEDATE"); 
			User.User_Email=result.getString("EMAIL");	
			User.FirstLogin=result.getString("FirstLogin");
			User.DateOfBirth=result.getTimestamp("DateOfBirth");
			User.Title=result.getString("Title");
			User.PREC=result.getString("PREC");
			User.AlternativeBroker=result.getString("AlternativeBroker");
			User.StratAlternativeBroker=result.getTimestamp("StartAlternativeBroker");
			User.EndAlternativeBroker=result.getTimestamp("EndAlternativeBroker");
			User.SinNumber=result.getString("SinNumber");
			User.HST=result.getString("HST");
			User.User_password=result.getString("PASSWORD");
			
		}
			
		else{
			
			//If there were no User , then it values will be null 
	            
			User.id=0;	}
		
	}//Close Try 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    
		    
		    
		}	

	 return User; //Returning the User information

}

//*****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


//The following function will add a new user to the data base to the users table

public Users AddNewUser( Users User , Connection conRDS) {
	
	//Connection conRDS = null; 
	
	//conRDS= CreateConnection(); //Creating a connection to the database by calling the CreateConnection function
	
	PreparedStatement pst=null; //Creating a prepared statement for searching 
	  
	String AddNewUser="INSERT INTO Users (BrokerID,Type,FirstName,LastName,ANNIVERSARY,FIRSTSPLIT,SECONDSPLIT,THIRDSPLIT,FIRSTCAP,SECONDCAP,THIRDCAP,PAYMENTMETHOD,BANK,INSTITUTION,TRANSIT,ACCOUNTNAME,ACCOUNTNUMBER, STREETNAME,STREETNUMBER,UNIT,CITY,PROVINCE,POSTALCODE,COUNTRY,PHONE,MOBILEFAX,MOBILEFAXNUMBER,MYSTATUS,STARTDATE,TERMINATEDATE,Email,FirstLogin,DateOfBirth,Title,PREC,AlternativeBroker,StartAlternativeBroker,EndAlternativeBroker,HST,SinNumber,PASSWORD)	values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

	 try {
         pst = conRDS.prepareStatement(AddNewUser);

		    
	        pst.setInt(1,User. Broker_id);
	        pst.setString(2,User.Type);
	        pst.setString(3,User.Firstname);
	        pst.setString(4,User.Lastname);
	        pst.setTimestamp(5,User.User_Anniversary);
	        pst.setString(6,User.User_Split );
	        pst.setString(7,User.User_Split2);
	        pst.setString(8,User.User_Split3);
	        pst.setString(9,User.User_Cap);	
	        pst.setString(10,User.User_Cap2);
	        pst.setString(11,User.User_Cap3);
	        pst.setString(12,User.User_PaymentMethod);
	        pst.setString(13,User.User_Bank);
	        pst.setString(14,User.User_Institution); 
	        pst.setString(15,User.User_Transit);
	        pst.setString(16,User.AccountName);
	        pst.setString(17,User.User_AccountNumber);
	        pst.setString(18,User.User_StreetName);
	        pst.setString(19,User.User_StreetNumber);
	        pst.setString(20,User.User_Unit);	
	        pst.setString(21,User.User_City);
	        pst.setString(22,User.User_Province);
	        pst.setString(23,User.User_PostalCode);
	        pst.setString(24,User.User_Country);
	        pst.setString(25,User.User_Phone);
	        pst.setString(26,User.User_faxOrMobile);
	        pst.setString(27,User.User_faxOrMobileNumber);	
	        pst.setString(28,User.User_Status);
	        pst.setTimestamp(29,User.User_StartDate);
	        pst.setTimestamp(30,User.User_TerminateDate);
	        pst.setString(31,User.User_Email);
	        pst.setString(32,User.FirstLogin );
	        pst.setTimestamp(33,User.DateOfBirth );
	        pst.setString(34,User.Title );
	        pst.setString(35,User.PREC );
	        pst.setString(36,User.AlternativeBroker );
	        pst.setTimestamp(37,User.StratAlternativeBroker );
	        pst.setTimestamp(38,User.EndAlternativeBroker);
	        pst.setString(39,User.HST );
	        pst.setString(40,User.SinNumber);
	        pst.setString(41,User.User_password);

		    pst.executeUpdate();
			
		
	}//Close Try 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }

		}	

	 return User; //Returning the broker object 

}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//the following function will get a specific user by Id and its type (for example a Broker , Agent or Admin ) 

public Users GetAnyUserById(int id , Connection conRDS) {
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;

	String SearchStatment="SELECT * FROM Users WHERE ID=? ";
	
	 Users User=new Users();

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		
		    pst.setInt(1, id);
		    
		    ResultSet result = pst.executeQuery();
		
			
		while ( result.next() ) {

			User.id=result.getInt("ID");
			User.Broker_id=result.getInt("BrokerID");
			User.Type=result.getString("Type");
			User.Firstname=result.getString("FirstName");	
			User.Lastname=result.getString("LastName");
			User.User_Anniversary=result.getTimestamp("ANNIVERSARY");
			User.User_Split =result.getString("FIRSTSPLIT");
			User.User_Split2=result.getString("SECONDSPLIT");
			User.User_Split3=result.getString("THIRDSPLIT");
			User.User_Cap=result.getString("FIRSTCAP");	
			User.User_Cap2=result.getString("SECONDCAP");
			User.User_Cap3=result.getString("THIRDCAP");
			User.User_PaymentMethod =result.getString("PAYMENTMETHOD");	
			User.User_Bank =result.getString("BANK");
			User.User_Institution =result.getString("INSTITUTION");	
			User.User_Transit =result.getString("TRANSIT");
			User.AccountName=result.getString("ACCOUNTNAME");	
			User.User_AccountNumber=result.getString("ACCOUNTNUMBER");	
			User.User_StreetName=result.getString("STREETNAME");
			User.User_StreetNumber=result.getString("STREETNUMBER");
			User.User_Unit=result.getString("UNIT");
			User.User_City=result.getString("CITY");	
			User.User_Province=result.getString("PROVINCE");
			User.User_PostalCode=result.getString("POSTALCODE");
			User.User_Country=result.getString("COUNTRY");
			User.User_Phone=result.getString("PHONE");	
			User.User_faxOrMobile=result.getString("MOBILEFAX");	
			User.User_faxOrMobileNumber=result.getString("MOBILEFAXNUMBER");	
			User.User_Status=result.getString("MYSTATUS");
			User.User_StartDate=result.getTimestamp("STARTDATE");
			User.User_TerminateDate=result.getTimestamp("TERMINATEDATE"); 
			User.User_Email=result.getString("EMAIL");	
			User.FirstLogin=result.getString("FirstLogin");
			User.DateOfBirth=result.getTimestamp("DateOfBirth");
			User.Title=result.getString("Title");
			User.PREC=result.getString("PREC");
			User.AlternativeBroker=result.getString("AlternativeBroker");
			User.StratAlternativeBroker=result.getTimestamp("StartAlternativeBroker");
			User.EndAlternativeBroker=result.getTimestamp("EndAlternativeBroker");
			User.SinNumber=result.getString("SinNumber");
			User.HST=result.getString("HST");
			User.User_password=result.getString("PASSWORD");
			
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally { if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    

		}	
		 
	
	return User;

}

//**************************************************************************************************************************************//

public Users GetAnyUserByEmail( String Email , Connection conRDS) {
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;

	String SearchStatment="SELECT * FROM Users WHERE EMAIL=?";
	
	 Users User=new Users();

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setString(1, Email);
		    
		    ResultSet result = pst.executeQuery();
		
			
		while ( result.next() ) {

			User.id=result.getInt("ID");
			User.Broker_id=result.getInt("BrokerID");
			User.Type=result.getString("Type");
			User.Firstname=result.getString("FirstName");	
			User.Lastname=result.getString("LastName");
			User.User_Anniversary=result.getTimestamp("ANNIVERSARY");
			User.User_Split =result.getString("FIRSTSPLIT");
			User.User_Split2=result.getString("SECONDSPLIT");
			User.User_Split3=result.getString("THIRDSPLIT");
			User.User_Cap=result.getString("FIRSTCAP");	
			User.User_Cap2=result.getString("SECONDCAP");
			User.User_Cap3=result.getString("THIRDCAP");
			User.User_PaymentMethod =result.getString("PAYMENTMETHOD");	
			User.User_Bank =result.getString("BANK");
			User.User_Institution =result.getString("INSTITUTION");	
			User.User_Transit =result.getString("TRANSIT");
			User.AccountName=result.getString("ACCOUNTNAME");	
			User.User_AccountNumber=result.getString("ACCOUNTNUMBER");	
			User.User_StreetName=result.getString("STREETNAME");
			User.User_StreetNumber=result.getString("STREETNUMBER");
			User.User_Unit=result.getString("UNIT");
			User.User_City=result.getString("CITY");	
			User.User_Province=result.getString("PROVINCE");
			User.User_PostalCode=result.getString("POSTALCODE");
			User.User_Country=result.getString("COUNTRY");
			User.User_Phone=result.getString("PHONE");	
			User.User_faxOrMobile=result.getString("MOBILEFAX");	
			User.User_faxOrMobileNumber=result.getString("MOBILEFAXNUMBER");	
			User.User_Status=result.getString("MYSTATUS");
			User.User_StartDate=result.getTimestamp("STARTDATE");
			User.User_TerminateDate=result.getTimestamp("TERMINATEDATE"); 
			User.User_Email=result.getString("EMAIL");	
			User.FirstLogin=result.getString("FirstLogin");
			User.DateOfBirth=result.getTimestamp("DateOfBirth");
			User.Title=result.getString("Title");
			User.PREC=result.getString("PREC");
			User.AlternativeBroker=result.getString("AlternativeBroker");
			User.StratAlternativeBroker=result.getTimestamp("StartAlternativeBroker");
			User.EndAlternativeBroker=result.getTimestamp("EndAlternativeBroker");
			User.SinNumber=result.getString("SinNumber");
			User.HST=result.getString("HST");
			User.User_password=result.getString("PASSWORD");
			
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally { if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    

		}	
		 
	
	return User;

}

//**************************************************************************************************************************************//

//This Function will get all the agents related to a Specific Broker and then return them as arrrayList

public ArrayList<Users> GetAgents(int Broker , String Type , Connection conRDS  ) {
	
	ArrayList<Users> AgentList = new ArrayList<Users>();

	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Users WHERE BrokerID=? and Type=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		
		    pst.setInt(1, Broker);
		    
		    pst.setString(2, Type);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Users agent=new Users();
			
			agent.id=result.getInt("ID");
			agent. Broker_id=result.getInt("BrokerID");
			agent.Firstname=result.getString("FIRSTNAME");	
			agent.Lastname=result.getString("LASTNAME");
			agent.User_Anniversary=result.getTimestamp("ANNIVERSARY");
			agent.User_Cap=result.getString("FIRSTCAP");		
			agent.User_PaymentMethod =result.getString("PAYMENTMETHOD");	
			agent.User_Bank =result.getString("BANK");
			agent.User_Institution =result.getString("INSTITUTION");	
			agent.User_Split =result.getString("FIRSTSPLIT");	
			agent.User_Transit =result.getString("TRANSIT");
			agent.User_AccountNumber=result.getString("ACCOUNTNUMBER");	
			agent.User_StreetName=result.getString("STREETNAME");
			agent.User_StreetNumber=result.getString("STREETNUMBER");
			agent.User_Unit=result.getString("UNIT");	
			agent.User_City=result.getString("CITY");	
			agent.User_Province=result.getString("PROVINCE");	
			agent.User_PostalCode=result.getString("POSTALCODE");
			agent.User_Country=result.getString("COUNTRY");
			agent.User_Phone=result.getString("PHONE");	
			agent.User_faxOrMobile=result.getString("MOBILEFAX");	
			agent.User_faxOrMobileNumber=result.getString("MOBILEFAXNUMBER");	
			agent.User_Email=result.getString("EMAIL");	
			agent.User_password=result.getString("PASSWORD");	
			agent.User_Status=result.getString("MYSTATUS");
			agent.User_Cap2=result.getString("SECONDCAP");
			agent.User_Cap3=result.getString("THIRDCAP");
			agent.User_Split2=result.getString("SECONDSPLIT");
			agent.User_Split3=result.getString("THIRDSPLIT");
			agent.User_StartDate=result.getTimestamp("STARTDATE");
			agent.User_TerminateDate=result.getTimestamp("TERMINATEDATE");	
			agent.Type=result.getString("Type");
			agent.FirstLogin=result.getString("FirstLogin");
			agent.DateOfBirth=result.getTimestamp("DateOfBirth");
			agent.Title=result.getString("Title");
		    agent.PREC=result.getString("PREC");
		    agent.AlternativeBroker=result.getString("AlternativeBroker");
		    agent.StratAlternativeBroker=result.getTimestamp("StartAlternativeBroker");
		    agent.EndAlternativeBroker=result.getTimestamp("EndAlternativeBroker");
			agent.HST=result.getString("HST");
			agent.SinNumber=result.getString("SinNumber");
			agent.AccountName=result.getString("ACCOUNTNAME");
			
			AgentList.add(agent); }
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		 
		}	

	return AgentList;

}

//*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void UpdateUser( Users User , Connection conRDS) {

	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String UpdatePasswordStatment="UPDATE Users set FirstName=?,LastName=?,ANNIVERSARY=?,FIRSTSPLIT=?,SECONDSPLIT=?,THIRDSPLIT=?,FIRSTCAP=?,SECONDCAP=?,THIRDCAP=?,PAYMENTMETHOD=?,BANK=?,INSTITUTION=?,TRANSIT=?,ACCOUNTNAME=?,ACCOUNTNUMBER=?, STREETNAME=?,STREETNUMBER=?,UNIT=?,CITY=?,PROVINCE=?,POSTALCODE=?,COUNTRY=?,PHONE=?,MOBILEFAX=?,MOBILEFAXNUMBER=?,MYSTATUS=?,STARTDATE=?,TERMINATEDATE=?,EMAIL=?,FirstLogin=?,DateOfBirth=?,Title=?,PREC=?,AlternativeBroker=?,StartAlternativeBroker=?,EndAlternativeBroker=?,HST=?,SinNumber=?,PASSWORD=? where ID=?;";

	 try {
		 
		    pst = conRDS.prepareStatement(UpdatePasswordStatment);

	        pst.setString(1,User.Firstname);
	        pst.setString(2,User.Lastname);
	        pst.setTimestamp(3,User.User_Anniversary);
	        pst.setString(4,User.User_Split );
	        pst.setString(5,User.User_Split2);
	        pst.setString(6,User.User_Split3);
	        pst.setString(7,User.User_Cap);	
	        pst.setString(8,User.User_Cap2);
	        pst.setString(9,User.User_Cap3);
	        pst.setString(10,User.User_PaymentMethod);
	        pst.setString(11,User.User_Bank);
	        pst.setString(12,User.User_Institution); 
	        pst.setString(13,User.User_Transit);
	        pst.setString(14,User.AccountName);
	        pst.setString(15,User.User_AccountNumber);
	        pst.setString(16,User.User_StreetName);
	        pst.setString(17,User.User_StreetNumber);
	        pst.setString(18,User.User_Unit);	
	        pst.setString(19,User.User_City);
	        pst.setString(20,User.User_Province);
	        pst.setString(21,User.User_PostalCode);
	        pst.setString(22,User.User_Country);
	        pst.setString(23,User.User_Phone);
	        pst.setString(24,User.User_faxOrMobile);
	        pst.setString(25,User.User_faxOrMobileNumber);	
	        pst.setString(26,User.User_Status);
	        pst.setTimestamp(27,User.User_StartDate);
	        pst.setTimestamp(28,User.User_TerminateDate);
	        pst.setString(29,User.User_Email);
	        pst.setString(30,User.FirstLogin );
	        pst.setTimestamp(31,User.DateOfBirth );
	        pst.setString(32,User.Title );
	        pst.setString(33,User.PREC );
	        pst.setString(34,User.AlternativeBroker );
	        pst.setTimestamp(35,User.StratAlternativeBroker );
	        pst.setTimestamp(36,User.EndAlternativeBroker);
	        pst.setString(37,User.HST );
	        pst.setString(38,User.SinNumber);
	        pst.setString(39,User.User_password);
	        pst.setInt(40,User.id);

		    
		    pst.executeUpdate();  }
	 
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
			    

			}	

}


//******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//Adding a new transaction to the database as new deal

public int NEWTransaction(Transaction Deal , Connection conRDS ){
	
    //Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;	
	
	ResultSet rs = null;
	
	 int last_inserted_id=0;
	
	 String AddStatment="INSERT INTO Transactions (AuthorType,AuthorID,BrokerID,MLSNumber,StreetName,StreetNumber,Unit,City,Province,PostalCode,PropertyType,FirstAgentID,SecondAgentID,FirstAgentCommission,SecondAgentCommission,Price,TransactionSource,ListingType,ListingDate,ClosingDate,ExpirationDate,OfficeLeadGrossCommission,OfficeLead,SellingOfficeLead,SellingOfficeLeadGrossCommission,ListingOfficeLead, ListingOfficeLeadGrossCommission,ListCommission,SellCommission,ReferralFeeNote,PropertyStatus,AgentSign1,AgentSign2,BrokerSign,TransactionStatus,Notes,Permanent,FirstAgentRole,SecondAgentRole,Descriptions ,ID, "
	 		+ " OfferDate,  OfferExpiretionDate , OfferAcceptanceDate ,ConditionExpirationDate ,ConditionCompletationDate  ,OfferWithrawalDate  ,InspectionDate  ,AccupancyDate ,OffMarketDate ,ProgressMarks,CreateDate ,FinalizedDate , LastCommissionID , LastCommissionDealID )"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
	 

	 try {
          pst = conRDS.prepareStatement(AddStatment,Statement.RETURN_GENERATED_KEYS);
		
	        pst.setInt(1,Deal.AuthorType);	
		    pst.setInt(2,Deal.AuthorID);
		    pst.setInt(3,Deal.BrokerID);
		    pst.setString(4,Deal.MLS);
		    pst.setString(5,Deal.StreetName);
		    pst.setString(6,Deal.StreetNumber);	
		    pst.setString(7,Deal.Unit);
		    pst.setString(8,Deal.City);
		    pst.setString(9,Deal.Province);
		    pst.setString(10,Deal.PostalCode);	
		    pst.setString(11,Deal.PropertyType);
		    pst.setInt(12,Deal.FirstAgent); 
		    pst.setInt(13,Deal.SecondAgent);
		    pst.setString(14,Deal.FirstAgentCommission);
		    pst.setString(15,Deal.SecondAgentCommission);	
		    pst.setString(16,Deal.Price);
		    pst.setString(17,Deal.TransactionSource);
		    pst.setString(18,Deal.ListingType);
		    pst.setTimestamp(19,Deal.ListingDate);
		    pst.setTimestamp(20,Deal.ClosingDate);	
		    pst.setTimestamp(21,Deal.ExpirationDate);
		    pst.setString(22,Deal.OfficeleadGrossCommission);
		    pst.setInt(23,Deal.OfficeLead);
		    pst.setInt(24,Deal.SellingOfficeLead);
		    pst.setString(25,Deal.SellingOfficeleadGrossCommission);
		    pst.setInt(26,Deal.ListingOfficeLead);
		    pst.setString(27,Deal.ListingOfficeleadGrossCommission);
		    pst.setString(28,Deal.ListCommission );
		    pst.setString(29,Deal.SellCommission);
		    pst.setString(30,Deal.ReferralFeeNote);
		    pst.setString(31,Deal.PropertyStatus);
		    pst.setString(32,Deal.Agent1Sign);
		    pst.setString(33,Deal.Agent2Sign);
		    pst.setString(34,Deal.BrokerSign);
		    pst.setString(35,Deal.TransactionStatus);
		    pst.setString(36,Deal.Notes);
		    pst.setString(37,Deal.Permanent);
		    pst.setString(38,Deal.Role1);
		    pst.setString(39,Deal.Role2);
		    pst.setString(40,Deal.Description);
		    pst.setInt(41,Deal.id);
		    
		    pst.setTimestamp(42,Deal.OfferDate);
		    
		    pst.setTimestamp(43,Deal.OfferExpiretionDate);
		    
		    pst.setTimestamp(44,Deal.OfferAcceptanceDate);
		    
		    pst.setTimestamp(45,Deal.ConditionExpirationDate);
		    
		    pst.setTimestamp(46,Deal.ConditionCompletationDate);
		    
		    pst.setTimestamp(47,Deal.OfferWithrawalDate);
		    
		    pst.setTimestamp(48,Deal.InspectionDate);
		    
		    pst.setTimestamp(49,Deal.AccupancyDate);
		    
		    pst.setTimestamp(50,Deal.OffMarketDate);
		    
		    pst.setString(51,Deal.progressMarks);
		    
		    pst.setTimestamp(52,Deal.CreateDate);
		    
		    pst.setTimestamp(53,Deal.FinalizedDate);
		    
		    pst.setInt(54,Deal.LastCommissionID);
		    
		    pst.setInt(55,Deal.LastCommissionDealID);
		   

		    pst.executeUpdate();
		    
	         rs = pst.getGeneratedKeys();
	         
            if(rs.next())
            {
                last_inserted_id = rs.getInt(1);
            }

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 
	 finally {
		
		    
		    if (pst != null) {
		    	
		        try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}   }
		    
 }	
	 
	 return last_inserted_id;
	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public void UpdateTransaction( Transaction Deal , Connection conRDS ) {

    //System.out.println("Hello1111111"+" "+Deal.Permanent );
    
    //System.out.println("Hello1111111"+" "+Deal.PropertyType );
    
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	//Creating Prepared statement for updating the password 
	
	PreparedStatement pst=null;
	
	//The following variable is an update statement to update the password in the database for that broker 
	  
	String UpdateTransaction="UPDATE Transactions set  AuthorType=?, AuthorID=?, MLSNumber=?, "
			+ "StreetName=?, StreetNumber=?, Unit=?, City=?, Province=?, PostalCode=?,"
			+ " PropertyType=?, FirstAgentID=?, SecondAgentID=?, FirstAgentCommission=?, "
			+ "SecondAgentCommission=?, Price=?, TransactionSource=?, ListingType=?, ListingDate=?, ClosingDate=?, "
			+ "ExpirationDate=?, OfficeLeadGrossCommission=?, OfficeLead=?, SellingOfficeLead=?, SellingOfficeLeadGrossCommission=?,"
			+ " ListingOfficeLead=?,  ListingOfficeLeadGrossCommission=?, ListCommission=?, SellCommission=?, PropertyStatus=?, "
			+ "AgentSign1=?, AgentSign2=?, BrokerSign=?, TransactionStatus=?, Notes=?, Permanent=?, FirstAgentRole=?, SecondAgentRole=? , Descriptions=? , ReferralFeeNote=? , OfferDate=? ,  OfferExpiretionDate=? , OfferAcceptanceDate=? , ConditionExpirationDate=? ,ConditionCompletationDate=?  ,OfferWithrawalDate=?  ,InspectionDate=?  ,AccupancyDate=? ,OffMarketDate=?  , ProgressMarks=? , CreateDate=? , FinalizedDate=?  where ID=? and  BrokerID=?" ;

	 try {
		 
		
		    pst = conRDS.prepareStatement( UpdateTransaction); //Preparing the statement for executing
		
		    //Adding the data to the ? Arguments of out statement
		    
		    pst.setInt(1, Deal.AuthorType );
		    
		    pst.setInt(2,Deal.AuthorID );
		    
		    pst.setString(3, Deal.MLS  );
		    
		    pst.setString(4,Deal.StreetName);
		    
		    pst.setString(5, Deal.StreetNumber);
		    
		    pst.setString(6,Deal.Unit);
		    
		    pst.setString(7, Deal.City );
		    
		    pst.setString(8,Deal.Province );
		    
		    pst.setString(9, Deal.PostalCode);
		    
		    pst.setString(10,Deal.PropertyType);
		    
		    pst.setInt(11, Deal.FirstAgent );
		    
		    pst.setInt(12,Deal.SecondAgent );
		    
		    pst.setString(13, Deal.FirstAgentCommission);
		    
		    pst.setString(14,Deal.SecondAgentCommission );
		    
		    pst.setString(15, Deal.Price );
		    
		    pst.setString(16,Deal.TransactionSource );
		    
		    pst.setString(17, Deal.ListingType );
		    
		    pst.setTimestamp(18,Deal.ListingDate );
		    
		    pst.setTimestamp(19, Deal.ClosingDate );
		    
		    pst.setTimestamp(20,Deal.ExpirationDate );
		    
		    pst.setString(21, Deal.OfficeleadGrossCommission );
		    
		    pst.setInt(22,Deal.OfficeLead );
		    
		    pst.setInt(23, Deal.SellingOfficeLead);
		    
		    pst.setString(24,Deal.SellingOfficeleadGrossCommission );
		    
		    pst.setInt(25, Deal.ListingOfficeLead );
		    
		    pst.setString(26,Deal.ListingOfficeleadGrossCommission );
		    
		    pst.setString(27, Deal.ListCommission );
		    
		    pst.setString(28,Deal.SellCommission );
		    
		    pst.setString(29, Deal.PropertyStatus );
		    
		    pst.setString(30,Deal.Agent1Sign );
		    
		    pst.setString(31, Deal.Agent2Sign );
		    
		    pst.setString(32,Deal.BrokerSign );
		    
		    pst.setString(33, Deal.TransactionStatus );
		    
		    pst.setString(34,Deal.Notes);
		    
		    pst.setString(35, Deal.Permanent );
		    
		    pst.setString(36,Deal.Role1 );
		    
		    pst.setString(37, Deal.Role2);
		    
		    pst.setString(38, Deal.Description);
		    
		    pst.setString(39, Deal.ReferralFeeNote);
		    
		    pst.setTimestamp(40,Deal.OfferDate);
		    
		    pst.setTimestamp(41,Deal.OfferExpiretionDate);
		    
		    pst.setTimestamp(42,Deal.OfferAcceptanceDate);
		    
		    pst.setTimestamp(43,Deal.ConditionExpirationDate);
		    
		    pst.setTimestamp(44,Deal.ConditionCompletationDate);
		    
		    pst.setTimestamp(45,Deal.OfferWithrawalDate);
		    
		    pst.setTimestamp(46,Deal.InspectionDate);
		    
		    pst.setTimestamp(47,Deal.AccupancyDate);
		    
		    pst.setTimestamp(48,Deal.OffMarketDate);
		    
		    pst.setString(49,Deal.progressMarks);
		    
		    pst.setTimestamp(50,Deal.CreateDate);
		    
		    pst.setTimestamp(51,Deal.FinalizedDate);

		    pst.setInt(52,Deal.id );
		    
		    pst.setInt(53, Deal.BrokerID );
		    
		    pst.executeUpdate();//Executing the update statement
	
	 }
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {   if (pst != null) {
			    	
			        try {   pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    
			   
			}	
	System.out.println("Finish");
}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//Adding a new Deposit record to the data base 

public void NEWDeposit(String Amount, String Type, Timestamp Date,String DepositReference,String RecivedFrom, String Relationship, String Unit, String StreetNumber, String StreetName,String City,String PostalCode, String Province,String Country, String Email,String ExtraContact, String ExtraContactNumber,String Phone,  int Transaction , int BrokerID , String FirstName , String LastName , String Fintrac ,  Connection conRDS) {

	      //Connection conRDS = null;
		
		  //conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String AddDeposit="INSERT INTO Deposits (Amount,Type,DepositDate,DepositReference,RecivedFrom,FirstName,LastName,Relationship,Unit,StreetNumber,StreetName,City,PostalCode,Province,Country,Email, ExtraContact, ExtraContactNumber,Phone,TransactionID ,BrokerID , Fintrac)"
		 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		 try {

	          pst = conRDS.prepareStatement(AddDeposit);
			
		        pst.setString(1,Amount);	
			    pst.setString(2,Type);
			    pst.setTimestamp(3,Date);
			    pst.setString(4,DepositReference);
			    pst.setString(5,RecivedFrom);
			    pst.setString(6,FirstName);
			    pst.setString(7,LastName);
			    pst.setString(8,Relationship);
			    pst.setString(9,Unit);	
			    pst.setString(10,StreetNumber);
			    pst.setString(11,StreetName);
			    pst.setString(12,City);
			    pst.setString(13,PostalCode);	
			    pst.setString(14,Province);
			    pst.setString(15,Country);
			    pst.setString(16,Email);
			    pst.setString(17,ExtraContact);
			    pst.setString(18,ExtraContactNumber );
			    pst.setString(19,Phone);
			    pst.setInt(20,Transaction);	
			    pst.setInt(21,BrokerID);	
			    pst.setString(22,Fintrac);
			    
			    
			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }
			 
			 finally {    if (pst != null) {
				    	
				        try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}   }
				    

				}	
}




//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void UpdateDeposit(String Amount, String Type, Timestamp Date,String DepositReference,String RecivedFrom, String Relationship, String Unit, String StreetNumber, String StreetName,String City,String PostalCode, String Province,String Country, String Email,String ExtraContact, String ExtraContactNumber,String Phone,  int Transaction,int ID , int BrokerID , String FirstName , String LastName ,String Fintrac , Connection conRDS) {

       //Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String UpdateDeposit="update Deposits set Amount=?,Type=? ,DepositDate=? ,DepositReference=? ,RecivedFrom=? ,Relationship=? ,Unit=?, StreetNumber=?, StreetName=?, City=?, PostalCode=? ,Province=? ,Country=?, Email=?, ExtraContact=?, ExtraContactNumber=?, Phone=? , FirstName=? , LastName=? , Fintrac=? where TransactionID=? and ID=? and BrokerID=?  ";
	
	 try {

		 
		    pst = conRDS.prepareStatement( UpdateDeposit ); //Preparing the statement for executing
		
	        pst.setString(1,Amount);	
		    pst.setString(2,Type);
		    pst.setTimestamp(3,Date);
		    pst.setString(4,DepositReference);
		    pst.setString(5,RecivedFrom);
		    pst.setString(6,Relationship);
		    pst.setString(7,Unit);	
		    pst.setString(8,StreetNumber);
		    pst.setString(9,StreetName);
		    pst.setString(10,City);
		    pst.setString(11,PostalCode);	
		    pst.setString(12,Province);
		    pst.setString(13,Country);
		    pst.setString(14,Email);
		    pst.setString(15,ExtraContact);
		    pst.setString(16,ExtraContactNumber );
		    pst.setString(17,Phone);
		    pst.setString(18,FirstName);
		    pst.setString(19,LastName);
		    pst.setString(20,Fintrac);
		    pst.setInt(21,Transaction);	
		    pst.setInt(22,ID);	
		    pst.setInt(23,BrokerID);	
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }
		 
		 finally {    if (pst != null) {
			    	
			        try {  pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//Adding a new cooperating Brokerage to the data base in the related table called in the function

public void NEWCOOperationBroker(String Brokerage,String AgentName,String Phone,String Unit,
		
		String StreetName,String StreetNumber,String City,String Province,String PostalCode,String Email,String ExtraContact, String ExtraContactNumber, int TransactionID , int BrokerID , Connection conRDS) {

       //Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String AddCooperating ="INSERT INTO COOperatingBrokers (Brokerage,AgentName,Phone,Unit,StreetName,StreetNumber,City,Province,PostalCode,Email,ExtraContact,ExtraContactNumber,TransactionID ,BrokerID)"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	 

	 try {

        pst = conRDS.prepareStatement(AddCooperating);
		
	        pst.setString(1,Brokerage);	
		    pst.setString(2, AgentName);
		    pst.setString(3,Phone);
		    pst.setString(4,Unit);
		    pst.setString(5,StreetName);
		    pst.setString(6,StreetNumber);
		    pst.setString(7,City);	
		    pst.setString(8,Province);
		    pst.setString(9,PostalCode);
		    pst.setString(10,Email);	
		    pst.setString(11,ExtraContact);
		    pst.setString(12,ExtraContactNumber);	
		    pst.setInt(13,TransactionID);
		    pst.setInt(14,BrokerID);
	
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }
		 
		 
		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    
			  
			}	

}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//Adding a new cooperating Brokerage to the data base in the related table called in the function

public void UpdateCOOperationBroker(String Brokerage,String AgentName,String Phone,String Unit,
		
		String StreetName,String StreetNumber,String City,String Province,String PostalCode,String Email,String ExtraContact, String ExtraContactNumber, int TransactionID , int ID , int BrokerID , Connection conRDS) {

      //Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String UpdateCooperating ="Update COOperatingBrokers set Brokerage=?, AgentName=?, Phone=?, Unit=?, StreetName=?, StreetNumber=?, City=?, Province=?, PostalCode=?, Email=?, ExtraContact=?, ExtraContactNumber=?, TransactionID=?  where  ID=? and BrokerID=?" ;
	 	
	 

	 try {

		  pst = conRDS.prepareStatement( UpdateCooperating ); //Preparing the statement for executing
		
	        pst.setString(1,Brokerage);	
		    pst.setString(2, AgentName);
		    pst.setString(3,Phone);
		    pst.setString(4,Unit);
		    pst.setString(5,StreetName);
		    pst.setString(6,StreetNumber);
		    pst.setString(7,City);	
		    pst.setString(8,Province);
		    pst.setString(9,PostalCode);
		    pst.setString(10,Email);	
		    pst.setString(11,ExtraContact);
		    pst.setString(12,ExtraContactNumber);	
		    pst.setInt(13,TransactionID);
		    pst.setInt(14,ID);
		    pst.setInt(15,BrokerID);
	
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }
		 
		 
		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}   }

			}	

}
//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NEWLawyer(String LawFirm, String Lawyer,String Phone,String Unit,String StreetNumber,String StreetName, String City,String PostalCode, String Province, String Email,String ExtraContact,String ExtraContactNumber, String ClerkFullName, String ClerkEmail, String LawyerType,int TransactionID , int BrokerID , Connection conRDS) {

        //Connection conRDS = null;
	
	    //conRDS= CreateConnection();
	
	    PreparedStatement pst=null;	
	
	    String AddLawyer ="INSERT INTO Lawyers (LawFirm,Lawyer,Phone,Unit,StreetNumber,StreetName,City,PostalCode,Province,Email,ExtraContact,ExtraContactNumber,ClerkFullName,ClerkEmail,LawyerType,TransactionID, BrokerID)"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	 try {

        pst = conRDS.prepareStatement(AddLawyer);
		
	        pst.setString(1,LawFirm);	
		    pst.setString(2,Lawyer);
		    pst.setString(3,Phone);
		    pst.setString(4,Unit);
		    pst.setString(5,StreetNumber);
		    pst.setString(6,StreetName);	
		    pst.setString(7,City);
		    pst.setString(8,PostalCode);
		    pst.setString(9,Province);
		    pst.setString(10,Email);		
		    pst.setString(11,ExtraContact);
		    pst.setString(12,ExtraContactNumber);
		    pst.setString(13,ClerkFullName);		
		    pst.setString(14,ClerkEmail);
		    pst.setString(15,LawyerType);
		    pst.setInt(16,TransactionID);
		    pst.setInt(17,BrokerID);
	
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally { if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
			    
			
			}	
}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdateLawyer(String LawFirm, String Lawyer,String Phone,String Unit,String StreetNumber,String StreetName, String City,String PostalCode, String Province, String Email,String ExtraContact,String ExtraContactNumber, String ClerkFullName, String ClerkEmail, String LawyerType,int TransactionID , int ID , int BrokerID ,Connection conRDS) {

        //Connection conRDS = null;
	
	    //conRDS= CreateConnection();
	
	    PreparedStatement pst=null;	
	
	    String UpdateLawyer ="Update Lawyers set LawFirm=?, Lawyer=?, Phone=?, Unit=?, StreetNumber=?, StreetName=?, City=?, PostalCode=?, Province=?, Email=?, ExtraContact=?, ExtraContactNumber=?, ClerkFullName=?, ClerkEmail=?, LawyerType=? , TransactionID=?  where ID=? and BrokerID=? ; ";
	 	
	 try {

		 pst = conRDS.prepareStatement(UpdateLawyer);
		
	        pst.setString(1,LawFirm);	
		    pst.setString(2,Lawyer);
		    pst.setString(3,Phone);
		    pst.setString(4,Unit);
		    pst.setString(5,StreetNumber);
		    pst.setString(6,StreetName);	
		    pst.setString(7,City);
		    pst.setString(8,PostalCode);
		    pst.setString(9,Province);
		    pst.setString(10,Email);		
		    pst.setString(11,ExtraContact);
		    pst.setString(12,ExtraContactNumber);
		    pst.setString(13,ClerkFullName);		
		    pst.setString(14,ClerkEmail);
		    pst.setString(15,LawyerType);
		    pst.setInt(16,TransactionID);
		    pst.setInt(17,BrokerID);
	
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally { if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
			    
			
			}	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NEWPatry(String Type,String BusinessName,String Officer,String FirstName,String LastName,String StreetName,
		String StreetNumber , String Unit,String City,String Province ,String PostalCode,String Country,String Phone,String ExtraContact,
		String ExtraContactNumber, String Email, String Role, int TransactionID , int BrokerID ,String Powerofattorney , Connection conRDS) {

      //Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String NewParty="INSERT INTO Parties(Type,BusinessName,Officer,FirstName,LastName,Unit,StreetName,StreetNumber,City,Province,PostalCode,Country,Email,Phone,ExtraContact,ExtraContactNumber,PartyRole,TransactionID ,BrokerID, Powerofattorney)"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	 try {

      pst = conRDS.prepareStatement(NewParty);
		
	        pst.setString(1,Type);	
		    pst.setString(2,BusinessName);
		    pst.setString(3,Officer);
		    pst.setString(4,FirstName);
			pst.setString(5,LastName);
		    pst.setString(6,Unit);	
		    pst.setString(7,StreetName);
		    pst.setString(8,StreetNumber);	
			pst.setString(9,City);
			pst.setString(10,Province);
			pst.setString(11,PostalCode);
			pst.setString(12,Country);
			pst.setString(13,Email);
			pst.setString(14,Phone);
			pst.setString(15,ExtraContact);	
			pst.setString(16,ExtraContactNumber);
			pst.setString(17,Role);
		    pst.setInt(18,TransactionID);
		    pst.setInt(19,BrokerID);
		    pst.setString(20,Powerofattorney);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {   pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	

}





//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdatePatry(String Type,String BusinessName,String Officer,String FirstName,String LastName,String StreetName,
		String StreetNumber , String Unit,String City,String Province ,String PostalCode,String Country,String Phone,String ExtraContact,
		String ExtraContactNumber, String Email, String Role, int TransactionID, int ID , int BrokerID , String Powerofattorney, Connection conRDS) {

       //Connection conRDS = null;
	
	   //conRDS= CreateConnection();
	
	   PreparedStatement pst=null;	
	
	   String UpdateParty="Update Parties set Type=?, BusinessName=?, Officer=?, FirstName=?, LastName=?, Unit=?, StreetName=?, StreetNumber=?, City=?, Province=?, PostalCode=?, Country=?, Email=?, Phone=?, ExtraContact=?, ExtraContactNumber=?, PartyRole=?, TransactionID=? , Powerofattorney=? where ID=? and BrokerID=? ";
	 		

	 try {

		    pst = conRDS.prepareStatement(UpdateParty);
		
	        pst.setString(1,Type);	
		    pst.setString(2,BusinessName);
		    pst.setString(3,Officer);
		    pst.setString(4,FirstName);
			pst.setString(5,LastName);
		    pst.setString(6,Unit);	
		    pst.setString(7,StreetName);
		    pst.setString(8,StreetNumber);	
			pst.setString(9,City);
			pst.setString(10,Province);
			pst.setString(11,PostalCode);
			pst.setString(12,Country);
			pst.setString(13,Email);
			pst.setString(14,Phone);
			pst.setString(15,ExtraContact);	
			pst.setString(16,ExtraContactNumber);
			pst.setString(17,Role);
		    pst.setInt(18,TransactionID);
			pst.setString(19,Powerofattorney);
		    pst.setInt(20,ID);
		    pst.setInt(21,BrokerID);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {   pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */  }   }
			    

			}	

}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NEWRebate(String Condition1, String Condition2, String Amount1,String Customer1,String Amount2,String Customer2,String Amount3,String Customer3,String Amount4,String Customer4,String TotalRebates,String Agent1,String Agent2,int TransactionID , int BrokerID , Connection conRDS) {

     // Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String NewRebates ="INSERT INTO Rebates ( RecipientPartyToTrade,AgreemenComplyWithEthic,Amount1,Customer1,Amount2,Customer2,Amount3,Customer3,Amount4,Customer4,TotalRebates,Agent1Percentage,Agent2Percentage,TransactionID , BrokerID)"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	 try {

        pst = conRDS.prepareStatement(NewRebates);
            pst.setString(1,Condition1);	
	        pst.setString(2,Condition2);
	        pst.setString(3,Amount1);	
		    pst.setString(4,Customer1);
		    pst.setString(5,Amount2);
		    pst.setString(6,Customer2);
		    pst.setString(7,Amount3);
		    pst.setString(8,Customer3);	
		    pst.setString(9,Amount4);
		    pst.setString(10,Customer4);	
			pst.setString(11,TotalRebates);
			pst.setString(12,Agent1);
			pst.setString(13,Agent2);
		    pst.setInt(14,TransactionID);
		    pst.setInt(15,BrokerID);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	

}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdateRebate(String Condition1, String Condition2, String Amount1,String Customer1,String Amount2,String Customer2,String Amount3,String Customer3,String Amount4,String Customer4,String TotalRebates,String Agent1,String Agent2,int TransactionID ,int ID , int BrokerID , Connection conRDS) {

      //Connection conRDS = null;
	
	 //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String UpdateRebates ="Update Rebates set RecipientPartyToTrade=?, AgreemenComplyWithEthic=?, Amount1=?, Customer1=?, Amount2=?, Customer2=?, Amount3=?, Customer3=?, Amount4=?, Customer4=?, TotalRebates=?, Agent1Percentage=?, Agent2Percentage=?, TransactionID=? where ID=? and BrokerID=? ;";

	 try {

		    pst = conRDS.prepareStatement(UpdateRebates);
            pst.setString(1,Condition1);	
	        pst.setString(2,Condition2);
	        pst.setString(3,Amount1);	
		    pst.setString(4,Customer1);
		    pst.setString(5,Amount2);
		    pst.setString(6,Customer2);
		    pst.setString(7,Amount3);
		    pst.setString(8,Customer3);	
		    pst.setString(9,Amount4);
		    pst.setString(10,Customer4);	
			pst.setString(11,TotalRebates);
			pst.setString(12,Agent1);
			pst.setString(13,Agent2);
		    pst.setInt(14,TransactionID);
		    pst.setInt(15,ID);
		    pst.setInt(16,BrokerID);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NEWReferral( String Condition1, String Condition2, String Amount,String Agent1,String  Agent2, String FirstName, String LastName,String Brokerage,
		String PhoneNumber,String ExtraContact,String ExtraContactNumber,
		String StreetName,String StreetNumber,String Unit,String City,String Province,String PostalCode,String Country,String Email,String HST1,String HST2, int TransactionID , int BrokerID ,Connection conRDS) {

      //Connection conRDS = null;
	
	 // conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String NewReferral ="INSERT INTO Referral ("
	  		+ "RecipientRegistrant,"
	  		+ "DisclosedToAllParties,"
	  		+ "Amount,"
	  		+ "Agent1Percentage,"
	  		+ "Agent2Percentage,"
	  		+ "FirstName,"
	  		+ "LastName,"
	  		+ "Brokerage,"
	  		+ "Phone,"
	  		+ "ExtraContactNumber,"
	  		+ "ExtraContact,"
	  		+ "StreetName,"
	  		+ "StreetNumber,"
	  		+ "Unit,"
	  		+ "City,"
	  		+ "Province,"
	  		+ "PostalCode,"
	  		+ "Country,"
	  		+ "Email,"
	  		+ "ReferralHST1, "
	  		+ "ReferralHSt2,"
	  		+ "TransactionID , "
	  		+ "BrokerID)"
	 		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	 try {

        pst = conRDS.prepareStatement(NewReferral);
        
            pst.setString(1,Condition1);	
            pst.setString(2,Condition2);	
            pst.setString(3,Amount);
		    pst.setString(4,Agent1);
		    pst.setString(5,Agent2);
		    pst.setString(6,FirstName);
		    pst.setString(7,LastName);
		    pst.setString(8,Brokerage);
		    pst.setString(9,PhoneNumber);	
		    pst.setString(10,ExtraContactNumber);
		    pst.setString(11,ExtraContact);	
			pst.setString(12,StreetName);
			pst.setString(13,StreetNumber);
			pst.setString(14,Unit);
			pst.setString(15,City);
			pst.setString(16,Province);	
			pst.setString(17,PostalCode);
			pst.setString(18,Country);
			pst.setString(19,Email);
			pst.setString(20,HST1);
			pst.setString(21,HST2);
            pst.setInt(22,TransactionID);
            pst.setInt(23,BrokerID);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {   pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
			    
		
			}	

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdateReferral( String Condition1, String Condition2, String Amount,String Agent1,String  Agent2, String FirstName, String LastName,String Brokerage,
		String PhoneNumber,String ExtraContact,String ExtraContactNumber,
		String StreetName,String StreetNumber,String Unit,String City,String Province,String PostalCode,String Country,String Email,String HST1, String HST2, int TransactionID , int ID , int BrokerID , Connection conRDS ) {

      //Connection conRDS = null;
	
	  //conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String NewReferral ="Update Referral set RecipientRegistrant=?, DisclosedToAllParties=?, Amount=?, Agent1Percentage=?, Agent2Percentage=?, FirstName=?, LastName=?, Brokerage=?, Phone=?, ExtraContactNumber=?, ExtraContact=?, StreetName=?, StreetNumber=?, Unit=?, City=?, Province=?, PostalCode=?, Country=?, Email=? ,ReferralHST1=?, ReferralHST2=?  where TransactionID=? and BrokerID=?; ";
	 		;

	 try {

      pst = conRDS.prepareStatement(NewReferral);
      
            pst.setString(1,Condition1);	
            pst.setString(2,Condition2);	
	        pst.setString(3,Amount);	
		    pst.setString(4,Agent1);
		    pst.setString(5,Agent2);
		    pst.setString(6,FirstName);
		    pst.setString(7,LastName);
		    pst.setString(8,Brokerage);
		    pst.setString(9,PhoneNumber);	
		    pst.setString(10,ExtraContactNumber);
		    pst.setString(11,ExtraContact);	
			pst.setString(12,StreetName);
			pst.setString(13,StreetNumber);
			pst.setString(14,Unit);
			pst.setString(15,City);
			pst.setString(16,Province);	
			pst.setString(17,PostalCode);
			pst.setString(18,Country);
			pst.setString(19,Email);
			pst.setString(20,HST1);	
			pst.setString(21,HST2);	
            pst.setInt(22,TransactionID);
            pst.setInt(23,BrokerID);
		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {   pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
		
			}	

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NEWContacts(Contacts contact , Connection conRDS ) {
	
	      //Connection conRDS = null;
		
		 // conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String NewContact="INSERT INTO Contacts (Type,BusinessName,Officer,FirstName,LastName,PartyType,Phone,Email,ExtraContact,ExtraContactNumber,Unit,StreetNumber,StreetName,City,Province,Country,PostalCode,Lawyer,LawFirm,ClerckName,ClerckEmail,UserID ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		 try {

	        pst = conRDS.prepareStatement(NewContact);
			
		        pst.setString(1,contact.Type );	
			    pst.setString(2,contact.businesName);
			    pst.setString(3,contact.Officer);
			    pst.setString(4,contact.FirstName);
				pst.setString(5,contact.LastName);
			    pst.setString(6,contact.PartyType);	
			    pst.setString(7,contact.Phone);
			    pst.setString(8,contact.Email);	
				pst.setString(9,contact.ExtraContact);
				pst.setString(10,contact.ExtraContactNumber);
				pst.setString(11,contact.Unit);
				pst.setString(12,contact.StreetNumber);
				pst.setString(13,contact.StreetName );	
				pst.setString(14,contact.City);
				pst.setString(15,contact.Province);	
				pst.setString(16,contact.Country);
			    pst.setString(17,contact.PostalCode);
				pst.setString(18,contact.Lawyer);
			    pst.setString(19,contact.LawFirm);
			    pst.setString(20,contact.ClerkName);
			    pst.setString(21,contact.ClerkEmail);	
			    pst.setInt(22,contact.UserID);

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
				    
	}	

}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function will retrieve all Transactions related to a specific Broker


public ArrayList<Transaction> GetAllTransactionsForSpesificBrokerToApprove( int Type, String Agent1Sign , String Agent2sign , String Brokersign , int BrokerID , Connection conRDS){
	
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where  AuthorType=? and AgentSign1=? and AgentSign2=? and Brokersign=? and BrokerID=?";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);
		
		
		    
		    pst.setInt(1, Type);
		    
		    pst.setString(2, Agent1Sign);
		    
		    pst.setString(3, Agent2sign);
		    
		    pst.setString(4, Brokersign);
		    
		    pst.setInt(5, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");

			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");

			System.out.println(myTransaction.id);
			 
			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	

	return Trans;
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function will retrieve all Transactions related to a specific Broker which has been approved by two agents , with specific property Status like('Available','Firm','Conditional','Closed','Expired','Off-Market','Withdrawn')

public ArrayList<Transaction> GetTransactionsByPropertyStatus(int Type, String Agent1Sign ,String Agent2sign, String BrokerSign , String PropertyStatus , int BrokerID , Connection conRDS ){
	
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where AuthorType=? and AgentSign1=? and AgentSign2=? and BrokerSign=? and PropertyStatus=? and BrokerID=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, Type);
		    
		    pst.setString(2, Agent1Sign);
		    
		    pst.setString(3, Agent2sign);
		    
		    pst.setString(4, BrokerSign);
		    
		    pst.setString(5, PropertyStatus);
		    
		    pst.setInt(6, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			
			 
			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Trans;
}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


//This function will return all transaction which which needs Broker's approvals and they are not closed , leased or Firm

public ArrayList<Transaction> GetTransactionsOther(int Type, String Agent1Sign ,String Agent2sign, String BrokerSign, int BrokerID , Connection conRDS ){
	
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where AuthorType=? and AgentSign1=? and AgentSign2=? and BrokerSign=? and BrokerID=? and PropertyStatus IN ( 'Conditional','Expired','Off-Market','Withdrawn',''); ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, Type);
		    
		    pst.setString(2, Agent1Sign);
		    
		    pst.setString(3, Agent2sign);
		    
		    pst.setString(4, BrokerSign);
		    
		    pst.setInt(5, BrokerID);

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			
			 
			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Trans;
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function will retrieve all Transactions related to a specific Agent related to a specific Broker

//The Transaction should be Created by an Agent and approved by both agents too , then the broker could see it for approval

//The ID1 is the Broker ID

//Type is to check if the Transaction has been created by the agent

public ArrayList<Transaction> GetAllDealsforAnAgent( int Type, String Agent1Sign , String Agent2sign , String Brokersign,int AgentID , Connection conRDS ){
	
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where  AuthorType=? and AgentSign1=? and AgentSign2=? and Brokersign=?  and FirstAgentID=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);
		
		
		    
		    pst.setInt(1, Type);
		    
		    pst.setString(2, Agent1Sign);
		    
		    pst.setString(3, Agent2sign);
		    
		    pst.setString(4, Brokersign);
		    
		    pst.setInt(5, AgentID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			

			 
			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	

	return Trans;
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function is to get an specific Transaction by a specific ID

public Transaction GetTransactionsbyID(int ID , int BrokerID , Connection conRDS){

	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	Transaction myTransaction=new Transaction();
	
	String SearchQuery="Select * from Transactions where ID=? and BrokerID=?";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);
		
		    pst.setInt(1, ID);
		    
		    pst.setInt(2, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");

		} 
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {  try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	

	return myTransaction;
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Transaction> GetALlDealsForSecondAgent(int AgentId, String Agent1Sign , String Agent2Sign , String Brokersign , Connection conRDS ){
	
	
ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where  SecondAgentID=? and AgentSign1=? and AgentSign2=? and Brokersign=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1,AgentId);
		    
		    pst.setString(2, Agent1Sign);
		    
		    pst.setString(3,Agent2Sign );
		    
		    pst.setString(4, Brokersign);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			
			System.out.println(myTransaction.id);
			 
			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Trans;
	
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function will check the deals in the data base and will return the deals which 

//is created by the broker and the first agent is broker 


public ArrayList<Transaction> GetAllPendingBrokerDeals( int AuthorType,int AuthorID, int FirstAgentID , String Filter , Connection conRDS){

	String search="";
	String fromDate = "";
	String toDate ="";
	String searchVal = "";
	String typeVal = "";

	/*if( !Filter.isEmpty() ){
    	Object obj=JSONValue.parse(Filter);  
		JSONObject jsonObject = (JSONObject) obj;  
	
		searchVal = (String) jsonObject.get("search");  
		typeVal = (String) jsonObject.get("type");

		if(!((String) jsonObject.get("from") == "") && !((String) jsonObject.get("to") == "")){
			fromDate = " AND date > "+(String) jsonObject.get("from");
			toDate = " AND date < "+(String) jsonObject.get("to");
		}else if(!((String) jsonObject.get("from") == "")){
			fromDate = " AND date > "+(String) jsonObject.get("from");
		}else if(!((String) jsonObject.get("to") == "")){
			toDate = " AND date < "+(String) jsonObject.get("to");
		}
		search=searchVal;
	}*/

	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;

	// Need to specify which fields we need to do search by
	
	String SearchQuery="Select * from Transactions where  AuthorType=? and AuthorID=? and FirstAgentID=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, AuthorType);
		    
		    pst.setInt(2, AuthorID);
		    
		    pst.setInt(3, FirstAgentID);
		    
		   

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			

			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Trans;
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function will check the deals in the data base and will return the deals which 

//is created by the broker and the first agent is broker 

//Also the deals has been finalized  by the broker 

//it also included the deals that are Off Market and Expired but they have been Save and Closed

public ArrayList<Transaction> GetAllCompletedBrokerDeals( int AuthorType,int AuthorID, int FirstAgentID ,String  Permanant, String Filter , Connection conRDS ){

	String search="";
	String fromDate = "";
	String toDate ="";
	String searchVal = "";
	String typeVal = "";

	/*if( !Filter.isEmpty() ){
    	Object obj=JSONValue.parse(Filter);  
		JSONObject jsonObject = (JSONObject) obj;  
	
		searchVal = (String) jsonObject.get("search");  
		typeVal = (String) jsonObject.get("type");

		if(!((String) jsonObject.get("from") == "") && !((String) jsonObject.get("to") == "")){
			fromDate = " AND date > "+(String) jsonObject.get("from");
			toDate = " AND date < "+(String) jsonObject.get("to");
		}else if(!((String) jsonObject.get("from") == "")){
			fromDate = " AND date > "+(String) jsonObject.get("from");
		}else if(!((String) jsonObject.get("to") == "")){
			toDate = " AND date < "+(String) jsonObject.get("to");
		}
		search=searchVal;
	}*/


	ArrayList<Transaction> FinalizedTrans = new ArrayList<Transaction>();
	
	//FinalizedTrans=GetAllPendingBrokerDeals( AuthorType , AuthorID, FirstAgentID ,"1");
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;


	String SearchQuery="Select * from Transactions where  AuthorType=? and AuthorID=? and FirstAgentID=? and Permanent=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, AuthorType);
		    
		    pst.setInt(2, AuthorID);
		    
		    pst.setInt(3,  FirstAgentID);
		    
		    pst.setString(4, Permanant);

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {

			//3 propertises for sorting *to discuss*
			// int propType = 0;
			// listType = 0;
			//int propStatus = 0;

			//3 propertises for sorting *to discuss*
			//switch(result.getString("PropertyType")){  case "Detached":  propType = 1; break; case "Semi-detached":  propType = 2; break; case "Townhouse":  propType = 3; break; case "Condominium":  propType = 4; break; case "Commercial":  propType = 5; break; case "Land":  propType = 6; break; case "Other":  propType = 7; break; default: propType = 8; break;}
    		//switch(result.getString("ListingType")){  case "Buyer-Side": listType = 1; break; case "Listing-Side": listType = 2; break; case "Sale-Double-Sided": listType = 3; break; case "Landlord-Side": listType = 4; break; case "Tenant-Side": listType = 5; break; case "Lease-DoubleSided": listType = 6; break; case "BuyerSide-Self-Represented-Vendor": listType = 7; break; case "TenantSide-Self-Represented-Landlord": listType = 8; break; default: listType = 9; break; }
    		//switch(result.getString("PropertyStatus")){ case "Closed": propStatus = 1; break; case "Firm": propStatus = 2; break; case "Conditional": propStatus = 3; break; case "Available": propStatus = 4; break; default: switch(result.getString("Descriptions")){ case "Referral Fee": propStatus = 5; break; case "TRS": propStatus = 7; break; default: propStatus = 6; break; } }
	
			
			Transaction myTransaction=new Transaction();

			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			

			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	 
	 Trans.addAll(FinalizedTrans);	 
 
	return Trans;
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Transaction> GetAllTransactionsforBroker(  int AuthorID , int BrokerID , String AuthorType , Connection conRDS ){

	ArrayList<Transaction> FinalizedTrans = new ArrayList<Transaction>();
	
	//FinalizedTrans=GetAllPendingBrokerDeals( AuthorType , AuthorID, FirstAgentID ,"1");
	
	ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Transactions where AuthorType=? , AuthorID=? , BrokerID=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setString(1,  AuthorType);
		    
		    pst.setInt(2,  AuthorID);
		    
		    pst.setInt(3,  BrokerID);
		    


		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
			
			Transaction myTransaction=new Transaction();
			
			myTransaction.id= result.getInt("ID");
			myTransaction.AuthorType=result.getInt("AuthorType") ;
			myTransaction.AuthorID= result.getInt("AuthorID");
			myTransaction.MLS=result.getString("MLSNumber");
			myTransaction.StreetName=result.getString("StreetName");
			myTransaction.StreetNumber=result.getString("StreetNumber");
			myTransaction.Unit= result.getString("Unit") ;
			myTransaction.City=result.getString("City");
			myTransaction.Province=result.getString("Province");
			myTransaction.PostalCode=result.getString("PostalCode");
			myTransaction.PropertyType= result.getString("PropertyType");
			myTransaction.FirstAgent= result.getInt("FirstAgentID") ;
			myTransaction.SecondAgent=result.getInt("SecondAgentID");
			myTransaction.FirstAgentCommission= result.getString("FirstAgentCommission") ;
			myTransaction.SecondAgentCommission=result.getString("SecondAgentCommission");
			myTransaction.Price= result.getString("Price");
			myTransaction.TransactionSource=result.getString("TransactionSource");
			myTransaction.ListingType=result.getString("ListingType");
			myTransaction.ListingDate=result.getTimestamp("ListingDate") ;
			myTransaction.ClosingDate=result.getTimestamp("ClosingDate");
			myTransaction.ListCommission= result.getString("ListCommission");
			myTransaction.SellCommission= result.getString("SellCommission");
			myTransaction.PropertyStatus= result.getString("PropertyStatus");
			myTransaction.Agent1Sign=result.getString("AgentSign1");
			myTransaction.Agent2Sign=result.getString("AgentSign2");
			myTransaction.BrokerSign=result.getString("BrokerSign");
			myTransaction.TransactionStatus=result.getString("TransactionStatus");
			myTransaction.ExpirationDate=result.getTimestamp("ExpirationDate");
			myTransaction.PropertyStatus=result.getString("PropertyStatus");
			myTransaction.OfficeleadGrossCommission=result.getString("OfficeLeadGrossCommission");
			myTransaction.OfficeLead=result.getInt("OfficeLead");
			myTransaction.SellingOfficeleadGrossCommission=result.getString("SellingOfficeLeadGrossCommission");
			myTransaction.SellingOfficeLead=result.getInt("SellingOfficeLead");
			myTransaction.ListingOfficeleadGrossCommission=result.getString("ListingOfficeLeadGrossCommission");
			myTransaction.ListingOfficeLead=result.getInt("ListingOfficeLead");
			myTransaction.Notes=result.getString("Notes");
			myTransaction.Permanent=result.getString("Permanent");
			myTransaction.Role1=result.getString("FirstAgentRole");
			myTransaction.Role2=result.getString("SecondAgentRole");
			myTransaction.Description=result.getString("Descriptions");
			myTransaction.ReferralFeeNote=result.getString("ReferralFeeNote");
			myTransaction.OfferDate=result.getTimestamp("OfferDate");
			
			myTransaction.OfferExpiretionDate=result.getTimestamp("OfferExpiretionDate");
			
			myTransaction.OfferAcceptanceDate=result.getTimestamp("OfferAcceptanceDate");
			
			myTransaction.ConditionExpirationDate=result.getTimestamp("ConditionExpirationDate");
			
			myTransaction.ConditionCompletationDate=result.getTimestamp("ConditionCompletationDate");
			
			myTransaction.OfferWithrawalDate=result.getTimestamp("OfferWithrawalDate");
			
			myTransaction.InspectionDate=result.getTimestamp("InspectionDate");
			
			myTransaction.AccupancyDate=result.getTimestamp("AccupancyDate");
			
			myTransaction.OffMarketDate=result.getTimestamp("OffMarketDate");
			
			myTransaction.progressMarks=result.getString("ProgressMarks");
		    
			myTransaction.CreateDate=result.getTimestamp("CreateDate");
		    
			myTransaction.FinalizedDate=result.getTimestamp("FinalizedDate");
			
			myTransaction.LastCommissionID=result.getInt("LastCommissionID");
		    
			myTransaction.LastCommissionDealID=result.getInt("LastCommissionDealID");
			

			 Trans.add(myTransaction);  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
	
		}	

	 
	 Trans.addAll(FinalizedTrans);	 

	return Trans;
}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdateCommissionDetails( CommissionDetails com , Connection conRDS) {
	
	System.out.println("Hello");	
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	
	PreparedStatement pst=null;
	
	String UpdateCommission=" UPDATE CommissionDetails  set Type=? ,Address=? ,Date=? ,ClosingDate=? ,Price=? ,GrossFee=? ,SellingCommission=? ,ListingCommission=? ,TotalCommission=?, AgentSplit=? ,NetToAgent=? ,Rebate=? ,Referral=? ,NetCommission=? ,NetToBrokerage=? ,Balance=? ,Cap=? ,CapDS=? ,CapReached =? , Finalized=? , Status=? where  BrokerID=? and  ID=? ";

	 try {
		 
		 System.out.println("Try");	
		 
         pst = conRDS.prepareStatement(UpdateCommission);

		    
	        pst.setString(1,com.Type);
	        pst.setString(2,com.Address);
	        pst.setTimestamp(3,com.Date);
	        pst.setTimestamp(4,com.Closingdate);
	        pst.setString(5,com.Price);
	        pst.setString(6,com.GrossCommission );
	        pst.setString(7,com.SellingCommission);
	        pst.setString(8,com.ListingCommission);
	        pst.setString(9,com.TotalCommission);	
	        pst.setString(10,com.Split);
	        pst.setString(11,com.AgentPortion);
	        pst.setString(12,com.Rebate);
	        pst.setString(13,com.Referral);
	        pst.setString(14,com.NetCommission); 
	        pst.setString(15,com.SplitWithBroker);
	        pst.setString(16,com.Balance);
	        pst.setString(17,com.AddtoCap);
	        pst.setString(18,com.AddtoCapDS);
	        pst.setString(19,com.CapReached);
	        pst.setString(20,com.Finalized);
	        pst.setString(21,com.Status);
	        pst.setInt(22,com.BrokerID);
	        pst.setInt(23,com.ID);

		    pst.executeUpdate();
			
		
	}//Close Try 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    
		  
		    
		}	
	
	
System.out.println("Finish function");	
	
}



//*******************************************************************************************************************************************************************


public ArrayList<CommissionDetails> SearchCommissions(int Broker , String Finalized , int AgentID , Connection conRDS) {
	
	ArrayList<CommissionDetails> Commissions = new ArrayList<CommissionDetails>();

	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM CommissionDetails WHERE BrokerID=? and AgentID=? and Finalized=? " ;

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		
		    pst.setInt(1, Broker);
		    
		    pst.setInt(2, AgentID);
		    
		    pst.setString(3, Finalized);

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			CommissionDetails com=new CommissionDetails();
			
	       com.Type=result.getString("Type");
	       com.Address=result.getString("Address");
	       com.Date=result.getTimestamp("Date");
	       com.Closingdate=result.getTimestamp("ClosingDate");
	       com.Price=result.getString("Price");
	       com.GrossCommission =result.getString("GrossFee");
	       com.SellingCommission=result.getString("SellingCommission");
	       com.ListingCommission=result.getString("ListingCommission");
	       com.TotalCommission=result.getString("TotalCommission");	
	       com.Split=result.getString("AgentSplit");
	       com.AgentPortion=result.getString("NetToAgent");
	       com.Rebate=result.getString("Rebate");
	       com.Referral=result.getString("Referral");
	       com.NetCommission=result.getString("NetCommission");
	       com.SplitWithBroker=result.getString("NetToBrokerage");
	       com.Balance=result.getString("Balance");
	       com.AddtoCap=result.getString("Cap");
	       com.AddtoCapDS=result.getString("CapDS");
	       com.CapReached=result.getString("CapReached");
	       com.Finalized=result.getString("Finalized");
	       com.Status=result.getString("Status");
	       com.TradeID=result.getInt("TransactionID");
			
			Commissions.add(com); }
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		
		}	

	 	//	Gson gson = new Gson();
	 	//    String json = gson.toJson(Commissions);


	return Commissions;

}




//*******************************************************************************************************************************************************************


public CommissionDetails SearchSpesificCommission( int TransactionID  , int ID , Connection conRDS ) {
	
	CommissionDetails com=new CommissionDetails();

	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM CommissionDetails WHERE  TransactionID=? and ID=?" ;

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);

		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, ID);

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			
		   com.ID=result.getInt("ID");
		   com.BrokerID=result.getInt("BrokerID");
		   com.AgentId=result.getInt("AgentID");
		   com.Status=result.getString("Status");
	       com.Type=result.getString("Type");
	       com.Address=result.getString("Address");
	       com.Date=result.getTimestamp("Date");
	       com.Closingdate=result.getTimestamp("ClosingDate");
	       com.Price=result.getString("Price");
	       com.GrossCommission =result.getString("GrossFee");
	       com.SellingCommission=result.getString("SellingCommission");
	       com.ListingCommission=result.getString("ListingCommission");
	       com.TotalCommission=result.getString("TotalCommission");	
	       com.Split=result.getString("AgentSplit");
	       com.AgentPortion=result.getString("NetToAgent");
	       com.Rebate=result.getString("Rebate");
	       com.Referral=result.getString("Referral");
	       com.NetCommission=result.getString("NetCommission");
	       com.SplitWithBroker=result.getString("NetToBrokerage");
	       com.Balance=result.getString("Balance");
	       com.AddtoCap=result.getString("Cap");
	       com.AddtoCapDS=result.getString("CapDS");
	       com.CapReached=result.getString("CapReached");
	       com.Finalized=result.getString("Finalized");
	       com.TradeID=result.getInt("TransactionID");
	      
			
			 }
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		  
		}	

	return com;

}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public ArrayList<CommissionDetails> GetCommission( int BrokerID , int AuthorID , Connection conRDS) {
	
	ArrayList<CommissionDetails> MyCommissions = new ArrayList<CommissionDetails>();

    ArrayList<Transaction> Trans = new ArrayList<Transaction>();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;

	// Need to specify which fields we need to do search by
	
	String SearchQuery1="Select * from Transactions where AuthorID=? and FirstAgentID=? ";

	 try {	
		 
		     pst = conRDS.prepareStatement(SearchQuery1);

		     pst.setInt(1, AuthorID);
		    
		     pst.setInt(2, BrokerID);

		     ResultSet result1 = pst.executeQuery();

		    while ( result1.next() ) {

			  Transaction myTransaction=new Transaction();
			  
			  myTransaction.id= result1.getInt("ID");
		    
			  myTransaction.LastCommissionID=result1.getInt("LastCommissionID");
		    
			  myTransaction.LastCommissionDealID=result1.getInt("LastCommissionDealID");

			 Trans.add(myTransaction);  } //End of While
	            
	    } //End Of Try
	 
	 catch (SQLException e) { e.printStackTrace();  }
	 
   for(int i =0 ; i< Trans.size() ;i++ ) {
	
	    PreparedStatement pst1=null;
	  
	    String SearchStatment="SELECT * FROM CommissionDetails WHERE  TransactionID=? and ID=?" ;

	 try {
		 
		    pst1= conRDS.prepareStatement(SearchStatment);

		    pst1.setInt(1, Trans.get(i).id );
		    
		    pst1.setInt(2, Trans.get(i).LastCommissionID );

		    ResultSet result = pst1.executeQuery();
		
		    
		while ( result.next() ) {
		
		   CommissionDetails com=new CommissionDetails();	
		   com.ID=result.getInt("ID");
		   com.BrokerID=result.getInt("BrokerID");
		   com.AgentId=result.getInt("AgentID");
		   com.Status=result.getString("Status");
	       com.Type=result.getString("Type");
	       com.Address=result.getString("Address");
	       com.Date=result.getTimestamp("Date");
	       com.Closingdate=result.getTimestamp("ClosingDate");
	       com.Price=result.getString("Price");
	       com.GrossCommission =result.getString("GrossFee");
	       com.SellingCommission=result.getString("SellingCommission");
	       com.ListingCommission=result.getString("ListingCommission");
	       com.TotalCommission=result.getString("TotalCommission");	
	       com.Split=result.getString("AgentSplit");
	       com.AgentPortion=result.getString("NetToAgent");
	       com.Rebate=result.getString("Rebate");
	       com.Referral=result.getString("Referral");
	       com.NetCommission=result.getString("NetCommission");
	       com.SplitWithBroker=result.getString("NetToBrokerage");
	       com.Balance=result.getString("Balance");
	       com.AddtoCap=result.getString("Cap");
	       com.AddtoCapDS=result.getString("CapDS");
	       com.CapReached=result.getString("CapReached");
	       com.Finalized=result.getString("Finalized");
	       com.TradeID=result.getInt("TransactionID");  
	       
	       MyCommissions.add(com);
		
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 
}//End of for
	 
	 
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		  
		

	return MyCommissions;

}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

























public int AddCommissionDetails( CommissionDetails com , Connection conRDS) {
	
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	
	ResultSet rs = null;
	 
	int last_inserted_id=0;
	
	String addCommission="INSERT INTO CommissionDetails (Type,Address,Date,ClosingDate,Price,GrossFee,SellingCommission,ListingCommission,TotalCommission, AgentSplit ,NetToAgent,Rebate,Referral,NetCommission,NetToBrokerage,Balance,Cap,CapDS ,CapReached ,AgentID , BrokerID, TransactionID ,Finalized , Status )	values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	 try {
		   pst = conRDS.prepareStatement (addCommission,Statement.RETURN_GENERATED_KEYS) ;

		    
	        pst.setString(1,com.Type);
	        pst.setString(2,com.Address);
	        pst.setTimestamp(3,com.Date);
	        pst.setTimestamp(4,com.Closingdate);
	        pst.setString(5,com.Price);
	        pst.setString(6,com.GrossCommission );
	        pst.setString(7,com.SellingCommission);
	        pst.setString(8,com.ListingCommission);
	        pst.setString(9,com.TotalCommission);	
	        pst.setString(10,com.Split);
	        pst.setString(11,com.AgentPortion);
	        pst.setString(12,com.Rebate);
	        pst.setString(13,com.Referral);
	        pst.setString(14,com.NetCommission); 
	        pst.setString(15,com.SplitWithBroker);
	        pst.setString(16,com.Balance);
	        pst.setString(17,com.AddtoCap);
	        pst.setString(18,com.AddtoCapDS);
	        pst.setString(19,com.CapReached);
	        pst.setInt(20,com.AgentId);	
	        pst.setInt(21,com.BrokerID);
	        pst.setInt(22,com.TradeID);
	        pst.setString(23,com.Finalized);
	        pst.setString(24,com.Status);

		    pst.executeUpdate();
		    
		    
	         rs = pst.getGeneratedKeys();
	         
	            if(rs.next())
	            {
	                last_inserted_id = rs.getInt(1);
	            }
			
		
	}//Close Try 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    
	
		}	
	
	
	 return last_inserted_id;
	
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function use to update the system if an agent approved a specific deal. 

public void AgentSign(int ID,String status, String Sign , Connection conRDS) {
	
	//Create a connection to the database by calling the CreateConnection function

		//Connection conRDS = null;
		
		//conRDS= CreateConnection();
		
		//Creating Prepared statement for updating the password 
		
		PreparedStatement pst=null;
		
		//The following variable is an update statement to update the password in the database for that broker 
		  
		String AgentSign="UPDATE Transactions set AgentSign2=? , TransactionStatus=? where ID=?;" ;

		 try {
			    pst = conRDS.prepareStatement(AgentSign); //Preparing the statement for executing
			
			    //Adding the data to the ? Arguments of out statement
			    
			    pst.setString(1, Sign);
			    
			    pst.setString(2,status);
			    
			    pst.setInt(3,ID);
			    
			    pst.executeUpdate();//Executing the update statement
		
		 }
		 catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {
				    	
				        try {    pst.close(); } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
				    
	}	

}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

//This function use to update the system if an Broker approved a specific deal. 

public void BrokerSign(int ID,String status, String Sign , Connection conRDS) {
	
	//Create a connection to the database by calling the CreateConnection function

		//Connection conRDS = null;
		
		//conRDS= CreateConnection();
		
		//Creating Prepared statement for updating the password 
		
		PreparedStatement pst=null;
		
		//The following variable is an update statement to update the password in the database for that broker 
		  
		String BrokerApprove="UPDATE Transactions set BrokerSign=? , TransactionStatus=? where ID=?;" ;

		 try {
			    pst = conRDS.prepareStatement(BrokerApprove); //Preparing the statement for executing
			
			    //Adding the data to the ? Arguments of out statement
			    
			    pst.setString(1, Sign);
			    
			    pst.setString(2,status);
			    
			    pst.setInt(3,ID);
			    
			    pst.executeUpdate();//Executing the update statement
		
		 }
		 catch (SQLException e) { e.printStackTrace(); }

			 finally {   if (pst != null) {
				    	
				        try {   pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}   }
				    

				}	
	
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void SendDealBack(int ID,String Status, String Nots , Connection conRDS) {
	
	//Create a connection to the database by calling the CreateConnection function

		//Connection conRDS = null;
		
		//conRDS= CreateConnection();
		
		//Creating Prepared statement for updating the password 
		
		PreparedStatement pst=null;
		
		//The following variable is an update statement to update the password in the database for that broker 
		  
		String BrokerApprove="UPDATE Transactions set TransactionStatus=? , Notes=?  where ID=?;" ;

		 try {
			    pst = conRDS.prepareStatement(BrokerApprove); //Preparing the statement for executing
			
			    //Adding the data to the ? Arguments of out statement
			    
			    pst.setString(1, Status);
			    
			    pst.setString(2, Nots);
			    
			    pst.setInt(3,ID);
			    
			    pst.executeUpdate();//Executing the update statement
		
		 }
		 catch (SQLException e) { e.printStackTrace(); }

			 finally {   if (pst != null) {
				    	
				        try {   pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}   }
				    

				}	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public int  UpdateCompany( Companies Company , Connection conRDS ) {

	      //Connection conRDS = null;
		
		  //conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		  
		  int id=0;
		
		  String NewCompany="Update Companies  set BusinessName=?, FiscalYearEnd=?, Unit=?, StreetNumber=?, StreetName=?, City=?, Province=?, PostalCode=?, Email=?, Phone=?, HSTNumberPart1=?, HSTNumberPart2=?, RealEstateTrustBankNumber=?, RealEstateTrustTransitNumber=?, RealEstateTrustAccountNumber=?, RealEstateTrustAccountName2=?, RealEstateTrustAccountNikName2=?, RealEstateTrustBankNumber2=?, RealEstateTrustTransitNumber2=?, RealEstateTrustAccountNumber2=?, CommissionTrustBankNumber=?, CommissionTrustTransitNumber=?, CommissionTrustAccountNumber=?, GeneralAccountBankNumber=?, GeneralAccountTransitNumber=?, GeneralAccountNumber=?,  TransactionID=? where BrokerID=? ;";

		 try {

	            pst = conRDS.prepareStatement(NewCompany , Statement.RETURN_GENERATED_KEYS);
			
		        pst.setString(1,  Company.BusinessName  );	
		        
		        pst.setString(2,  Company.FiscalYearEnd );	
		        
		        pst.setString(3,  Company.Unit  );	
		        
		        pst.setString(4,  Company.StreetNumber  );	
		        
		        pst.setString(5,  Company.StreetName );	
		        
		        pst.setString(6,  Company.City );	
		         
		        pst.setString(7,  Company.Province );	
		        
		        pst.setString(8,  Company.PostalCode  );	
		        
		        pst.setString(9,  Company.Email );
		        
		        pst.setString(10, Company.Phone );	
		        
		        pst.setString(11, Company.HSTNumberPart1 );	
		        
		        pst.setString(12, Company.HSTNumberPart2 );	
		        
		        pst.setString(13, Company.RealEstateTrustBankNumber );	
		        
		        pst.setString(14, Company.RealEstateTrustTransitNumber );	
		        
		        pst.setString(15, Company.RealEstateTrustAccountNumber );

		        pst.setString(16, Company.RealEstateTrustAccountName2 );	
		        
		        pst.setString(17, Company.RealEstateTrustAccountNikname2 );	
		        
		        pst.setString(18, Company.RealEstateTrustBankNumber2 );
		        
		        pst.setString(19, Company.RealEstateTrustTransitNumber2 );	
		        
		        pst.setString(20, Company. RealEstateTrustAccountNumber2 );	

		        pst.setString(21, Company.CommissionBankNumber );	
		        
		        pst.setString(22, Company.CommissionTransitNumber );	
		        
		        pst.setString(23, Company.CommissionAccountNumber  );	
		        
		        pst.setString(24, Company.GeneralAccountBankNumber );
		        
		        pst.setString(25, Company.GeneralAccountTransitNumber  );
		        
		        pst.setString(26, Company.GeneralAccountAccountNumber );
		        
		        pst.setInt(27, Company.TransactionID );
			
		        pst.setInt(28, Company.BrokerID );

			    pst.executeUpdate();
			    
			    id=Statement.RETURN_GENERATED_KEYS;
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
				    
	}	
		 
		 
		 return id;

}  

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void UpdateCompanyTransaction( int TransactionID , int BrokerID , Connection conRDS) {

	      //Connection conRDS = null;
		
		  //conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String NewCompany="Update Companies  set  TransactionID=? where BrokerID=? ;";

		 try {

	            pst = conRDS.prepareStatement(NewCompany);
			
		        pst.setInt(1, TransactionID );	
		        
		        pst.setInt(2, BrokerID );	
	

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
	}	

}  




//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void UpdateCompanyTemp( String TempID , int BrokerID , Connection conRDS) {

	     //Connection conRDS = null;
		
		 // conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String NewCompany="Update Companies  set  Temp=? where BrokerID=? ;";

		 try {

	            pst = conRDS.prepareStatement(NewCompany);
			
		        pst.setString(1, TempID );	
		        
		        pst.setInt(2, BrokerID );	
	

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
				    
 	}	

}  




//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public int NewCompany( Companies Company , Connection conRDS ) {

	      //Connection conRDS = null;
		
		 // conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String NewCompany="INSERT INTO Companies (BusinessName,FiscalYearEnd,Unit,StreetNumber,StreetName,City,Province,PostalCode,Email,Phone,HSTNumberPart1,HSTNumberPart2,RealEstateTrustBankNumber,RealEstateTrustTransitNumber,RealEstateTrustAccountNumber,RealEstateTrustAccountName2,RealEstateTrustAccountNikName2,RealEstateTrustBankNumber2,RealEstateTrustTransitNumber2,RealEstateTrustAccountNumber2,CommissionTrustBankNumber,CommissionTrustTransitNumber,CommissionTrustAccountNumber,GeneralAccountBankNumber,GeneralAccountTransitNumber,GeneralAccountNumber,BrokerID , TransactionID ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		 try {

	            pst = conRDS.prepareStatement(NewCompany ,  Statement.RETURN_GENERATED_KEYS);
			
		        pst.setString(1,  Company.BusinessName  );	
		        
		        pst.setString(2,  Company.FiscalYearEnd );	
		        
		        pst.setString(3,  Company.Unit  );	
		        
		        pst.setString(4,  Company.StreetNumber  );	
		        
		        pst.setString(5,  Company.StreetName );	
		        
		        pst.setString(6,  Company.City );	
		         
		        pst.setString(7,  Company.Province );	
		        
		        pst.setString(8,  Company.PostalCode  );	
		        
		        pst.setString(9,  Company.Email );
		        
		        pst.setString(10, Company.Phone );	
		        
		        pst.setString(11, Company.HSTNumberPart1 );	
		        
		        pst.setString(12, Company.HSTNumberPart2 );	
		        
		        pst.setString(13, Company.RealEstateTrustBankNumber );	
		        
		        pst.setString(14, Company.RealEstateTrustTransitNumber );	
		        
		        pst.setString(15, Company.RealEstateTrustAccountNumber );

		        pst.setString(16, Company.RealEstateTrustAccountName2 );	
		        
		        pst.setString(17, Company.RealEstateTrustAccountNikname2 );	
		        
		        pst.setString(18, Company.RealEstateTrustBankNumber2 );
		        
		        pst.setString(19, Company.RealEstateTrustTransitNumber2 );	
		        
		        pst.setString(20, Company. RealEstateTrustAccountNumber2 );	

		        pst.setString(21, Company.CommissionBankNumber );	
		        
		        pst.setString(22, Company.CommissionTransitNumber );	
		        
		        pst.setString(23, Company.CommissionAccountNumber  );	
		        
		        pst.setString(24, Company.GeneralAccountBankNumber );
		        
		        pst.setString(25, Company.GeneralAccountTransitNumber  );
		        
		        pst.setString(26, Company.GeneralAccountAccountNumber );
			
		        pst.setInt(27, Company.BrokerID );
		        
		        pst.setInt(28, Company.TransactionID );

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
 	}
		 
		return  Statement.RETURN_GENERATED_KEYS;	

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public Companies GetaCompanyBuyBrokerID( int BrokerID , Connection conRDS ) {
 
	Companies Company=new Companies();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Companies where BrokerID=?";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, BrokerID);
		

		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			 
		  Company.ID= result.getInt("ID"); 	
			
		  Company.BusinessName= result.getString("BusinessName");
		        
		  Company.FiscalYearEnd =result.getString("FiscalYearEnd");	
		        
		  Company.Unit =result.getString("Unit");
		  
		  Company.StreetNumber=result.getString("StreetNumber");	
		        
		  Company.StreetName=result.getString("StreetName"); 	
		        
		  Company.City =result.getString("City");
		         
		  Company.Province =result.getString("Province");
		        
		  Company.PostalCode=result.getString("PostalCode");
		        
		  Company.Email =result.getString("Email");
		        
		  Company.Phone =result.getString("Phone");
		        
		  Company.HSTNumberPart1 =result.getString("HSTNumberPart1");
		        
		  Company.HSTNumberPart2 =result.getString("HSTNumberPart2");
		        
		  Company.RealEstateTrustBankNumber =result.getString("RealEstateTrustBankNumber");
		        
		  Company.RealEstateTrustTransitNumber =result.getString("RealEstateTrustTransitNumber");
		        
		  Company.RealEstateTrustAccountNumber=result.getString("RealEstateTrustAccountNumber");

		  Company.RealEstateTrustAccountName2 =result.getString("RealEstateTrustAccountName2");
		        
	      Company.RealEstateTrustAccountNikname2=result.getString("RealEstateTrustAccountNikName2");
		        
		  Company.RealEstateTrustBankNumber2 =result.getString("RealEstateTrustBankNumber2");
		        
		  Company.RealEstateTrustTransitNumber2 =result.getString("RealEstateTrustTransitNumber2");
		        
		  Company. RealEstateTrustAccountNumber2 =result.getString("RealEstateTrustAccountNumber2");

		  Company.CommissionBankNumber =result.getString("CommissionTrustBankNumber");
		        
		  Company.CommissionTransitNumber=result.getString("CommissionTrustTransitNumber");
		        
	      Company.CommissionAccountNumber=result.getString("CommissionTrustAccountNumber");
		        
		  Company.GeneralAccountBankNumber=result.getString("GeneralAccountBankNumber");
		        
		  Company.GeneralAccountTransitNumber=result.getString("GeneralAccountTransitNumber");
		        
		  Company.GeneralAccountAccountNumber=result.getString("GeneralAccountNumber");
		  
		  Company.TransactionID=result.getInt("TransactionID");

		  Company.Temp=result.getString("Temp");
			

			 
		  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Company;
	
	
}
//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void AddAlternativeBroker( int ID, String StartDate, String EndDate, String AlternativeBroker, Connection conRDS ) {
	
    //Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String UpdatePasswordStatment="UPDATE Users set AlternativeBroker=?,StartAlternativeBroker=?,EndAlternativeBroker=? where ID=?;";


	 try {
		 
		    pst = conRDS.prepareStatement(UpdatePasswordStatment);

	        pst.setString(1, AlternativeBroker);
	        pst.setString(2,StartDate);
	        pst.setString(3,EndDate);
	        pst.setInt(4,ID);

		    
		    pst.executeUpdate();  }
	 
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();  } 
			        
			        catch (SQLException e) { /* ignored */}  }
			    

			}	

}	

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void NEWInvoice(Invoice NewInvoice , Connection conRDS) {
	
	      //Connection conRDS = null;
		
		 //conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String Invoice="INSERT INTO Invoices  ( BrokerID ,DealID,SendStatus,Type,Date,RecieverFirstName, RecieverLastName ,RecieverEmail, Unit,StreetName,StreetNumber, City, Province, PostalCode, Country, SalesPrice, commissionPayable, HST,Deposit, Balance, ClosingDate,Party1,Party2 ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		 try {

	        pst = conRDS.prepareStatement( Invoice);
			
		        pst.setInt(1,NewInvoice.BrokerID );	
			    pst.setInt(2,NewInvoice.DealID);
			    pst.setString(3,NewInvoice.SendStatus);
			    pst.setString(4,NewInvoice.Type);
				pst.setTimestamp(5,NewInvoice.Date);
			    pst.setString(6,NewInvoice.RecieverFirstName);	
			    pst.setString(7,NewInvoice.RecieverLastName);
			    pst.setString(8,NewInvoice.RecieverEmail);	
				pst.setString(9,NewInvoice.Unit);
				pst.setString(10,NewInvoice.StreetName );
				pst.setString(11,NewInvoice.StreetNumber);
				pst.setString(12,NewInvoice.City);
				pst.setString(13,NewInvoice.Province);	
			    pst.setString(14,NewInvoice.PostalCode);
				pst.setString(15,NewInvoice.Country);
				pst.setString(16,NewInvoice.SalesPrice);
			    pst.setString(17,NewInvoice.commissionPayable);
			    pst.setString(18,NewInvoice.HST);
			    pst.setString(19,NewInvoice.Deposit);
			    pst.setString(20,NewInvoice.Balance);
			    pst.setTimestamp(21,NewInvoice.ClosingDate);
			    pst.setString(22,NewInvoice.Party1 );
			    pst.setString(23,NewInvoice.Party2 );

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
	}	

}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void UpdateInvoice(Invoice NewInvoice , Connection conRDS) {
	
	      //Connection conRDS = null;
		
		  //conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String Invoice="Update Invoices set BrokerID =?, DealID=?, SendStatus=?, Type=?, Date=?, RecieverFirstName=?,  RecieverLastName =?, RecieverEmail=?,  Unit=?, StreetName=?, StreetNumber=?,  City=?,  Province=?,  PostalCode=?,  Country=?,  SalesPrice=?,  commissionPayable=?,  HST=?, Deposit=?,  Balance=?,  ClosingDate=?  , Party1=? , Party2=? where ID=?";

		 try {

	        pst = conRDS.prepareStatement( Invoice);
			
		        pst.setInt(1,NewInvoice.BrokerID );	
			    pst.setInt(2,NewInvoice.DealID);
			    pst.setString(3,NewInvoice.SendStatus);
			    pst.setString(4,NewInvoice.Type);
				pst.setTimestamp(5,NewInvoice.Date);
			    pst.setString(6,NewInvoice.RecieverFirstName);	
			    pst.setString(7,NewInvoice.RecieverLastName);
			    pst.setString(8,NewInvoice.RecieverEmail);	
				pst.setString(9,NewInvoice.Unit);
				pst.setString(10,NewInvoice.StreetName );
				pst.setString(11,NewInvoice.StreetNumber);
				pst.setString(12,NewInvoice.City);
				pst.setString(13,NewInvoice.Province);	
			    pst.setString(14,NewInvoice.PostalCode);
				pst.setString(15,NewInvoice.Country);
				pst.setString(16,NewInvoice.SalesPrice);
			    pst.setString(17,NewInvoice.commissionPayable);
			    pst.setString(18,NewInvoice.HST);
			    pst.setString(19,NewInvoice.Deposit);
			    pst.setString(20,NewInvoice.Balance);
			    pst.setTimestamp(21,NewInvoice.ClosingDate);
			    pst.setString(22,NewInvoice.Party1 );
			    pst.setString(23,NewInvoice.Party2 );
			    pst.setInt(24,NewInvoice.ID);

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
	 	}	

}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public Invoice SearchInvoiceByTransactionID( int TransactionID , int BrokerID ,Connection conRDS) {
	 
	Invoice MyInvoice=new Invoice();
	
	//Connection conRDS = null;

	//conRDS=CreateConnection();
	
	PreparedStatement pst=null;
	
	String SearchQuery="Select * from Invoices where DealID=? and BrokerID=? ";

	 try {	
		 
		    pst = conRDS.prepareStatement(SearchQuery);

		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		

		    ResultSet result = pst.executeQuery();

		    
		while ( result.next() ) {
			 

			MyInvoice .ID=result.getInt("ID");
		    MyInvoice .SendStatus=result.getString("SendStatus");	
			MyInvoice .DealID=result.getInt("DealID");
			MyInvoice .Type=result.getString("Type");
			MyInvoice .Date=result.getTimestamp("date");
			MyInvoice .RecieverFirstName=result.getString("RecieverFirstName");
			MyInvoice .RecieverLastName=result.getString("RecieverLastName");
			MyInvoice .RecieverEmail=result.getString("RecieverEmail");
			MyInvoice .Unit=result.getString("Unit");
			MyInvoice .StreetName=result.getString("StreetName");
			MyInvoice .StreetNumber=result.getString("StreetNumber");
			MyInvoice .City=result.getString("City");
			MyInvoice .Province=result.getString("Province");
			MyInvoice .PostalCode=result.getString("PostalCode");
			MyInvoice .SalesPrice=result.getString("SalesPrice");
			MyInvoice .commissionPayable=result.getString("CommissionPayable");
			MyInvoice .HST=result.getString("HST");
			MyInvoice .Deposit=result.getString("Deposit");
			MyInvoice .Balance=result.getString("Balance");
			MyInvoice .BrokerID=result.getInt("BrokerID");
			MyInvoice .ClosingDate=result.getTimestamp("ClosingDate");
		    MyInvoice .Country=result.getString("Country");
		    MyInvoice .Party1=result.getString("Party1");
		    MyInvoice .Party2=result.getString("Party2");
			 
		  } 
	            
	} 
	 
	 catch (SQLException e) { e.printStackTrace();
	}
	 
	 finally {   if (pst != null) {  try {   pst.close();   } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return MyInvoice;
	
	
}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public Lawyers SearchLawyers( int TransactionID , String LawyerType , int BrokerID,Connection conRDS) {
	
	Lawyers Lawyer=new Lawyers();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Lawyers where TransactionID=? and LawyerType=? and BrokerID=? ";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setString(2, LawyerType);
		    
		    pst.setInt(3, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
		
			
			Lawyer.ID=result.getInt("ID");
			Lawyer.LawFirm=result.getString("LawFirm");
			Lawyer.Lawyer=result.getString("Lawyer");
			Lawyer.Phone=result.getString("Phone");
			Lawyer.Unit=result.getString("Unit"); 
			Lawyer.StreetNumber=result.getString("StreetNumber");
			Lawyer.StreetName=result.getString("StreetName");
			Lawyer.City=result.getString("City");
			Lawyer.PostalCode=result.getString("PostalCode");
			Lawyer.Province=result.getString("Province");
			Lawyer.Email=result.getString("Email");
			Lawyer.ExtraContact=result.getString("ExtraContact");
			Lawyer.ExtraContactNumber=result.getString("ExtraContactNumber");
			Lawyer.ClerkFullName=result.getString("ClerkFullName");
			Lawyer.ClerkEmail=result.getString("ClerkEmail");
			Lawyer.Role=result.getString("LawyerType");
			Lawyer.TransactionID=result.getInt("TransactionID");
			
			 }
		
	    if (result.next() == false) { Lawyer.ID=0;} 
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		
		}	

	return Lawyer;
	
	
	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Deposits> SearchDeposits( int TransactionID ,int BrokerID ,Connection conRDS) {

	ArrayList<Deposits> Deposits = new ArrayList<Deposits>();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Deposits where TransactionID=? and BrokerID=?";

	 try {
		
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID );
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Deposits Deposit=new Deposits();
			
			Deposit. ID=result.getInt("ID");
			Deposit. Amount=result.getString("Amount");
			Deposit. Type=result.getString("Type");
			Deposit. Date=result.getTimestamp("DepositDate");
			Deposit. Reference=result.getString("DepositReference");
			Deposit. RecievedFrom=result.getString("RecivedFrom");
			Deposit. Relationship=result.getString("Relationship");
			Deposit. Unit=result.getString("Unit");
			Deposit. StreetNumber=result.getString("StreetNumber");
			Deposit. StreetName=result.getString("StreetName");
			Deposit. City=result.getString("City");
			Deposit. PostalCode=result.getString("PostalCode");
			Deposit. Province=result.getString("Province");
			Deposit. Country=result.getString("Country");
			Deposit. Email=result.getString("Email");
			Deposit. ExtraContact=result.getString("ExtraContact");
			Deposit. ExtraContactNumber=result.getString("ExtraContactNumber");
			Deposit. Phone=result.getString("Phone");
			Deposit. TransactionID=result.getInt("TransactionID");
			Deposit.FirstName=result.getString("FirstName");
			Deposit. LastName=result.getString("LastName");
			Deposit. Fintrac=result.getString("Fintrac");
			
			Deposits.add(Deposit);
		
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return Deposits;

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public Rebate SearchRebates( int TransactionID , int BrokerID ,Connection conRDS ) {
	
	Rebate MyRebate=new Rebate();

	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Rebates where TransactionID=? and BrokerID=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		if ( result.next() ) {

			 MyRebate. ID=result.getInt("ID");
			 MyRebate. RecipientPartyToTrade=result.getString("RecipientPartyToTrade");
			 MyRebate. AgreemenComplyWithEthic=result.getString("AgreemenComplyWithEthic");
			 MyRebate. Amount1=result.getString("Amount1");
			 MyRebate. Customer1=result.getString("Customer1");
			 MyRebate. Amount2=result.getString("Amount2");
			 MyRebate. Customer2=result.getString("Customer2");
			 MyRebate. Amount3=result.getString("Amount3");
			 MyRebate. Customer3=result.getString("Customer3");
			 MyRebate. Amount4=result.getString("Amount4");
			 MyRebate. Customer4=result.getString("Customer4");
			 MyRebate. TotalRebates=result.getString("TotalRebates");
			 MyRebate. Agent1Percentage=result.getString("Agent1Percentage");
			 MyRebate. Agent2Percentage=result.getString("Agent2Percentage");
			 MyRebate. TransactionID=result.getInt("TransactionID");
			 MyRebate. BrokerID=result.getInt("BrokerID");
			
		
		}else {  MyRebate.ID=0; } 
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
	
		}	

	return MyRebate;

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public Referral SearchReferral( int TransactionID , int BrokerID ,Connection conRDS ) {
	
	Referral MyReferral=new Referral();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Referral where TransactionID=? and BrokerID=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		if ( result.next() ) {
			
			MyReferral. ID=result.getInt ("ID"); 
			MyReferral.RecipientRegistrant=result.getString("RecipientRegistrant");
			MyReferral.DisclosedToAllParties=result.getString("DisclosedToAllParties");
			MyReferral.Amount=result.getString("Amount");
			MyReferral.Agent1Percentage=result.getString("Agent1Percentage");
			MyReferral.Agent2Percentage=result.getString("Agent2Percentage");
			MyReferral.FirstName=result.getString("FirstName");
			MyReferral.LastName=result.getString("LastName");
			MyReferral.Brokerage=result.getString("Brokerage");
			MyReferral.Phone=result.getString("Phone");
			MyReferral.ExtraContactNumber=result.getString("ExtraContactNumber");
			MyReferral.ExtraContact=result.getString("ExtraContact");
			MyReferral.StreetName=result.getString("StreetName");
			MyReferral.StreetNumber=result.getString("StreetNumber");
			MyReferral.Unit=result.getString("Unit");
			MyReferral.City=result.getString("City");
			MyReferral.Province=result.getString("Province");
			MyReferral.PostalCode=result.getString("PostalCode");
			MyReferral.Country=result.getString("Country");
			MyReferral.Email=result.getString("Email");
			MyReferral.HST1=result.getString("ReferralHST1");
			MyReferral.HST2=result.getString("ReferralHST2");
			MyReferral.TransactionID=result.getInt("TransactionID");
			MyReferral.BrokerID=result.getInt("BrokerID");

		}else { MyReferral. ID=0;}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return MyReferral;	

}

//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public String GetAllContacts( int UserID ,Connection conRDS) {

	String Result = "";

 	CallableStatement proc = null;
	 try {
		 
		 proc = conRDS.prepareCall("{ ? = call get_all_contacts(?) }");
		 proc.registerOutParameter(1, Types.OTHER);
		 proc.setInt(2, UserID);
		 proc.execute();
		 Result = (String) proc.getObject(1);
		 proc.close();
		
	}catch (SQLException e) { e.printStackTrace(); 
	
	}finally {
			
		    
		    if (proc != null) {  try {   proc.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
	
	return Result ;	
	
}




//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Contacts> SerchContacts( int UserID, String Type , Connection conRDS) {

	ArrayList<Contacts> Contacts = new ArrayList<Contacts>();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Contacts where UserID=? and Type=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, UserID);
		    
		    pst.setString(2,Type);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Contacts Contact=new Contacts();
	
	
			//Contact.Type=result.getString("");
			 Contact.businesName=result.getString("BusinessName");
			 Contact.Officer=result.getString("Officer");
			 Contact.FirstName=result.getString("FirstName");
			 Contact.LastName=result.getString("LastName");
			 Contact.PartyType=result.getString("PartyType");
			 Contact.Phone=result.getString("Phone");
			 Contact.Email=result.getString("Email");
			 Contact.ExtraContact=result.getString("ExtraContact");
			 Contact.ExtraContactNumber=result.getString("ExtraContactNumber");
			 Contact.Unit=result.getString("Unit");
			 Contact.StreetNumber=result.getString("StreetNumber");
			 Contact.StreetName=result.getString("StreetName");
			 Contact.City=result.getString("City");
			 Contact.Province=result.getString("Province");
			 Contact.Country=result.getString("Country");
			 Contact.PostalCode=result.getString("PostalCode");
			 Contact.Lawyer=result.getString("Lawyer");
			 Contact.LawFirm=result.getString("LawFirm");
			 Contact.ClerkName=result.getString("ClerckName");
			 Contact.ClerkEmail=result.getString("ClerckEmail");
			 //Contact. UserID=result.getInt("");
			 Contact. ID=result.getInt("ID");
			
			
			Contacts.add( Contact );
			
	
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
	
	
	
	return Contacts ;	
	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public ArrayList<Contacts> distinctSerchContacts( int UserID, String Type ,Connection conRDS) {

	ArrayList<Contacts> Contacts = new ArrayList<Contacts>();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT  DISTINCT LawFirm FROM Contacts where UserID=? and Type=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, UserID);
		    
		    pst.setString(2,Type);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Contacts Contact=new Contacts();
	
	
			//Contact.Type=result.getString("");
			 Contact.businesName=result.getString("BusinessName");
			 Contact.Officer=result.getString("Officer");
			 Contact.FirstName=result.getString("FirstName");
			 Contact.LastName=result.getString("LastName");
			 Contact.PartyType=result.getString("PartyType");
			 Contact.Phone=result.getString("Phone");
			 Contact.Email=result.getString("Email");
			 Contact.ExtraContact=result.getString("ExtraContact");
			 Contact.ExtraContactNumber=result.getString("ExtraContactNumber");
			 Contact.Unit=result.getString("Unit");
			 Contact.StreetNumber=result.getString("StreetNumber");
			 Contact.StreetName=result.getString("StreetName");
			 Contact.City=result.getString("City");
			 Contact.Province=result.getString("Province");
			 Contact.Country=result.getString("Country");
			 Contact.PostalCode=result.getString("PostalCode");
			 Contact.Lawyer=result.getString("Lawyer");
			 Contact.LawFirm=result.getString("LawFirm");
			 Contact.ClerkName=result.getString("ClerckName");
			 Contact.ClerkEmail=result.getString("ClerckEmail");
			 //Contact. UserID=result.getInt("");
			 Contact. ID=result.getInt("ID");
			
			
			Contacts.add( Contact );
			
	
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	
	
	
	
	return Contacts ;	
	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Contacts> SerchContactsbyCompany( int UserID, String Type,String Company , Connection conRDS) {

	ArrayList<Contacts> Contacts = new ArrayList<Contacts>();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Contacts where UserID=? and Type=? and LawFirm=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, UserID);
		    
		    pst.setString(2,Type);
		    
		    pst.setString(3,Company);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Contacts Contact=new Contacts();
	
	
			//Contact.Type=result.getString("");
			 Contact.businesName=result.getString("BusinessName");
			 Contact.Officer=result.getString("Officer");
			 Contact.FirstName=result.getString("FirstName");
			 Contact.LastName=result.getString("LastName");
			 Contact.PartyType=result.getString("PartyType");
			 Contact.Phone=result.getString("Phone");
			 Contact.Email=result.getString("Email");
			 Contact.ExtraContact=result.getString("ExtraContact");
			 Contact.ExtraContactNumber=result.getString("ExtraContactNumber");
			 Contact.Unit=result.getString("Unit");
			 Contact.StreetNumber=result.getString("StreetNumber");
			 Contact.StreetName=result.getString("StreetName");
			 Contact.City=result.getString("City");
			 Contact.Province=result.getString("Province");
			 Contact.Country=result.getString("Country");
			 Contact.PostalCode=result.getString("PostalCode");
			 Contact.Lawyer=result.getString("Lawyer");
			 Contact.LawFirm=result.getString("LawFirm");
			 Contact.ClerkName=result.getString("ClerckName");
			 Contact.ClerkEmail=result.getString("ClerckEmail");
			 //Contact. UserID=result.getInt("");
			 Contact. ID=result.getInt("ID");
			
			
			Contacts.add( Contact );
			
	
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
	
	
	
	return Contacts ;	
	
}




public Contacts SerchContactsbyID( int ID , Connection conRDS) {

	Contacts Contact=new Contacts();
	
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Contacts where ID=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1,ID);

		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
		
	
	
			 Contact.Type=result.getString("Type");
			 Contact.businesName=result.getString("BusinessName");
			 Contact.Officer=result.getString("Officer");
			 Contact.FirstName=result.getString("FirstName");
			 Contact.LastName=result.getString("LastName");
			 Contact.PartyType=result.getString("PartyType");
			 Contact.Phone=result.getString("Phone");
			 Contact.Email=result.getString("Email");
			 Contact.ExtraContact=result.getString("ExtraContact");
			 Contact.ExtraContactNumber=result.getString("ExtraContactNumber");
			 Contact.Unit=result.getString("Unit");
			 Contact.StreetNumber=result.getString("StreetNumber");
			 Contact.StreetName=result.getString("StreetName");
			 Contact.City=result.getString("City");
			 Contact.Province=result.getString("Province");
			 Contact.Country=result.getString("Country");
			 Contact.PostalCode=result.getString("PostalCode");
			 Contact.Lawyer=result.getString("Lawyer");
			 Contact.LawFirm=result.getString("LawFirm");
			 Contact.ClerkName=result.getString("ClerckName");
			 Contact.ClerkEmail=result.getString("ClerckEmail");
			 //Contact. UserID=result.getInt("");
			 Contact. ID=result.getInt("ID");
			
			

			
	
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	
	
	
	
	return Contact ;	
	
}
//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void NewContacts( Contacts Contact ,Connection conRDS) {

	 // Connection conRDS = null;
		
	 // conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String NewCompany="INSERT INTO Contacts ( Type, BusinessName, Officer, FirstName, LastName, PartyType, Phone, Email, ExtraContact, ExtraContactNumber, Unit, StreetNumber, StreetName, City, Province, Country, PostalCode, Lawyer, LawFirm, ClerckName, ClerckEmail, UserID ) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

	 try {

           pst = conRDS.prepareStatement(NewCompany);
           
           
             pst.setString( 1,  Contact.Type );
			 pst.setString( 2, Contact.businesName );
			 pst.setString( 3,  Contact.Officer);
			 pst.setString( 4,  Contact.FirstName);
			 pst.setString( 5,  Contact.LastName);
			 pst.setString( 6,  Contact.PartyType);
			 pst.setString( 7,  Contact.Phone);
			 pst.setString( 8,  Contact.Email);
			 pst.setString( 9,  Contact.ExtraContact);
			 pst.setString( 10, Contact.ExtraContactNumber);
			 pst.setString( 11, Contact.Unit);
			 pst.setString( 12, Contact.StreetNumber );
			 pst.setString( 13, Contact.StreetName);
			 pst.setString( 14, Contact.City);
			 pst.setString( 15, Contact.Province);
			 pst.setString( 16, Contact.Country);
			 pst.setString( 17, Contact.PostalCode);
			 pst.setString( 18, Contact.Lawyer);
			 pst.setString( 19, Contact.LawFirm);
			 pst.setString( 20,Contact.ClerkName);
			 pst.setString( 21, Contact.ClerkEmail);
			 pst.setInt(  22,   Contact. UserID);

		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}
			    }
	}	

	
	
	
}




//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void UpdateContacts( Contacts Contact ,Connection conRDS) {

	  //Connection conRDS = null;
		
	 // conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String UpdateCompany=" UPDATE Contacts set Type=?, BusinessName=?, Officer=?, FirstName=?, LastName=?, PartyType=?, Phone=?, Email=?, ExtraContact=?, ExtraContactNumber=?, Unit=?, StreetNumber=?, StreetName=?, City=?, Province=?, Country=?, PostalCode=?, Lawyer=?, LawFirm=?, ClerckName=?, ClerckEmail=?, UserID=?  where ID=?";

	 try {

         pst = conRDS.prepareStatement(UpdateCompany);
         
         
              pst.setString( 1,  Contact.Type );
			 pst.setString( 2, Contact.businesName );
			 pst.setString( 3,  Contact.Officer);
			 pst.setString( 4,  Contact.FirstName);
			 pst.setString( 5,  Contact.LastName);
			 pst.setString( 6,  Contact.PartyType);
			 pst.setString( 7,  Contact.Phone);
			 pst.setString( 8,  Contact.Email);
			 pst.setString( 9,  Contact.ExtraContact);
			 pst.setString( 10, Contact.ExtraContactNumber);
			 pst.setString( 11, Contact.Unit);
			 pst.setString( 12, Contact.StreetNumber );
			 pst.setString( 13, Contact.StreetName);
			 pst.setString( 14, Contact.City);
			 pst.setString( 15, Contact.Province);
			 pst.setString( 16, Contact.Country);
			 pst.setString( 17, Contact.PostalCode);
			 pst.setString( 18, Contact.Lawyer);
			 pst.setString( 19, Contact.LawFirm);
			 pst.setString( 20,Contact.ClerkName);
			 pst.setString( 21, Contact.ClerkEmail);
			 pst.setInt( 22, Contact.UserID );
			 pst.setInt(  23,   Contact.ID);

		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}
			    }
			    
 	}	

	
	
	
}


//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteContacts( int ID ,Connection conRDS) {

	 // Connection conRDS = null;
		
	 // conRDS= CreateConnection();
	
	  PreparedStatement pst=null;	
	
	  String UpdateCompany=" delete from Contacts where ID=?";

	 try {

       pst = conRDS.prepareStatement(UpdateCompany);
       
       
            pst.setInt( 1, ID );

	

		    pst.executeUpdate();
		    
	 } catch (SQLException e) { e.printStackTrace(); }

		 finally {  if (pst != null) {  try {  pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}
			    }
			    
 	}	

	
	
	
}



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public CooperatingBrokerage SearchCooperatingBrokerage( int TransactionID , int BrokerID ,Connection conRDS) { 
	
CooperatingBrokerage  MyBroker= new CooperatingBrokerage();

//Connection conRDS = null;

//conRDS= CreateConnection();

PreparedStatement pst=null;
  
String SearchStatment="SELECT * FROM COOperatingBrokers where TransactionID=? and BrokerID=?";

 try {
	 
	    pst = conRDS.prepareStatement(SearchStatment);
	    
	    pst.setInt(1, TransactionID);
	    
	    pst.setInt(2, BrokerID);
	    
	    ResultSet result = pst.executeQuery();
	
	    
	while ( result.next() ) {
		
		   MyBroker.ID=result.getInt("ID");;
		   MyBroker.Brokerage=result.getString("Brokerage");
		   MyBroker.AgentName=result.getString("AgentName");
		   MyBroker.phone=result.getString("Phone");
		   MyBroker.unit=result.getString("unit");
		   MyBroker.StreetName=result.getString("StreetName");
		   MyBroker.StreetNumber=result.getString("StreetNumber");
		   MyBroker.City=result.getString("City");
		   MyBroker.Province=result.getString("Province");
		   MyBroker.PostalCode=result.getString("PostalCode");
		   MyBroker.Email=result.getString("Email");
		   MyBroker.ExtraContact=result.getString("ExtraContact");
		   MyBroker.ExtraContactNumber=result.getString("ExtraContactNumber");
		   MyBroker.BrokerID=result.getInt("BrokerID");

	}
	
} 
 
 catch (SQLException e) { e.printStackTrace(); }
 
 finally {
		
	    
	    if (pst != null) {  try {   pst.close();  } 
	        
	        catch (SQLException e) { /* ignored */}
	    }
	    
	  
	}	


return MyBroker;  }



//***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public ArrayList<Parties> SearchParties(  int TransactionID , String Type  , int BrokerID ,Connection conRDS) {
	
	ArrayList<Parties> MyParties = new ArrayList<Parties>();
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String SearchStatment="SELECT * FROM Parties where TransactionID=? and PartyRole=? and  BrokerID=?";

	 try {
		 
		    pst = conRDS.prepareStatement(SearchStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setString(2, Type);
		    
		    pst.setInt(3, BrokerID);
		    
		    ResultSet result = pst.executeQuery();
		
		    
		while ( result.next() ) {
			
			Parties myParty= new Parties();
			
			
			 myParty.ID=result.getInt("ID");	
			 myParty.Type =result.getString("Type");
			 myParty.Firstname=result.getString("FirstName");
			 myParty.Lastname=result.getString("LastName");
			 myParty.BusinessName=result.getString("BusinessName");
			 myParty.OfficerFullName=result.getString("Officer");	
			 myParty.Unit=result.getString("Unit");	
			 myParty.streetName=result.getString("StreetName");	
			 myParty.StreetNumber=result.getString("StreetNumber");	
			 myParty.City=result.getString("City");	
			 myParty.Province=result.getString("Province");
			 myParty.PostalCode=result.getString("PostalCode");	
			 myParty.Country=result.getString("Country");	
			 myParty.Email=result.getString("Email");	
			 myParty.Phone=result.getString("Phone");	
			 myParty.FaxEmail=result.getString("ExtraContact");	
			 myParty.FaxEmailNumber=result.getString("ExtraContactNumber");	
			 myParty.BrokerID=result.getInt("BrokerID");	
			 myParty.Powerofattorney=result.getString("Powerofattorney");	
		

			 MyParties .add(myParty);
			
			
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	

	return MyParties ; }




//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public void NewTradeRecordes( RecordSheet Record  ,Connection conRDS) {

	
          //Connection conRDS = null;
	
		 // conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String NewRecord="INSERT INTO RecordSheet (TransactionID,RefoundAmount,RefoundLabel,ListingCommission,SellingCommission,TotalCommission,Split1,Split2,Split3,Agent2Split1,Agent2Split2,Agent2Split3,Allocation1,Allocation2,NetPayment,NetHST,NetTotal,HST1,HST2,HST3,HST4,HST5,HST6,HST7,HST8,HST9,HST10,Payment1,Payment2,Payment3,Payment4,Payment5,Payment6 , Payment7, Payment8 ,Payment9, Payment10, BrokerID , Cap1, Cap2,Cap3,Agent2Cap1,Agent2Cap2,Agent2Cap3, CommissionBankNumber, CommissionTransitNumber, CommissionAccountNumber) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		 try {

	            pst = conRDS.prepareStatement(NewRecord);
			
		        pst.setInt(1,  Record.TransactionID  );	
		        
		        pst.setString(2,  Record.RefoundAmount );	
		        
		        pst.setString(3,  Record.RefoundLabel  );	
		        
		        pst.setString(4,  Record.ListingCommission  );	
		        
		        pst.setString(5,  Record.SellingCommission );	
		        
		        pst.setString(6,  Record.TotalCommission );	
		         
		        pst.setString(7,  Record.Split1 );	
		        
		        pst.setString(8,  Record.Split2  );	
		        
		        pst.setString(9,  Record.Split3  );	
		       
		        pst.setString(10,  Record.Agent2Split1  );	
		        
		        pst.setString(11,  Record.Agent2Split2  );	
		        
		        pst.setString(12,  Record.Agent2Split3  );	
		        
		        pst.setString(13,  Record.Allocation1 );
		        
		        pst.setString(14, Record.Allocation2 );	
		        
		        pst.setString(15, Record.NetPayment );	
		        
		        pst.setString(16, Record.NetHST );	
		        
		        pst.setString(17, Record.NetTotal );	
		        
		        pst.setString(18, Record.HST1 );	
		        
		        pst.setString(19, Record.HST2 );

		        pst.setString(20, Record.HST3 );	
		        
		        pst.setString(21, Record.HST4 );	
		        
		        pst.setString(22, Record.HST5);
		        
		        pst.setString(23, Record.HST6 );	
		        
		        pst.setString(24, Record. HST7 );	

		        pst.setString(25, Record.HST8 );	
		        
		        pst.setString(26, Record. HST9 );	

		        pst.setString(27, Record.HST10);	
		        
		        pst.setString(28, Record.Payment1 );	
		        
		        pst.setString(29, Record.Payment2  );	
		        
		        pst.setString(30, Record.Payment3 );
		        
		        pst.setString(31, Record.Payment4  );
		        
		        pst.setString(32, Record.Payment5 );
			
		        pst.setString(33, Record.Payment6 );
		        
                pst.setString(34, Record.Payment7  );
		        
		        pst.setString(35, Record.Payment8 );
		        
                pst.setString(36, Record.Payment9  );
		        
		        pst.setString(37, Record.Payment10 );
		        
		        pst.setInt(38, Record.BrokerID );
		        
		        pst.setString(39, Record.Cap1  );
		        
		        pst.setString(40, Record.Cap2 );
		        
		        pst.setString(41, Record.Cap3 );
		        
		        pst.setString(42, Record.Agent2Cap1  );
		        
		        pst.setString(43, Record.Agent2Cap2 );
		        
		        pst.setString(44, Record.Agent2Cap3 );
			
		        pst.setString(45, Record.CommissionBankNumber );
		        
                pst.setString(46, Record.CommissionTransitNumber  );
		        
		        pst.setString(47, Record.CommissionAccountNumber );

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
				    
	}	

	
}




//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public void UpdateTradeRecordes( RecordSheet Record ,Connection conRDS) {

	
         //Connection conRDS = null;
	
		 // conRDS= CreateConnection();
		
		  PreparedStatement pst=null;	
		
		  String UpdateRecord="Update RecordSheet set TransactionID=?, RefoundAmount=?, RefoundLabel=?, ListingCommission=?, SellingCommission=?, TotalCommission=?, Split1=?, Split2=?, Split3=? , Agent2Split1=? , Agent2Split2=? , Agent2Split3=? ,Allocation1=?,   Allocation2=?, NetPayment=?, NetHST=?, NetTotal=?, HST1=?, HST2=?, HST3=?, HST4=?, HST5=?, HST6=?, HST7=?, HST8=?, HST9=?,HST10=? ,Payment1=?, Payment2=?, Payment3=?, Payment4=?, Payment5=?, Payment6=? , Payment7=?, Payment8=? ,Payment9=?,Payment10=?, Cap1=? , Cap2=? , Cap3=? , Agent2Cap1=?, Agent2Cap2=? , Agent2Cap3=? ,  CommissionBankNumber=? , CommissionTransitNumber=?  , CommissionAccountNumber=? where ID=? and BrokerID=?;";

		 try {

	            pst = conRDS.prepareStatement(UpdateRecord);
			
		        pst.setInt(1,     Record.TransactionID  );	
		        
		        pst.setString(2,  Record.RefoundAmount );	
		        
		        pst.setString(3,  Record.RefoundLabel  );	
		        
		        pst.setString(4,  Record.ListingCommission  );	
		        
		        pst.setString(5,  Record.SellingCommission );	
		        
		        pst.setString(6,  Record.TotalCommission );	
		         
		        pst.setString(7,  Record.Split1 );	
		        
		        pst.setString(8,  Record.Split2  );	
		        
		        pst.setString(9,  Record.Split3 );	
		        
		        pst.setString(10,  Record.Agent2Split1 );
		        
		        pst.setString(11,  Record.Agent2Split2 );
		        
		        pst.setString(12,  Record.Agent2Split3 );
		        
		        pst.setString(13,  Record.Allocation1 );
		        
		        pst.setString(14, Record.Allocation2 );	
		        
		        pst.setString(15, Record.NetPayment );	
		        
		        pst.setString(16, Record.NetHST );	
		        
		        pst.setString(17, Record.NetTotal );	
		        
		        pst.setString(18, Record.HST1 );	
		        
		        pst.setString(19, Record.HST2 );

		        pst.setString(20, Record.HST3 );	
		        
		        pst.setString(21, Record.HST4 );	
		        
		        pst.setString(22, Record.HST5);
		        
		        pst.setString(23, Record.HST6 );	
		        
		        pst.setString(24, Record.HST7 );	

		        pst.setString(25, Record.HST8 );	
		        
		        pst.setString(26, Record.HST9 );	

		        pst.setString(27, Record.HST10 );	
		        
		        pst.setString(28, Record.Payment1 );	
		        
		        pst.setString(29, Record.Payment2  );	
		        
		        pst.setString(30, Record.Payment3 );
		        
		        pst.setString(31, Record.Payment4  );
		        
		        pst.setString(32, Record.Payment5 );
			
		        pst.setString(33, Record.Payment6 );
		        
                pst.setString(34, Record.Payment7  );
		        
		        pst.setString(35, Record.Payment8 );

                pst.setString(36, Record.Payment9  );
		        
		        pst.setString(37, Record.Payment10 );
		        
	            pst.setString(38, Record.Cap1  );
		        
		        pst.setString(39, Record.Cap2 );
		        
		        pst.setString(40, Record.Cap3 );
		        
		        pst.setString(41, Record.Agent2Cap1 );
		        
		        pst.setString(42, Record.Agent2Cap2 );
		        
		        pst.setString(43, Record.Agent2Cap3 );
			
		        pst.setString(44, Record.CommissionBankNumber );
		        
                pst.setString(45, Record.CommissionTransitNumber  );
		        
		        pst.setString(46, Record.CommissionAccountNumber );
		        
		        pst.setInt(47, Record.ID );
		        
		        pst.setInt(48, Record.BrokerID );

			    pst.executeUpdate();
			    
		 } catch (SQLException e) { e.printStackTrace(); }

			 finally {  if (pst != null) {  try {  pst.close();   } 
				        
				        catch (SQLException e) { /* ignored */}
				    }
	}	

	
}



//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public RecordSheet SearchTradeRecordes( int TransactionID , int BrokerID ,Connection conRDS) { 
	
RecordSheet MyRecord= new RecordSheet();

//Connection conRDS = null;

//conRDS= CreateConnection();

PreparedStatement pst=null;
  
String SearchStatment="SELECT * FROM RecordSheet where TransactionID=? and BrokerID=?";

 try {
	 
	    pst = conRDS.prepareStatement(SearchStatment);
	    
	    pst.setInt(1, TransactionID);
	    
	    pst.setInt(2, BrokerID);
	    
	    ResultSet result = pst.executeQuery();
	
	    
	while ( result.next() ) {
		
		
		MyRecord.ID=result.getInt("ID");
		 
		MyRecord.RefoundAmount=result.getString("RefoundAmount");
		 
		MyRecord.RefoundLabel=result.getString("RefoundAmount");
		 
		MyRecord.ListingCommission=result.getString("ListingCommission");
		 
		MyRecord.SellingCommission=result.getString("SellingCommission");
		 
		MyRecord.TotalCommission=result.getString("TotalCommission");
		 
		MyRecord.Split1=result.getString("Split1");
		 
		MyRecord.Split2=result.getString("Split2");
		
		MyRecord.Split3=result.getString("Split3");
		 
		MyRecord.Agent2Split1=result.getString("Agent2Split1");
		
		MyRecord.Agent2Split2=result.getString("Agent2Split2");
		
		MyRecord.Agent2Split3=result.getString("Agent2Split3");
		 
		MyRecord.Allocation1=result.getString("Allocation1");
		 
		MyRecord.Allocation2=result.getString("Allocation2");
		 
		MyRecord.NetPayment=result.getString("NetPayment");
		 
		MyRecord.NetHST=result.getString("NetHST");
		 
		MyRecord.NetTotal=result.getString("NetTotal");
		 
		MyRecord.HST1=result.getString("HST1");
		 
		MyRecord.HST2=result.getString("HST2");
		 
		MyRecord.HST3=result.getString("HST3");
		 
		MyRecord.HST4=result.getString("HST4");
		 
		MyRecord.HST5=result.getString("HST5");
		 
		MyRecord.HST6=result.getString("HST6");
		 
		MyRecord.HST7=result.getString("HST7");
		 
		MyRecord.HST8=result.getString("HST8");
		
		MyRecord.HST9=result.getString("HST9");
		 
		MyRecord.HST10=result.getString("HST10");
		 
		MyRecord.Payment1=result.getString("Payment1");
		 
		MyRecord.Payment2=result.getString("Payment2");
		 
		MyRecord.Payment3=result.getString("Payment3");
		 
		MyRecord.Payment4=result.getString("Payment4");
		 
		MyRecord.Payment5=result.getString("Payment5");
		 
		MyRecord.Payment6=result.getString("Payment6");
		 
		MyRecord.Payment7=result.getString("Payment7");
		 
		MyRecord.Payment8=result.getString("Payment8");	
		
		MyRecord.Payment9=result.getString("Payment9");
		 
		MyRecord.Payment10=result.getString("Payment10");	
		
		MyRecord.BrokerID=result.getInt("BrokerID");	

		MyRecord.Cap1=result.getString("Cap1");
		 
		MyRecord.Cap2=result.getString("Cap2");
		
		MyRecord.Cap3=result.getString("Cap3");
		
		MyRecord.Agent2Cap1=result.getString("Agent2Cap1");
		 
		MyRecord.Agent2Cap3=result.getString("Agent2Cap2");
		
		MyRecord.Agent2Cap3=result.getString("Agent2Cap3");
		 
		MyRecord.CommissionBankNumber=result.getString("CommissionBankNumber");
		 
		MyRecord.CommissionTransitNumber=result.getString("CommissionTransitNumber");	
		
		MyRecord.CommissionAccountNumber=result.getString("CommissionAccountNumber");	
	

	}
	
} 
 
 catch (SQLException e) { e.printStackTrace(); }
 
 finally {
		
	    
	    if (pst != null) {  try {   pst.close();  } 
	        
	        catch (SQLException e) { /* ignored */}
	    }
  
	}	


return MyRecord;  }



//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public void DeleteParty( int TransactionID ,  int BrokerID  , int ID ,Connection conRDS) {
	

	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Parties where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		
		}	
		
	
}


//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteTransaction( int BrokerID , int  ID,Connection conRDS ) {

	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Transactions  where BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, BrokerID);
		    
		    pst.setInt(2, ID);

		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		 
		}	
			
	
	
	
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteInvoice(   int BrokerID , int  ID , int TransactionID ,Connection conRDS) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Invoices where DealID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
			
	
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteRecordSheet( int BrokerID , int TransactionID ,Connection conRDS ) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from RecordSheet where TransactionID=? and BrokerID=? ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    

		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
			
	
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteReferral( int BrokerID , int  ID , int TransactionID ,Connection conRDS ) {
	
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Referral where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		
		}	
			
	
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteRebate( int BrokerID , int  ID , int TransactionID ,Connection conRDS ) {
	
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Rebates where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		 
		}	
			

	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteLawyer(   int BrokerID , int  ID , int TransactionID  ,Connection conRDS) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Lawyers where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		   
		}	
			

	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteDeposit(  int BrokerID , int  ID , int TransactionID ,Connection conRDS ) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from Parties where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		 
		}	
		
	
	
	
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void DeleteBrokerage(  int BrokerID , int  ID , int TransactionID ,Connection conRDS) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from COOperatingBrokers where TransactionID=? and BrokerID=? and ID=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }

		}	
	
	
}


//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void AddNewAudit( AuditTrail Aduit ,Connection conRDS) {
	
	//Connection conRDS = null; 
	
	//conRDS= CreateConnection(); //Creating a connection to the database by calling the CreateConnection function
	
	PreparedStatement pst=null; //Creating a prepared statement for searching 
	  
	String AddNewAudit="INSERT INTO AuditTrail (  TransactionID , Description , Date , Type , BrokerID , UserID , UserFullName ) values (?,?,?,?,?,?,? );";

	 try {
         pst = conRDS.prepareStatement(AddNewAudit);

		    
	        pst.setInt(1,Aduit.TransactionID);
	        pst.setString(2,Aduit.Description);
	        pst.setString(3,Aduit.Date);
	        pst.setString(4,Aduit.Type);
	        pst.setInt(5,Aduit.BrokerID);
	        pst.setInt(6,Aduit.UserID);
	        pst.setString(7,Aduit.UserFullName);
	       

		    pst.executeUpdate();
			
		
	}//Close Try 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {  if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    
		 
		}	



}



//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public 	ArrayList<AuditTrail> SearchAuditTrail( int TransactionID , int BrokerID , String Type ,Connection conRDS) { 
	
ArrayList<AuditTrail> Trails = new ArrayList<AuditTrail>();

//Connection conRDS = null;

//conRDS= CreateConnection();

PreparedStatement pst=null;
  
String SearchStatment="SELECT * FROM AuditTrail where TransactionID=? and BrokerID=? and Type=?";

 try {
	 
	    pst = conRDS.prepareStatement(SearchStatment);
	    
	    pst.setInt(1, TransactionID);
	    
	    pst.setInt(2, BrokerID);
	    
	    pst.setString(3, Type);
	    
	    ResultSet result = pst.executeQuery();
	
	    
	while ( result.next() ) {
		
		AuditTrail MyRecord= new AuditTrail();
		
		MyRecord.ID=result.getInt("ID");
		 
		MyRecord.TransactionID=result.getInt("TransactionID");
		 
		MyRecord.Description=result.getString("Description");
		 
		MyRecord.Date=result.getString("Date");
		 
		MyRecord.Type=result.getString("Type");
		 
		MyRecord.BrokerID=result.getInt("BrokerID");
		 
		MyRecord.UserID=result.getInt("UserID");
		 
		MyRecord.UserFullName=result.getString("UserFullName");
		
		Trails.add(MyRecord);

	}
	
} 
 
 catch (SQLException e) { e.printStackTrace(); }
 
 finally {
		
	    
	    if (pst != null) {  try {   pst.close();  } 
	        
	        catch (SQLException e) { /* ignored */}
	    }
	    
	    
	}	


return Trails;  }


//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public void DeletAudit(  int BrokerID , String Type , int TransactionID , int ID ,Connection conRDS) {
	
	
	//Connection conRDS = null;

	//conRDS= CreateConnection();

	PreparedStatement pst=null;
	  
	String DeleteStatment="Delete from AuditTrail where TransactionID=? and BrokerID=? and ID=? and Type=? ; ";

	 try {
		 
		    pst = conRDS.prepareStatement(DeleteStatment);
		    
		    pst.setInt(1, TransactionID);
		    
		    pst.setInt(2, BrokerID);
		    
		    pst.setInt(3, ID);
		    
		    pst.setString(4, Type);
		    
		    pst.executeUpdate();
	
	     } 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally {
			
		    
		    if (pst != null) {  try {   pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    
		
		}	
		

	
	
}


//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

public void ReopenTransaction( int BrokerID , int ID ,String  Permanant ,String Status , Connection conRDS) {

    
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	//Creating Prepared statement for updating the password 
	
	PreparedStatement pst=null;
	
	//The following variable is an update statement to update the password in the database for that broker 
	  
	String UpdateTransaction="UPDATE Transactions set Permanent=?  ,PropertyStatus=?   where ID=? and  BrokerID=?" ;

	 try {
		 
		
		    pst = conRDS.prepareStatement( UpdateTransaction); //Preparing the statement for executing
		
		    //Adding the data to the ? Arguments of out statement
		    
		    pst.setString(1 ,  Permanant );
		    
		    pst.setString(2 ,  Status );

		    pst.setInt(3 , ID );
		    
		    pst.setInt(4, BrokerID );
		    
		    pst.executeUpdate();//Executing the update statement
	
	 }
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {   if (pst != null) {
			    	
			        try {  pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

		 
			}	
	System.out.println("Finish");
}



//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



public void UpdateLastCommmissionID( int BrokerID , int ID , int CommissionID ,Connection conRDS ) {

    
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	//Creating Prepared statement for updating the password 
	
	PreparedStatement pst=null;
	
	//The following variable is an update statement to update the password in the database for that broker 
	  
	String UpdateTransaction="UPDATE Transactions set LastCommissionID=?  where ID=? and  BrokerID=?" ;

	 try {
		 
		
		    pst = conRDS.prepareStatement( UpdateTransaction); //Preparing the statement for executing
		
		    //Adding the data to the ? Arguments of out statement
		    
		    pst.setInt(1 ,  CommissionID );

		    pst.setInt(2 , ID );
		    
		    pst.setInt(3, BrokerID );
		    
		    pst.executeUpdate();//Executing the update statement
	
	 }
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {   if (pst != null) {
			    	
			        try {   pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	
	System.out.println("Finish");
	
	
}





//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************






public void UpdateDealCommision( int BrokerID , int ID , int CommissionID ,Connection conRDS ) {

    
	//Connection conRDS = null;
	
	//conRDS= CreateConnection();
	
	//Creating Prepared statement for updating the password 
	
	PreparedStatement pst=null;
	
	//The following variable is an update statement to update the password in the database for that broker 
	  
	String UpdateTransaction="UPDATE Transactions set LastCommissionDealID=?  where ID=? and  BrokerID=?" ;

	 try {
		 
		
		    pst = conRDS.prepareStatement( UpdateTransaction); //Preparing the statement for executing
		
		    //Adding the data to the ? Arguments of out statement
		    
		    pst.setInt(1 ,  CommissionID );

		    pst.setInt(2 , ID );
		    
		    pst.setInt(3, BrokerID );
		    
		    pst.executeUpdate();//Executing the update statement
	
	 }
	 catch (SQLException e) { e.printStackTrace(); }

		 finally {   if (pst != null) {
			    	
			        try {   pst.close();   } 
			        
			        catch (SQLException e) { /* ignored */}   }
			    

			}	
	System.out.println("Finish");
	
	
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


// Here are Rewriting new functions 

public ArrayList<PendingDeals> AllReporData(int ID ,String permanent , Connection conRDS ) {

	
	ArrayList<PendingDeals> myDelas = new ArrayList<PendingDeals>();
	
	PreparedStatement pst=null;

    String Searchquery="SELECT * FROM Transactions  as a  LEFT JOIN Invoices as b on b.BrokerID = a.BrokerID and  b.DealID = a.ID left join RecordSheet as c on a.ID = c.TransactionID and  a.BrokerID = c.BrokerID left join CommissionDetails as d on a.ID = d.TransactionID and  d.ID = a.LastCommissionID where a.BrokerID=? and a.Permanent=? ;";

	 try {
		 
		    PendingDeals deals=new PendingDeals();
		 
		    pst = conRDS.prepareStatement(Searchquery);
		
		    pst.setInt(1, ID);
		    
		    pst.setString(2, permanent);

		    ResultSet result = pst.executeQuery();
		
			
		while ( result.next() ) {

			deals.id= result.getInt("a.ID");
			deals.AuthorType=result.getInt("a.AuthorType") ;
			deals.AuthorID= result.getInt("a.AuthorID");
			deals.MLS=result.getString("a.MLSNumber");
			deals.StreetName=result.getString("a.StreetName");
			deals.StreetNumber=result.getString("a.StreetNumber");
			deals.Unit= result.getString("a.Unit") ;
			deals.City=result.getString("a.City");
			deals.Province=result.getString("a.Province");
			deals.PostalCode=result.getString("a.PostalCode");
			deals.PropertyType= result.getString("a.PropertyType");
			deals.FirstAgent= result.getInt("a.FirstAgentID") ;
			deals.SecondAgent=result.getInt("a.SecondAgentID");
			deals.FirstAgentCommission= result.getString("a.FirstAgentCommission") ;
			deals.SecondAgentCommission=result.getString("a.SecondAgentCommission");
			deals.Price= result.getString("a.Price");
			deals.TransactionSource=result.getString("a.TransactionSource");
			deals.ListingType=result.getString("a.ListingType");
			deals.ListingDate=result.getString("a.ListingDate") ;
			deals.ClosingDate=result.getString("a.ClosingDate");
			deals.ListCommission= result.getString("a.ListCommission");
			deals.SellCommission= result.getString("a.SellCommission");
			deals.PropertyStatus= result.getString("a.PropertyStatus");
			deals.Agent1Sign=result.getString("a.AgentSign1");
			deals.Agent2Sign=result.getString("a.AgentSign2");
			deals.BrokerSign=result.getString("a.BrokerSign");
			deals.TransactionStatus=result.getString("a.TransactionStatus");
			deals.ExpirationDate=result.getString("a.ExpirationDate");
			deals.PropertyStatus=result.getString("a.PropertyStatus");
			deals.OfficeleadGrossCommission=result.getString("a.OfficeLeadGrossCommission");
			deals.OfficeLead=result.getInt("a.OfficeLead");
			deals.SellingOfficeleadGrossCommission=result.getString("a.SellingOfficeLeadGrossCommission");
			deals.SellingOfficeLead=result.getInt("a.SellingOfficeLead");
			deals.ListingOfficeleadGrossCommission=result.getString("a.ListingOfficeLeadGrossCommission");
			deals.ListingOfficeLead=result.getInt("a.ListingOfficeLead");
			deals.Notes=result.getString("a.Notes");
			deals.Permanent=result.getString("a.Permanent");
			deals.Role1=result.getString("a.FirstAgentRole");
			deals.Role2=result.getString("a.SecondAgentRole");
			deals.Description=result.getString("a.Descriptions");
			deals.ReferralFeeNote=result.getString("a.ReferralFeeNote");
			deals.OfferDate=result.getString("a.OfferDate");
			
			deals.OfferExpiretionDate=result.getString("a.OfferExpiretionDate");
			
			deals.OfferAcceptanceDate=result.getString("a.OfferAcceptanceDate");
			
			deals.ConditionExpirationDate=result.getString("a.ConditionExpirationDate");
			
			deals.ConditionCompletationDate=result.getString("a.ConditionCompletationDate");
			
			deals.OfferWithrawalDate=result.getString("a.OfferWithrawalDate");
			
			deals.InspectionDate=result.getString("a.InspectionDate");
			
			deals.AccupancyDate=result.getString("a.AccupancyDate");
			
			deals.OffMarketDate=result.getString("a.OffMarketDate");
			
			deals.progressMarks=result.getString("a.ProgressMarks");
		    
			deals.CreateDate=result.getString("a.CreateDate");
		    
			deals.FinalizedDate=result.getString("a.FinalizedDate");
			
			deals.LastCommissionID=result.getInt("a.LastCommissionID");
		    
			deals.LastCommissionDealID=result.getInt("a.LastCommissionDealID");

			deals.invoiceID=result.getInt("b.ID");
		    deals.SendStatus=result.getString("b.SendStatus");	
			deals.DealID=result.getInt("b.DealID");
			deals.Type=result.getString("b.Type");
			deals.Date=result.getString("b.date");
			deals.RecieverFirstName=result.getString("b.RecieverFirstName");
			deals.RecieverLastName=result.getString("b.RecieverLastName");
			deals.RecieverEmail=result.getString("b.RecieverEmail");
			deals.RUnit=result.getString("b.Unit");
			deals.RStreetName=result.getString("b.StreetName");
			deals.RStreetNumber=result.getString("b.StreetNumber");
			deals.RCity=result.getString("b.City");
			deals.RProvince=result.getString("b.Province");
			deals.RPostalCode=result.getString("b.PostalCode");
			deals.commissionPayable=result.getString("b.CommissionPayable");
			deals.HST=result.getString("b.HST");
			deals.Deposit=result.getString("b.Deposit");
			deals.Balance=result.getString("b.Balance");
		    deals.RCountry=result.getString("b.Country");

		    deals.RecordSheertID=result.getInt("c.ID");
			 
			deals.RefoundAmount=result.getString("c.RefoundAmount");
			 
			deals.RefoundLabel=result.getString("c.RefoundAmount");
			 
			deals.ListingCommission=result.getString("c.ListingCommission");
			 
			deals.SellingCommission=result.getString("c.SellingCommission");
			 
			deals.TotalCommission=result.getString("c.TotalCommission");
			 
			deals.Split1=result.getString("c.Split1");
			 
			deals.Split2=result.getString("c.Split2");
			
			deals.Split3=result.getString("c.Split3");
			 
			deals.Agent2Split1=result.getString("c.Agent2Split1");
			
			deals.Agent2Split2=result.getString("c.Agent2Split2");
			
			deals.Agent2Split3=result.getString("c.Agent2Split3");
			 
			deals.Allocation1=result.getString("c.Allocation1");
			 
			deals.Allocation2=result.getString("c.Allocation2");
			 
			deals.NetPayment=result.getString("c.NetPayment");
			 
			deals.NetHST=result.getString("c.NetHST");
			 
			deals.NetTotal=result.getString("c.NetTotal");
			 
			deals.HST1=result.getString("c.HST1");
			 
			deals.HST2=result.getString("c.HST2");
			 
			deals.HST3=result.getString("c.HST3");
			 
			deals.HST4=result.getString("c.HST4");
			 
			deals.HST5=result.getString("c.HST5");
			 
			deals.HST6=result.getString("c.HST6");
			 
			deals.HST7=result.getString("c.HST7");
			 
			deals.HST8=result.getString("c.HST8");
			
			deals.HST9=result.getString("c.HST9");
			 
			deals.HST10=result.getString("c.HST10");
			 
			deals.Payment1=result.getString("c.Payment1");
			 
			deals.Payment2=result.getString("c.Payment2");
			 
			deals.Payment3=result.getString("c.Payment3");
			 
			deals.Payment4=result.getString("c.Payment4");
			 
			deals.Payment5=result.getString("c.Payment5");
			 
			deals.Payment6=result.getString("c.Payment6");
			 
			deals.Payment7=result.getString("c.Payment7");
			 
			deals.Payment8=result.getString("c.Payment8");	
			
			deals.Payment9=result.getString("c.Payment9");
			 
			deals.Payment10=result.getString("c.Payment10");	
			
			deals.BrokerID=result.getInt("c.BrokerID");	

			deals.Cap1=result.getString("c.Cap1");
			 
			deals.Cap2=result.getString("c.Cap2");
			
			deals.Cap3=result.getString("c.Cap3");
			
			deals.Agent2Cap1=result.getString("c.Agent2Cap1");
			 
			deals.Agent2Cap3=result.getString("c.Agent2Cap2");
			
			deals.Agent2Cap3=result.getString("c.Agent2Cap3");
			 
			deals.CommissionBankNumber=result.getString("c.CommissionBankNumber");
			 
			deals.CommissionTransitNumber=result.getString("c.CommissionTransitNumber");	
			
			deals.CommissionAccountNumber=result.getString("c.CommissionAccountNumber");	
			
			myDelas.add(deals);
		}
		
	} 
	 
	 catch (SQLException e) { e.printStackTrace(); }
	 
	 finally { if (pst != null) {   try {  pst.close();  } 
		        
		        catch (SQLException e) { /* ignored */}  }
		    

		}	

return myDelas;

}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************



//public JSONArray get_all_Contacts(int ID, Connection conRDS) throws JSONException {
//	
//	     JSONArray   AllData = new JSONArray();
//
//	String SearchStatment="{?= CALL get_all_contacts(?)}";
//
//	java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);
//
//	pst.registerOutParameter(1, Types.OTHER );	
//	
//		     pst.setInt(2,ID);
//
//		     pst.execute();
//	
//	         String Result= (String) pst.getObject(1);
//	         
//	         
//	         org.json.JSONObject json = new  org.json.JSONObject(Result);   
//
//	         JSONArray LawFirms = json.getJSONArray("LawFirm");  
//	         
//	         JSONArray Clients = json.getJSONArray("Clients"); 
//	         
//	         JSONArray Brokerages = json.getJSONArray("Brokerages"); 
//	         
//	         JSONArray all = json.getJSONArray("all"); 
//	         
//	         //JSONArray  jsonArray = new JSONArray(Result);  
//	         
//	         
//	         AllData.put(LawFirms);
//	         
//	         AllData.put(Brokerages);
//	         
//	         AllData.put(Clients);
//	         
//	         AllData.put(all);
//
//	         return AllData ;	
//	
//	
//	
//	
//	
//}


public JSONObject GetAllContactsJSON( int UserID ,Connection conRDS) throws ParseException {

	//Connection conRDS2 = null;
	//conRDS2= CreateConnection();
	String Result = "";

 	CallableStatement proc = null;

 	JSONObject result = new JSONObject();
	 try {
		 
		 proc = conRDS.prepareCall("{ ? = call get_all_contacts(?) }");
		 proc.registerOutParameter(1, Types.OTHER);
		 proc.setInt(2, UserID);
		 proc.execute();
		 Result = (String) proc.getObject(1);


		 JSONParser parser = new JSONParser();  
		 result = (JSONObject) parser.parse(Result);   
		 proc.close();
		
	}catch (SQLException e) { e.printStackTrace(); 
	
	}finally {
			
		    
		    if (proc != null) {  try {   proc.close();  } 
		        
		        catch (SQLException e) { /* ignored */}
		    }
		    

		}	
	
	
	return result ;	
	
}


//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


public String SearchTransactionsForUser(int ID, String Permanent, Connection conRDS) throws ParseException {
	
	String Result = "";
	String SearchStatment="{?= CALL get_all_reports(?,?)}";
	try {


	java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);

	pst.registerOutParameter(1, Types.OTHER );	
	
		     pst.setInt(2,ID);
		     
		     pst.setString(3,Permanent);

		     pst.execute();
		     
		     System.out.println("Json returned: "+(String) pst.getObject(1));
		     
		     Result= (String) pst.getObject(1);
	
	         //String Result= "["+(String) pst.getObject(1)+"]";

	        // JSONArray  jsonArray = new JSONArray(Result);  
	
		    pst.close(); 
		 
		    }catch (SQLException e) { /* ignored */ return "Empty";	}
		    
	 return Result ;	

}

public String GetInvoiceData(int TransID, int ID, Connection conRDS) throws ParseException {
	
	String Result = "";
	System.out.println("params: "+TransID + ", "+ID);
	String SearchStatment="{?= CALL get_invoice_data(?,?)}";
	try {
		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);

		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,TransID);
		pst.setInt(3,ID);
		pst.execute();
		System.out.println("invoice returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
	}catch (SQLException e) { /* ignored */ return "Empty";	}
		    
	 return Result ;	

}

public String GetTRSData(int TransID, int ID, Connection conRDS) throws ParseException {
	
	String Result = "";
	System.out.println("params: "+TransID + ", "+ID);
	String SearchStatment="{?= CALL get_trs_deal(?,?)}";
	try {
		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);

		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,TransID);
		pst.setInt(3,ID);
		pst.execute();
		System.out.println("invoice returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
	}catch (SQLException e) { /* ignored */ return "Empty";	}
		    
	return Result ;	

}

public String GetTRSReferralData(int TransID, int ID, Connection conRDS) throws ParseException {
	
	String Result = "";
	String SearchStatment="{?= CALL get_referral_fee(?,?)}";
	try {
		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);

		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,TransID);
		pst.setInt(3,ID);
		pst.execute();
		System.out.println("invoice returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
	}catch (SQLException e) { /* ignored */ return "Empty";	}
		    
	return Result ;	

}

public String GetTRSOtherData(int TransID, int ID, Connection conRDS) throws ParseException {
	
	String Result = "";
	String SearchStatment="{?= CALL get_trs_appraisal(?,?)}";
	try {
		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);

		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,TransID);
		pst.setInt(3,ID);
		pst.execute();
		System.out.println("invoice returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
	}catch (SQLException e) { /* ignored */ return "Error";	}
		    
	return Result ;	

}

public String GetSortedReports(int TransID, String Permanent, String search_value, String date_type, String date_from, String date_to, String sort_by, String search, int page, int per_page, Connection conRDS) throws ParseException {
	//System.out.println("enter");
	System.out.println(TransID+", " + Permanent+", type: " + date_type+", from: " + date_from+", to: " + date_to+", sort: " + sort_by+", search: "+search +", "+ per_page+", " + page+", " + conRDS);
	String Result = "";
	String SearchStatment="{?= CALL get_filter_reports(?,?,?,?,?,?,?,?,?)}";

	DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	 Timestamp timeStampDate1 = null;
     Timestamp timeStampDate2 = null;
     
	try {
      if(!(date_from==null)) {
    	  Date date1 = formatter.parse(date_from);
    	  timeStampDate1 = new Timestamp(date1.getTime());
    	  System.out.println(timeStampDate1);
      }
	} catch (java.text.ParseException e) {
		 
		  System.out.println("Exception date_from : :" + e);
	} 
	try {
      if(!(date_to == null)) {
    	  Date date2 = formatter.parse(date_to);
    	  timeStampDate2 = new Timestamp(date2.getTime());
    	  System.out.println(timeStampDate2);
      }
	} catch (java.text.ParseException e) {
		 
		  System.out.println("Exception date_to :" + e);
	}


	try {
	
		//Timestamp timestamp1 = new Timestamp(date_from);
		//Timestamp timestamp2 = new Timestamp(date_to);
		//System.out.println(timestamp1);

		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);
		pst.registerOutParameter(1, Types.OTHER );	

		pst.setInt(2,TransID);
		pst.setString(3,Permanent);
		pst.setString(4,date_type);
		pst.setTimestamp(5,timeStampDate1);
		pst.setTimestamp(6,timeStampDate2);
		pst.setString(7,sort_by);
		pst.setInt(8,page);
		pst.setInt(9,per_page);
		pst.setString(10,search);

		pst.execute();
	
		System.out.println("Json returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
		
	}catch (SQLException e) { System.out.println(e);/* ignored */ return "Empty";	}
		    
	 return Result ;	

}

public String GetSortedCommissions(int TransID, String Permanent, String date_type, String date_from, String date_to, Connection conRDS) throws ParseException {
	//System.out.println("enter");
	System.out.println(TransID+", " + Permanent+", type: " + date_type+", from: " + date_from+", to: " + date_to+"  " + conRDS);
	String Result = "";
	String SearchStatment="{?= CALL get_all_deals_commissions(?,?,?,?,?)}";

	DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	 Timestamp timeStampDate1 = null;
     Timestamp timeStampDate2 = null;
     
	try {
      if(!(date_from==null)) {
    	  Date date1 = formatter.parse(date_from);
    	  timeStampDate1 = new Timestamp(date1.getTime());
    	  System.out.println(timeStampDate1);
      }
	} catch (java.text.ParseException e) {
		 
		  System.out.println("Exception date_from : :" + e);
	} 
	try {
      if(!(date_to == null)) {
    	  Date date2 = formatter.parse(date_to);
    	  timeStampDate2 = new Timestamp(date2.getTime());
    	  System.out.println(timeStampDate2);
      }
	} catch (java.text.ParseException e) {
		 
		  System.out.println("Exception date_to :" + e);
	}

	try {

		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);
		pst.registerOutParameter(1, Types.OTHER );	

		pst.setInt(2,TransID);
		pst.setString(3,Permanent);
		pst.setString(4,date_type);
		pst.setTimestamp(5,timeStampDate1);
	    pst.setTimestamp(6,timeStampDate2);

		pst.execute();
	
		System.out.println("Json returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
		
	}catch (SQLException e) { System.out.println(e);/* ignored */ return "Empty";	}
		    
	 return Result ;	

}
public String GetDashboardDeals(int TransID, Connection conRDS) throws ParseException {
	//System.out.println("enter");
	System.out.println(TransID+", " + conRDS);
	String Result = "";
	String SearchStatment="{?= CALL get_dashboard(?)}";

	try {

		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);
		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,TransID);
		pst.execute();
	
		System.out.println("Json returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
		
	}catch (SQLException e) { System.out.println(e);/* ignored */ return "Empty";	}
		    
	 return Result ;	

}

public String GetUsersCommissions(int UserID, Connection conRDS) throws ParseException {
	//System.out.println("enter");
	String Result = "";
	String SearchStatment="{?= CALL get_user_commission(?)}";

	try {

		java.sql.CallableStatement pst = conRDS.prepareCall(SearchStatment);
		pst.registerOutParameter(1, Types.OTHER );	
		pst.setInt(2,UserID);
		pst.execute();
	
		System.out.println("Json returned: "+(String) pst.getObject(1));
		Result= (String) pst.getObject(1);
		pst.close(); 
		
	}catch (SQLException e) { System.out.println(e);/* ignored */ return "Empty";	}
		    
	return Result ;	

}



}













