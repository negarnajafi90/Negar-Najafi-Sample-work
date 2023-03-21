package ProMasterClasses;

import java.sql.Timestamp;

public class Transaction {

	public int    id;	
	public int    AuthorType;
	public int    AuthorID;
	public int    BrokerID;
	public String MLS;
	public String StreetName;	
	public String StreetNumber;	
	public String Unit;	
	public String City;	
	public String Province;	
	public String PostalCode;	
	public String PropertyType;
	public int    FirstAgent;	
	public int    SecondAgent;	
	public String FirstAgentCommission;	
	public String SecondAgentCommission;	
	public String Price;	
	public String TransactionSource;	
	public String ListingType;		
	public String ListCommission;	
	public String SellCommission;	
	public String PropertyStatus;	
	public String OfficeleadGrossCommission;
	public int    OfficeLead;
	public String SellingOfficeleadGrossCommission;
	public int    SellingOfficeLead;
	public String ListingOfficeleadGrossCommission;
	public int    ListingOfficeLead;
	public String Agent1Sign;	
	public String Agent2Sign;
	public String BrokerSign;	
	public String TransactionStatus;
	public String Notes;
	public String Permanent;
	public String ReferralFeeNote;
	public String Role1;
	public String Role2;
	public String Description;
	
	public Timestamp OfferDate;
    
	public Timestamp OfferExpiretionDate;
    
	public Timestamp OfferAcceptanceDate;
    
	public Timestamp ConditionExpirationDate;
    
	public Timestamp ConditionCompletationDate;
    
	public Timestamp OfferWithrawalDate;
    
	public Timestamp InspectionDate;
    
	public Timestamp AccupancyDate;
    
	public Timestamp OffMarketDate;

	public String progressMarks;
	
	public Timestamp CreateDate;
	
	public Timestamp FinalizedDate;

	public Timestamp ListingDate;	
	
	public Timestamp ClosingDate;	
	
	public Timestamp ExpirationDate;

	public int LastCommissionID;
	
    public int LastCommissionDealID;

