package ProMasterClasses;

import java.sql.Timestamp;

public class Deposits {
	
	
	public int ID;
	public String Amount;
	public String Type;
	public Timestamp Date;
	public String Reference;
	public String RecievedFrom;
	public String Relationship;
	public String Unit;
	public String StreetNumber;
	public String StreetName;
	public String City;
	public String PostalCode;
	public String Province;
	public String Country;
	public String Email;
	public String ExtraContact;
	public String ExtraContactNumber;
	public String Phone;
	public int    TransactionID;
	public int    BrokerID;
	public String FirstName;
	public String LastName;
	public String Fintrac;

	
	
	
public	Deposits() {
	
	this.ID=0;
	this.Amount="";
	this.Type="";
	this.Date=null;
	this.Reference="";
	this.RecievedFrom="";
	this.Relationship="";
	this.Unit="";
	this.StreetNumber="";
	this.StreetName="";
	this.City="";
	this.Province="";
	this.Country="";
	this.Email="";
	this.ExtraContact="";
	this.ExtraContactNumber="";
	this. Phone="";
	this.TransactionID=0;
	this.BrokerID=0;
	this.FirstName="";
	this.LastName="";
	this.PostalCode="";
	this.Fintrac="";
}
	
	
public	Deposits( int ID,String Amount,String Type,Timestamp Date,String Reference,String RecievedFrom,String Relationship,String Unit,String StreetNumber,String StreetName,String City,String PostalCode,String Province,String Country,String Email,String ExtraContact,
		
		String ExtraContactNumber,String Phone,int TransactionID , int BrokerID , String FirstName, String LastName ,String Fintrac) {
	
	this.ID=ID;
	this.Amount=Amount;
	this.Type=Type;
	this.Date=Date;
	this.Reference=Reference;
	this.RecievedFrom=RecievedFrom;
	this.Relationship=Relationship;
	this.Unit=Unit;
	this.StreetNumber=StreetNumber;
	this.StreetName=StreetName;
	this.City=City;
	this.Province=Province;
	this.Country=Country;
	this.Email=Email;
	this.ExtraContact=Email;
	this.ExtraContactNumber=ExtraContactNumber;
	this. Phone=Phone;
	this.TransactionID=TransactionID;	
	this.BrokerID=BrokerID;
	this.FirstName=FirstName;
	this.LastName=LastName;
	this.PostalCode=PostalCode;
	this.Fintrac=Fintrac;
	
}
	

}
