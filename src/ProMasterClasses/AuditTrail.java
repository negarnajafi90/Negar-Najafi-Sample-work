package ProMasterClasses;

public class AuditTrail {
	
	
	
public int ID;

public int TransactionID;

public String Description;

public String Date;	
	
public String Type;	
	
public int BrokerID ;

public int UserID ;

public String UserFullName;


	
	public  AuditTrail() {
		
        this. ID=0;

        this. TransactionID=0;

        this. Description="";

        this. Date="";	
			
        this. Type="";	
			
        this. BrokerID =0;

        this. UserID =0;

        this. UserFullName="";   }
	
	
	
	public  AuditTrail(
			
			 int ID,

			 int TransactionID,

			 String Description,

			 String Date,
				
			 String Type,	
				
			 int BrokerID ,

			 int UserID ,

			 String UserFullName
			
			
			
			) {
		
        this. ID=ID;

        this. TransactionID=TransactionID;

        this. Description=Description;

        this. Date=Date;	
			
        this. Type=Type;	
			
        this. BrokerID =BrokerID;

        this. UserID =UserID;

        this. UserFullName=UserFullName;    }
	
	

}
