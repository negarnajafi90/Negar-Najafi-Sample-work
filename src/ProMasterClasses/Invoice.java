package ProMasterClasses;

import java.sql.Timestamp;

public class Invoice {
	
	public int ID;
	public int BrokerID;	
	public int DealID;
	public String SendStatus;	
	public String Type;
	public Timestamp Date;
	public String RecieverFirstName;
	public String RecieverLastName;
	public String RecieverEmail;
	public String Unit;
	public String StreetName;
	public String StreetNumber;
	public String City;
	public String Province;
	public String PostalCode;
	public String Country;
	public String SalesPrice;
	public String commissionPayable;	
	public String HST;	
	public String Deposit;
	public String Balance;	
	public Timestamp ClosingDate;
	
	public String Party1;
	
	public String Party2;
	
	
	

	public Invoice(){
		
		
		this. ID=0;
	    this. SendStatus="";	
		this. DealID=0;
		this. Type="";
		this. Date=null;
		this. RecieverFirstName="";
		this. RecieverLastName="";
		this. RecieverEmail="";
		this. Unit="";
		this. StreetName="";
		this. StreetNumber="";
		this. City="";
		this. Province="";
		this. PostalCode="";
		this. Country="";
		this. SalesPrice="";
		this. commissionPayable="";
		this. HST="";	
		this. Deposit="";
		this. Balance="";	
		this. BrokerID=0;
		this. ClosingDate=null;
		
		this. Party1="";
		
		this. Party2="";

	  }
	
	public Invoice( 
			
			  int ID,
			  int BrokerID,
			  int DealID,
			  String SendStatus,	
			  String Type,
			  Timestamp Date,
			  String RecieverFirstName,
			  String RecieverLastName,
			  String RecieverEmail,
			  String Unit,
			  String StreetName,
			  String StreetNumber,
			  String City,
			  String Province,
			  String PostalCode,
			  String Country,
			  String SalesPrice,
			  String commissionPayable,	
			  String HST,	
			  String Deposit,
			  String Balance,	
			  Timestamp ClosingDate,
				  String Party1 ,
				
				  String Party2 
				

			){
		
		
		this. ID= ID;
	    this. SendStatus=SendStatus;	
		this. DealID=DealID;
		this. Type=Type;
		this. Date=Date;
		this. RecieverFirstName=RecieverFirstName;
		this. RecieverLastName=RecieverLastName;
		this. RecieverEmail=RecieverEmail;
		this. Unit=Unit;
		this. StreetName=StreetName;
		this. StreetNumber=StreetNumber;
		this. City=City;
		this. Province=Province;
		this. PostalCode=PostalCode;
		this. SalesPrice=SalesPrice;
		this. commissionPayable=commissionPayable;	
		this. HST=HST;	
		this. Deposit=Deposit;
		this. Balance=Balance;	
		this. BrokerID=BrokerID;
		this. ClosingDate=ClosingDate;
	    this. Country=Country;
	    
		this. Party1=Party1;
		
		this. Party2=Party2;
		

		
	     }

	


	
}
