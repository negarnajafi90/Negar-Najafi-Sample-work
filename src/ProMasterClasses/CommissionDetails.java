package ProMasterClasses;

import java.sql.Timestamp;

public class CommissionDetails {
	
	 public int ID;

	 public int TradeID;
	 
	 public int BrokerID;
	 
     public int AgentId;
	 
     public String Address;
     
     public String Price;
     
     public String GrossCommission;
     
     public String SplitWithBroker;
     
     public String AgentPortion;
     
     public String Rebate;
     
     public String Referral;
     
     public String NetCommission;

     public Timestamp Closingdate;
     
     public Timestamp Date;

     public String Type;
     
     public String  Split;
     
     public String  TotalCommission;
     
     public String  ListingCommission;
     
     public String  SellingCommission;
     
     public String  Balance;
     
     public String  CapReached;
     
     public String  AddtoCap;
     
     public String  AddtoCapDS;

     public String  Finalized;
     
     public String  Status;
     
     
     
     
 	
	 public CommissionDetails() {

		this.TradeID = 0;
		this.ID = 0;
		this.BrokerID = 0;
		this.AgentId=0;
		this.Address ="";
		this.Price="0.00";
		this.GrossCommission ="0.00";
		this.SplitWithBroker ="0.00";
		this.AgentPortion = "0.00";
		this.Rebate ="0.00";
		this.Referral ="0.00";
		this.NetCommission ="0.00";
		this.Closingdate=null;
		this.Date=null;
		this.Type="0.00";
		this.Split="0.00";
        this.TotalCommission="0.00";
	    this.ListingCommission="0.00";
	    this.SellingCommission="0.00";
	    this.Balance="0.00";
	    this.AddtoCap="0.00";
	    this.AddtoCapDS="0";
	    this.Finalized="0";
	    this.CapReached="0.00";
	    this.Status="0.00";
	     
	 

	}
     
 	
	 public CommissionDetails(

			 int ID,
			 
			 String Type,
			 
			 String Address ,
			 
			 Timestamp Date,  
			 
			 Timestamp Closingdate, 
			 
			 String Price,
			 
			 String GrossCommission, 
			 
		     String SellingCommission,
		     
		     String ListingCommission,
		     
	         String TotalCommission,
	         
			 String Split,
			 
			 String AgentPortion, 
			 
			 String Rebate, 
			 
			 String Referral,
			 
			 String NetCommission,
			 
			 String SplitWithBroker,
			 
			 String Balance,

		     String AddtoCap,
		     
		     String AddtoCapDS,
		     
		     String CapReached,

			 int AgentId, 
			 
			 int BrokerID,
			 
			 int tradeID, 
			 
			 String Finalized,
			 
			 String  Status

		     

	 ) {

			this.TradeID = tradeID;
			this.ID = ID;
			this.BrokerID =BrokerID;
			this.AgentId=AgentId;
			this.Address =Address;
			this.Price=Price;
			this.GrossCommission =GrossCommission;
			this.SplitWithBroker =SplitWithBroker;
			this.AgentPortion =AgentPortion;
			this.Rebate =Rebate;
			this.Referral =Referral;
			this.NetCommission =NetCommission;
			this.Closingdate=Closingdate;
			this.Date=Date;
			this.Type=Type;
			this.Split=Split;
	        this.TotalCommission=TotalCommission;
		    this.ListingCommission=ListingCommission;
		    this.SellingCommission=SellingCommission;
		    this.Balance=Balance;
		    this.AddtoCap=AddtoCap;
		    this.AddtoCapDS=AddtoCapDS;
		    this.Finalized=Finalized;
		    this.CapReached=CapReached;
		    this.Status=Status;
	}




	

}