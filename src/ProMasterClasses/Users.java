package ProMasterClasses;

import java.sql.Timestamp;

//This class is to get user's information from the data base /

public class Users {
	
public int id;	
public int Broker_id;
public String Firstname;
public String Lastname;
public Timestamp User_Anniversary;	
public String User_Cap;	
public String User_PaymentMethod;	
public String User_Bank;	
public String User_Institution;	
public String User_Split;	
public String User_Transit;
public String User_Split2;	
public String User_Cap2;	
public String User_Split3;	
public String User_Cap3;	
public String User_AccountNumber;	
public String User_StreetName;	
public String User_StreetNumber;	
public String User_Unit;	
public String User_City;	
public String User_Province;	
public String User_PostalCode;	
public String User_Country;	
public String User_Phone;	
public String User_faxOrMobile;	
public String User_faxOrMobileNumber;	
public String User_Email;	
public String User_password;	
public String User_Status;
public Timestamp User_StartDate;	
public Timestamp User_TerminateDate;	
public String Type;	
public String FirstLogin;	
public String Title;	
public Timestamp DateOfBirth;	
public String PREC;	
public String AlternativeBroker;
public Timestamp StratAlternativeBroker;	
public Timestamp EndAlternativeBroker;
public String HST;
public String SinNumber;
public String AccountName;



public Users(){
	
	this.id=0;	
	this.Broker_id=0;
	this.Firstname="";	
	this.Lastname="";	
    this.User_Anniversary=null;	
    this.User_Cap="";	
	this.User_PaymentMethod="";	
	this.User_Bank="";	
	this.User_Institution="";	
	this.User_Split="";	
	this.User_Transit="";	
    this.User_AccountNumber="";	
    this.User_StreetName="";
    this.User_StreetNumber="";
    this.User_Unit="";	
	this.User_City="";	
    this.User_Province="";	
    this.User_PostalCode="";
    this.User_Country="";
    this.User_faxOrMobile="";	
    this.User_faxOrMobileNumber="";
    this.User_Email="";	
	this.User_password="";	
	this.User_Status="";
	this.User_Split2="";
	this.User_Split3="";
	this.User_Cap2="";
	this.User_Cap3="";
	this.User_StartDate=null;	
    this.User_TerminateDate=null;	
    this.Type="";
    this.FirstLogin="";
    this.Title=""; 
    this.DateOfBirth=null;		
    this.PREC="";		
    this.AlternativeBroker="";	
    this.StratAlternativeBroker=null;		
    this.EndAlternativeBroker=null;
    this.HST="";
    this.SinNumber="";
    this.AccountName="";
	
}

public Users (
		int id,		
		int Brokerid,	
        String Firstname,
        String Lastname,
        Timestamp Anniversary,	
        String Cap,	
        String PaymentMethod,	
        String Bank,	
        String Institution,
        String Split,	
        String Transit,	
        String AccountNumber,	
        String Streetname,
        String Streetnumber,
        String Unit,	
        String City,	
        String Province,	
        String PostalCode,	
        String Country,
        String Phone,	
        String FaxOrMobile,	
        String FaxOrMoNumber,	
        String Email,	
        String password,
        String Status,
        String Cap2,
        String Cap3,
        String Split2,
        String Split3,
        Timestamp Startdate,
        Timestamp Terminatedate,
        String Type,
        String FirtsLogin,
        String Title,	
        Timestamp DateOfBirth,
	    String PREC,	
	    String AlternativeBroker,
	    Timestamp StratAlternativeBroker,	
	    Timestamp EndAlternativeBroker,
		String HST,
	    String SinNumber,
		String AccountName
        
		){
	this.id=id;	
	this.Broker_id=Brokerid;	
	this.Firstname=Firstname;	
	this.Lastname=Lastname;
    this.User_Anniversary=Anniversary;	
    this.User_Cap=Cap;	
	this.User_PaymentMethod=PaymentMethod;	
	this.User_Bank=Bank;	
	this.User_Institution=Institution;	
	this.User_Split=Split;	
	this.User_Transit=Transit;	
    this.User_AccountNumber=AccountNumber;	
    this.User_StreetName=Streetname;	
    this.User_StreetNumber=Streetnumber;	
    this.User_Unit=Unit;	
	this.User_City=City;	
    this.User_Province=Province;	
    this.User_PostalCode=PostalCode;
    this.User_Country=Country;
    this.User_Phone=Phone;	
    this.User_faxOrMobile=FaxOrMobile;	
    this.User_faxOrMobileNumber=FaxOrMoNumber;	
    this.User_Email=Email;	
	this.User_password=password;	
	this.User_Status=Status;
	this.User_Split2=Split2;
	this.User_Split3=Split3;
	this.User_Cap2=Cap2;
	this.User_Cap3=Cap3;
	this.User_StartDate=Startdate;	
    this.User_TerminateDate=Terminatedate;	
    this.Type=Type;
    this.FirstLogin=FirtsLogin;
    this.Title=Title; 
    this.DateOfBirth=DateOfBirth;		
    this.PREC=PREC;		
    this.AlternativeBroker=AlternativeBroker;	
    this.StratAlternativeBroker=StratAlternativeBroker;		
    this.EndAlternativeBroker=EndAlternativeBroker;	
    this.HST=HST;
    this.SinNumber=SinNumber;
    this.AccountName=AccountName;
}


	
//**********************************************************************************************//


	
	

}
