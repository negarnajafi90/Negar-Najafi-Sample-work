package ProMasterClasses;

public class Referral {
	
	
	public int ID; 
	public String RecipientRegistrant;
	public String DisclosedToAllParties;
	public String Amount;
	public String Agent1Percentage;
	public String Agent2Percentage;
	public String FirstName;
	public String LastName;
	public String Brokerage;
	public String Phone;
	public String ExtraContactNumber;
	public String ExtraContact;
	public String StreetName;
	public String StreetNumber;
	public String Unit;
	public String City;
	public String Province;
	public String PostalCode;
	public String Country;
	public String Email;
	public String HST1;
	public String HST2;
	public int TransactionID; 
	//public String HSTPercentage;
	public int BrokerID; 
	
	
	
	
	public Referral() {
		
		
		this.ID=0; 
		this.RecipientRegistrant="";
		this.DisclosedToAllParties="";
		this.Amount="";
		this.Agent1Percentage="";
		this.Agent2Percentage="";
		this.FirstName="";
		this.LastName="";
		this.Brokerage="";
		this.Phone="";
		this.ExtraContactNumber="";
		this.ExtraContact="";
		this.StreetName="";
		this.StreetNumber="";
		this.Unit="";
		this.City="";
		this.Province="";
		this.PostalCode="";
		this.Country="";
		this.Email="";
		this.HST1="";
		this.HST2="";
		this.TransactionID=0;
		//this.HSTPercentage="";
		this.BrokerID=0;
		
		
		
		
	}
	
	
	public Referral(
			int ID, 
			String RecipientRegistrant,
			String DisclosedToAllParties,
			String Amount,
			String Agent1Percentage,
			String Agent2Percentage,
			String FirstName,
			String LastName,
			String Brokerage,
			String Phone,
			String ExtraContactNumber,
			String ExtraContact,
			String StreetName,
			String StreetNumber,
			String Unit,
			String City,
			String Province,
			String PostalCode,
			String Country,
			String Email,
			String HST1,
			String HST2,
			int TransactionID ,
			//String HSTPercentage,
			int BrokerID
			
			) {
		
		
		this.ID=ID;; 
		this.RecipientRegistrant=RecipientRegistrant;
		this.DisclosedToAllParties="";
		this.Amount=DisclosedToAllParties;
		this.Agent1Percentage=Agent1Percentage;
		this.Agent2Percentage=Agent2Percentage;
		this.FirstName=FirstName;
		this.LastName=LastName;
		this.Brokerage=Brokerage;
		this.Phone=Phone;
		this.ExtraContactNumber=ExtraContactNumber;
		this.ExtraContact=ExtraContact;
		this.StreetName=StreetName;
		this.StreetNumber=StreetNumber;
		this.Unit=Unit;
		this.City=City;
		this.Province=Province;
		this.PostalCode=PostalCode;
		this.Country=Country;
		this.Email=Email;
		this.HST1=HST1;
		this.HST2=HST2;
		this.TransactionID=TransactionID;
		//this.HSTPercentage=HSTPercentage;
		this.BrokerID=BrokerID;
		
		
	}
	

}
