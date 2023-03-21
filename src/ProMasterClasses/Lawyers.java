package ProMasterClasses;

public class Lawyers {

	
public int ID;
public String LawFirm;
public String Lawyer;
public String Phone;
public String Unit; 
public String StreetNumber;
public String StreetName;
public String City;
public String PostalCode;
public String Province;
public String Email;
public String ExtraContact;
public String ExtraContactNumber;
public String ClerkFullName;
public String ClerkEmail;
public String Role;
public int TransactionID;
public int BrokerID;

	
	public Lawyers() {
		
			
		 this.ID=0;
		 this.LawFirm="";
		 this.Lawyer="";
		 this.Phone="";
		 this.Unit="";
	     this.StreetNumber="";
		 this.StreetName="";
		 this.City="";
		 this.PostalCode="";
		 this.Province="";
		 this.Email="";
		 this.ExtraContact="";
		 this.ExtraContactNumber="";
		 this.ClerkFullName="";
		 this.ClerkEmail="";
		 this.Role="";
		 this.TransactionID=0;	
		 this.BrokerID=0;	
		
		
	}
	
	
	public Lawyers(
			
			 int ID,
			 String LawFirm,
			 String Lawyer,
			 String Phone,
			 String Unit,
		     String StreetNumber,
			 String StreetName,
			 String City,
			 String PostalCode,
			 String Province,
			 String Email,
			 String ExtraContact,
			 String ExtraContactNumber,
			 String ClerkFullName,
			 String ClerkEmail,
			 String Role,
			 int TransactionID ) {
		
		 this.ID=ID;
		 this.LawFirm=LawFirm;
		 this.Lawyer=Lawyer;
		 this.Phone=Phone;
		 this.Unit=Unit;
	     this.StreetNumber=StreetNumber;
		 this.StreetName=StreetName;
		 this.City=City;
		 this.PostalCode=PostalCode;
		 this.Province=Province;
		 this.Email=Email;
		 this.ExtraContact=ExtraContact;
		 this.ExtraContactNumber=ExtraContactNumber;
		 this.ClerkFullName=ClerkFullName;
		 this.ClerkEmail=ClerkEmail;
		 this.Role=Role;
		 this.TransactionID=0;	
		 this.BrokerID=0;
		
		
	}
	
	
	
}
