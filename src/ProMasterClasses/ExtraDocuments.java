package ProMasterClasses;

public class ExtraDocuments {

	 public int BrokerID;
	 
	 public int TrasnactionID;
	 
	 public String Name;
	 
	 public String ModfiedDate;
	 
	 public String Object;
	 
	 
	 public ExtraDocuments(){
		 
	     this. BrokerID=0;
		 
		 this.TrasnactionID=0;
		 
	     this. Name="";
		 
		 this.ModfiedDate=""; 
		 
		 this.Object="";
		 
		 
		 
	 }
	 
	 
	 
	 public ExtraDocuments( int BrokerID , int TrasnactionID , String Name , String ModfiedDate, String Object){
		
	     this. BrokerID=BrokerID;
		 
		 this.TrasnactionID=TrasnactionID;
		 
	     this. Name=Name;
		 
		 this.ModfiedDate=ModfiedDate; 
		 
		 this.Object=Object;
		 
		 
	 }
	 

}
