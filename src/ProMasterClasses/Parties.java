package ProMasterClasses;

public class Parties {

	public int ID;	
	public String Firstname;
	public String Lastname;
	public String BusinessName;
	public String OfficerFullName;	
	public String Unit;	
	public String streetName;	
	public String StreetNumber;	
	public String City;	
	public String Province;
	public String PostalCode;	
	public String Country;	
	public String Email;	
	public String Phone;	
	public String FaxEmail;	
	public String FaxEmailNumber;	
	public String Type;
	public int DealID;
	public String partyRole;
	public int BrokerID;
	public String Powerofattorney;
	
	
	public Parties(){
		 this.ID=0;	
		 this.Firstname="";
		 this.Lastname="";
		 this.BusinessName="";
		 this.OfficerFullName="";	
		 this.Unit="";	
		 this.streetName="";	
		 this.StreetNumber="";	
		 this.City="";	
		 this.Province="ON";
		 this.PostalCode="";	
		 this.Country="Canada";	
		 this.Email="";	
		 this.Phone="";	
		 this.FaxEmail="Mobile";	
		 this.FaxEmailNumber="";	
		 this.Type="Individual";
		 this.DealID=0;
		 this.partyRole=""; 
		 this.BrokerID=0;
		 this.Powerofattorney="";
	}
	
	
	
	
	public Parties(

			int id, 
			
			String Type,
			
			String BusinessName,
			
			String OfficerName,
			
			String FirstName,
			
			String LastName,
			
			String streetName,

			String StreetNumber, 
			
			String unit,

			String City, 
			
			String Province,
			
			String PostalCode,
			
			String Country,
			
			String Phone,
			
			String FaxEmail,
			
			String FaxEmailNumber,
			
			String Email,
			
			String partyRole,

			int DealID,
			
			int BrokerID,
			
			String Powerofattorney
			
			){
		
		 this.ID=id;	
		 this. Firstname=FirstName;
		 this.Lastname=LastName;
		 this.BusinessName=BusinessName;
		 this.OfficerFullName=OfficerName;	
		 this.Unit=unit;	
		 this.streetName=streetName;	
		 this.StreetNumber=StreetNumber;	
		 this.City=City;	
		 this.Province=Province;
		 this.PostalCode=PostalCode;	
		 this.Country=Country;	
		 this.Email=Email;	
		 this.Phone=Phone;	
		 this.FaxEmail=FaxEmail;	
		 this.FaxEmailNumber=FaxEmailNumber;	
		 this.Type=Type;
		 this.DealID=DealID; 
		 this.partyRole=partyRole;  
		 this.BrokerID=BrokerID; 
		 this.Powerofattorney=Powerofattorney;
		 
	}	
	
	
	
	
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getFirstname() {
		return Firstname;
	}
	public void setFirstname(String firstname) {
		Firstname = firstname;
	}
	public String getLastname() {
		return Lastname;
	}
	public void setLastname(String lastname) {
		Lastname = lastname;
	}
	public String getBusinessName() {
		return BusinessName;
	}
	public void setBusinessName(String businessName) {
		BusinessName = businessName;
	}
	public String getOfficerFullName() {
		return OfficerFullName;
	}
	public void setOfficerFullName(String officerFullName) {
		OfficerFullName = officerFullName;
	}
	public String getUnit() {
		return Unit;
	}
	public void setUnit(String unit) {
		Unit = unit;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getStreetNumber() {
		return StreetNumber;
	}
	public void setStreetNumber(String streetNumber) {
		StreetNumber = streetNumber;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getFaxEmail() {
		return FaxEmail;
	}
	public void setFaxEmail(String faxEmail) {
		FaxEmail = faxEmail;
	}
	public String getFaxEmailNumber() {
		return FaxEmailNumber;
	}
	public void setFaxEmailNumber(String faxEmailNumber) {
		FaxEmailNumber = faxEmailNumber;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public int getDealID() {
		return DealID;
	}
	public void setDealID(int dealID) {
		DealID = dealID;
	}	
	

}
