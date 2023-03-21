package ProMasterClasses;

public class CooperatingBrokerage {
	
	
	public int ID;
	public String Brokerage;
	public String AgentName;
	public String phone;
	public String unit;
	public String StreetName;
	public String StreetNumber;
	public String City;
	public String Province;
	public String PostalCode;
	public String Email;
	public String ExtraContact;
	public String ExtraContactNumber;
	public int TransactionID;
	public String HSTPercentage;
	public int BrokerID;
	
	public CooperatingBrokerage(){
		
	   this.ID=0;
	   this.Brokerage="";
	   this.AgentName="";
	   this.phone="";
	   this.unit="";
	   this.StreetName="";
	   this.StreetNumber="";
	   this.City="";
	   this.Province="";
	   this.PostalCode="";
	   this.Email="";
	   this.ExtraContact="";
	   this.ExtraContactNumber="";
	   this.TransactionID=0;
	   this.HSTPercentage="";
	   this.BrokerID=0;
		
	}
	
	
	public CooperatingBrokerage( int ID,String Brokerage,String AgentName,String phone,String unit,String StreetName,String StreetNumber, String City,String Province,String PostalCode,String Email,String ExtraContact,String ExtraContactNumber,int TransactionID,String HSTPercentage, int BrokerID){
		
		   this.ID=ID;
		   this.Brokerage=Brokerage;
		   this.AgentName=AgentName;
		   this.phone=phone;
		   this.unit=unit;
		   this.StreetName=StreetName;
		   this.StreetNumber=StreetNumber;
		   this.City=City;
		   this.Province=Province;
		   this.PostalCode=PostalCode;
		   this.Email=Email;
		   this.ExtraContact=ExtraContact;
		   this.ExtraContactNumber=ExtraContactNumber;
		   this.TransactionID=TransactionID;	
		   this.HSTPercentage=HSTPercentage;
		   this.BrokerID=BrokerID;
		}
	
	
	
	
	

}
