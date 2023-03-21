package ProMasterClasses;

public class Companies {

	public int ID;
	public String BusinessName;
	public String FiscalYearEnd;
	public String Unit;
	public String StreetNumber;
	public String StreetName;
	public String City;
	public String Province;
	public String PostalCode;
	public String Email;
	public String Phone;
	public String HSTNumberPart1;
	public String HSTNumberPart2;
	public String RealEstateTrustBankNumber;
	public String RealEstateTrustTransitNumber;
	public String RealEstateTrustAccountNumber;
	public String RealEstateTrustAccountName2;
	public String RealEstateTrustAccountNikname2;
	public String RealEstateTrustBankNumber2;
	public String RealEstateTrustTransitNumber2;
	public String RealEstateTrustAccountNumber2;
	public String CommissionBankNumber;
	public String CommissionTransitNumber;
	public String CommissionAccountNumber;
	public String GeneralAccountBankNumber;
	public String GeneralAccountTransitNumber;
	public String GeneralAccountAccountNumber;
	public int BrokerID;
	public int TransactionID;
	public  String Temp;

	
	public Companies(){
		
		this.ID=0;
		this.BusinessName="";
		this.FiscalYearEnd="";
	    this.Unit="";
		this.StreetNumber="";
	    this.StreetName="";
		this.City="";
	    this.Province="";
		this.PostalCode="";
		this.Email="";
		this.Phone="";
		this.HSTNumberPart1="";
	    this.HSTNumberPart2="";
	    this.RealEstateTrustBankNumber="";
		this.RealEstateTrustTransitNumber="";
		this.RealEstateTrustAccountNumber="";
		this.RealEstateTrustAccountName2="";
		this.RealEstateTrustAccountNikname2="";
		this.RealEstateTrustBankNumber2="";
		this.RealEstateTrustTransitNumber2="";
	    this.RealEstateTrustAccountNumber2=""; 	
		this.CommissionBankNumber="";
		this.CommissionTransitNumber="";
	    this.CommissionAccountNumber="";
	    this.GeneralAccountBankNumber="";
		this.GeneralAccountTransitNumber="";
		this.GeneralAccountAccountNumber="";
		this.BrokerID=0;
		this.TransactionID=0;
		this.Temp="";
	
		
	}
	
	
	
	public Companies(
			
			 int ID,
			 String BusinessName,
			 String FiscalYearEnd,
		     String Unit,
			 String StreetNumber,
		     String StreetName,
			 String City,
			 String Province,
			 String PostalCode,
			 String Email,
			 String Phone,
			 String HSTNumberPart1,
		     String HSTNumberPart2,
		     String RealEstateTrustBankNumber,
			 String RealEstateTrustTransitNumber,
			 String RealEstateTrustAccountNumber,
		     String RealEstateTrustAccountName2,
	         String RealEstateTrustAccountNikname2,
			 String RealEstateTrustBankNumber2,
			 String RealEstateTrustTransitNumber2,
			 String RealEstateTrustAccountNumber2,
			 String CommissionBankNumber,
			 String CommissionTransitNumber,
		     String CommissionAccountNumber,
		     String GeneralAccountBankNumber,
			 String GeneralAccountTransitNumber,
			 String GeneralAccountAccountNumber,
			 int BrokerID , int TransactionID, String Temp	){
		
		
		
		
		 this.ID=ID;
		 this.BusinessName=BusinessName;
		 this.FiscalYearEnd=FiscalYearEnd;
	     this.Unit=Unit;
		 this.StreetNumber=StreetNumber;
	     this.StreetName=StreetName;
		 this.City=City;
		 this.Province=Province;
		 this.PostalCode=PostalCode;
		 this.Email=Email;
		 this.Phone=Phone;
		 this.HSTNumberPart1=HSTNumberPart1;
	     this.HSTNumberPart2=HSTNumberPart2;
	     this.RealEstateTrustBankNumber=RealEstateTrustBankNumber;
		 this.RealEstateTrustTransitNumber=RealEstateTrustTransitNumber;
		 this.RealEstateTrustAccountNumber=RealEstateTrustAccountNumber;
		 this.RealEstateTrustAccountName2=RealEstateTrustAccountName2;
		 this.RealEstateTrustAccountNikname2=RealEstateTrustAccountNikname2;
		 this.RealEstateTrustBankNumber2=RealEstateTrustBankNumber2;
		 this.RealEstateTrustTransitNumber2=RealEstateTrustTransitNumber2;
		 this.RealEstateTrustAccountNumber2=RealEstateTrustAccountNumber2; 
		 this.CommissionBankNumber=CommissionBankNumber;
		 this.CommissionTransitNumber=CommissionTransitNumber;
	     this.CommissionAccountNumber=CommissionAccountNumber;
	     this.GeneralAccountBankNumber=GeneralAccountBankNumber;
		 this.GeneralAccountTransitNumber=GeneralAccountTransitNumber;
		 this. GeneralAccountAccountNumber=GeneralAccountAccountNumber; 
		 this.BrokerID=BrokerID;
		 this.TransactionID=TransactionID;
		 
		 this.Temp=Temp;
		 
	                  }