	public Transaction() {

		this.id=0;
		this.AuthorType =0;
		this.AuthorID =0;
		this.MLS ="";
		this.StreetName="";
		this.StreetNumber=""; 
		this.Unit ="";
		this.City="";
		this.Province ="";
		this.PostalCode="";
		this.PropertyType="";
		this.FirstAgent=0; 
		this.SecondAgent=0;
		this.FirstAgentCommission="";
		this.SecondAgentCommission=""; 
		this.Price ="";
		this.TransactionSource =""; 
		this.ListingType = "";
		this.ListingDate =null; 
		this.ClosingDate =null;
		this.ExpirationDate=null;
		this.ListCommission ="";
		this.SellCommission ="";
		this.PropertyStatus ="";
		this.Agent1Sign="";	
		this.Agent2Sign="";
		this.BrokerSign = "";
		this.TransactionStatus = "";
		this.PropertyStatus="";
		this.OfficeleadGrossCommission="";
        this.OfficeLead=0;
        this.SellingOfficeleadGrossCommission="";
        this.SellingOfficeLead=0;
    	this.ListingOfficeleadGrossCommission="";
        this.ListingOfficeLead=0;
    	this.Notes="";
    	this.Permanent="";
    	this.ReferralFeeNote="";
    	this.Role1="";
    	this.Role2="";
    	this.Description="";
    	this.OfferDate=null;
        
    	this.OfferExpiretionDate=null;
        
    	this.OfferAcceptanceDate=null;
        
    	this.ConditionExpirationDate=null;
        
    	this.ConditionCompletationDate=null;
        
    	this.OfferWithrawalDate=null;
        
    	this.InspectionDate=null;
        
    	this.AccupancyDate=null;
        
    	this.OffMarketDate=null;
    	
    	this.progressMarks="";
    	
        this. CreateDate=null;
    	
    	this.FinalizedDate=null;
    	 
    	this.LastCommissionID=0;
    	
    	this.LastCommissionDealID=0;
    	
	}
	
	
	
	
	
	
	
	
	public Transaction(
			int id,
			int authorType, 
			int authorID,
			int Broker,
			String mLS, 
			String streetName, 
			String streetNumber,
			String unit, 
			String city, 
			String province, 
			String postalCode, 
			String propertyType, 
			int    firstAgent,
			int    secondAgent, 
			String firstAgentCommission, 
			String secondAgentCommission, 
			String price,
			String transactionSource, 
			String listingType, 
			Timestamp listingDate,
			Timestamp closingDate, 
			Timestamp ExpiredDate, 
			String listCommission,
			String sellCommission, 
			String propertyStatus, 
			String agent1Sign, 
			String agent2Sign, 
			String brokerSign,
			String transactionStatus,
			String OfficeleadGrossCommission,
	        int OfficeLead,
	        String SellingOfficeleadGrossCommission,
	        int SellingOfficeLead,
	    	String ListingOfficeleadGrossCommission,
	        int ListingOfficeLead,
	        String Note,
	    	String Permanent ,
	    	String ReferralFeeNote,
	    	String Role1,
	    	String Role2, 
	    	
	    	String Description,
	    	Timestamp OfferDate,
		    
	    	Timestamp OfferExpiretionDate,
		    
	    	Timestamp OfferAcceptanceDate,
		    
	    	Timestamp ConditionExpirationDate,
		    
	    	Timestamp ConditionCompletationDate,
		    
	    	Timestamp OfferWithrawalDate,
		    
	    	Timestamp InspectionDate,
		    
	    	Timestamp AccupancyDate,
		    
	    	Timestamp OffMarketDate,

	        String   progressMarks,
			
	    	Timestamp CreateDate,
			
	    	Timestamp FinalizedDate,
	    	
		    int LastCommissionID,
		
			int LastCommissionDealID) {

		this.id = id;
		this.AuthorType = authorType;
		this.AuthorID = authorID;
		this.BrokerID=Broker;
		this.MLS = mLS;
		this.StreetName = streetName;
		this.StreetNumber = streetNumber;
		this.Unit = unit;
		this.City = city;
		this.Province = province;
		this.PostalCode = postalCode;
		this.PropertyType = propertyType;
		this.FirstAgent = firstAgent;
		this.SecondAgent = secondAgent;
		this.FirstAgentCommission = firstAgentCommission;
		this.SecondAgentCommission = secondAgentCommission;
		this.Price = price;
		this.TransactionSource = transactionSource;
		this.ListingType = listingType;
		this.ListingDate = listingDate;
		this.ClosingDate = closingDate;
		this.ExpirationDate= ExpiredDate;
		this.ListCommission = listCommission;
		this.SellCommission = sellCommission;
		this.PropertyStatus = propertyStatus;
		this.Agent1Sign = agent1Sign;
		this.Agent2Sign = agent2Sign;
		this.BrokerSign = brokerSign;
		this.TransactionStatus = transactionStatus;
		this.OfficeleadGrossCommission=OfficeleadGrossCommission;
        this.OfficeLead=OfficeLead;
        this.SellingOfficeleadGrossCommission=SellingOfficeleadGrossCommission;
        this.SellingOfficeLead=SellingOfficeLead;
    	this.ListingOfficeleadGrossCommission=ListingOfficeleadGrossCommission;
        this.ListingOfficeLead=ListingOfficeLead;
        this.Notes=Note;
        this.Permanent=Permanent;
        this.ReferralFeeNote=ReferralFeeNote;
    	this.Role1=Role1;
    	this.Role2=Role2;
    	this.Description=Description;
    	
    	this.OfferDate=OfferDate;
        
    	this.OfferExpiretionDate=OfferExpiretionDate;
        
    	this.OfferAcceptanceDate=OfferAcceptanceDate;
        
    	this.ConditionExpirationDate=ConditionExpirationDate;
        
    	this.ConditionCompletationDate=ConditionCompletationDate;
        
    	this.OfferWithrawalDate=OfferWithrawalDate;
        
    	this.InspectionDate=InspectionDate;
        
    	this.AccupancyDate=AccupancyDate;
        
    	this.OffMarketDate=OffMarketDate;
    	
    	this.progressMarks=progressMarks;
    	
        this. CreateDate=CreateDate;
    	
    	this.FinalizedDate=FinalizedDate;
    	 
    	this.LastCommissionID=LastCommissionID;
    	 
    	this.LastCommissionDealID=LastCommissionDealID;
	}

	
	

}
