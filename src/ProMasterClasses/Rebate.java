package ProMasterClasses;

public class Rebate {
	
 public int ID;
 public String RecipientPartyToTrade;
 public String AgreemenComplyWithEthic;
 public String Amount1;
 public String Customer1;
 public String Amount2;
 public String Customer2;
 public String Amount3;
 public String Customer3;
 public String Amount4;
 public String Customer4;
 public String TotalRebates;
 public String Agent1Percentage;
 public String Agent2Percentage;
 public int    TransactionID;
 public int    BrokerID;

 
	
public Rebate() {
	
	
	  this.ID=0;
	  this.RecipientPartyToTrade="";
	  this.AgreemenComplyWithEthic="";
	  this.Amount1="";
	  this.Customer1="";
	  this.Amount2="";
	  this.Customer2="";
	  this.Amount3="";
	  this.Customer3="";
	  this.Amount4="";
	  this.Customer4="";
	  this.TotalRebates="";
	  this.Agent1Percentage="";
	  this.Agent2Percentage="";
	  this.TransactionID=0;	
	  this.BrokerID=0;
	
}

public Rebate(
  int ID,
  String RecipientPartyToTrade,
  String AgreemenComplyWithEthic,
  String Amount1,
  String Customer1,
  String Amount2,
  String Customer2,
  String Amount3,
  String Customer3,
  String Amount4,
  String Customer4,
  String TotalRebates,
  String Agent1Percentage,
  String Agent2Percentage,
  int TransactionID,	
  int BrokerID
		) {
	
	  this.ID=ID;
	  this.RecipientPartyToTrade=RecipientPartyToTrade;
	  this.AgreemenComplyWithEthic=AgreemenComplyWithEthic;
	  this.Amount1=Amount1;
	  this.Customer1=Customer1;
	  this.Amount2=Amount2;
	  this.Customer2=Customer2;
	  this.Amount3=Amount3;
	  this.Customer3=Customer3;
	  this.Amount4=Amount4;
	  this.Customer4=Customer4;
	  this.TotalRebates=TotalRebates;
	  this.Agent1Percentage=Agent1Percentage;
	  this.Agent2Percentage=Agent2Percentage;
	  this.TransactionID=TransactionID;	
	  this.BrokerID=BrokerID;

	  
}
	

}