	public int getID() {
		return ID;
	}



	public void setID(int iD) {
		ID = iD;
	}



	public String getBusinessName() {
		return BusinessName;
	}



	public void setBusinessName(String businessName) {
		BusinessName = businessName;
	}



	public String getFiscalYearEnd() {
		return FiscalYearEnd;
	}



	public void setFiscalYearEnd(String fiscalYearEnd) {
		FiscalYearEnd = fiscalYearEnd;
	}



	public String getUnit() {
		return Unit;
	}



	public void setUnit(String unit) {
		Unit = unit;
	}



	public String getStreetNumber() {
		return StreetNumber;
	}



	public void setStreetNumber(String streetNumber) {
		StreetNumber = streetNumber;
	}



	public String getStreetName() {
		return StreetName;
	}



	public void setStreetName(String streetName) {
		StreetName = streetName;
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



	public String getHSTNumberPart1() {
		return HSTNumberPart1;
	}



	public void setHSTNumberPart1(String hSTNumberPart1) {
		HSTNumberPart1 = hSTNumberPart1;
	}



	public String getHSTNumberPart2() {
		return HSTNumberPart2;
	}



	public void setHSTNumberPart2(String hSTNumberPart2) {
		HSTNumberPart2 = hSTNumberPart2;
	}



	public String getRealEstateTrustBankNumber() {
		return RealEstateTrustBankNumber;
	}



	public void setRealEstateTrustBankNumber(String realEstateTrustBankNumber) {
		RealEstateTrustBankNumber = realEstateTrustBankNumber;
	}



	public String getRealEstateTrustTransitNumber() {
		return RealEstateTrustTransitNumber;
	}



	public void setRealEstateTrustTransitNumber(String realEstateTrustTransitNumber) {
		RealEstateTrustTransitNumber = realEstateTrustTransitNumber;
	}



	public String getRealEstateTrustAccountNumber() {
		return RealEstateTrustAccountNumber;
	}



	public void setRealEstateTrustAccountNumber(String realEstateTrustAccountNumber) {
		RealEstateTrustAccountNumber = realEstateTrustAccountNumber;
	}



	public String getCommissionBankNumber() {
		return CommissionBankNumber;
	}



	public void setCommissionBankNumber(String commissionBankNumber) {
		CommissionBankNumber = commissionBankNumber;
	}



	public String getCommissionTransitNumber() {
		return CommissionTransitNumber;
	}



	public void setCommissionTransitNumber(String commissionTransitNumber) {
		CommissionTransitNumber = commissionTransitNumber;
	}



	public String getCommissionAccountNumber() {
		return CommissionAccountNumber;
	}



	public void setCommissionAccountNumber(String commissionAccountNumber) {
		CommissionAccountNumber = commissionAccountNumber;
	}



	public String getGeneralAccountBankNumber() {
		return GeneralAccountBankNumber;
	}



	public void setGeneralAccountBankNumber(String generalAccountBankNumber) {
		GeneralAccountBankNumber = generalAccountBankNumber;
	}



	public String getGeneralAccountTransitNumber() {
		return GeneralAccountTransitNumber;
	}



	public void setGeneralAccountTransitNumber(String generalAccountTransitNumber) {
		GeneralAccountTransitNumber = generalAccountTransitNumber;
	}



	public String getGeneralAccountAccountNumber() {
		return GeneralAccountAccountNumber;
	}



	public void setGeneralAccountAccountNumber(String generalAccountAccountNumber) {
		GeneralAccountAccountNumber = generalAccountAccountNumber;
	}



	public String getRealEstateTrustAccountName2() {
		return RealEstateTrustAccountName2;
	}



	public void setRealEstateTrustAccountName2(String realEstateTrustAccountName2) {
		RealEstateTrustAccountName2 = realEstateTrustAccountName2;
	}



	public String getRealEstateTrustAccountNikname2() {
		return RealEstateTrustAccountNikname2;
	}



	public void setRealEstateTrustAccountNikname2(String realEstateTrustAccountNikname2) {
		RealEstateTrustAccountNikname2 = realEstateTrustAccountNikname2;
	}



	public String getRealEstateTrustBankNumber2() {
		return RealEstateTrustBankNumber2;
	}



	public void setRealEstateTrustBankNumber2(String realEstateTrustBankNumber2) {
		RealEstateTrustBankNumber2 = realEstateTrustBankNumber2;
	}



	public String getRealEstateTrustTransitNumber2() {
		return RealEstateTrustTransitNumber2;
	}



	public void setRealEstateTrustTransitNumber2(String realEstateTrustTransitNumber2) {
		RealEstateTrustTransitNumber2 = realEstateTrustTransitNumber2;
	}



	public String getRealEstateTrustAccountNumber2() {
		return RealEstateTrustAccountNumber2;
	}



	public void setRealEstateTrustAccountNumber2(String realEstateTrustAccountNumber2) {
		RealEstateTrustAccountNumber2 = realEstateTrustAccountNumber2;
	}



	public int getBrokerID() {
		return BrokerID;
	}



	public void setBrokerID(int brokerID) {
		BrokerID = brokerID;
	}
	
	
	
	
	
	

}
