package FULLBackendPart;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;
import java.util.Date; 
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;


import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.amazonaws.services.s3.AmazonS3;
import com.itextpdf.html2pdf.HtmlConverter;

import RDS.RDSFunctions;
import S3.ConnectionToS3;
import ProMasterClasses.AuditTrail;
import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Transaction;
import ProMasterClasses.Users;
import ProMasterClasses.User;
import ProMasterClasses.Contacts;
import ProMasterClasses.Companies;
import ProMasterClasses.CooperatingBrokerage;
import ProMasterClasses.Deposits;
import ProMasterClasses.ExtraDocuments;
import ProMasterClasses.Invoice;
import ProMasterClasses.Lawyers;
import ProMasterClasses.Parties;
import ProMasterClasses.Rebate;
import ProMasterClasses.RecordSheet;
import ProMasterClasses.Referral;


/**
 * Servlet implementation class TradeRecordSheet
 */


@WebServlet(
		
        name = "TradeRecordSheet"


		
		)

@MultipartConfig

public class TradeRecordSheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradeRecordSheet() {
    	
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		
		doGet(request, response);
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		//In this section the system checks if the user is finalizing the deal or just saving it and wants to complete it again . Because if they are not finalizing a deal then there is no new contact in their contact list
		
		//We check which buttons they have pressed to come in this stage
		
		NumberFormat CanadaVal = NumberFormat.getInstance(new Locale("en", "US"));
		
		CanadaVal.setMinimumFractionDigits(2);
		
		CanadaVal.setMaximumFractionDigits(2);

	    String Finilize= request.getParameter("Finalized");
	    		
	    String Save=request.getParameter("SaveExit");	
	    
	    String Delete=request.getParameter("Delete");

	    String Save1=request.getParameter("SaveTransactionDetails");
	    
	    String Save2=request.getParameter("VendorSave");
	    
	    String Save3=request.getParameter( "VendorLawyerSave");
	    
	    String Save4=request.getParameter("PurchaserSave");
	    
	    String Save5=request.getParameter("PurchaserLawyerSave");
	    
	    String Save6=request.getParameter("DepositSave");
	    
	    String Save7=request.getParameter("CooperatingSave");
	    
	    String Save8=request.getParameter("InvoiceveSave");
	    
	    String Save9=request.getParameter("ReferralSave1");
	    
	    String Save10=request.getParameter("Referralstep2Save");
	    
	    String Save11=request.getParameter("RebateSave1");
	    
	    String Save12=request.getParameter("Rebate2Save");
	    
	    String Save13=request.getParameter("RecordsheetSave");

	    String Save14=request.getParameter("SendEmailInvoice");
	    
	    String Save15=request.getParameter("DocumentsSave");
	    
	    String Save16=request.getParameter("ReferralSave2");

	    String Save17=request.getParameter("RebateSave2");
	    
	    String Save18=request.getParameter("completeDeal");
	    
	    String Save19=request.getParameter("reopenDeal");
	    
	    String documentSubmit=request.getParameter("documentSubmitbtn");

	    String Savenote=request.getParameter("savenote");
	    
	    String Delete1=request.getParameter("Deletedoc1");
	    
	    String Delete2=request.getParameter("Deletedoc2");
	    
	    String Delete3=request.getParameter("Deletedoc3");
	    
	    String Delete4=request.getParameter("Deletedoc4");
	    
	    String Delete5=request.getParameter("Deletedoc5");
	    
	    String Delete6=request.getParameter("Deletedoc6");

	    String Permanant="";

	    String TempPermanant="";
	    
	    int CheckFinalize=0;
	    
	    int CheckFinalizeTemp=0;
	    
	    String FinalProgressMark="0";
	    
	    String AddAgaintCap="";
	    
	    String AddAgaintCapDS="";
	    
	    int CheckSave=0;

	    if( Finilize!=null  ) {      System.out.println("save");  TempPermanant="1";   CheckFinalizeTemp=1;  CheckSave=0; } 

	    else if(  Save!=null )   {   System.out.println("save");    TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0;}
	    
	    else if(  Delete!=null)  {   System.out.println("Delete");  TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0;}

	    else if(  Save1!=null )  {   System.out.println("SaveTransactionDetails");     TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save2!=null)   {   System.out.println("VendorSave");      TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save3!=null)   {   System.out.println("VendorLawyerSave");   TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save4!=null )  {   System.out.println("PurchaserSave");     TempPermanant="0";   CheckFinalizeTemp=0;  CheckSave=0; }
	    
	    else if(  Save5!=null)   {   System.out.println("PurchaserLawyerSave");  TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0;  }
	    
	    else if(  Save6!=null)   {   System.out.println("DepositSave");    TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save7!=null )  {   System.out.println("CooperatingSave");     TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save8!=null)   {   System.out.println("InvoiceveSave");    TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save9!=null)   {   System.out.println("ReferralSave1");    TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save10!=null)  {   System.out.println("Referralstep2Save"); TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0;}
	     
	    else if(  Save11!=null ) {   System.out.println("RebateSave1");    TempPermanant="0";  CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save12!=null)  {   System.out.println("Rebate2Save");    TempPermanant="0";   CheckFinalizeTemp=0; CheckSave=0; }
	    
	    else if(  Save13!=null)  {   System.out.println("RecordsheetSave");   TempPermanant="0";   CheckFinalizeTemp=0;  CheckSave=1; }
	    
	    else if(  Save14!=null)  {   System.out.println("Email");      }
	    
	    else if(  Save15!=null)  {   System.out.println("Documents Save");  }
	    
	    else if(  Save16!=null)  {   System.out.println("ReferralSave2");   TempPermanant="0";   CheckFinalize=0; CheckSave=0; }
	    
	    else if(  Save17!=null)  {   System.out.println("RebateSave2");   TempPermanant="0";  CheckFinalize=0; CheckSave=0; }
	    
	    else if(  Save18!=null)  {   System.out.println("movetocompleted");   TempPermanant="1";  CheckFinalize=0; CheckSave=0; }
	    
	    else if(  Save19!=null)  {   System.out.println("reopenDeal");    TempPermanant="0";   CheckFinalize=0; CheckSave=0; }
	          
	    else if(  Delete1!=null)  {   System.out.println("Delete1");    }
	          
	    else {    /* ************** Do nothing ************** */  System.out.println("Nothing Clicked");   CheckFinalize=0;  CheckSave=0; }
	          

	 	     //Getting the current Broker and the user Type(if it is Broker , Agent or Admin )
		      
			  RDSFunctions RDS= new RDSFunctions();

		      HttpSession Existingsession = request.getSession();

		      int Brokerid=(int) Existingsession.getAttribute("Brokerid");
		      
		      int UserID=(int) Existingsession.getAttribute("Userid");

		      int Author= (int) Existingsession.getAttribute("Userid");
		      
		      Connection con=(Connection) Existingsession.getAttribute("Connection");
		      
		      AmazonS3 s3client=(AmazonS3) Existingsession.getAttribute("S3");
		      
		      String Type=(String) Existingsession.getAttribute("Type");

		      int  AuthorType= Integer.parseInt(Type);
		      
		 	  Users MyInformation=new Users();
			 
		 	  MyInformation=RDS.GetAnyUserById(Brokerid,con); //Getting the current company information for a specific broker

			  Companies CurrentCompanies=new Companies();
			 
			  CurrentCompanies=RDS.GetaCompanyBuyBrokerID(Brokerid,con);

			  int TransactionID=(int) Existingsession.getAttribute("TransactionID");
			    
			  Transaction NewDeal=new Transaction();
			  
		   	  ConnectionToS3 S3= new ConnectionToS3();  //Creating an object of the S3 class to operate on the files 
		   	  
			  //Creating a object of deal information to save to the data base 

			  NewDeal= RDS.GetTransactionsbyID( TransactionID , Brokerid,con);
			    
			  Companies myCompany=RDS.GetaCompanyBuyBrokerID(Brokerid,con);
			    
			  RecordSheet Record=new RecordSheet();
     
	    	  ArrayList<Parties> MyVendors = new ArrayList<Parties>();
	        	
	    	  MyVendors=RDS.SearchParties(  TransactionID ,"Vendor" , Brokerid,con) ;
	    	
	    	  int Size=MyVendors.size();

	    	  ArrayList<Parties> MyPurchasers = new ArrayList<Parties>();
	    	
	    	  MyPurchasers=RDS.SearchParties(  TransactionID ,"Purchaser",Brokerid,con ) ;

	    	  int Size1=MyPurchasers.size();

	       	  ArrayList<Deposits> MyDeposits = new ArrayList<Deposits>();
		
	          MyDeposits= RDS.SearchDeposits( TransactionID , Brokerid ,con);
		
	    	  int Size2=MyDeposits.size();

		      Lawyers Lawyer1=new Lawyers(); //Creating an object of vendor lawyer
		    	
		      Lawyer1=RDS.SearchLawyers(  TransactionID , "1" , Brokerid ,con);  //Check if there a vendor lawyer or not

		      Lawyers Lawyer2=new Lawyers();
		    	
		      Lawyer2=RDS.SearchLawyers(  TransactionID , "2" , Brokerid ,con);   

		      CooperatingBrokerage  MyCooperatingBroker= new CooperatingBrokerage();

		      MyCooperatingBroker=RDS.SearchCooperatingBrokerage( TransactionID , Brokerid ,con);

			  ArrayList<AuditTrail> Notes=new ArrayList<AuditTrail>();
			    
			  Notes=RDS.SearchAuditTrail(  TransactionID ,  Brokerid ,"Note" ,con); 

              ArrayList<ExtraDocuments> Documents=new ArrayList<ExtraDocuments>();
		    
		      Documents=S3.SearchExtraFilesfroms3("Mastere/TRS/Extra-Documents/",Brokerid,TransactionID,s3client); 
      
/////////////////////////////////////////////////////////////////////////////////////////// Deleting Extra Documents ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
    for(int counter=0; counter< Documents.size() ; counter++ ) {

             String ExtradocDelete=request.getParameter("ExtradocDelete"+counter);	

             if(ExtradocDelete!=null) {  

                    S3.DeleteBucketInS3( "Mastere/TRS/Extra-Documents/"+Documents.get(counter).Name+"%"+String.valueOf( TransactionID )+"%"+String.valueOf(Brokerid),s3client );  }

             else  { /*Do nothing */ }

     }


/////////////////////////////////////////////////////////////////////////////////////////// Deleting notes ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	        


        for(int counter=0; counter< Notes.size() ; counter++ ) {

                    String ExtraNoteDelete=request.getParameter("Deletenote"+counter);	

                    if(ExtraNoteDelete!=null) {  RDS. DeletAudit(    Brokerid , "Note" ,TransactionID,  Notes.get(counter).ID  ,con ) ;   }
                    
                    else {}

          }

//*************************************************************************** Checking which button has been clicked by the user	***************************************************************************//  

		        
	     if(Save19!=null ){ 

	    	   System.out.println("reopen");
	    	 
	    	   RDS.ReopenTransaction( Brokerid , TransactionID ,"0" ,"Reopened" ,con)  ; 
	    	    
	    	   //Getting the current Commission Details related to current Deal.

	   	       CommissionDetails newcom=RDS.SearchSpesificCommission( Brokerid ,  NewDeal.LastCommissionDealID ,con);
	   	     
	   	       double Cap=0.00;
	   	        
	   	       //Here We are Calculating the cap reached based on the data we have 

	   	       Cap=Double.parseDouble(myCompany.Temp)-Double.parseDouble(newcom.SplitWithBroker);

	   	       newcom.TradeID=TransactionID;
	   	     
	   	       newcom.BrokerID=Brokerid;
	   	  
	   	       newcom.AgentId=Brokerid;
	   	     
	   	       newcom.Status="Delete";
	   	       
	   	       SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

	           Date date = new Date( ); 
	    	 
		       //String Date=formatter.format(date); 
		     
	           RDS. UpdateCompanyTemp( String.valueOf(Cap), Brokerid ,con); 
	 
	   	       newcom.Date=new Timestamp(date.getTime());
	   	     
	   	       newcom.CapReached=String.valueOf(Cap);

	   	       RDS.AddCommissionDetails( newcom,con) ; //Creating the Delete Row 
	    
	   	       newcom.Finalized="1";

	   	       newcom.CapReached=String.valueOf(Cap);

	   	       newcom.Status="Deal";
	   	     
	   	       int LastCommissionID= RDS.AddCommissionDetails(newcom,con) ; //Creating the new Row of data 
	   	       
	   	       RDS.UpdateDealCommision(     Brokerid ,   TransactionID , LastCommissionID,con ); //Updating the last Deal number where the type is deal (which means the deal hasent been deleted)
	   	       
	   	       RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID
	     }

	    else if(Delete1!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Rebate-Agreement-Documents/Rebate-Agreement"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid) ,s3client);   }
	 
	    else if(Delete2!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Referral-Disclosure-Documents/Referral-Disclosure"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client );	   }
	 
	    else if(Delete3!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Deposits/1-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);    }
	 
	    else if(Delete4!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Deposits/2-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);   }
	 
	    else if(Delete5!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Deposits/3-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);  }
	 
	    else if(Delete6!=null) {  S3.DeleteBucketInS3( "Mastere/TRS/Deposits/4-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);   }
	     
	    else if(documentSubmit!=null) {
	    	
	   	       String ExtraDocumentName = request.getParameter("EXtraDocumentName1"); 
	   	    
	           Part filePart7= request.getPart("FileName0");

	   	       InputStream fileInputStream7 = filePart7.getInputStream();
	   	    
	           if(  fileInputStream7.available()==0  ) {   } //closing of If
	           
	           else {
	   	   
	   	                String fileName7 =filePart7.getSubmittedFileName();
  
	   	                String FILENAME7=fileName7+"%"+String.valueOf(TransactionID)+"%"+String.valueOf(Brokerid);
	   	     
	   	                S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Extra-Documents", fileInputStream7, filePart7 , FILENAME7,s3client );
	   	    
	                } //Closing else
	
	    } 
	     
	    else if( Savenote !=null ) {
	    	
	    	
              //--------------------------------------------------- Notes ----------------------------------------------------------    
	    	
	   	      String ExteraNotes=request.getParameter("allNotesDocuments");
	         
  	          if ( ExteraNotes.isEmpty() || ExteraNotes==null ) {   }else { 

	 	    	        SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	 	    	 
	 	                Date date = new Date( ); 

	         	        AuditTrail auditRecord=new AuditTrail( 0,  TransactionID,  ExteraNotes,  formatter.format(date),  "Note",	  Brokerid ,  UserID ,  MyInformation.Firstname+" "+ MyInformation.Lastname );

	         	        RDS.AddNewAudit( auditRecord ,con);   }	
	
	    }
	     

		 if(  Delete!=null)  {  

		        //Deleting every single information regarding the Selected deal 

		    	if(Size2==0) {  /* Do nothing */  }

		    	else if(Size2==1) {  RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con );  }  

		    	else if(Size2==2) {

			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con);
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID ,con);  }

		    	else if(Size2==3) {
		    		
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con);
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID,con );
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(2).ID ,TransactionID ,con);	 }

		    	else if(Size2==4) {
		    		
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con);
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID,con );
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(2).ID ,TransactionID ,con);
			    	
			    	RDS.DeleteDeposit(  Brokerid , MyDeposits.get(3).ID ,TransactionID,con );	 }

		    	 if(Size==0 ){ /* Do nothing */ }
		    	
		    	 else if( Size==1 ) { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con); }

	             else if( Size==2 ) {
		       		
		        	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con);
		        	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID ,con); }
		       		
		     	else if( Size==3 ) {
		       		
		        	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con);
		        	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID ,con);
			    	 
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(2).ID ,con);	  	}
		
		       	else if( Size==4) {
		       		
		        	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con);
		        	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID ,con);
			    	 
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(2).ID ,con);
			    	 
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(3).ID ,con); }

		    	 if ( Size1==0 ) { /* Do nothing */  }
		    	 
		    	 else if( Size1==1 ) { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID ,con);  }

		    	 else if( Size1==2 ) {
		    		 
			 	    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID,con );
				    	
				    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID ,con);	    }
		    	 
		    	 else if( Size1==3 ) {
		    		 
			 	    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID ,con);
				    	
				    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID ,con);
				    	
				    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(2).ID,con );    }
		    	 
		    	 else if( Size1==4 ) {
		    		 
		 	    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID,con );
			    	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID ,con);
			    	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(2).ID,con );
			    	
			    	RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(3).ID ,con);	   
			    	
		    	 }

		    	RDS.DeleteLawyer(   Brokerid , Lawyer1.ID , TransactionID ,con);
		    	
		    	RDS.DeleteLawyer(   Brokerid , Lawyer2.ID , TransactionID ,con);

		    	RDS.DeleteBrokerage(   Brokerid ,MyCooperatingBroker.ID , TransactionID ,con);
		    	
		    	RDS.DeleteTransaction( Brokerid , TransactionID ,con);

		    	RDS. DeleteRecordSheet(  Brokerid , TransactionID ,con );

			    for(int counter=0; counter< Notes.size() ; counter++ ) {
				    
			         RDS. DeletAudit(    Brokerid , "Note" ,TransactionID,  Notes.get(counter).ID  ,con ) ;    
			         
			    }
			    
		
			    for(int counter=0; counter< Documents.size() ; counter++ ) {

		  		     S3.DeleteBucketInS3( "Mastere/TRS/Extra-Documents/"+Documents.get(counter).Name+"+"+String.valueOf( TransactionID )+"+"+String.valueOf(Brokerid) ,s3client); 
		  		     
		    	   }

			    S3.DeleteBucketInS3( "Mastere/TRS/Deposits/1-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);
			    
			    S3.DeleteBucketInS3( "Mastere/TRS/Deposits/2-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);
			    
			    S3.DeleteBucketInS3( "Mastere/TRS/Deposits/3-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);
			    
			    S3.DeleteBucketInS3( "Mastere/TRS/Deposits/4-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client);
			    
			    S3.DeleteBucketInS3( "Mastere/TRS/Rebate-Agreement-Documents/Rebate-Agreement"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid) ,s3client);

			    S3.DeleteBucketInS3( "Mastere/TRS/Referral-Disclosure-Documents/Referral-Disclosure"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client );
			    
			    S3.DeleteBucketInS3( "Mastere/TRS/Property-Picture/Property-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid),s3client );

			    CommissionDetails newcom=RDS.SearchSpesificCommission( Brokerid ,  NewDeal.LastCommissionDealID ,con);
			      
			 	 double Cap=0.00;

		    	 Cap=Double.parseDouble(myCompany.Temp.replace(",",""))-Double.parseDouble(newcom.SplitWithBroker.replace(",",""));
		    	
		         RDS. UpdateCompanyTemp( String.valueOf(Cap), Brokerid ,con); 
		         
		         SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 
		    	 
			     //String Date=formatter.format(date); 
			     
		   	     newcom.TradeID=TransactionID;
		   	     
		   	     newcom.BrokerID=Brokerid;
		   	  
		   	     newcom.AgentId=Brokerid;
		   	 
		   	     newcom.Date=new Timestamp(date.getTime());
		   	     
		   	     newcom.Status="Delete";
		  
		    	 newcom.CapReached=String.valueOf(Cap);
		    	 
		    	 System.out.println("Delete");

		    	 int LastCommissionID=RDS.AddCommissionDetails( newcom,con) ;
		    	 
		    	 RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID
		    	 
		    }// End of Delete
		    
		    

	    else {       

	    	       //There are 3 types of users in our system . Broker , Agents and Admins
	    	     
	    	       //Also , there are 3 users who  sign the deals .(It should be mentioned that second agent id not mandatory party )
	    	
	    	       //We are checking who need to approve and sign the deal based on th euser type and other parties.

		           String BerokerSign="0";
			      
			       String AgentSign1="0";
			    
			       String AgentSign2="0";
			      
			       String TransactionStatus="";  //TransactionStatus Is to check which party need to approve and sign the deal and who has done it .
			       
			       //If we are finalizing the deal we need to check for the parties sign 
			      
			       if( Finilize!=null  ) {
			
			                      if(  AuthorType==1 ) {   BerokerSign="1";  AgentSign1="1";  AgentSign2="1";  TransactionStatus="Complete";  } // if AuthorType==1

			                      else if( AuthorType==3 ){
			    	  
			    	                      BerokerSign="0" ;  AgentSign1="0";
			    	  
			    	                      if( request.getParameter("AddAgent")==null ) { AgentSign2="1"; }else { AgentSign2="0";  }
			    	  
			    	                      TransactionStatus="Needs First Agent Approval";     } //Else if  AuthorType==3 

			                       else if ( AuthorType==2 ) {
			    	     
			    	                            BerokerSign="0" ;
			    	  
			    	                            AgentSign1="1";
			    	  
			    	                            if( request.getParameter("AddAgent")==null ) { AgentSign2="1";  TransactionStatus="Needs Broker Approval";}
			    	  
			    	                            else { AgentSign2="0"; 	TransactionStatus="Needs Second Agent Approval"; }
			  
			    	                }//End if AuthorType==2
			                
			                       else { /* Do nothing */ }
			                
			      }  // End of if Finilize1!=null || Finilize2!=null || Finilize3!=null || Finilize4!=null || Finilize5!=null

			      else {   BerokerSign="0";   AgentSign1="0";  AgentSign2="0";  TransactionStatus="Incomplete";  }

 //****************************************************************************** Getting the Information regarding the property ******************************************************************************//
				    
				    String MLSNumber= request.getParameter("MLSNumber");
				    
				    String PropertystreetNumber= request.getParameter("PropertyStreetNumber");
				    
				    String PropertyStreetName= request.getParameter("PropertyStreetName");
				    
				    String Propertyunit= request.getParameter("PropertyUnit");
				    
				    String PropertyCity= request.getParameter("PropertyCity");
				   
				    String PropertyProvince= request.getParameter("PropertyProvince");
				    
				    String PropertyPostalCode= request.getParameter("PropertyPostalCode");
				    
				    String PropertyType= request.getParameter("PropertyType");	   
				    
				    String PropertyDescription= request.getParameter("PropertyCondition");	
				    
				    String PropertyFirstAgentID=request.getParameter("FirstAgentID");
				    
				    int FirstAgentID=0;
				    
				    //Checking and retrieving first Agent ID if the user has checked it
				    
				    if( PropertyFirstAgentID.isEmpty() || PropertyFirstAgentID==null) {  FirstAgentID=0; }

				    else {   
				    	
				    	   String str1 = PropertyFirstAgentID;  
				    	
				    	   String Agent1 = str1.replaceAll("[^0-9]", "");  
				    	
				    	   FirstAgentID=Integer.parseInt(Agent1);    }

			         int SecondAgentID=0;

				     String PropertySecondAgentID=request.getParameter("SecondAgentID");

				     //So if there is second agent we get the ID and if not we set it to 0 
				    
				     if( request.getParameter("AddAgent")==null ) {  SecondAgentID=0;  }
				    
				    else {

				    	     if( PropertySecondAgentID.isEmpty() || PropertySecondAgentID==null) {  SecondAgentID=0; }
				    	 
				    	     else { 

					                String str2 =PropertySecondAgentID;
					    
				                    String Agent2 = str2.replaceAll("[^0-9]", "");
				    	
				                    SecondAgentID=Integer.parseInt(Agent2);	  }
				    }

			        Users Agent1=new Users();
					   
				    Agent1=RDS.GetAnyUserById(FirstAgentID,con);
					   
				    Users Agent2=new Users();
					   
					Agent2=RDS.GetAnyUserById(SecondAgentID,con);
				    
				    String FirstAgentGrossCommisionSplit= String.format("%.2f",Double. parseDouble(request.getParameter("FirstAgentGrossCommisionSplit")) );
				    
				    String SecondAgentGrossCommisionSplit= request.getParameter("SecondAgentGrossCommisionSplit");
				    
				    String ProPertyListingPrice=request.getParameter("ProPertyListingPrice");
				    
				    String ProPertyListingSource=request.getParameter("ProPertyListingSource");
				    
				    String PropertyListingType=request.getParameter("PropertyListingType");
				    
				    String PropertyListingStatus= request.getParameter("PropertyListingStatus");

				    String PropertyListingComission=request.getParameter("PropertyListingComission");
				    
				    String PropertySellingComission= request.getParameter("PropertySellingComission");

				    String OfficeLeadPercentege= "0";
				    
				    int OfficeLeadPercentegeAgainst=0;
				    
				    int OfficeLeadPercentegeApplyAgainstSelling=0;
				    
				    int OfficeLeadPercentegeAgainstListing=0;

				    String OfficeLeadPercentegeSelling= "0";
				    
				    String OfficeLeadPercentegeListing= "0";

			        if (  ProPertyListingSource.equals("Agent-lead") ) {  
			        	
			        	  OfficeLeadPercentege= "0"; 
			        	
			        	  OfficeLeadPercentegeSelling= "0";
			        	
			        	  OfficeLeadPercentegeListing="0";
			        	  
			        	  AddAgaintCap="1";  AddAgaintCapDS="0";
			        	  

			        } // if ProPertyListingSource.equals("Agent Lead")
			        
			        else {   
                               OfficeLeadPercentege= request.getParameter("OfficeLeadAllocaton");

			        	       if( PropertyListingType.equals("Buyer-Side") ||   PropertyListingType.equals("Listing-Side") || PropertyListingType.equals("Landlord-Side") || PropertyListingType.equals("Tenant-Side") || 
			        			
			        	          PropertyListingType.equals("BuyerSide-Self-Represented-Vendor") || PropertyListingType.equals("TenantSide-Self-Represented-Landlord") ) {
			                   
			           	                  if(request.getParameter("OfficeLeadAgainstCap")==null) { OfficeLeadPercentegeAgainst= 0; AddAgaintCap="0";  AddAgaintCapDS="0"; }else { OfficeLeadPercentegeAgainst=1;  AddAgaintCap="1";  AddAgaintCapDS="0";}

				                          OfficeLeadPercentegeSelling= "0";
					    
				                          OfficeLeadPercentegeListing= "0"; 
				               
				                          OfficeLeadPercentegeApplyAgainstSelling=0;
				               
				                          OfficeLeadPercentegeAgainstListing=0;   } // End of IF
			        	
			        	        else {
			        	        	
			        	        	
			        	                  OfficeLeadPercentege="0";
			        	
			        	                  OfficeLeadPercentegeAgainst=0;

			        	                  AddAgaintCap="0";  AddAgaintCapDS="1s";
			        	                  
			       	                      if( request.getParameter("OfficeLeadAgainstSelling")==null ) { OfficeLeadPercentegeApplyAgainstSelling=0; } else {  OfficeLeadPercentegeApplyAgainstSelling=1;  }

			       	                      if( request.getParameter("OfficeLeadAgainstCapListing")==null ) {  OfficeLeadPercentegeAgainstListing= 0; } else {  OfficeLeadPercentegeAgainstListing=1; }
			        	  
				                          OfficeLeadPercentegeSelling= request.getParameter("OfficeLeadAllocatonSelling");
				    
				                          OfficeLeadPercentegeListing= request.getParameter("OfficeLeadAllocatonListng");   } //End of else
			        	       
			        } // End else 
			                 

				    //Here We are checking the agent's roles based on the listing Type and the number of the agents exist for a deal
				    
				    String FirstAgentRol=" ";
				    
				    String SecondAgentRol= request.getParameter("SecondAgentIDRole");

				    if(  PropertyListingType.equals("Double-Double-Sided")|| PropertyListingType.equals("Lease-DoubleSided")  ) {

				    	   if(SecondAgentRol.equals("Selling Agent")) { FirstAgentRol="Listing"; SecondAgentRol="Selling"; }
				    	
				    	   else if(SecondAgentRol.equals("Listing Agent") ){ FirstAgentRol="Selling"; SecondAgentRol="Listing"; }
				    	
				    	   else {  FirstAgentRol="Both"; SecondAgentRol=" ";  }
				    	
				    } // End PropertyListingType.equals("Double-Double-Sided")|| PropertyListingType.equals("Lease-DoubleSided") 
				    
				    else {

				    	 FirstAgentRol=" ";
				    	
				    	 SecondAgentRol=" ";
				    }
				    
				    String ProgressMark=request.getParameter("progressMarks");

				    String ReferralFeeNote="";
				    
//****************************************************************************** Getting the Referral Information ******************************************************************************//

				    SimpleDateFormat DateFor = new SimpleDateFormat("DD MM YYYY HH:MM:SS");
					
				    Date date_PropertyListingDate=null;
				    
				    Date date_PropertyClosingDate=null;
				    
				    Date date_PropertyExpireDate=null;
				    
				    Date date_OfferDate=null;
				    
				    Date date_OfferExpiretionDate=null;
				    
				    Date date_OfferAcceptanceDate=null;
				    
				    Date date_ConditionCompletationDate=null;
				    
				    Date date_ConditionExpirationDate=null;
				    
				    Date date_InspectionDate=null;
				   
				    Date date_OfferWithrawalDate=null;
				    
				    Date date_AccupancyDate=null;
				    
				    Date date_OffMarketDate=null;
				    
				    Timestamp PropertyListingDate=null;
				    
				    Timestamp PropertyClosingDate=null;
				    
				    Timestamp PropertyExpireDate=null;
				    
				    Timestamp OfferDate=null;
				    
				    Timestamp OfferExpiretionDate=null;
				    
				    Timestamp OfferAcceptanceDate=null;
				    
				    Timestamp ConditionCompletationDate=null;
				    
				    Timestamp ConditionExpirationDate=null;
				    
				    Timestamp InspectionDate=null;
				   
				    Timestamp OfferWithrawalDate=null;
				    
				    Timestamp AccupancyDate=null;
				    
				    Timestamp OffMarketDate=null;
				    
				   
				    try {

				    if( request.getParameter("PropertyListingDate").isEmpty()  || request.getParameter("PropertyListingDate")==null ||  request.getParameter("PropertyListingDate").equals("null")) { 
				    	
				 	     System.out.println("Salam") ;
				    	
						 PropertyListingDate=null;  }else {
							 
						     System.out.println("Hello") ;

						 date_PropertyListingDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss", Locale.US ).parse(request.getParameter("PropertyListingDate")+" "+"00:00:00");
						 
						 PropertyListingDate=new Timestamp( date_PropertyListingDate.getTime() ); }
				    
				    
				    
				    System.out.println("date testtt"+" "+request.getParameter("PropertyClosingDate"));
				    
				    if(request.getParameter("PropertyClosingDate").isEmpty()  || request.getParameter("PropertyClosingDate")==null ||  request.getParameter("PropertyClosingDate").equals("null") ) 
				    
				    { PropertyClosingDate=null; }else { 
				    	
				    	date_PropertyClosingDate=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("PropertyClosingDate"));
				    	
				    	 System.out.println("date testtt1111"+" "+date_PropertyClosingDate);
				    	 
				    	PropertyClosingDate=new Timestamp( date_PropertyClosingDate.getTime() ); }
				    
				    
				    
				    
				    if(request.getParameter("PropertyExpirationDate").isEmpty() || request.getParameter("PropertyExpirationDate")==null || request.getParameter("PropertyExpirationDate").equals("null")) {
				    	
				    	PropertyExpireDate=null;  }else {
				    
				    	date_PropertyExpireDate= new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse(request.getParameter("PropertyExpirationDate")+" "+"00:00:00");
				    	
				    	PropertyExpireDate=new Timestamp( date_PropertyExpireDate.getTime() ); }
				    
				    

				    
				    if(request.getParameter("PropertyOfferDate").isEmpty() || request.getParameter("PropertyOfferDate")==null || request.getParameter("PropertyOfferDate").equals("null") ) { 
				    	
				    	OfferDate=null;
				    	
				    }else { 
				    	
				    	date_OfferDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss",Locale.US).parse(request.getParameter("PropertyOfferDate")+" "+"00:00:00");
				    	
				    	OfferDate=new Timestamp( date_OfferDate.getTime() ); }
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyOfferExpirationDate").isEmpty() || request.getParameter("PropertyOfferExpirationDate")==null || request.getParameter("PropertyOfferExpirationDate").equals("null")) { 
				    	
				    	OfferExpiretionDate=null;
				    			
				    }else {
				    	
				    	date_OfferExpiretionDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss",Locale.US).parse(request.getParameter("PropertyOfferExpirationDate")+" "+"00:00:00");
				          
				    	OfferExpiretionDate=new Timestamp( date_OfferExpiretionDate.getTime() ); }
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyOfferAcceptanceDate").isEmpty() || request.getParameter("PropertyOfferAcceptanceDate")==null || request.getParameter("PropertyOfferAcceptanceDate").equals("null")) {
				    	
				    	OfferAcceptanceDate=null;
				    	
				    }else {
				    	
				    	date_OfferAcceptanceDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss", Locale.US).parse(request.getParameter("PropertyOfferAcceptanceDate")+" "+"00:00:00");
				    	
				    	OfferAcceptanceDate=new Timestamp( date_OfferAcceptanceDate.getTime() ); }
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyConditionsExpirationDate").isEmpty() || request.getParameter("PropertyConditionsExpirationDate")==null || request.getParameter("PropertyConditionsExpirationDate").equals("null")) { 
				    	
				    	ConditionExpirationDate=null;
				    	
				    }else {
				    	
				    	date_ConditionExpirationDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss" ,Locale.US).parse(request.getParameter("PropertyConditionsExpirationDate")+" "+"00:00:00");
				    	
				    	ConditionExpirationDate=new Timestamp( date_ConditionExpirationDate.getTime() );}
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyConditionsCompleteDate").isEmpty() || request.getParameter("PropertyConditionsCompleteDate")==null || request.getParameter("PropertyConditionsCompleteDate").equals("null")) { 
				    	
				    	ConditionCompletationDate=null;
				    	
				    }else {
				    	
				    	date_ConditionCompletationDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss" ,Locale.US).parse(request.getParameter("PropertyConditionsCompleteDate")+" "+"00:00:00");
				    	
				    	ConditionCompletationDate=new Timestamp( date_ConditionCompletationDate.getTime() ); }
				    
				    
				    
				    
				    if(request.getParameter("PropertyOfferWithdrawalDate").isEmpty() || request.getParameter("PropertyOfferWithdrawalDate")==null || request.getParameter("PropertyOfferWithdrawalDate").equals("null")) { 
				    	
				    	OfferWithrawalDate=null;
				    	
				    }else {
				    	
				    	date_OfferWithrawalDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss", Locale.US).parse(request.getParameter("PropertyOfferWithdrawalDate")+" "+"00:00:00");
				    	
				    	OfferWithrawalDate=new Timestamp( date_OfferWithrawalDate.getTime() );}
				    
				    
				    
				    
				    if(request.getParameter("PropertyInspectionDate").isEmpty() || request.getParameter("PropertyInspectionDate")==null || request.getParameter("PropertyInspectionDate").equals("null")) {
				    	
				    	InspectionDate=null;
				    	
				    }else {
				    	
				    	date_InspectionDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss" ,  Locale.US).parse(request.getParameter("PropertyInspectionDate")+" "+"00:00:00");
				    	
				    	InspectionDate=new Timestamp( date_InspectionDate.getTime() ); }
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyOccupancyDate").isEmpty() || request.getParameter("PropertyOccupancyDate")==null || request.getParameter("PropertyOccupancyDate").equals("null")) { 
				    	
				    	AccupancyDate=null;
				    	
				    }else {
				    	
				    	date_AccupancyDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US).parse(request.getParameter("PropertyOccupancyDate")+" "+"00:00:00");
				    	
				    	AccupancyDate=new Timestamp( date_AccupancyDate.getTime() );  }
				    
				    
				    
				    
				    
				    if(request.getParameter("PropertyOffMarketDate").isEmpty() || request.getParameter("PropertyOffMarketDate")==null || request.getParameter("PropertyOffMarketDate").equals("null")) {
				    	
				    	OffMarketDate=null;
				    	
				    }else {
				    	
				    	date_OffMarketDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss" ,Locale.US).parse(request.getParameter("PropertyOffMarketDate")+" "+"00:00:00");
				    	
				    	date_OffMarketDate=new Timestamp( date_OffMarketDate.getTime() );  }
				    
				    
				    
				    
				    
				    } catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				    Timestamp  CreateDate=null;
				    
				    Timestamp  FinalizedDate=null;
				    
			    	java.util.Date Newdate = Calendar.getInstance().getTime();  
			    		
		    	 	SimpleDateFormat formattertime = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 	 
                    CreateDate=new Timestamp(Newdate.getTime());

				    /*System.out.println( "PropertyListingDate"+" "+PropertyListingDate);
				    
				    System.out.println( "PropertyClosingDate"+" "+PropertyClosingDate);
				    
				    System.out.println( "PropertyExpireDate"+" "+PropertyExpireDate);
				    
				    System.out.println( "OfferDate"+" "+OfferDate);
				    
				    System.out.println( "OfferExpiretionDate"+" "+OfferExpiretionDate);
				    
				    System.out.println( "OfferAcceptanceDate"+" "+OfferAcceptanceDate);
				    
				    System.out.println( "ConditionCompletationDate"+" "+ConditionCompletationDate);
				    
				    System.out.println( "ConditionExpirationDate"+" "+ConditionExpirationDate);
				    
				    System.out.println( "InspectionDate"+" "+InspectionDate);
				   
				    System.out.println( "OfferWithrawalDate"+" "+OfferWithrawalDate);
				    
				    System.out.println( "AccupancyDate"+" "+AccupancyDate);
				    
				    System.out.println( "OffMarketDate"+" "+OffMarketDate);*/
                    



 //****************************************************************************** Getting the Referral Information ******************************************************************************//

		    String  ReferalCondition1="0";
		    
			String  ReferalCondition2="0";
			    
		    String  Referralrecipientregistrant="";

	        String  Referralagreementdisclosedtoallparties="";

	        String  ReferralAgentFirstName="";
	        
	        String  ReferralAgentLastName="";
	        
	        String  ReferralBrokerage="";
	        
	        String  ReferralUnit="";
	        
	        String  ReferralStreetNumber="";
	        
	        String  ReferralStreetName="";
	        
	        String  ReferralCity="";
	        
	        String  ReferralPostalCode="";
	        
	        String  ReferralCountry="";
	        
	        String  ReferralProvince="";
	        
	        String  ReferralOtherProvince="";
	        
		    String  ReferralEmail="";
 		        
		    String  ReferralPhone="";
		        
		    String  ReferralExtraContact="";
		        
		    String  ReferralExtraContactNumber="";
		        
		    String  ReferralFeeAmount="";
		        
		    String  ReferralHSTNumber1="";
		    
		    String  ReferralHSTNumber2="";
		        
		    String  ReferralAgent1Percentage="";
		        
		    String  ReferralAgent2Percentage="";
		    
		    String  ReferralMainProvince="";
		    
			String  ReferralFee=request.getParameter("AddRefferalFree");
			
		    if(ReferralFee==null) {  /*Do nothing if there is no referral */  }

		    else { 
			         ReferalCondition1="0";
			    
			         ReferalCondition2="0";
			    
		             Referralrecipientregistrant=request.getParameter("ReferralfeeIsRegistrantYES");

	                 if(Referralrecipientregistrant!=null){  ReferalCondition1="1"; }else { ReferalCondition1="0";}
	        
	                 Referralagreementdisclosedtoallparties=request.getParameter("ReferralfeeIsDisclosedToAllYES");
	        
	                 if(Referralagreementdisclosedtoallparties!=null) { ReferalCondition2="1"; }else { ReferalCondition2="0";}
	        
	                 ReferralAgentFirstName=request.getParameter("PayeeFirstName");
	        
	                 ReferralAgentLastName=request.getParameter("PayeeLastName");
	        
	                 ReferralBrokerage=request.getParameter("PayeePRealStateBrokerage");
	        
	                 ReferralUnit=request.getParameter("PayeeUnit");
	        
	                 ReferralStreetNumber=request.getParameter("PayeeStreetNumber");
	        
	                 ReferralStreetName=request.getParameter("PayeeStreetName");
	        
	                 ReferralCity=request.getParameter("PayeeCity");
	        
	                 ReferralPostalCode=request.getParameter("PayeePostalCode");
	        
	                 ReferralCountry=request.getParameter("PayeeCountry");
	        
	                 ReferralProvince=request.getParameter("PayeeProvince");
	        
	                 ReferralOtherProvince=request.getParameter("PayeeOtherProvince");
	        
	                 if( ReferralProvince.equals("Other") ) { ReferralMainProvince=ReferralOtherProvince; } else {  ReferralMainProvince=ReferralProvince;  }
	        
	                 ReferralEmail=request.getParameter("PayeeEmail");
	        
	                 ReferralPhone=request.getParameter("PayeePhone");
	        
	                 ReferralExtraContact=request.getParameter("PayeeExtraContactInformationLabel");
	        
	                 ReferralExtraContactNumber=request.getParameter("PayeeExtraContactInformation");
	        
	                 ReferralFeeAmount=request.getParameter("ReferralFeeAmount");
	        
		             ReferralHSTNumber1=request.getParameter("ReferralPayeeHSTNumber");
			    
	                 ReferralHSTNumber2=request.getParameter("ReferralPayeeHSTNumber2");
	        
	                 ReferralAgent1Percentage=request.getParameter("ReferralPercentageAmountToAgent1");
	        
	                 ReferralAgent2Percentage=request.getParameter("ReferralPercentageAmountToAgent2");

		    } // else ReferralFee==null
			
			
 //****************************************************************************** Getting Rebate Fee Data ******************************************************************************//  
		    
		    String  RebateCondition1="0";
		    
		    String  RebateCondition2="0";
		    
	        String  RebateAgreemenComplyWithEthic="";
	        
            String  RebateAmount1="";
	        
	        String  RebateCustomer1="";
	        
	        String  RebateAmount2="";
	        
	        String  RebateCustomer2="";
	        
	        String  RebateAmount3="";
	        
	        String  RebateCustomer3="";
	        
	        String  RebateAmount4="";
	        
	        String  RebateCustomer4="";
	        
	        String  TotalRebates="";
	        
	        String  RebateAgent1Percentage="";
	        
	        String  RebateAgent2Percentage="";
	        
	        String  RebatRecipientPartyToTrade="";

		    String  Rebate=request.getParameter("AddRebate");
		    
		    if( Rebate==null ) { /*Do nothing if there is no Rebate */ }

		    else { 
		      
			         RebateCondition1="0";
			    
			         RebateCondition2="0";
			         
	                 RebateAgreemenComplyWithEthic=request.getParameter("ComplyWithEthicYes");
			    
		             RebatRecipientPartyToTrade=request.getParameter("RecipientAPartyYes");

	                 if(RebatRecipientPartyToTrade==null){  RebateCondition1="0"; }else { RebateCondition1="1";}
	        
	                 if( RebateAgreemenComplyWithEthic==null) { RebateCondition2="0"; }else { RebateCondition2="1";}
	        
	                 RebateAmount1=request.getParameter("FirstRebateAmount");
	        
	                 RebateCustomer1=request.getParameter("RebateCustomerReciever1");
	        
	                 RebateAmount2=request.getParameter("SecondRebateAmount");
	        
	                 RebateCustomer2=request.getParameter("RebateCustomerReciever2");
	        
	                 RebateAmount3=request.getParameter("ThirdRebateAmount");
	        
	                 RebateCustomer3=request.getParameter("RebateCustomerReciever3");
	        
	                 RebateAmount4=request.getParameter("ForthRebateAmount");
	        
	                 RebateCustomer4=request.getParameter("RebateCustomerReciever4");
	         
	                 TotalRebates=request.getParameter("TotalRebats");
	        
	                 RebateAgent1Percentage=request.getParameter("RebateAgent1amount");
	        
	                 RebateAgent2Percentage=request.getParameter("RebateAgent2amount");

		    } // End else Rebate==null
		    

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

// Here we are creating some variables to check if we should add the data to the database or not 
		    
		int isVendor1=0; 
		
		int isVendor2=0;
		
    	int isVendor3=0;
    	
    	int isVendor4=0;
    	
    	int isPurchaser1=0;
    	
    	int isPurchaser2=0;
    	
    	int isPurchaser3=0;
    	
    	int isPurchaser4=0;
    	
    	int isDeposit1=0;
    	
    	int isDeposit2=0;
    	
    	int isDeposit3=0;
    	
    	int isDeposit4=0;
    	
    	int isVendorLawyer=0;
    	
    	int isPurchaserLawyer=0;
    	
    	int isCooperatingBrokerage=0;

 /////////////////////////////////////////////////////////////////////////////////// Getting first Vendor information ///////////////////////////////////////////////////////////////////////  
	    
	    
	    String VendorType1=request.getParameter("VendorType1");
	    
	    String VendorBusinessName1=request.getParameter("VendorBusinessName1");
	    
	    String VendorOfficer1=request.getParameter("VendorAuthorizedSigningOfficer1");
	    
        String VendorFirstName1=request.getParameter("VendorFirstName1");
	    
	    String VendorLastName1=request.getParameter("VendorLastName1");

	    String VendorUnit1=request.getParameter("VendorUnit1");
	    
	    String VendorStreetNumber1=request.getParameter("VendorStreetNumber1");
	    
	    String VendorStreetName1=request.getParameter("VendorStreetName1");
	    
	    String VendorCity1=request.getParameter("VendorCity1");
	    
	    String VendorPostalCode1=request.getParameter("VendorPostalCode1");
	    
	    String VendorProvince1=request.getParameter("VendorProvince1");
	    
	    String VendorOtherProvince1=request.getParameter("VendorOtherProvince1");
	    
	    String VendorMainProvince1="";
	    
	    if(VendorProvince1.equals("Other")) { VendorMainProvince1=VendorOtherProvince1; }else { VendorMainProvince1=VendorProvince1; }
	    
	    String VendorCountry1=request.getParameter("VendorCountry1");
	    
	    String VendorEmail1=request.getParameter("VendorEmail1");
	    
        String VendorPhone1=request.getParameter("VendorPhone1");
	    
	    String VendorExteraContact1=request.getParameter("VendorExteraContactInformation1");
	    
	    String VendorExteraContactNumber1=request.getParameter("VendorExteraContact1");
	    
	    String VendorPowerofattorney1=request.getParameter("poaVendor1");

	   
	     if(     !VendorBusinessName1.isEmpty() || !VendorOfficer1.isEmpty() || !VendorFirstName1.isEmpty() || !VendorLastName1.isEmpty() ||

	    		 !VendorUnit1.isEmpty() || !VendorStreetNumber1.isEmpty() ||  !VendorStreetName1.isEmpty() 	||  !VendorCity1.isEmpty() || !VendorPostalCode1.isEmpty()||
	    		 
	    		  !VendorEmail1.isEmpty() || !VendorPhone1.isEmpty() || !VendorExteraContactNumber1.isEmpty()  ) 
	     
	     {  isVendor1=1;  }else {  isVendor1=0;   }
	    

 /////////////////////////////////////////////////////////////////////////////////// Getting Second Vendor information ///////////////////////////////////////////////////////////////////////  

	    
	    String VendorType2=request.getParameter("VendorType2");
	    
	    String VendorBusinessName2=request.getParameter("VendorBusinessName2");
	    
	    String VendorOfficer2=request.getParameter("VendorAuthorizedSigningOfficer2");
	    
        String VendorFirstName2=request.getParameter("VendorFirstName2");
	    
	    String VendorLastName2=request.getParameter("VendorLastName2");

	    String VendorUnit2=request.getParameter("VendorUnit2");
	    
	    String VendorStreetNumber2=request.getParameter("VendorStreetNumber2");
	    
	    String VendorStreetName2=request.getParameter("VendorStreetName2");
	    
	    String VendorCity2=request.getParameter("VendorCity2");
	    
	    String VendorPostalCode2=request.getParameter("VendorPostalCode2");
	    
	    String VendorProvince2=request.getParameter("VendorProvince2");
	    
	    String VendorOtherProvince2=request.getParameter("VendorOtherProvince2");
	    
	    String VendorMainProvince2="";
	    
	    if(VendorProvince2.equals("Other")) { VendorMainProvince2=VendorOtherProvince2; }else { VendorMainProvince2=VendorProvince2; }
	    
	    String VendorCountry2=request.getParameter("VendorCountry2");
	    
	    String VendorEmail2=request.getParameter("VendorEmail2");
	    
        String VendorPhone2=request.getParameter("VendorPhone2");
	    
	    String VendorExteraContact2=request.getParameter("VendorExteraContactInformation2");
	    
	    String VendorExteraContactNumber2=request.getParameter("VendorExteraContact2");
	    
	    String VendorPowerofattorney2=request.getParameter("poaVendor2");

	     
	     if(     !VendorBusinessName2.isEmpty()  || !VendorOfficer2.isEmpty() ||  !VendorFirstName2.isEmpty()  || !VendorLastName2.isEmpty() ||

	    		  !VendorUnit2.isEmpty()  || !VendorStreetNumber2.isEmpty()  ||  !VendorStreetName2.isEmpty() 	 ||  !VendorCity2.isEmpty()  || !VendorPostalCode2.isEmpty() ||
	    		 
	    		  !VendorEmail2.isEmpty()  || !VendorPhone2.isEmpty()  || !VendorExteraContactNumber2.isEmpty()  ) 
	     
	     {   isVendor2=1;    }else {  isVendor2=0;  }
	     

/////////////////////////////////////////////////////////////////////////////////// Getting Third Vendor information ///////////////////////////////////////////////////////////////////////  
	     
	    
	    String VendorType3=request.getParameter("VendorType3");
	    
	    String VendorBusinessName3=request.getParameter("VendorBusinessName3");
	    
	    String VendorOfficer3=request.getParameter("VendorAuthorizedSigningOfficer3");
	    
        String VendorFirstName3=request.getParameter("VendorFirstName3");
	    
	    String VendorLastName3=request.getParameter("VendorLastName3");

	    String VendorUnit3=request.getParameter("VendorUnit3");
	    
	    String VendorStreetNumber3=request.getParameter("VendorStreetNumber3");
	    
	    String VendorStreetName3=request.getParameter("VendorStreetName3");
	    
	    String VendorCity3=request.getParameter("VendorCity3");
	    
	    String VendorPostalCode3=request.getParameter("VendorPostalCode3");
	    
	    String VendorProvince3=request.getParameter("VendorProvince3");
	    
	    String VendorOtherProvince3=request.getParameter("VendorOtherProvince3");
	    
        String VendorMainProvince3="";
	    
	    if(VendorProvince3.equals("Other")) { VendorMainProvince3=VendorOtherProvince3; }else { VendorMainProvince3=VendorProvince3; }

	    String VendorCountry3=request.getParameter("VendorCountry3");
	    
	    String VendorEmail3=request.getParameter("VendorEmail3");
	    
        String VendorPhone3=request.getParameter("VendorPhone3");
	    
	    String VendorExteraContact3=request.getParameter("VendorExteraContactInformation3");
	    
	    String VendorExteraContactNumber3=request.getParameter("VendorExteraContact3"); 
	    
	    String VendorPowerofattorney3=request.getParameter("poaVendor3");

	     if( !VendorBusinessName3.isEmpty() || !VendorOfficer3.isEmpty() || !VendorFirstName3.isEmpty() || !VendorLastName3.isEmpty() ||

	    		 !VendorUnit3.isEmpty() || !VendorStreetNumber3.isEmpty() ||  !VendorStreetName3.isEmpty() 	||  !VendorCity3.isEmpty() || !VendorPostalCode3.isEmpty()||
	    		 
	    		 !VendorEmail3.isEmpty() || !VendorPhone3.isEmpty() || !VendorExteraContactNumber3.isEmpty()  ) {  isVendor3=1;  }else {   isVendor3=0;  }
	    
/////////////////////////////////////////////////////////////////////////////////////////// Getting forth Vendor information //////////////////////////////////////////////////////////////////////////////////////////// 
	  

	    String VendorType4=request.getParameter("VendorType4");
	    
	    String VendorBusinessName4=request.getParameter("VendorBusinessName4");
	    
	    String VendorOfficer4=request.getParameter("VendorAuthorizedSigningOfficer4");
	    
        String VendorFirstName4=request.getParameter("VendorFirstName4");
	    
	    String VendorLastName4=request.getParameter("VendorLastName4");

	    String VendorUnit4=request.getParameter("VendorUnit4");
	    
	    String VendorStreetNumber4=request.getParameter("VendorStreetNumber4");
	    
	    String VendorStreetName4=request.getParameter("VendorStreetName4");
	    
	    String VendorCity4=request.getParameter("VendorCity4");
	    
	    String VendorPostalCode4=request.getParameter("VendorPostalCode4");
	    
	    String VendorProvince4=request.getParameter("VendorProvince4");
	    
	    String VendorOtherProvince4=request.getParameter("VendorOtherProvince4");
	    
        String VendorMainProvince4="";
	    
	    if(VendorProvince4.equals("Other") && !VendorProvince4.equals(null)) { VendorMainProvince4=VendorOtherProvince4; }else { VendorMainProvince4=VendorProvince4; }

	    String VendorCountry4=request.getParameter("VendorCountry4");
	    
	    String VendorEmail4=request.getParameter("VendorEmail4");
	    
        String VendorPhone4=request.getParameter("VendorPhone4");
	    
	    String VendorExteraContact4=request.getParameter("VendorExteraContactInformation4");
	    
	    String VendorExteraContactNumber4=request.getParameter("VendorExteraContact4");
	    
	    String VendorPowerofattorney4=request.getParameter("poaVendor4");


	     if(     !VendorBusinessName4.isEmpty() || !VendorOfficer4.isEmpty() || !VendorFirstName4.isEmpty() || !VendorLastName4.isEmpty() ||

	    		 !VendorUnit4.isEmpty() || !VendorStreetNumber4.isEmpty() ||  !VendorStreetName4.isEmpty() 	||  !VendorCity4.isEmpty() || !VendorPostalCode4.isEmpty()||
	    		 
	    		 !VendorEmail4.isEmpty() || !VendorPhone4.isEmpty() || !VendorExteraContactNumber4.isEmpty()  ) {  isVendor4=1;  }else {  isVendor4=0; }
  
	    
///////////////////////////////////////////////////////////////////////////////////////////////////////////  Getting first Purchaser information	 //////////////////////////////////////////////////////////////////////////////////////

		    String PurchaserType1=request.getParameter("PurchaserType1");
		    
		    String PurchaserBusinessName1=request.getParameter("PurchaserBusinessName1");
		    
		    String PurchaserOfficer1=request.getParameter("PurchaserAuthorizedSigningOfficer1");
		    
	        String PurchaserFirstName1=request.getParameter("PurchaserFirstName1");
		    
		    String PurchaserLastName1=request.getParameter("PurchaserLastName1");

		    String PurchaserUnit1=request.getParameter("PurchaserUnit1");
		    
		    String PurchaserStreetNumber1=request.getParameter("PurchaserStreetNumber1");
		    
		    String PurchaserStreetName1=request.getParameter("purchaserStreetName1");
		    
		    String PurchaserCity1=request.getParameter("PurchaserCity1");
		    
		    String PurchaserPostalCode1=request.getParameter("PurchaserPostalCode1");
		    
		    String PurchaserProvince1=request.getParameter("PurchaserProvince1");
		    
		    String PurchaserOtherProvince1=request.getParameter("PurchaserOtherProvince1");
		    
	        String PurchaserMainProvince1="poaPurchaser1";
		    
		    if(PurchaserProvince1.equals("Other")) { PurchaserMainProvince1=PurchaserOtherProvince1; }else { PurchaserMainProvince1=PurchaserProvince1; }
		    
		    String PurchaserCountry1=request.getParameter("PurchaserCountry1");
		    
		    String PurchaserEmail1=request.getParameter("PurchaserEmail1");
		    
	        String PurchaserPhone1=request.getParameter("PurchaserPhone1");
		    
		    String PurchaserExteraContact1=request.getParameter("PurchaserExteraContactInformation1");
		    
		    String PurchaserExteraContactNumber1=request.getParameter("PurchaserExteraContact1");
		    
		    String PurchaserPowerofattorney1=request.getParameter("poaPurchaser1");

	     if(       !PurchaserBusinessName1.isEmpty() || !PurchaserOfficer1.isEmpty() || !PurchaserFirstName1.isEmpty() || !PurchaserLastName1.isEmpty() ||

		    		 !PurchaserUnit1.isEmpty() || !PurchaserStreetNumber1.isEmpty() ||  !PurchaserStreetName1.isEmpty() 	||  !PurchaserCity1.isEmpty() || !PurchaserPostalCode1.isEmpty()||
		    		 
		    		 !PurchaserEmail1.isEmpty() || !PurchaserPhone1.isEmpty() || !PurchaserExteraContactNumber1.isEmpty()  ) {  isPurchaser1=1;  }else {  isPurchaser1=0; }
		   

///////////////////////////////////////////////////////////////////////////////////////////////////////////  Getting Second Purchaser information	 //////////////////////////////////////////////////////////////////////////////////////

		    
		    String PurchaserType2=request.getParameter("PurchaserType2");
		    
		    String PurchaserBusinessName2=request.getParameter("PurchaserBusinessName2");
		    
		    String PurchaserOfficer2=request.getParameter("PurchaserAuthorizedSigningOfficer2");
		    
	        String PurchaserFirstName2=request.getParameter("PurchaserFirstName2");
		    
		    String PurchaserLastName2=request.getParameter("PurchaserLastName2");

		    String PurchaserUnit2=request.getParameter("PurchaserUnit2");
		    
		    String PurchaserStreetNumber2=request.getParameter("PurchaserStreetNumber2");
		    
		    String PurchaserStreetName2=request.getParameter("purchaserStreetName2");
		    
		    String PurchaserCity2=request.getParameter("PurchaserCity2");
		    
		    String PurchaserPostalCode2=request.getParameter("PurchaserPostalCode2");
		    
		    String PurchaserProvince2=request.getParameter("PurchaserProvince2");
		    
		    String PurchaserOtherProvince2=request.getParameter("PurchaserOtherProvince2");
		    
	        String PurchaserMainProvince2="";
		    
		    if(PurchaserProvince2.equals("Other")) { PurchaserMainProvince2=PurchaserOtherProvince2; }else { PurchaserMainProvince2=PurchaserProvince2; }
		    
		    String PurchaserCountry2=request.getParameter("PurchaserCountry2");
		    
		    String PurchaserEmail2=request.getParameter("PurchaserEmail2");
		    
	        String PurchaserPhone2=request.getParameter("PurchaserPhone2");
		    
		    String PurchaserExteraContact2=request.getParameter("PurchaserExteraContactInformation2");
		    
		    String PurchaserExteraContactNumber2=request.getParameter("PurchaserExteraContact2");
		    
		    String PurchaserPowerofattorney2=request.getParameter("poaPurchaser2");

	     if(       !PurchaserBusinessName2.isEmpty() || !PurchaserOfficer2.isEmpty() || !PurchaserFirstName2.isEmpty() || !PurchaserLastName2.isEmpty() ||

		    		 !PurchaserUnit2.isEmpty() || !PurchaserStreetNumber2.isEmpty() ||  !PurchaserStreetName2.isEmpty() 	||  !PurchaserCity2.isEmpty() || !PurchaserPostalCode2.isEmpty()||
		    		 
		    		 !PurchaserEmail2.isEmpty() || !PurchaserPhone2.isEmpty() || !PurchaserExteraContactNumber2.isEmpty()  ) {  isPurchaser2=1;  }else {  isPurchaser2=0; }
		    
    

///////////////////////////////////////////////////////////////////////////////////////////////////////////  Getting Third Purchaser information	 //////////////////////////////////////////////////////////////////////////////////////	     

		    
		    String PurchaserType3=request.getParameter("PurchaserType3");
		    
		    String PurchaserBusinessName3=request.getParameter("PurchaserBusinessName3");
		    
		    String PurchaserOfficer3=request.getParameter("PurchaserAuthorizedSigningOfficer3");
		    
	        String PurchaserFirstName3=request.getParameter("PurchaserFirstName3");
		    
		    String PurchaserLastName3=request.getParameter("PurchaserLastName3");

		    String PurchaserUnit3=request.getParameter("PurchaserUnit3");
		    
		    String PurchaserStreetNumber3=request.getParameter("PurchaserStreetNumber3");
		    
		    String PurchaserStreetName3=request.getParameter("purchaserStreetName3");
		    
		    String PurchaserCity3=request.getParameter("PurchaserCity3");
		    
		    String PurchaserPostalCode3=request.getParameter("PurchaserPostalCode3");
		    
		    String PurchaserProvince3=request.getParameter("PurchaserProvince3");
		    
		    String PurchaserOtherProvince3=request.getParameter("PurchaserOtherProvince3");

	        String PurchaserMainProvince3="";
		    
		    if(PurchaserProvince3.equals("Other")) { PurchaserMainProvince3=PurchaserOtherProvince3; }else { PurchaserMainProvince3=PurchaserProvince3; }
		    
		    String PurchaserCountry3=request.getParameter("PurchaserCountry3");
		    
		    String PurchaserEmail3=request.getParameter("PurchaserEmail3");
		    
	        String PurchaserPhone3=request.getParameter("PurchaserPhone3");
		    
		    String PurchaserExteraContact3=request.getParameter("PurchaserExteraContactInformation3");
		    
		    String PurchaserExteraContactNumber3=request.getParameter("PurchaserExteraContact3"); 
		    
		    String PurchaserPowerofattorney3=request.getParameter("poaPurchaser3");
		     
	     if(        !PurchaserBusinessName3.isEmpty() || !PurchaserOfficer3.isEmpty() || !PurchaserFirstName3.isEmpty() || !PurchaserLastName3.isEmpty() ||
	    		 
		    		 !PurchaserUnit3.isEmpty() || !PurchaserStreetNumber3.isEmpty() ||  !PurchaserStreetName3.isEmpty() 	||  !PurchaserCity3.isEmpty() || !PurchaserPostalCode3.isEmpty()||
		    		 
		    		 !PurchaserEmail3.isEmpty() || !PurchaserPhone3.isEmpty() || !PurchaserExteraContactNumber3.isEmpty()  ) {  isPurchaser3=1;  }else { isPurchaser3=0;  }
	     
		    
////////////////////////////////////////////////////////////////////////////////// Getting Forth Purchaser information ///////////////////////////////////////////////////////////////////////////////////	    
		    
	

		    String PurchaserType4=request.getParameter("PurchaserType4");
		    
		    String PurchaserBusinessName4=request.getParameter("PurchaserBusinessName4");
		    
		    String PurchaserOfficer4=request.getParameter("PurchaserAuthorizedSigningOfficer4");
		    
	        String PurchaserFirstName4=request.getParameter("PurchaserFirstName4");
		    
		    String PurchaserLastName4=request.getParameter("PurchaserLastName4");

		    String PurchaserUnit4=request.getParameter("PurchaserUnit4");
		    
		    String PurchaserStreetNumber4=request.getParameter("PurchaserStreetNumber4");
		    
		    String PurchaserStreetName4=request.getParameter("purchaserStreetName4");
		    
		    String PurchaserCity4=request.getParameter("PurchaserCity4");
		    
		    String PurchaserPostalCode4=request.getParameter("PurchaserPostalCode4");
		    
		    String PurchaserProvince4=request.getParameter("PurchaserProvince4");
		    
		    String PurchaserOtherProvince4=request.getParameter("PurchaserOtherProvince4");

	        String PurchaserMainProvince4="";
		    
		    if(PurchaserProvince4.equals("Other")) { PurchaserMainProvince4=PurchaserOtherProvince4; }else { PurchaserMainProvince4=PurchaserProvince4; }
		    
		    String PurchaserCountry4=request.getParameter("PurchaserCountry4");
		    
		    String PurchaserEmail4=request.getParameter("PurchaserEmail4");
		    
	        String PurchaserPhone4=request.getParameter("PurchaserPhone4");
		    
		    String PurchaserExteraContact4=request.getParameter("PurchaserExteraContactInformation4");
		    
		    String PurchaserExteraContactNumber4=request.getParameter("PurchaserExteraContact4");
		    
		    String PurchaserPowerofattorney4=request.getParameter("poaPurchaser4");

	     if(         !PurchaserBusinessName4.isEmpty() || !PurchaserOfficer4.isEmpty() || !PurchaserFirstName4.isEmpty() || !PurchaserLastName4.isEmpty() ||

		    		 !PurchaserUnit4.isEmpty() || !PurchaserStreetNumber4.isEmpty() ||  !PurchaserStreetName4.isEmpty() 	||  !PurchaserCity4.isEmpty() || !PurchaserPostalCode4.isEmpty()||
		    		 
		    		 !PurchaserEmail4.isEmpty() || !PurchaserPhone4.isEmpty() || !PurchaserExteraContactNumber4.isEmpty()  ) {  isPurchaser4=1;  }else { isPurchaser4=0; }

		     
//////////////////////////////////////////////////////////////////////////////////////// Getting Vendor Lawyer information //////////////////////////////////////////////////////////////////////////////////
	    
	String VendorLawFirm=request.getParameter("VendorLawyerFirm");
			    
    String VendorLawyer=request.getParameter("VendorLawyerName");
			    
    String VendorLawyerUnit=request.getParameter("VendorLawyerUnit");
			    
    String VendorLawyerStreetName=request.getParameter("VendorLawyerStreetName");
    
    String VendorLawyerStreetNumber=request.getParameter("VendorLawyerStreetNumber");
			    
    String VendorLawyerCity=request.getParameter("VendorLawyerCity");
			    
    String VendorLawyerProvince=request.getParameter("VendorLawyerProvince");
			    
    String VendorLawyerPostalCode=request.getParameter("VendorLawyerPostalCode");
    
    String VendorLawyerEmail=request.getParameter("VendorLawyerEmail");
		     
    String VendorLawyerExtraContact=request.getParameter("VendorLawyerExteraContactInformation");
    
    String VendorLawyerExtraContactNumber=request.getParameter("VendorLawyerExteraContact");
    
    String VendorLawyerPhone=request.getParameter("VendorLawyerPhone");
    
    String VendorLawyerClerkFullName=request.getParameter("ClerkFullName");
    
    String VendorLawyerClerkEmail=request.getParameter("ClerkEmail");

    if( !VendorLawFirm.isEmpty() || !VendorLawyer.isEmpty() || !VendorLawyerUnit.isEmpty() || !VendorLawyerStreetName.isEmpty() ||

   		 !VendorLawyerStreetNumber.isEmpty() || !VendorLawyerCity.isEmpty() ||  !VendorLawyerPostalCode.isEmpty() 	||  !VendorLawyerEmail.isEmpty() || ! VendorLawyerPostalCode.isEmpty()||
   		 
   		 ! VendorLawyerEmail.isEmpty() || ! VendorLawyerPhone.isEmpty() || ! VendorLawyerExtraContactNumber.isEmpty()  ) {
    
    	isVendorLawyer=1;  } else {  isVendorLawyer=0; }
    
///////////////////////////////////////////////////////////////////////////////////////////////// Getting Purchaser Lawyer information /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

  	  String PurchaserLawFirm=request.getParameter("PurchaserLawyerFirm");
  			    
      String PurchaserLawyer=request.getParameter("PurchaserLawyerName");
  			    
      String PurchaserLawyerUnit=request.getParameter("PurchaserLawyerUnit");
  			    
      String PurchaserLawyerStreetName=request.getParameter("PurchaserLawyerStreetName");
      
      String PurchaserLawyerStreetNumber=request.getParameter("PurchaserLawyerStreetNumber");
  			    
      String PurchaserLawyerCity=request.getParameter("PurchaserLawyerCity");
  			    
      String PurchaserLawyerProvince=request.getParameter("PurchaserLawyerProvince");
  			    
      String PurchaserLawyerPostalCode=request.getParameter("PurchaserLawyerPostalCode");
      
      String PurchaserLawyerEmail=request.getParameter("PurchaserLawyerEmail");
  		     
      String PurchaserLawyerExtraContact=request.getParameter("PurchaserLawyerExteraContactInformation");
      
      String PurchaserLawyerExtraContactNumber=request.getParameter("PurchaserLawyerExteraContact");
      
      String PurchaserLawyerPhone=request.getParameter("PurchaserLawyerPhone");

      if(!PurchaserLawFirm.isEmpty() || !PurchaserLawyer.isEmpty() ||!PurchaserLawyerUnit.isEmpty() || !PurchaserLawyerStreetName.isEmpty() || 

    	   		!PurchaserLawyerStreetNumber.isEmpty() || !PurchaserLawyerCity.isEmpty() ||  !PurchaserLawyerPostalCode.isEmpty() 	||  !PurchaserLawyerEmail.isEmpty() || !PurchaserLawyerPostalCode.isEmpty()||
    	   		 
    	   		 !PurchaserLawyerEmail.isEmpty() || !PurchaserLawyerPhone.isEmpty() || !PurchaserLawyerExtraContactNumber.isEmpty()  ) {
      
    	  isPurchaserLawyer=1;  }else {  isPurchaserLawyer=0; }
      
///////////////////////////////////////////////////////////////////////////////////////////  Retrieving  First Deposit Information ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      
      String DepositType1=request.getParameter("DepositType1");
      
      String DepositAmount1=request.getParameter("DepositAmount1");
      
      Timestamp DepositDate1=null;
      
      Date date_DepositDate1 = null;
      
      System.out.println("Deposit check"+" "+request.getParameter("DepositDate1"));
      
      if(  request.getParameter("DepositDate1").isEmpty() || request.getParameter("DepositDate1")==null || request.getParameter("DepositDate1").equals("null") || request.getParameter("DepositDate1").equals("")) {}else {
    
	try {
		date_DepositDate1 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse( request.getParameter("DepositDate1")+" "+"00:00:00");
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
    DepositDate1=new Timestamp(date_DepositDate1.getTime());
      
      }

      String DepositReference1=request.getParameter("DepositRef1");
      
      String DepositReciver1="";

      String  DepositRecievedFromDetail1="";
     
      String FirstName1="";
      
      String LastName1="";
      
      String DepositRecievedFrom1=request.getParameter("DepositReceivedFrom1");
      
      if(  DepositRecievedFrom1==null  || DepositRecievedFrom1=="" ||  DepositRecievedFrom1.isEmpty() ) {  /* Do nothing */  }

      else {
    	  
                  if( DepositRecievedFrom1.equals("Third Party") ) {      

    	                    FirstName1 =request.getParameter("DepositRecivedFromFirstName1");  
    	  
    	                    LastName1=request.getParameter("DepositRecivedFromLastName1");  
    	  
    	                    DepositRecievedFromDetail1="1";    }//End if
            
                   else {
    	  
    	                  DepositReciver1 =DepositRecievedFrom1; 
    	   
    	                  DepositRecievedFromDetail1="0";
    	  
	                      String s = DepositReciver1+" ";
	    	
	                      String[] FullName= s.split("\\s+");
	      
	                      if( FullName.length > 1 ) {   FirstName1=FullName[0];   LastName1=FullName[1]; }   else {  FirstName1=FullName[0];  LastName1=" ";   }
      
                   }   //end else
                  
      }//End of outter else
      
      
      String DepositRelationship1=request.getParameter("DepositRecivedFromRelationship1");

      String DepositUnit1=request.getParameter("DepositUnitNumber1");
	    
      String DepositStreetNumber1=request.getParameter("DepositStreetNumber1");
      
      String DepositStreetName1=request.getParameter("DepositStreetName1");
  			    
      String DepositCity1=request.getParameter("DepositCity1");
  			    
      String DepositProvince1=request.getParameter("DepositProvince1");
  			    
      String DepositOtherProvince1=request.getParameter("OtherDepositProvince1");
      
      String DepositMainProvince1="";
      
      if( DepositProvince1.equals("Other") ) { DepositMainProvince1=DepositOtherProvince1; } else { DepositMainProvince1=DepositProvince1;}
      
      String DepositPostalCode1=request.getParameter("DepositPostalCode1");
      
      String DepositCountry1=request.getParameter("DepositCountry1");
      
      String DepositEmail1=request.getParameter("DepositRecivedEmail1");
  		     
      String DepositExtraContact1=request.getParameter("DepositRecivedExteraContactLabel1");
      
      String DepositExtraContactNumber1=request.getParameter("DepositRecivedExteraContactNumber1");
      
      String DepositPhone1=request.getParameter("DepositRecivedFromPhone1");
      
      String Fintrac1=request.getParameter("fintrac1");


      if(     !DepositAmount1.isEmpty() ||  !DepositType1.isEmpty() ||  DepositDate1!=null || !DepositReference1.isEmpty() ||  !DepositReciver1.isEmpty() || !DepositRelationship1.isEmpty() ||
    		  
    		  !DepositUnit1.isEmpty() || !DepositStreetNumber1.isEmpty() || !DepositStreetName1.isEmpty() || !DepositCity1.isEmpty() || !DepositPostalCode1.isEmpty() ||
    		  
    		  !DepositEmail1.isEmpty() ||  !DepositExtraContactNumber1.isEmpty() || !DepositPhone1.isEmpty() ) {  isDeposit1=1;   } else { isDeposit1=0 ;} 
      

///////////////////////////////////////////////////////////////////////////////////////////  Retrieving  Second Deposit Information ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      String DepositType2=request.getParameter("DepositType2");
      
      String DepositAmount2=request.getParameter("DepositAmount2");
      
      Timestamp DepositDate2=null;
      Date date_DepositDate2 = null;
      
      if( request.getParameter("DepositDate2").isEmpty() || request.getParameter("DepositDate2")==null || request.getParameter("DepositDate2").equals("null")) {}else {

	try {
		date_DepositDate2 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse( request.getParameter("DepositDate2")+" "+"00:00:00");
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      DepositDate2=new Timestamp(date_DepositDate2.getTime());
      
      }
      
      String DepositReference2=request.getParameter("DepositRef2");
      
      String DepositReciver2="";
      
      String DepositRecievedFrom2=request.getParameter("DepositRecivedFrom2");
     
      String  DepositRecievedFromDetail2="";
      
      String FirstName2="";
      
      String LastName2="";
      
      
      if(  DepositRecievedFrom2==null  || DepositRecievedFrom2=="" ||  DepositRecievedFrom2.isEmpty() ) {    /* Do nothing */  }
      
      
      else { 

                 if( DepositRecievedFrom2.equals("Third Party") ) {

    	                  FirstName2=request.getParameter("DepositRecivedFromFirstName2");

    	                  LastName2= request.getParameter("DepositRecivedFromLastName2"); 
    	  
    	                  DepositRecievedFromDetail2="1";   } //End of if DepositRecievedFrom2.equals("Third Party")
            
                  else {
    	  
    	                    DepositReciver2 =DepositRecievedFrom2; 
    	  
    	                    DepositRecievedFromDetail2="0";
    	  
	                        String s = DepositReciver2+" ";
	    	
	                        String[] FullName= s.split("\\s+");
	      
	                        if( FullName.length > 1 ) {  FirstName2=FullName[0];  LastName2=FullName[1];  }//End if
	      
	                        else {  FirstName2=FullName[0];   LastName2=" ";  }

                       } // End of else

               }//End of else
      
      
      String DepositRelationship2=request.getParameter("DepositRecivedFromRelationship2");

      String DepositUnit2=request.getParameter("DepositUnitNumber2");
	    
      String DepositStreetNumber2=request.getParameter("DepositStreetNumber2");
      
      String DepositStreetName2=request.getParameter("DepositStreetName2");
  			    
      String DepositCity2=request.getParameter("DepositCity2");
  			    
      String DepositProvince2=request.getParameter("DepositProvince2");
  			    
      String DepositOtherProvince2=request.getParameter("OtherDepositProvince2");
      
      String DepositMainProvince2="";
      
      System.out.println("DepositOtherProvince2"+ " "+ DepositOtherProvince2 );
      
      if( DepositProvince2.equals("Other") ) {   DepositMainProvince2=DepositOtherProvince2; }  else { DepositMainProvince2=DepositProvince2;}
      
      String DepositPostalCode2=request.getParameter("DepositPostalCode2");
      
      String DepositCountry2=request.getParameter("DepositCountry2");
      
      String DepositEmail2=request.getParameter("DepositRecivedEmail2");
  		     
      String DepositExtraContact2=request.getParameter("DepositRecivedExteraContactLabel2");
      
      String DepositExtraContactNumber2=request.getParameter("DepositRecivedExteraContactNumber2");
      
      String DepositPhone2=request.getParameter("DepositRecivedFromPhone2");
      
      String Fintrac2=request.getParameter("fintrac2");

    
      if(  !DepositAmount2.isEmpty() ||  !DepositType2.isEmpty() ||  DepositDate2!=null || !DepositReference2.isEmpty() ||  !DepositReciver2.isEmpty() || !DepositRelationship2.isEmpty() || !DepositUnit2.isEmpty() || !DepositStreetNumber2.isEmpty() || !DepositStreetName2.isEmpty() || !DepositPostalCode2.isEmpty() || !DepositEmail2.isEmpty() ||  !DepositExtraContactNumber2.isEmpty() || !DepositPhone2.isEmpty() ) {
    	  
    	  isDeposit2=1;  }  else { isDeposit2=0; }
      
///////////////////////////////////////////////////////////////////////////////////////////  Retrieving  Third Deposit Information ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      
      String DepositType3=request.getParameter("DepositType3");
      
      String DepositAmount3=request.getParameter("DepositAmount3");
      
      Timestamp DepositDate3=null;
      
      Date date_DepositDate3 = null;
      
      if( request.getParameter("DepositDate3").isEmpty() || request.getParameter("DepositDate3")==null || request.getParameter("DepositDate3").equals("null")) {}else {

	try {
		date_DepositDate3 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse( request.getParameter("DepositDate3")+" "+"00:00:00");
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      DepositDate3=new Timestamp(date_DepositDate3.getTime());
      
      }
      
      String DepositReference3=request.getParameter("DepositRef3");
      
      String DepositReciver3="";
      
      String DepositRecievedFrom3=request.getParameter("DepositRecivedFrom3");
     
      String  DepositRecievedFromDetail3="";
      
      String FirstName3="";
      
      String LastName3="";
      
      System.out.println("DepositRecievedFrom3"+ " "+ DepositRecievedFrom3 );
      
     if( DepositRecievedFrom3.isEmpty() || DepositRecievedFrom3==null || DepositRecievedFrom3=="") {   /* Do nothing */ }
     
     else {

      
               if( DepositRecievedFrom3.equals("Third Party") ) {
    	  
    	                 FirstName3=request.getParameter("DepositRecivedFromFirstName3");
    			  
    	                 LastName3=request.getParameter("DepositRecivedFromLastName3"); 
    	  
    	                 DepositRecievedFromDetail3="1"; 
         	  
                 }//End of if DepositRecievedFrom3.equals("Third Party")
            
               else {
    	  
    	                 DepositReciver3 =DepositRecievedFrom3; 
    	  
    	                 DepositRecievedFromDetail3="0";
    	  
	                     String s = DepositReciver3+" ";
	    	
	                     String[] FullName= s.split("\\s+");
	      
	                      if( FullName.length > 1 ) {   FirstName3=FullName[0];   LastName3=FullName[1];  }
	      
	                      else { FirstName3=FullName[0];   LastName3=" ";   }
	      
                    } //End of else
      
     }
      
      String DepositRelationship3=request.getParameter("DepositRecivedFromRelationship3");

      String DepositUnit3=request.getParameter("DepositUnitNumber3");
	    
      String DepositStreetNumber3=request.getParameter("DepositStreetNumber3");
      
      String DepositStreetName3=request.getParameter("DepositStreetName3");
  			    
      String DepositCity3=request.getParameter("DepositCity3");
  			    
      String DepositProvince3=request.getParameter("DepositProvince3");
  			    
      String DepositOtherProvince3=request.getParameter("OtherDepositProvince3");
      
      String DepositMainProvince3="";
      
      if( DepositProvince3.equals("Other") ) { DepositMainProvince3=DepositOtherProvince3; } else { DepositMainProvince3=DepositProvince3;}
      
      String DepositPostalCode3=request.getParameter("DepositPostalCode3");
      
      String DepositCountry3=request.getParameter("DepositCountry3");
      
      String DepositEmail3=request.getParameter("DepositRecivedEmail3");
  		     
      String DepositExtraContact3=request.getParameter("DepositRecivedExteraContactLabel3");
      
      String DepositExtraContactNumber3=request.getParameter("DepositRecivedExteraContactNumber3");
      
      String DepositPhone3=request.getParameter("DepositRecivedFromPhone3");
      
      String Fintrac3=request.getParameter("fintrac3");
          
      if( !DepositAmount3.isEmpty() ||  !DepositType3.isEmpty() ||  DepositDate3!=null || !DepositReference3.isEmpty() ||  !DepositReciver3.isEmpty() || !DepositRelationship3.isEmpty() || !DepositUnit3.isEmpty() || !DepositStreetNumber3.isEmpty() || !DepositStreetName3.isEmpty() || !DepositCity3.isEmpty() || !DepositPostalCode3.isEmpty()  || !DepositEmail3.isEmpty()  || !DepositExtraContactNumber3.isEmpty() || !DepositPhone3.isEmpty() ) {
    
    	  isDeposit3=1;  } else { isDeposit3=0; }
      

///////////////////////////////////////////////////////////////////////////////////////////  Retrieving  forth Deposit Information ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
      
      String DepositType4=request.getParameter("DepositType4");
      
      String DepositAmount4=request.getParameter("DepositAmount4");
      
      Timestamp DepositDate4=null;
      
      Date date_DepositDate4 = null;
      
      if( request.getParameter("DepositDate4").isEmpty() || request.getParameter("DepositDate4")==null || request.getParameter("DepositDate4").equals("null")) {}else {

	try {
		date_DepositDate4 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse( request.getParameter("DepositDate4")+" "+"00:00:00");
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      DepositDate4=new Timestamp(date_DepositDate4.getTime());
      
      }
      
      String DepositReference4=request.getParameter("DepositRef4");
      
      String DepositReciver4="";
      
      String FirstName4="";
      
      String LastName4="";
      
      String DepositRecievedFrom4=request.getParameter("DepositReceivedFrom4");
      
      String DepositRecievedFromDetail4="";
      
      
      if( DepositRecievedFrom4.isEmpty() || DepositRecievedFrom4==null || DepositRecievedFrom4=="") {  /* Do nothing */  }
      
      else {    

      if( DepositRecievedFrom4.equals("Third Party") ) {
    	  
    	   FirstName4=request.getParameter("DepositRecivedFromFirstName4");
    			  
    	   LastName4=request.getParameter("DepositRecivedFromLastName4"); 
    	 
    	   DepositRecievedFromDetail4="1"; 
    	 
      }//End of if DepositRecievedFrom4.equals("Third Party")
            
      else {
    	  
    	       DepositReciver4 =DepositRecievedFrom4; 
    	  
    	       DepositRecievedFromDetail4="0";
    	  
	           String s = DepositReciver4+" ";
	    	
	           String[] FullName= s.split("\\s+");
	      
	           if( FullName.length > 1 ) {   FirstName4=FullName[0];   LastName4=FullName[1];  }
	      
	           else {  FirstName4=FullName[0];  LastName4=" ";  }
    	  
          }//End of else
      
      
      }
      
      String DepositRelationship4=request.getParameter("DepositRecivedFromRelationship4");

      String DepositUnit4=request.getParameter("DepositUnitNumber4");
	    
      String DepositStreetNumber4=request.getParameter("DepositStreetNumber4");
      
      String DepositStreetName4=request.getParameter("DepositStreetName4");
  			    
      String DepositCity4=request.getParameter("DepositCity4");
  			    
      String DepositProvince4=request.getParameter("DepositProvince4");
  			    
      String DepositOtherProvince4=request.getParameter("OtherDepositProvince4");
      
      String DepositMainProvince4="";
      
      if( DepositProvince4.equals("Other") ) { DepositMainProvince4=DepositOtherProvince4; } else { DepositMainProvince4=DepositProvince4;}
      
      String DepositPostalCode4=request.getParameter("DepositPostalCode4");
      
      String DepositCountry4=request.getParameter("DepositCountry4");
      
      String DepositEmail4=request.getParameter("DepositRecivedEmail4");
  		     
      String DepositExtraContact4=request.getParameter("DepositRecivedExteraContactLabel4");
      
      String DepositExtraContactNumber4=request.getParameter("DepositRecivedExteraContactNumber4");
      
      String DepositPhone4=request.getParameter("DepositRecivedFromPhone4");
      
      String Fintrac4=request.getParameter("fintrac4");
    
      
      if( !DepositAmount4.isEmpty() ||  !DepositType4.isEmpty() ||  DepositDate4!=null || !DepositReference4.isEmpty() ||  !DepositReciver4.isEmpty() 
    		  
    		  || !DepositRelationship4.isEmpty() || !DepositUnit4.isEmpty() || !DepositStreetNumber4.isEmpty()
    		  
    		  || !DepositStreetName4.isEmpty() || !DepositCity4.isEmpty() || !DepositPostalCode4.isEmpty()  ||  !DepositEmail4.isEmpty() ||  
    		  
    		  !DepositExtraContactNumber4.isEmpty() || !DepositPhone4.isEmpty() ) {

    	  isDeposit4=1;  } else { isDeposit4=0; }
      
	    
////////////////////////////////////////////////////////////////////////////////////////////////////// Retrieving Cooperating Brokerage Information ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	    

	    String CooperatingBrokerage=request.getParameter("Brokername");
	    
        String CooperatingAgentFullName=request.getParameter("CooperatingAgentName");

        String CooperatingBrokerageUnit=request.getParameter("CooperatingUnit");

	    String CooperatingBrokerageStreetNumber=request.getParameter("CooperatingStreetNumber");
	    
	    String CooperatingBrokerageStreetName=request.getParameter("COOPERATINGBROKERAGEstreetName");
	     
	    String CooperatingBrokerageCity=request.getParameter("CooperatingCity");
	    
	    String CooperatingBrokerageProvince=request.getParameter("CooperatingProvince");
	    
	    String CooperatingBrokeragePostalCode=request.getParameter("CooperatingPostalCode");
	    
	    String CooperatingBrokerageEmail=request.getParameter("CO-OPERATINGBROKERAGEEmail");

	    String CooperatingBrokerageExtraContact=request.getParameter("CO-OPERATINGBROKERAGEExteraContactInformation");
	    
	    String CooperatingBrokerageExtraContactNumber=request.getParameter("CO-OPERATINGBROKERAGErExteraContact");
	    
	    String CooperatingBrokeragePhone=request.getParameter("CO-OPERATINGBROKERAGEPhone");

	    if(  !CooperatingBrokerage.isEmpty() || !CooperatingAgentFullName.isEmpty() || !CooperatingBrokeragePhone.isEmpty() || !CooperatingBrokerageUnit .isEmpty()||
	    		  
	         !CooperatingBrokerageStreetName.isEmpty() || !CooperatingBrokerageStreetNumber.isEmpty() || 
	      
	         !CooperatingBrokerageCity.isEmpty() || !CooperatingBrokeragePostalCode.isEmpty() || 
	      
	         !CooperatingBrokerageEmail.isEmpty() || !CooperatingBrokerageExtraContactNumber.isEmpty() ) {  isCooperatingBrokerage=1;  }  
	    
	    else {   isCooperatingBrokerage=0; }
	    
////////////////////////////////////////////////////////////////////////////////////////// Getting the Record Sheet Information ///////////////////////////////////////////////////////////////////////////////////////////////

		   String  RefoundAmount=request.getParameter("ReciveOrRefoundAmount");
		   
		   String  RefoundLabel=request.getParameter("ReciveOrRefoundAmount");
		   
		   String  ListingCommission=request.getParameter("TRSListCommission");;
		   
		   String  SellingCommission=request.getParameter("TRSSellCommission");

		   String  TRSRecordSheetAgent1Split=request.getParameter("TRSSplit1");
		   
		   String  TRSRecordSheetAgent1CommissionAmount=request.getParameter("TRSAgentCommision1");
		   
		   String  Agent1Portion=request.getParameter("TRSAgentNet1");
		   
		   String  TRSRecordSheetAgent2Split=request.getParameter("TRSSplit2");
		   
		  // String  TRSRecordSheetAgent2CommissionAmount=request.getParameter("AgentExpensesNet2");;

		   String  TotalCommission=request.getParameter("TRSTotalCommissions");

		   String  Allocation1="100";
		   
		   String  Allocation2="0";

		   //String TRSRecordSheetAgent2TotalCommission=request.getParameter("TRSAgentCommision2");

		   String TRSRecordSheetNetFee= request.getParameter("TotalNetToBrokeragePurAmounts");
		   
		   String TRSRecordSheetNetHST= request.getParameter("HSTNetToBrokerageAmounts");
		   
		   String TRSRecordSheetNetTotal= request.getParameter("TotalNetToBrokerageAmount");   

		   String HST1= request.getParameter("Co-operatingBrokerageExpensesHSTPercent");
		   
		   String HST2= request.getParameter("ExpensesReferralAgentHSTPercent");
		   
		   String HST3= request.getParameter("CustomerHST1Percent");
		   
		   String HST4= request.getParameter("CustomerHST2Percent");
		   
		   String HST5= request.getParameter("CustomerHST3Percent");
		   
		   String HST6= request.getParameter("CustomerHST4Percent");
		   
		   String HST7 =request.getParameter("AgentExpensesHST1Percent");
		   
		   String HST8= request.getParameter("AgentExpensesHST2Percent");   
		   
		   String HST9 =request.getParameter("TRSListHTSPercent");
		   
		   String HST10= request.getParameter("TRSSellCommissionHTSPercent");   
		   
		   String Payment1=request.getParameter("Co-operatingBrokerageExpensesNet");  
		   
		   String Payment2=request.getParameter("ReferralAgentNet"); 
		   
		   String Payment3=request.getParameter("CustomerNet1");  
		   
		   String Payment4=request.getParameter("CustomerNet2"); 
		   
		   String Payment5=request.getParameter("CustomerNet3");  
		   
		   String Payment6=request.getParameter("CustomerNet4"); 
		   
		   String Payment7=request.getParameter("AgentExpensesNet1");  
		   
		   String Payment8=request.getParameter("AgentExpensesNet2"); 
		   
		   String Payment9=request.getParameter("TRSListCommission");  
		   
		   String Payment10=request.getParameter("TRSSellCommission"); 
		   
		   
		   String newInvoiceRecieverFirstName="";
		   String newInvoiceRecieverLastName="";
		   String newInvoiceRecieverEmail="";
		   String newInvoiceUnit="";
		   String newInvoiceStreetName="";
		   String newInvoiceStreetNumber="";
		   String newInvoiceCity="";
		   String newInvoiceProvince="";
		   String newInvoicePostalCode="";
		   String newInvoiceCountry="";


/////////////////////////////////////////////////////////////////////////////////////////////////// Getting the Invoice Data //////////////////////////////////////////////////////////////////////////////////////

		  String InvoiceSendStatus="0";
		  
		  String InvoicecommissionPayable=request.getParameter("hiddeninvoiceCommission");	
		  
		  String InvoiceHST=request.getParameter("hiddenInvoiceHSTtax");
		  
		  double HSTInvoice=0.0;
		  
		  if(InvoiceHST==null || InvoiceHST.isEmpty() ) { HSTInvoice=(float) 0; } else { HSTInvoice=Float.parseFloat( InvoiceHST ) ;}

		  String InvoiceDeposit=request.getParameter("hiddenInvoiceDeposits");
		  
		  String InvoiceBalance=request.getParameter("hiddenInvoiceBalance");	
		  
		  String Party1=request.getParameter("hiddenVendors");
		  
		  String Party2=request.getParameter("hiddenPurchasers");	
		  
	      Timestamp InvoiceDate =CreateDate;
	      
		 /* Date date_InvoiceDate=null;
		  try {
			
			if( request.getParameter("hiddenInvoiceDate").isEmpty() || request.getParameter("hiddenInvoiceDate")==null || request.getParameter("hiddenInvoiceDate").equals("null")) {  }else {
			
			   date_InvoiceDate = new SimpleDateFormat("dd MMM yyyy HH:mm:ss").parse(request.getParameter("hiddenInvoiceDate"));
			   
			   InvoiceDate=new Timestamp(date_InvoiceDate.getTime());
			}
			
		} catch (ParseException e1) {
	
			e1.printStackTrace();
		}*/
		  
		  String InvoiceType="";
		  
		  float Commissions=0;
		  
		  if(InvoicecommissionPayable==null || InvoicecommissionPayable.isEmpty() ) { Commissions=(float) 0; } else { Commissions=Float.parseFloat( InvoicecommissionPayable ) ;}
		 
		  float Deposits=0;//Float.parseFloat(InvoiceDeposit) ;
		  
		  if( InvoiceDeposit==null ||  InvoiceDeposit.isEmpty()  ) { Deposits=(float) 0; } else {  Deposits=Float.parseFloat( InvoiceDeposit ) ;}
		  
		  if( Deposits > Commissions ) { InvoiceType="STATMENT"; }
		  
		  else if( Deposits<Commissions ) { InvoiceType="INVOICE"; }
		  
		  else {  InvoiceType="INVOICE"; }

		  String InvoiceRecieverFirstName="";
		  
		  String InvoiceRecieverLastName="";
		  
		  String InvoiceRecieverEmail="";
		  
		  String InvoiceUnit="";
		  
		  String InvoiceStreetName="";
		  
		  String InvoiceStreetNumber="";
		  
		  String InvoiceCity="";
		  
		  String InvoiceProvince="";
		  
		  String InvoicePostalCode="";
		  
		  String InvoiceCountry="";

		  if (PropertyListingType.equals( "Buyer-Side") || PropertyListingType.equals( "Tenant-Side") ) {
		    	
		    	    String s = CooperatingAgentFullName+" "+"No Family Name";
		    	
		    	    String[] FullName= s.split("\\s+");

		    	    InvoiceRecieverFirstName=FullName[0];
				  
				    InvoiceRecieverLastName=FullName[1];
				  
				    InvoiceRecieverEmail=CooperatingBrokerageEmail;
				  
				    InvoiceUnit=CooperatingBrokerageUnit;
				  
				    InvoiceStreetName=CooperatingBrokerageStreetName;
				  
				    InvoiceStreetNumber=CooperatingBrokerageStreetNumber;
				  
				    InvoiceCity=CooperatingBrokerageCity;
				  
				    InvoiceProvince=CooperatingBrokerageProvince;
				  
				    InvoicePostalCode=CooperatingBrokeragePostalCode;
				  
				    InvoiceCountry="Canada";  
				    
		    	    newInvoiceRecieverFirstName=FullName[0];
					  
		    	    newInvoiceRecieverLastName=FullName[1];
				  
		    	    newInvoiceRecieverEmail=CooperatingBrokerageEmail;
				  
		    	    newInvoiceUnit=CooperatingBrokerageUnit;
				  
		    	    newInvoiceStreetName=CooperatingBrokerageStreetName;
				  
		    	    newInvoiceStreetNumber=CooperatingBrokerageStreetNumber;
				  
		    	    newInvoiceCity=CooperatingBrokerageCity;
				  
		    	    newInvoiceProvince=CooperatingBrokerageProvince;
				  
		    	    newInvoicePostalCode=CooperatingBrokeragePostalCode;
				  
		    	    newInvoiceCountry="Canada";  

		  
		  }  // End of IF
		    
		    else if ( PropertyListingType.equals( "Listing-Side" )|| PropertyListingType.equals("Sale-Double-Sided" ) || PropertyListingType.equals("BuyerSide-Self-Represented-Vendor" ) ) {
	    	    
		    	    String s = VendorLawyer+" "+"No Family Name";
		    	
		    	    String[] LawyerFullName= s.split("\\s+");
		    	
		    	    InvoiceRecieverFirstName=LawyerFullName[0];
				  
			        InvoiceRecieverLastName=LawyerFullName[1];
			  
			        InvoiceRecieverEmail=VendorLawyerEmail;
			  
			        InvoiceUnit=VendorLawyerUnit;
			  
			        InvoiceStreetName=VendorLawyerStreetName;
			   
			        InvoiceStreetNumber=VendorLawyerStreetNumber;
			  
			        InvoiceCity=VendorLawyerCity;
			  
			        InvoiceProvince=VendorLawyerProvince;
			  
			        InvoicePostalCode=VendorLawyerPostalCode;
			  
			        InvoiceCountry="Canada"; 
			        
		    	    newInvoiceRecieverFirstName=LawyerFullName[0];
					  
		    	    newInvoiceRecieverLastName=LawyerFullName[1];
			  
		    	    newInvoiceRecieverEmail=VendorLawyerEmail;
			  
		    	    newInvoiceUnit=VendorLawyerUnit;
			  
		    	    newInvoiceStreetName=VendorLawyerStreetName;
			   
		    	    newInvoiceStreetNumber=VendorLawyerStreetNumber;
			  
		    	    newInvoiceCity=VendorLawyerCity;
			  
		    	    newInvoiceProvince=VendorLawyerProvince;
			  
		    	    newInvoicePostalCode=VendorLawyerPostalCode;
			  
		    	    newInvoiceCountry="Canada"; 
		    
		    
		    
		    
		    } //End of else if
		    
		    else {

		    	   if( VendorBusinessName1.isEmpty() || VendorBusinessName1==null ) {  InvoiceRecieverFirstName=VendorFirstName1;  InvoiceRecieverLastName=VendorLastName1; } //End of if
		    
		            else { 	
		    	               String s = VendorOfficer1+" "+" ";
		    	
		    	               String[] VendorFullName= s.split("\\s+");
		    	
		    	               InvoiceRecieverFirstName=VendorFullName[0]; 
		    	               
		    	              newInvoiceRecieverFirstName=VendorFullName[0]; 
		    	               
		    	               if ( VendorFullName.length==1 ) { InvoiceRecieverLastName="" ; newInvoiceRecieverLastName="" ; }
		    	
		    	               else { InvoiceRecieverLastName=VendorFullName[1];

		    	               newInvoiceRecieverLastName=VendorFullName[1];
		    	               
		    	               }
		    	              
		                } // End of else
			  
			    InvoiceRecieverEmail=VendorEmail1;
			  
			    InvoiceUnit=VendorUnit1;
			  
			    InvoiceStreetName=VendorStreetName1;
			  
			    InvoiceStreetNumber=VendorStreetNumber1;
			  
			    InvoiceCity=VendorCity1;
			  
			    InvoiceProvince=VendorMainProvince1;
			  
			    InvoicePostalCode=VendorPostalCode1;
			  
			    InvoiceCountry=VendorCountry1;
	    		
			    newInvoiceRecieverEmail=VendorEmail1;
				  
			    newInvoiceUnit=VendorUnit1;
			  
			    newInvoiceStreetName=VendorStreetName1;
			  
			    newInvoiceStreetNumber=VendorStreetNumber1;
			  
			    newInvoiceCity=VendorCity1;
			  
			    newInvoiceProvince=VendorMainProvince1;
			  
			    newInvoicePostalCode=VendorPostalCode1;
			  
			    newInvoiceCountry=VendorCountry1;
		    	
		    } //else                    

		  String InvoiceSalesPrice=ProPertyListingPrice;
		  
		  Timestamp InvoiceClosingDate=null;
		  
		  
		  if(PropertyClosingDate==null) {}
		  
		  else {
			  InvoiceClosingDate =PropertyClosingDate;
		  }
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		        

		 
// in this section we are checking if the transaction or deal exist or it is the new one		  
		 
		    
	        String Province=PropertyProvince;

	    	String HST="0.00";

	    	if(Province.equals("AB") || Province.equals("BC") || Province.equals("MB")  || Province.equals("NWT") || Province.equals("NU") || Province.equals("QC") || Province.equals("SK") || Province.equals("YT") ){ 

	    		HST="5.00"+"%";  }

	    	else if(Province.equals("ON") ){ HST="13.00"+"%"; }

	    	else if(Province.equals("PE") || Province.equals("NC")  || Province.equals("NB" ) || Province.equals("NL")    ){ HST="15.00"+"%"; }

	        else if(Province.equals("Other") ){  HST="0.00"+"%";  }
	    	
	    	
	    	
		    if(PropertyListingStatus.equals("Available") ) {  Permanant="0";  CheckFinalize=0;  } 
		    
		    else if ( PropertyListingStatus.equals("Off-Market")) { Permanant="1"; CheckFinalize=0; }
		    
		    else if ( PropertyListingStatus.equals("Offer Withdrawn")) { Permanant="1"; CheckFinalize=0; }

		    else if ( PropertyListingStatus.equals("Expired")) { Permanant="1"; CheckFinalize=0; }
		    
		    else { Permanant=TempPermanant;  CheckFinalize=CheckFinalizeTemp; }
		    

	      
		    if( NewDeal.id==0 ) {  
		           


				     if (Permanant=="1" ) {	 FinalizedDate=CreateDate;  }else { 
	
				    	 FinalizedDate=null; 
				    	 
				     }
				     
		
				    
                     NewDeal=new Transaction(
      	    		
                           TransactionID ,  AuthorType,  Author, Brokerid,MLSNumber, 
                           
                           PropertyStreetName,   PropertystreetNumber, Propertyunit, PropertyCity, PropertyProvince,  PropertyPostalCode, PropertyType,  FirstAgentID, 
				           
				           SecondAgentID,  FirstAgentGrossCommisionSplit,   SecondAgentGrossCommisionSplit,  ProPertyListingPrice,  ProPertyListingSource,  PropertyListingType ,PropertyListingDate ,
				           
				             PropertyClosingDate , PropertyExpireDate, PropertyListingComission,  PropertySellingComission,  PropertyListingStatus,  AgentSign1, AgentSign2,  BerokerSign, 
				           
				           TransactionStatus,  OfficeLeadPercentege,  OfficeLeadPercentegeAgainst, OfficeLeadPercentegeSelling,  OfficeLeadPercentegeApplyAgainstSelling,  OfficeLeadPercentegeListing, OfficeLeadPercentegeAgainstListing,PropertyDescription, Permanant, 
				           
				           ReferralFeeNote,  FirstAgentRol,  SecondAgentRol, "TRS", OfferDate , OfferExpiretionDate , OfferAcceptanceDate , ConditionExpirationDate , ConditionCompletationDate ,
				           
				           OfferWithrawalDate,InspectionDate,  AccupancyDate, OffMarketDate, ProgressMark,  CreateDate,  FinalizedDate,  0, 0 );
		    	
		    	           RDS.NEWTransaction( NewDeal ,con);	 
		    	
		                   RDS.UpdateCompanyTransaction( TransactionID , Brokerid ,con) ;
		                   
		                   //RDS.UpdateCompanyTemp( 0 , Brokerid ) ; 

				    	   Record=new RecordSheet(
					 			   
				    			   
			              	   		 0 ,  TransactionID ,  RefoundAmount,  RefoundLabel , PropertySellingComission ,  PropertyListingComission , TotalCommission ,

							         Agent1.User_Split , Agent1.User_Split2 , Agent1.User_Split3, Agent2.User_Split , Agent2.User_Split2 , Agent2.User_Split3, Allocation1  , Allocation2 ,

							 	     TRSRecordSheetNetFee ,  TRSRecordSheetNetHST , TRSRecordSheetNetTotal ,  HST , HST , "0.00", "0.00" ,  "0.00" , "0.00" , HST, HST , HST,HST,  "0.00" ,  "0.00" ,"0.00" ,

							 	      "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" , "0.00" , "0.00", Brokerid , Agent1.User_Cap , Agent1.User_Cap2 , Agent1.User_Cap3, Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 , CurrentCompanies.CommissionBankNumber,CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber  );

					 	            RDS.NewTradeRecordes(Record,con);
					 	            
					 	            
					 	           CommissionDetails com=new CommissionDetails();
					 	           
						   	       SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

						           //Date Commissondate = new Date( ); 
						    	 
							  //String Date=formatter.format(Newdate); 
					 	           
					 	      com.TradeID=TransactionID;
					 	   	 
					 	      com.BrokerID=Brokerid;
					 	   	 
					 	      com.AgentId=Brokerid;
					 	      
					 	      com.Status="Deal";
					 	      
					 	      com. Date=new Timestamp(Newdate.getTime());
					 	      
					 	      com. AddtoCap="0";
		
					 	      com. AddtoCapDS="0";
					 	     
					 	      int LastCommissionID=RDS.AddCommissionDetails(com ,con);
					 	      
					 	      RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID
					 	      
					 	      RDS.UpdateDealCommision( Brokerid , TransactionID , LastCommissionID ,con);
					 	            

		    } // End of if NewDeal.id==0 

		    else {   
		    	
		    	
		    	
	
		    	
		    	
			if(Integer. parseInt(NewDeal.progressMarks) >= Integer. parseInt(ProgressMark) ) {

				FinalProgressMark=NewDeal.progressMarks; }else { FinalProgressMark=ProgressMark; }
			
		    	
		          java.util.Date Finalize_date = Calendar.getInstance().getTime();  
		    	
		    	  String NewPermanant=Permanant;
		    	  
		    	  Timestamp NewFinalizedDate=null;

		          if ( NewDeal.Permanent.equals("1") ) { NewPermanant="1" ;  } else {  NewPermanant=Permanant; } 
		        
		          if ( NewDeal.Permanent.equals("0") && Permanant.equals("1") ) { 

		        	  FinalizedDate=new Timestamp(Finalize_date.getTime());    NewPermanant="1";  PropertyListingStatus="Closed";} 
		          
		          else {  NewFinalizedDate=NewDeal.FinalizedDate; } 
	      
                  NewDeal=new Transaction(
                		  
                           TransactionID ,  AuthorType,  Author, Brokerid,MLSNumber, 
                          
                           PropertyStreetName,   PropertystreetNumber, Propertyunit, PropertyCity, PropertyProvince,  PropertyPostalCode, PropertyType,  FirstAgentID, 
				           
				           SecondAgentID,  FirstAgentGrossCommisionSplit,   SecondAgentGrossCommisionSplit,  ProPertyListingPrice,  ProPertyListingSource,  PropertyListingType , PropertyListingDate,
				           
				           PropertyClosingDate, PropertyExpireDate, PropertyListingComission,  PropertySellingComission,  PropertyListingStatus,  AgentSign1, AgentSign2,  BerokerSign, 
				           
				           TransactionStatus,  OfficeLeadPercentege,  OfficeLeadPercentegeAgainst, OfficeLeadPercentegeSelling,  OfficeLeadPercentegeApplyAgainstSelling,  OfficeLeadPercentegeListing, OfficeLeadPercentegeAgainstListing,PropertyDescription, NewPermanant, 
				           
				           ReferralFeeNote,  FirstAgentRol,  SecondAgentRol, "TRS", OfferDate, OfferExpiretionDate,OfferAcceptanceDate, ConditionExpirationDate,ConditionCompletationDate,
				           
				           OfferWithrawalDate, InspectionDate, AccupancyDate, OffMarketDate,
				           
				           FinalProgressMark,NewDeal.CreateDate,NewFinalizedDate,NewDeal.LastCommissionID,NewDeal.LastCommissionDealID);
                  
                  Record =RDS.SearchTradeRecordes( TransactionID , Brokerid,con) ;
                  
                  if(Record.ID==0) {

	              	      Record=new RecordSheet(
				 			   
	                  	   		 0 ,  TransactionID ,  RefoundAmount,  RefoundLabel , PropertySellingComission ,  PropertyListingComission , TotalCommission ,

	         				     Agent1.User_Split , Agent1.User_Split2 , Agent1.User_Split3, Agent2.User_Split , Agent2.User_Split2 , Agent2.User_Split3, Allocation1  , Allocation2 ,

	         				     TRSRecordSheetNetFee ,  TRSRecordSheetNetHST , TRSRecordSheetNetTotal ,  HST , HST , "0.00","0.00" ,  "0.00" , "0.00" , HST, HST ,HST,HST,   "0.00" ,  "0.00" ,"0.00" ,

	         					 "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" ,  "0.00" , "0.00" , Brokerid , Agent1.User_Cap , Agent1.User_Cap2 , Agent1.User_Cap3, Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 , CurrentCompanies.CommissionBankNumber,CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber );
	
			 	                 RDS.NewTradeRecordes(Record,con);    }
                  
                           else { /* Do nothing */
                        	   
                        	   
                        	   if( Payment1==null || Payment1.isEmpty() ) {     
                        		   
                        	        if( Record.Payment1==null || Record.Payment1.isEmpty() )
                        		   
                        	         {  Payment1="0.00" ;  } 
                        	   
                        	      else{   Payment1=request.getParameter("TRSAgentNet1");  }
                        	   
                        	   
                        	   }
                        	   
                        	   
                        	   if( Payment2==null || Payment2.isEmpty() ) {     
                        		   
                       	        if( Record.Payment2==null || Record.Payment2.isEmpty() )
                       		   
                       	         {  Payment2="0.00" ;  } 
                       	   
                       	      else{   Payment2=request.getParameter("TRSAgentNet2");  }
                       	   
                       	   
                       	   }
                        	   
                        	   
                        	   if( Payment3==null || Payment3.isEmpty() ) {     
                        		   
                          	        if( Record.Payment3==null || Record.Payment3.isEmpty() )
                          		   
                          	         {  Payment3="0.00" ;  } 
                          	   
                          	      else{   Payment3=request.getParameter("CustomerNet1");  }
                          	   
                          	   
                          	   }   
                        	   
                        	   
                        	   if( Payment4==null || Payment4.isEmpty() ) {     
                        		   
                         	        if( Record.Payment4==null || Record.Payment4.isEmpty() )
                         		   
                         	         {  Payment4="0.00" ;  } 
                         	   
                         	      else{   Payment4=request.getParameter("CustomerNet2");  }
                         	   
                         	   
                         	   }   
                        	   
                        	   
                        	   if( Payment5==null || Payment5.isEmpty() ) {     
                        		   
                         	        if( Record.Payment5==null || Record.Payment5.isEmpty() )
                         		   
                         	         {  Payment5="0.00" ;  } 
                         	   
                         	      else{   Payment5=request.getParameter("CustomerNet3");  }
                         	   
                         	   
                         	   }   
                        	   
                        		   
                         	        if( Record.Payment6==null || Record.Payment6.isEmpty() )
                         		   
                         	         {  Payment6="0.00" ;  } 
                         	   
                         	      else{   Payment6=request.getParameter("CustomerNet4");  }
                         	   
                         	   
                         	   }   
                        	   
                        	   
                        	   if( Payment7==null || Payment7.isEmpty() ) {     
                        		   
                         	        if( Record.Payment7==null || Record.Payment7.isEmpty() )
                         		   
                         	         {  Payment7="0.00" ;  } 
                         	   
                         	      else{   Payment7=request.getParameter("AgentExpensesNet1");  }
                         	   
                         	   
                         	   }   
                        	   
                        	   
                        	   if( Payment8==null || Payment8.isEmpty() ) {     
                        		   
                         	        if( Record.Payment8==null || Record.Payment8.isEmpty() )
                         		   
                         	         {  Payment8="0.00" ;  } 
                         	   
                         	      else{   Payment8=request.getParameter("AgentExpensesNet2");  }
                         	   
                         	   
                         	   }   
                        	   
                        	   
                        	   
                        	   if( Payment9==null || Payment9.isEmpty() ) {     
                        		   
                         	        if( Record.Payment9==null || Record.Payment9.isEmpty() )
                         		   
                         	         {  Payment9="0.00" ;  } 
                         	   
                         	      else{   Payment9=request.getParameter("TRSListCommission");  }
                         	   
                         	   
                         	   }   
                        	   
                        	   
                        	   
                        	   if( Payment10==null || Payment10.isEmpty() ) {     
                        		   
                         	        if( Record.Payment10==null || Record.Payment10.isEmpty() )
                         		   
                         	         {  Payment10="0.00" ;  } 
                         	   
                         	      else{   Payment10=request.getParameter("TRSSellCommission");  }
                         	   
                         	   
                         	   }   

                        	   
                           }

  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		    


	    if( Finilize!=null || Save!=null  || Save1!=null ||  Save2!=null || Save3!=null  || Save4!=null  || Save5!=null  || Save6!=null  || Save7!=null  || Save8!=null  || Save9!=null  || Save10!=null  || Save11!=null  || Save12!=null  || Save13!=null || Save15!=null  || Save16!=null || Save17!=null || Save18!=null )  { 
	    	
	    	
	    	System.out.println("FirstAgentCommission"+" "+FirstAgentGrossCommisionSplit);
	   
	            RDS.UpdateTransaction( NewDeal ,con); 

 //********************* Deposits *********************// 

    	    if( Size2==0) {

    	    	   if(isDeposit1==1) {  RDS.NEWDeposit(DepositAmount1, DepositType1 , DepositDate1 ,DepositReference1, DepositRecievedFromDetail1 , DepositRelationship1 , DepositUnit1, DepositStreetNumber1, DepositStreetName1 , DepositCity1 , DepositPostalCode1 , DepositMainProvince1 , DepositCountry1 , DepositEmail1 , DepositExtraContact1 , DepositExtraContactNumber1 , DepositPhone1 ,  TransactionID,Brokerid ,  FirstName1, LastName1,Fintrac1 ,con );  } else {}
    	    	   if(isDeposit2==1) {  RDS.NEWDeposit(DepositAmount2, DepositType2 ,DepositDate2 ,DepositReference2, DepositRecievedFromDetail2 , DepositRelationship2 , DepositUnit2, DepositStreetNumber2, DepositStreetName2 , DepositCity2 , DepositPostalCode2 , DepositMainProvince2 , DepositCountry2 , DepositEmail2 , DepositExtraContact2 , DepositExtraContactNumber2 , DepositPhone2 ,  TransactionID ,Brokerid , FirstName2, LastName2,Fintrac2 ,con);  } else {}
    	    	   if(isDeposit3==1) {  RDS.NEWDeposit(DepositAmount3, DepositType3 , DepositDate3,DepositReference3, DepositRecievedFromDetail3 , DepositRelationship3 , DepositUnit3, DepositStreetNumber3, DepositStreetName3 , DepositCity3 , DepositPostalCode3 , DepositMainProvince3 , DepositCountry3 , DepositEmail3 , DepositExtraContact3 , DepositExtraContactNumber3 , DepositPhone3 ,  TransactionID ,Brokerid , FirstName3, LastName3 , Fintrac3,con);   } else {}
    	    	   if(isDeposit4==1) {  RDS.NEWDeposit(DepositAmount4, DepositType4 , DepositDate4,DepositReference4, DepositRecievedFromDetail4 , DepositRelationship4 , DepositUnit4, DepositStreetNumber4, DepositStreetName4 , DepositCity4 , DepositPostalCode4 , DepositMainProvince4 , DepositCountry4 , DepositEmail4 , DepositExtraContact4 , DepositExtraContactNumber4 , DepositPhone4 ,  TransactionID ,Brokerid , FirstName4, LastName4 , Fintrac4,con);   } else {}

    	    }
    	    
    	    if( Size2==1) {
    	    	
    	    	   if(isDeposit1==1) {

    	    	       RDS.UpdateDeposit(DepositAmount1, DepositType1 , DepositDate1 ,DepositReference1, DepositRecievedFromDetail1, DepositRelationship1 , DepositUnit1, DepositStreetNumber1, DepositStreetName1 , DepositCity1 , DepositPostalCode1 , DepositMainProvince1 , DepositCountry1 , DepositEmail1 , DepositExtraContact1 , DepositExtraContactNumber1 , DepositPhone1 ,  TransactionID ,MyDeposits.get(0).ID, Brokerid , FirstName1, LastName1,  Fintrac1 ,con);}
    	    	
    	    	   else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con); }
    	    	
    	    	   if(isDeposit2==1) {  RDS.NEWDeposit(DepositAmount2, DepositType2 , DepositDate2 ,DepositReference2, DepositRecievedFromDetail2 , DepositRelationship2 , DepositUnit2, DepositStreetNumber2, DepositStreetName2 , DepositCity2 , DepositPostalCode2 , DepositMainProvince2 , DepositCountry2 , DepositEmail2 , DepositExtraContact2 , DepositExtraContactNumber2 , DepositPhone2 ,  TransactionID ,Brokerid , FirstName2, LastName2,Fintrac2,con ); }else { }
    	    	   if(isDeposit3==1) {  RDS.NEWDeposit(DepositAmount3, DepositType3 ,DepositDate3 ,DepositReference3, DepositRecievedFromDetail3 , DepositRelationship3 , DepositUnit3, DepositStreetNumber3, DepositStreetName3 , DepositCity3 , DepositPostalCode3 , DepositMainProvince3 , DepositCountry3 , DepositEmail3 , DepositExtraContact3 , DepositExtraContactNumber3 , DepositPhone3 ,  TransactionID ,Brokerid , FirstName3, LastName3,Fintrac3,con ); }else {}
    	    	   if(isDeposit4==1) {  RDS.NEWDeposit(DepositAmount4, DepositType4 , DepositDate4 ,DepositReference4, DepositRecievedFromDetail4 , DepositRelationship4 , DepositUnit4, DepositStreetNumber4, DepositStreetName4 , DepositCity4 , DepositPostalCode4 , DepositMainProvince4 , DepositCountry4 , DepositEmail4 , DepositExtraContact4 , DepositExtraContactNumber4 , DepositPhone4 ,  TransactionID ,Brokerid , FirstName4, LastName4 ,Fintrac4 ,con);}else {}

    	    }
    	    
    	    if( Size2==2) {
    	    	
    	    	  if(isDeposit1==1) {
    	    	
    	    	       RDS.UpdateDeposit(DepositAmount1, DepositType1 , DepositDate1,DepositReference1, DepositRecievedFromDetail1 , DepositRelationship1 , DepositUnit1, DepositStreetNumber1, DepositStreetName1 , DepositCity1 , DepositPostalCode1 , DepositMainProvince1 , DepositCountry1 , DepositEmail1 , DepositExtraContact1 , DepositExtraContactNumber1 , DepositPhone1 ,  TransactionID ,MyDeposits.get(0).ID, Brokerid , FirstName1, LastName1 ,Fintrac1 ,con); }
    	    	
    	    	  else {  RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con ); }
    	    	
    	    	  if(isDeposit2==1) {	RDS.UpdateDeposit(DepositAmount2, DepositType2 ,DepositDate2,DepositReference2, DepositRecievedFromDetail2 , DepositRelationship2 , DepositUnit2, DepositStreetNumber2, DepositStreetName2 , DepositCity2 , DepositPostalCode2 , DepositMainProvince2 , DepositCountry2 , DepositEmail2 , DepositExtraContact2 , DepositExtraContactNumber2 , DepositPhone2 ,  TransactionID, MyDeposits.get(1).ID ,Brokerid , FirstName2, LastName2 ,Fintrac2 ,con); }
    	    	
    	    	  else {  RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID ,con); }
    	    	
     	    	  if(isDeposit3==1) {  RDS.NEWDeposit(DepositAmount3, DepositType3 , DepositDate3 ,DepositReference3, DepositRecievedFromDetail3 , DepositRelationship3 , DepositUnit3, DepositStreetNumber3, DepositStreetName3 , DepositCity3 , DepositPostalCode3 , DepositMainProvince3 , DepositCountry3 , DepositEmail3 , DepositExtraContact3 , DepositExtraContactNumber3 , DepositPhone3 ,  TransactionID ,Brokerid , FirstName3, LastName3, Fintrac3,con );} else {} 
     	    	
    	    	  if(isDeposit4==1) {  RDS.NEWDeposit(DepositAmount4, DepositType4 , DepositDate4,DepositReference4, DepositRecievedFromDetail4 , DepositRelationship4 , DepositUnit4, DepositStreetNumber4, DepositStreetName4 , DepositCity4 , DepositPostalCode4 , DepositMainProvince4 , DepositCountry4 , DepositEmail4 , DepositExtraContact4 , DepositExtraContactNumber4 , DepositPhone4 ,  TransactionID ,Brokerid , FirstName4, LastName4, Fintrac4 ,con);} else {}

    	    }
    	    
    	    if( Size2==3) {
    	    	
    	    	   if(isDeposit1==1) {  RDS.UpdateDeposit(DepositAmount1, DepositType1 , DepositDate1,DepositReference1, DepositRecievedFromDetail1 , DepositRelationship1 , DepositUnit1, DepositStreetNumber1, DepositStreetName1 , DepositCity1 , DepositPostalCode1 , DepositMainProvince1 , DepositCountry1 , DepositEmail1 , DepositExtraContact1 , DepositExtraContactNumber1 , DepositPhone1 ,  TransactionID ,MyDeposits.get(0).ID ,Brokerid , FirstName1, LastName1 ,Fintrac1 ,con); }
    	    	
    	    	   else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID,con ); }
    	    	
    	    	   if(isDeposit2==1) { RDS.UpdateDeposit(DepositAmount2, DepositType2 , DepositDate2 ,DepositReference2, DepositRecievedFromDetail2 , DepositRelationship2 , DepositUnit2, DepositStreetNumber2, DepositStreetName2 , DepositCity2 , DepositPostalCode2 , DepositMainProvince2 , DepositCountry2 , DepositEmail2 , DepositExtraContact2 , DepositExtraContactNumber2 , DepositPhone2 ,  TransactionID, MyDeposits.get(1).ID ,Brokerid  , FirstName2, LastName2,Fintrac2 ,con); }
    	    	
    	    	   else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID ,con); }
    	    	
    	    	   if(isDeposit3==1) { RDS.UpdateDeposit(DepositAmount3, DepositType3 , DepositDate3 ,DepositReference3, DepositRecievedFromDetail3 , DepositRelationship3 , DepositUnit3, DepositStreetNumber3, DepositStreetName3 , DepositCity3 , DepositPostalCode3 , DepositMainProvince3 , DepositCountry3 , DepositEmail3 , DepositExtraContact3 , DepositExtraContactNumber3 , DepositPhone3 ,  TransactionID , MyDeposits.get(2).ID ,Brokerid, FirstName3, LastName3,Fintrac3 ,con); }
    	    	   
    	    	   else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(2).ID ,TransactionID,con ); }

    	    	   if(isDeposit4==1) {  RDS.NEWDeposit(DepositAmount4, DepositType4 , DepositDate4,DepositReference4, DepositRecievedFromDetail4 , DepositRelationship4 , DepositUnit4, DepositStreetNumber4, DepositStreetName4 , DepositCity4 , DepositPostalCode4 , DepositMainProvince4 , DepositCountry4 , DepositEmail4 , DepositExtraContact4 , DepositExtraContactNumber4 , DepositPhone4 ,  TransactionID ,Brokerid, FirstName4, LastName4 ,Fintrac4 ,con );}else {}

    	    }
    	    
    	    if( Size2==4) {
    	    	
    	    	if(isDeposit1==1) { RDS.UpdateDeposit(DepositAmount1, DepositType1 ,DepositDate1,DepositReference1, DepositRecievedFromDetail1 , DepositRelationship1 , DepositUnit1, DepositStreetNumber1, DepositStreetName1 , DepositCity1 , DepositPostalCode1 , DepositMainProvince1 , DepositCountry1 , DepositEmail1 , DepositExtraContact1 , DepositExtraContactNumber1 , DepositPhone1 ,  TransactionID ,MyDeposits.get(0).ID ,Brokerid ,FirstName1, LastName1 ,Fintrac1,con );}
    	    	
    	    	else{ RDS.DeleteDeposit(  Brokerid , MyDeposits.get(0).ID ,TransactionID ,con); }
    	    	
    	    	if(isDeposit2==1) { RDS.UpdateDeposit(DepositAmount2, DepositType2 , DepositDate2 ,DepositReference2, DepositRecievedFromDetail2 , DepositRelationship2 , DepositUnit2, DepositStreetNumber2, DepositStreetName2 , DepositCity2 , DepositPostalCode2 , DepositMainProvince2 , DepositCountry2 , DepositEmail2 , DepositExtraContact2 , DepositExtraContactNumber2 , DepositPhone2 ,  TransactionID, MyDeposits.get(1).ID  , Brokerid , FirstName2, LastName2,Fintrac2,con ); }
    	    	
    	    	else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(1).ID ,TransactionID ,con);}
    	    	
    	    	if(isDeposit3==1) { RDS.UpdateDeposit(DepositAmount3, DepositType3 , DepositDate3 ,DepositReference3, DepositRecievedFromDetail3 , DepositRelationship3 , DepositUnit3, DepositStreetNumber3, DepositStreetName3 , DepositCity3 , DepositPostalCode3 , DepositMainProvince3 , DepositCountry3 , DepositEmail3 , DepositExtraContact3 , DepositExtraContactNumber3 , DepositPhone3 ,  TransactionID , MyDeposits.get(2).ID  , Brokerid , FirstName3, LastName3 ,Fintrac3,con); }
    	    	
    	    	else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(2).ID ,TransactionID ,con); }
    	    	
    	    	if(isDeposit4==1) { RDS.UpdateDeposit(DepositAmount4, DepositType4 , DepositDate4 ,DepositReference4, DepositRecievedFromDetail4 , DepositRelationship4 , DepositUnit4, DepositStreetNumber4, DepositStreetName4 , DepositCity4 , DepositPostalCode4 , DepositMainProvince4 , DepositCountry4 , DepositEmail4 , DepositExtraContact4 , DepositExtraContactNumber4 , DepositPhone4 ,  TransactionID ,  MyDeposits.get(3).ID , Brokerid , FirstName4, LastName4 ,Fintrac4 ,con); }
    	    	
    	    	else { RDS.DeleteDeposit(  Brokerid , MyDeposits.get(3).ID ,TransactionID,con ); }
    	    }
    	

 //********************* Vendor-Landlord *********************
    	    
        	 if(Size==0){
	    		
        		   if( isVendor1==1) {

		                     RDS.NEWPatry( VendorType1, VendorBusinessName1, VendorOfficer1, VendorFirstName1, VendorLastName1, VendorStreetName1,
		        		
			    		     VendorStreetNumber1 , VendorUnit1, VendorCity1 , VendorMainProvince1 ,VendorPostalCode1, VendorCountry1, VendorPhone1, VendorExteraContact1,
			    		 
			    		     VendorExteraContactNumber1, VendorEmail1, "Vendor", TransactionID ,Brokerid , VendorPowerofattorney1 ,con); } else {}
	    		
	    	      if( isVendor2==1) {
	    	    	
	    		             RDS.NEWPatry(VendorType2,VendorBusinessName2,VendorOfficer2,VendorFirstName2,VendorLastName2,VendorStreetName2,
	   		    		     VendorStreetNumber2 , VendorUnit2, VendorCity2 , VendorMainProvince2 ,VendorPostalCode2,VendorCountry2,VendorPhone2,VendorExteraContact2,
	   		    		     VendorExteraContactNumber2, VendorEmail2, "Vendor",TransactionID ,Brokerid , VendorPowerofattorney2 ,con); }else {}
	    	    
	    	      if( isVendor3==1) {

	    		             RDS.NEWPatry(VendorType3,VendorBusinessName3,VendorOfficer3,VendorFirstName3,VendorLastName3,VendorStreetName3,
	    		    		 VendorStreetNumber3 , VendorUnit3, VendorCity3 , VendorMainProvince3 ,VendorPostalCode3,VendorCountry3,VendorPhone3,VendorExteraContact3,
	    		    		 VendorExteraContactNumber3, VendorEmail3, "Vendor",TransactionID , Brokerid,VendorPowerofattorney3,con ); }else {}
	    	    
	    	      if( isVendor4==1) {
	   		     
	    		             RDS.NEWPatry(VendorType4,VendorBusinessName4,VendorOfficer4,VendorFirstName4,VendorLastName4,VendorStreetName4,
	    		    		 VendorStreetNumber4 , VendorUnit4, VendorCity4 , VendorMainProvince4 ,VendorPostalCode4, VendorCountry4 , VendorPhone4,VendorExteraContact4,
	    		    		 VendorExteraContactNumber4, VendorEmail4,"Vendor", TransactionID , Brokerid ,VendorPowerofattorney4 ,con);  }else {}
	    		
	    	}//if Size==0


	    	if(Size==1){

	    		    if( isVendor1==1) {

		                     RDS.UpdatePatry( VendorType1, VendorBusinessName1, VendorOfficer1, VendorFirstName1, VendorLastName1, VendorStreetName1,
		        		
			    		     VendorStreetNumber1 , VendorUnit1, VendorCity1 , VendorMainProvince1 ,VendorPostalCode1, VendorCountry1, VendorPhone1, VendorExteraContact1,
			    		 
			    		     VendorExteraContactNumber1, VendorEmail1, "Vendor", TransactionID , MyVendors.get(0).ID , Brokerid ,VendorPowerofattorney1 ,con); }else {  RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con);}
	    		
	    	        if( isVendor2==1) {
	    	    	
	    		             RDS.NEWPatry(VendorType2,VendorBusinessName2,VendorOfficer2,VendorFirstName2,VendorLastName2,VendorStreetName2,
	   		    		     VendorStreetNumber2 , VendorUnit2, VendorCity2 , VendorMainProvince2 ,VendorPostalCode2,VendorCountry2,VendorPhone2,VendorExteraContact2,
	   		    		     VendorExteraContactNumber2, VendorEmail2, "Vendor",TransactionID , Brokerid , VendorPowerofattorney2,con ); }else {   }
	    	    
	    	         if( isVendor3==1) {

	    		             RDS.NEWPatry(VendorType3,VendorBusinessName3,VendorOfficer3,VendorFirstName3,VendorLastName3,VendorStreetName3,
	    		    		 VendorStreetNumber3 , VendorUnit3, VendorCity3 , VendorMainProvince3 ,VendorPostalCode3,VendorCountry3,VendorPhone3,VendorExteraContact3,
	    		    		 VendorExteraContactNumber3, VendorEmail3, "Vendor",TransactionID , Brokerid , VendorPowerofattorney3 ,con); }else {}
	    	    
	    	           if( isVendor4==1) {
	   		     
	    		             RDS.NEWPatry(VendorType4,VendorBusinessName4,VendorOfficer4,VendorFirstName4,VendorLastName4,VendorStreetName4,
	    		    		 VendorStreetNumber4 , VendorUnit4, VendorCity4 , VendorMainProvince4 ,VendorPostalCode4, VendorCountry4 , VendorPhone4,VendorExteraContact4,
	    		    		 VendorExteraContactNumber4, VendorEmail4,"Vendor", TransactionID , Brokerid ,VendorPowerofattorney4 ,con);  }else {}

	    		
	    	       }//If Size==1

	        	  if(Size==2){
	       		
	         	      if( isVendor1==1) {
	         	    	
		                       RDS.UpdatePatry( VendorType1, VendorBusinessName1, VendorOfficer1, VendorFirstName1, VendorLastName1, VendorStreetName1,
		        		
			    		       VendorStreetNumber1 , VendorUnit1, VendorCity1 , VendorMainProvince1 ,VendorPostalCode1, VendorCountry1, VendorPhone1, VendorExteraContact1,
			    		 
			    		       VendorExteraContactNumber1, VendorEmail1, "Vendor", TransactionID , MyVendors.get(0).ID , Brokerid , VendorPowerofattorney1 ,con); }
	         	      
	         	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con); }
		        
    	    	
	         	     if( isVendor2==1) { 
	         	    	
	         	    	        RDS.UpdatePatry(VendorType2,VendorBusinessName2,VendorOfficer2,VendorFirstName2,VendorLastName2,VendorStreetName2,
   		    		            VendorStreetNumber2 , VendorUnit2, VendorCity2 , VendorMainProvince2 ,VendorPostalCode2,VendorCountry2,VendorPhone2,VendorExteraContact2,
   		    		            VendorExteraContactNumber2, VendorEmail2, "Vendor",TransactionID ,  MyVendors.get(1).ID , Brokerid , VendorPowerofattorney2,con );}
	         	     
	         	     else {  RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID ,con);}
    		    
    		    
        	          if( isVendor3==1) {

	    		                RDS.NEWPatry(VendorType3,VendorBusinessName3,VendorOfficer3,VendorFirstName3,VendorLastName3,VendorStreetName3,
	    		    		    VendorStreetNumber3 , VendorUnit3, VendorCity3 , VendorMainProvince3 ,VendorPostalCode3,VendorCountry3,VendorPhone3,VendorExteraContact3,
	    		    		    VendorExteraContactNumber3, VendorEmail3, "Vendor",TransactionID , Brokerid , VendorPowerofattorney3 ,con); } else {}
	    	    
	    	          if( isVendor4==1) {
	   		     
	    		               RDS.NEWPatry(VendorType4,VendorBusinessName4,VendorOfficer4,VendorFirstName4,VendorLastName4,VendorStreetName4,
	    		    		   VendorStreetNumber4 , VendorUnit4, VendorCity4 , VendorMainProvince4 ,VendorPostalCode4, VendorCountry4 , VendorPhone4,VendorExteraContact4,
	    		    		   VendorExteraContactNumber4, VendorEmail4,"Vendor", TransactionID , Brokerid , VendorPowerofattorney4 ,con);  }else {}

	       	}//If Size==2
	    

	    	if(Size==3){
	    		
	     	      if( isVendor1==1) {
	     	    	
		                      RDS.UpdatePatry( VendorType1, VendorBusinessName1, VendorOfficer1, VendorFirstName1, VendorLastName1, VendorStreetName1,
		        		
			    		      VendorStreetNumber1 , VendorUnit1, VendorCity1 , VendorMainProvince1 ,VendorPostalCode1, VendorCountry1, VendorPhone1, VendorExteraContact1,
			    		 
			    		      VendorExteraContactNumber1, VendorEmail1, "Vendor", TransactionID , MyVendors.get(0).ID , Brokerid, VendorPowerofattorney1 ,con); }
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID,con );}
		        
	     	      if( isVendor2==1) {
	     	    	
    		                  RDS.UpdatePatry(VendorType2,VendorBusinessName2,VendorOfficer2,VendorFirstName2,VendorLastName2,VendorStreetName2,
   		    		          VendorStreetNumber2 , VendorUnit2, VendorCity2 , VendorMainProvince2 ,VendorPostalCode2,VendorCountry2,VendorPhone2,VendorExteraContact2,
   		    		          VendorExteraContactNumber2, VendorEmail2, "Vendor",TransactionID ,  MyVendors.get(1).ID , Brokerid , VendorPowerofattorney2 ,con);}
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID ,con);}
    		    
    		    
	     	      if( isVendor3==1) { 
	     	    	  
	     	    	          RDS.UpdatePatry(VendorType3,VendorBusinessName3,VendorOfficer3,VendorFirstName3,VendorLastName3,VendorStreetName3,
    		    		      VendorStreetNumber3 , VendorUnit3, VendorCity3 , VendorMainProvince3 ,VendorPostalCode3,VendorCountry3,VendorPhone3,VendorExteraContact3,
    		    		      VendorExteraContactNumber3, VendorEmail3, "Vendor",TransactionID , MyVendors.get(2).ID, Brokerid ,VendorPowerofattorney3 ,con );}
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(2).ID ,con); }
	    		
	    	       if( isVendor4==1) {
		   		     
	    		              RDS.NEWPatry(VendorType4,VendorBusinessName4,VendorOfficer4,VendorFirstName4,VendorLastName4,VendorStreetName4,
	    		    		  VendorStreetNumber4 , VendorUnit4, VendorCity4 , VendorMainProvince4 ,VendorPostalCode4, VendorCountry4 , VendorPhone4,VendorExteraContact4,
	    		    		  VendorExteraContactNumber4, VendorEmail4,"Vendor", TransactionID , Brokerid , VendorPowerofattorney4,con );  } else {}
	    		
	    	}//If Size==3

	    	if(Size==4){

	     	      if( isVendor1==1) {
	    		
		                      RDS.UpdatePatry( VendorType1, VendorBusinessName1, VendorOfficer1, VendorFirstName1, VendorLastName1, VendorStreetName1,
		        		
			    		      VendorStreetNumber1 , VendorUnit1, VendorCity1 , VendorMainProvince1 ,VendorPostalCode1, VendorCountry1, VendorPhone1, VendorExteraContact1,
			    		 
			    		      VendorExteraContactNumber1, VendorEmail1, "Vendor", TransactionID , MyVendors.get(0).ID , Brokerid , VendorPowerofattorney1 ,con); }
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(0).ID ,con); }
		        
    	    	
	     	      if( isVendor2==1) { 
	     	    	 
	     	    	          RDS.UpdatePatry(VendorType2,VendorBusinessName2,VendorOfficer2,VendorFirstName2,VendorLastName2,VendorStreetName2,
   		    		          VendorStreetNumber2 , VendorUnit2, VendorCity2 , VendorMainProvince2 ,VendorPostalCode2,VendorCountry2,VendorPhone2,VendorExteraContact2,
   		    		          VendorExteraContactNumber2, VendorEmail2, "Vendor",TransactionID ,  MyVendors.get(1).ID , Brokerid  , VendorPowerofattorney2 ,con);}
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(1).ID,con );}
    		    
    		    
	     	     if( isVendor3==1) {  
	     	    	
	     	    	          RDS.UpdatePatry(VendorType3,VendorBusinessName3,VendorOfficer3,VendorFirstName3,VendorLastName3,VendorStreetName3,
    		    		      VendorStreetNumber3 , VendorUnit3, VendorCity3 , VendorMainProvince3 ,VendorPostalCode3,VendorCountry3,VendorPhone3,VendorExteraContact3,
    		    		      VendorExteraContactNumber3, VendorEmail3, "Vendor",TransactionID , MyVendors.get(2).ID , Brokerid , VendorPowerofattorney3 ,con);	}
	     	     
	     	     else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(2).ID ,con);}
    		    
    		    
	     	      if( isVendor4==1) { 
	     	    	
	     	    	         RDS.UpdatePatry(VendorType4,VendorBusinessName4,VendorOfficer4,VendorFirstName4,VendorLastName4,VendorStreetName4,
    		    		     VendorStreetNumber4 , VendorUnit4, VendorCity4 , VendorMainProvince4 ,VendorPostalCode4, VendorCountry4 , VendorPhone4,VendorExteraContact4,
    		    		     VendorExteraContactNumber4, VendorEmail4,"Vendor", TransactionID , MyVendors.get(3).ID , Brokerid , VendorPowerofattorney4 ,con); }
	     	      
	     	      else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyVendors.get(3).ID ,con);}

	    	}//If Size==4
    	
    	
//********* Purchaser-Tanent ***************//
	    	
	       	if(Size1==0){
	       		
	       		    if(isPurchaser1==1) {

			                RDS.NEWPatry(PurchaserType1,PurchaserBusinessName1,PurchaserOfficer1,PurchaserFirstName1,PurchaserLastName1,PurchaserStreetName1,
			    		    PurchaserStreetNumber1 , PurchaserUnit1, PurchaserCity1 , PurchaserMainProvince1 ,PurchaserPostalCode1, PurchaserCountry1, PurchaserPhone1,PurchaserExteraContact1,
			    		    PurchaserExteraContactNumber1, PurchaserEmail1,"Purchaser", TransactionID , Brokerid , PurchaserPowerofattorney1 ,con);} else {}
			     
			        if(isPurchaser2==1) {
			    	
			                 RDS.NEWPatry(PurchaserType2,PurchaserBusinessName2,PurchaserOfficer2,PurchaserFirstName2,PurchaserLastName2,PurchaserStreetName2,
			    		     PurchaserStreetNumber2 , PurchaserUnit2, PurchaserCity2 , PurchaserMainProvince2 ,PurchaserPostalCode2, PurchaserCountry2 ,PurchaserPhone2,PurchaserExteraContact2,
			    		     PurchaserExteraContactNumber2, PurchaserEmail2, "Purchaser", TransactionID  , Brokerid, PurchaserPowerofattorney2 ,con);}else {}
			    
			        if(isPurchaser3==1) {
			     
			                 RDS.NEWPatry(PurchaserType3,PurchaserBusinessName3,PurchaserOfficer3,PurchaserFirstName3,PurchaserLastName3,PurchaserStreetName3,
				    		 PurchaserStreetNumber3 , PurchaserUnit3, PurchaserCity3 , PurchaserMainProvince3 ,PurchaserPostalCode3, PurchaserCountry3 , PurchaserPhone3,PurchaserExteraContact3,
				    		 PurchaserExteraContactNumber3, PurchaserEmail3, "Purchaser",TransactionID , Brokerid , PurchaserPowerofattorney3,con );}else {}
			    
			       if(isPurchaser4==1) {
				    
				             RDS.NEWPatry(PurchaserType4,PurchaserBusinessName4,PurchaserOfficer4,PurchaserFirstName4,PurchaserLastName4,PurchaserStreetName4,
				    		 PurchaserStreetNumber4 , PurchaserUnit4, PurchaserCity4 , PurchaserMainProvince4 ,PurchaserPostalCode4, PurchaserCountry4 ,PurchaserPhone4,PurchaserExteraContact4,
				    		 PurchaserExteraContactNumber4, PurchaserEmail4,"Purchaser", TransactionID , Brokerid , PurchaserPowerofattorney4,con );}else {}

	       	}//If Size==0  
	       	
	           	if(Size1==1){
	       		
	           		

	           	       if(isPurchaser1==1){
	           	    	
			                RDS.UpdatePatry(PurchaserType1,PurchaserBusinessName1,PurchaserOfficer1,PurchaserFirstName1,PurchaserLastName1,PurchaserStreetName1,
			    		    PurchaserStreetNumber1 , PurchaserUnit1, PurchaserCity1 , PurchaserMainProvince1 ,PurchaserPostalCode1, PurchaserCountry1 , PurchaserPhone1,PurchaserExteraContact1,
			    		    PurchaserExteraContactNumber1, PurchaserEmail1,"Purchaser", TransactionID ,MyPurchasers.get(0).ID , Brokerid , PurchaserPowerofattorney1 ,con );}
	           	       
	           	       else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID ,con); }
			     
			          if(isPurchaser2==1) {
			    	
			                RDS.NEWPatry(PurchaserType2,PurchaserBusinessName2,PurchaserOfficer2,PurchaserFirstName2,PurchaserLastName2,PurchaserStreetName2,
			    		    PurchaserStreetNumber2 , PurchaserUnit2, PurchaserCity2 , PurchaserMainProvince2 ,PurchaserPostalCode2, PurchaserCountry2 ,PurchaserPhone2,PurchaserExteraContact2,
			    		    PurchaserExteraContactNumber2, PurchaserEmail2, "Purchaser", TransactionID , Brokerid , PurchaserPowerofattorney2,con );}else {}
			    
			          if(isPurchaser3==1) {
			     
			                 RDS.NEWPatry(PurchaserType3,PurchaserBusinessName3,PurchaserOfficer3,PurchaserFirstName3,PurchaserLastName3,PurchaserStreetName3,
				    		 PurchaserStreetNumber3 , PurchaserUnit3, PurchaserCity3 , PurchaserMainProvince3 ,PurchaserPostalCode3, PurchaserCountry3 , PurchaserPhone3,PurchaserExteraContact3,
				    		 PurchaserExteraContactNumber3, PurchaserEmail3, "Purchaser",TransactionID , Brokerid , PurchaserPowerofattorney3 ,con);}else {}
			    
			           if(isPurchaser4==1) {
				    
				             RDS.NEWPatry(PurchaserType4,PurchaserBusinessName4,PurchaserOfficer4,PurchaserFirstName4,PurchaserLastName4,PurchaserStreetName4,
				    		 PurchaserStreetNumber4 , PurchaserUnit4, PurchaserCity4 , PurchaserMainProvince4 ,PurchaserPostalCode4, PurchaserCountry4 ,PurchaserPhone4,PurchaserExteraContact4,
				    		 PurchaserExteraContactNumber4, PurchaserEmail4,"Purchaser", TransactionID , Brokerid, PurchaserPowerofattorney4,con );}else {}

	       	}//If Size1=1
	       	
	    	if(Size1==2){

	    		
	    		   if(isPurchaser1==1) {
	    			
			              RDS.UpdatePatry(PurchaserType1,PurchaserBusinessName1,PurchaserOfficer1,PurchaserFirstName1,PurchaserLastName1,PurchaserStreetName1,
			    		  PurchaserStreetNumber1 , PurchaserUnit1, PurchaserCity1 , PurchaserMainProvince1 ,PurchaserPostalCode1, PurchaserCountry1 , PurchaserPhone1,PurchaserExteraContact1,
			    		  PurchaserExteraContactNumber1, PurchaserEmail1,"Purchaser", TransactionID ,MyPurchasers.get(0).ID, Brokerid , PurchaserPowerofattorney1 ,con);}
	    		   
	    		   else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID ,con );}
			     

	    		   if(isPurchaser2==1) {	

			              RDS.UpdatePatry(PurchaserType2,PurchaserBusinessName2,PurchaserOfficer2,PurchaserFirstName2,PurchaserLastName2,PurchaserStreetName2,
			    		  PurchaserStreetNumber2 , PurchaserUnit2, PurchaserCity2 , PurchaserMainProvince2 ,PurchaserPostalCode2, PurchaserCountry2 ,PurchaserPhone2,PurchaserExteraContact2,
			    		  PurchaserExteraContactNumber2, PurchaserEmail2, "Purchaser", TransactionID ,MyPurchasers.get(1).ID , Brokerid , PurchaserPowerofattorney2 ,con);}
	    		   
	    		   else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID ,con); }
			    
			       if(isPurchaser3==1) {
			     
			                 RDS.NEWPatry(PurchaserType3,PurchaserBusinessName3,PurchaserOfficer3,PurchaserFirstName3,PurchaserLastName3,PurchaserStreetName3,
				    		 PurchaserStreetNumber3 , PurchaserUnit3, PurchaserCity3 , PurchaserMainProvince3 ,PurchaserPostalCode3,PurchaserCountry3 , PurchaserPhone3,PurchaserExteraContact3,
				    		 PurchaserExteraContactNumber3, PurchaserEmail3, "Purchaser",TransactionID , Brokerid , PurchaserPowerofattorney3,con );}else {}
			    
			       if(isPurchaser4==1) {
				    
				            RDS.NEWPatry(PurchaserType4,PurchaserBusinessName4,PurchaserOfficer4,PurchaserFirstName4,PurchaserLastName4,PurchaserStreetName4,
				    		 PurchaserStreetNumber4 , PurchaserUnit4, PurchaserCity4 , PurchaserMainProvince4 ,PurchaserPostalCode4, PurchaserCountry4 ,PurchaserPhone4,PurchaserExteraContact4,
				    		 PurchaserExteraContactNumber4, PurchaserEmail4,"Purchaser", TransactionID , Brokerid, PurchaserPowerofattorney4 ,con); }else {}
	    	}//If Size1=2
	    	
	    	if(Size1==3){
	    		
	    		     if(isPurchaser1==1) {
	    		
			                 RDS.UpdatePatry(PurchaserType1,PurchaserBusinessName1,PurchaserOfficer1,PurchaserFirstName1,PurchaserLastName1,PurchaserStreetName1,
			    		     PurchaserStreetNumber1 , PurchaserUnit1, PurchaserCity1 , PurchaserMainProvince1 ,PurchaserPostalCode1, PurchaserCountry1 , PurchaserPhone1,PurchaserExteraContact1,
			    		     PurchaserExteraContactNumber1, PurchaserEmail1,"Purchaser", TransactionID ,MyPurchasers.get(0).ID , Brokerid, PurchaserPowerofattorney1 ,con); }
	    		     
	    		     else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID,con ); }
			     
			          if(isPurchaser2==1) {
			     	
			                 RDS.UpdatePatry(PurchaserType2,PurchaserBusinessName2,PurchaserOfficer2,PurchaserFirstName2,PurchaserLastName2,PurchaserStreetName2,
			    		     PurchaserStreetNumber2 , PurchaserUnit2, PurchaserCity2 , PurchaserMainProvince2 ,PurchaserPostalCode2, PurchaserCountry2 ,PurchaserPhone2,PurchaserExteraContact2,
			    		     PurchaserExteraContactNumber2, PurchaserEmail2, "Purchaser", TransactionID ,MyPurchasers.get(1).ID , Brokerid, PurchaserPowerofattorney2 ,con); }
			          
			          else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID,con );}
			    
			          if(isPurchaser3==1) {
			     
			                 RDS.UpdatePatry(PurchaserType3,PurchaserBusinessName3,PurchaserOfficer3,PurchaserFirstName3,PurchaserLastName3,PurchaserStreetName3,
				    		 PurchaserStreetNumber3 , PurchaserUnit3, PurchaserCity3 , PurchaserMainProvince3 ,PurchaserPostalCode3, PurchaserCountry3 , PurchaserPhone3,PurchaserExteraContact3,
				    		 PurchaserExteraContactNumber3, PurchaserEmail3, "Purchaser",TransactionID,MyPurchasers.get(2).ID , Brokerid , PurchaserPowerofattorney3,con ); }
			          
			          else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(2).ID ,con); }
			    
			          if(isPurchaser4==1) {
				    
				             RDS.NEWPatry(PurchaserType4,PurchaserBusinessName4,PurchaserOfficer4,PurchaserFirstName4,PurchaserLastName4,PurchaserStreetName4,
				    		 PurchaserStreetNumber4 , PurchaserUnit4, PurchaserCity4 , PurchaserMainProvince4 ,PurchaserPostalCode4, PurchaserCountry4 ,PurchaserPhone4,PurchaserExteraContact4,
				    		 PurchaserExteraContactNumber4, PurchaserEmail4,"Purchaser", TransactionID, Brokerid, PurchaserPowerofattorney4 ,con); }else {}
	    		
	    		
	    	}//If Size1=3
	    	
	    	if(Size1==4){
	    		
	    		  if(isPurchaser1==1) {

			               RDS.UpdatePatry(PurchaserType1,PurchaserBusinessName1,PurchaserOfficer1,PurchaserFirstName1,PurchaserLastName1,PurchaserStreetName1,
			    		   PurchaserStreetNumber1 , PurchaserUnit1, PurchaserCity1 , PurchaserMainProvince1 ,PurchaserPostalCode1, PurchaserCountry1 , PurchaserPhone1,PurchaserExteraContact1,
			    		   PurchaserExteraContactNumber1, PurchaserEmail1,"Purchaser", TransactionID ,MyPurchasers.get(0).ID , Brokerid , PurchaserPowerofattorney1 ,con);}else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(0).ID ,con); }
	    		
			       if(isPurchaser2==1) {

			                RDS.UpdatePatry(PurchaserType2,PurchaserBusinessName2,PurchaserOfficer2,PurchaserFirstName2,PurchaserLastName2,PurchaserStreetName2,
			    		    PurchaserStreetNumber2 , PurchaserUnit2, PurchaserCity2 , PurchaserMainProvince2 ,PurchaserPostalCode2, PurchaserCountry2 ,PurchaserPhone2,PurchaserExteraContact2,
			    		    PurchaserExteraContactNumber2, PurchaserEmail2, "Purchaser", TransactionID ,MyPurchasers.get(1).ID , Brokerid , PurchaserPowerofattorney2 ,con);} else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(1).ID ,con);}
			    

			        if(isPurchaser3==1) { 

			                 RDS.UpdatePatry(PurchaserType3,PurchaserBusinessName3,PurchaserOfficer3,PurchaserFirstName3,PurchaserLastName3,PurchaserStreetName3,
				    		 PurchaserStreetNumber3 , PurchaserUnit3, PurchaserCity3 , PurchaserMainProvince3 ,PurchaserPostalCode3,PurchaserCountry3, PurchaserPhone3,PurchaserExteraContact3,
				    		 PurchaserExteraContactNumber3, PurchaserEmail3, "Purchaser",TransactionID,MyPurchasers.get(2).ID , Brokerid , PurchaserPowerofattorney3 ,con);}else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(2).ID ,con);}
	
			         if(isPurchaser4==1) {    

				             RDS.UpdatePatry(PurchaserType4,PurchaserBusinessName4,PurchaserOfficer4,PurchaserFirstName4,PurchaserLastName4,PurchaserStreetName4,
				    		 PurchaserStreetNumber4 , PurchaserUnit4, PurchaserCity4 , PurchaserMainProvince4 ,PurchaserPostalCode4, PurchaserCountry4 ,PurchaserPhone4,PurchaserExteraContact4,
				    		 PurchaserExteraContactNumber4, PurchaserEmail4,"Purchaser", TransactionID , MyPurchasers.get(3).ID , Brokerid , PurchaserPowerofattorney4 ,con);}else { RDS.DeleteParty( TransactionID ,  Brokerid  , MyPurchasers.get(3).ID ,con);}

	    		
	    	}//If Size1=4

	    	//****************** Vendor Lawyer ******************//
	    	

	    	
	    	//if not and the user has requested a vendor lawyer we will add it 

	    	if( Lawyer1.ID==0 ) {  
	    		
	    		   if( isVendorLawyer==1 ) { RDS.NEWLawyer(VendorLawFirm,VendorLawyer,VendorLawyerPhone,VendorLawyerUnit,VendorLawyerStreetNumber,VendorLawyerStreetName, VendorLawyerCity,VendorLawyerPostalCode,VendorLawyerProvince, VendorLawyerEmail ,VendorLawyerExtraContact,VendorLawyerExtraContactNumber , VendorLawyerClerkFullName , VendorLawyerClerkEmail ,"1", TransactionID, Brokerid,con);}
	    		
	    		   else { }
	    		  
	    	 }//End of Lawyer1.ID==0 

	    	else { 

	    		  if( isVendorLawyer==1 ) {  RDS.UpdateLawyer(VendorLawFirm,VendorLawyer,VendorLawyerPhone,VendorLawyerUnit,VendorLawyerStreetNumber,VendorLawyerStreetName, VendorLawyerCity,VendorLawyerPostalCode,VendorLawyerProvince, VendorLawyerEmail ,VendorLawyerExtraContact,VendorLawyerExtraContactNumber , VendorLawyerClerkFullName , VendorLawyerClerkEmail ,"1", TransactionID , Lawyer1.ID , Brokerid,con);}
	    		
	    		  else {  RDS.DeleteLawyer(   Brokerid , Lawyer1.ID , TransactionID,con ); }
	    	}
    	

	
	    	
	    	if( Lawyer2.ID==0 ) {
	    	
	    	     if(isPurchaserLawyer==1) { RDS.NEWLawyer(PurchaserLawFirm, PurchaserLawyer,PurchaserLawyerPhone,PurchaserLawyerUnit,PurchaserLawyerStreetNumber,PurchaserLawyerStreetName, PurchaserLawyerCity ,PurchaserLawyerPostalCode, PurchaserLawyerProvince , PurchaserLawyerEmail , PurchaserLawyerExtraContact, PurchaserLawyerExtraContactNumber ,"","","2",TransactionID , Brokerid,con);}
	    	     
	    	      else {}
	    	
    
	    	} else {

	    		     if(isPurchaserLawyer==1){ RDS.UpdateLawyer(PurchaserLawFirm, PurchaserLawyer,PurchaserLawyerPhone,PurchaserLawyerUnit,PurchaserLawyerStreetNumber,PurchaserLawyerStreetName, PurchaserLawyerCity ,PurchaserLawyerPostalCode, PurchaserLawyerProvince , PurchaserLawyerEmail , PurchaserLawyerExtraContact, PurchaserLawyerExtraContactNumber ,"","","2",TransactionID , Lawyer2.ID, Brokerid,con);}
	    		  
	    	        else{ RDS.DeleteLawyer(   Brokerid , Lawyer2.ID , TransactionID ,con);  }	

	    	}//End of else Lawyer2.ID==0 
	    	
	    	


	    	  if( MyCooperatingBroker.ID==0) {
	    		  
	    		       if( isCooperatingBrokerage ==1) {  

	    		    	     RDS.NEWCOOperationBroker(CooperatingBrokerage,CooperatingAgentFullName,CooperatingBrokeragePhone,CooperatingBrokerageUnit,
	   	    		  
	    			          CooperatingBrokerageStreetName,CooperatingBrokerageStreetNumber,CooperatingBrokerageCity,CooperatingBrokerageProvince,CooperatingBrokeragePostalCode,CooperatingBrokerageEmail,CooperatingBrokerageExtraContact, CooperatingBrokerageExtraContactNumber, TransactionID,Brokerid ,con); }
	    		    
	    		       else{}

	    		  
	    	  } else {  
	    		  
	    		     if( isCooperatingBrokerage ==1) {
	    		  	  
	    		            RDS.UpdateCOOperationBroker(CooperatingBrokerage,CooperatingAgentFullName,CooperatingBrokeragePhone,CooperatingBrokerageUnit,
			    		  
		    		        CooperatingBrokerageStreetName,CooperatingBrokerageStreetNumber,CooperatingBrokerageCity,CooperatingBrokerageProvince,CooperatingBrokeragePostalCode,CooperatingBrokerageEmail,CooperatingBrokerageExtraContact, CooperatingBrokerageExtraContactNumber, TransactionID, MyCooperatingBroker.ID , Brokerid,con ); }
	    		  
	    		     else { RDS.DeleteBrokerage(   Brokerid ,MyCooperatingBroker.ID , TransactionID ,con); }
	    		  
	    	  }//End of else MyCooperatingBroker.ID==0
	    	  

	    	  Invoice MyInvoice=new Invoice();  
	    	  
	    	  MyInvoice=RDS.SearchInvoiceByTransactionID(TransactionID , Brokerid ,con);
	    	  
	    	  
	    	  if( MyInvoice.ID==0) {
	    		  
				  Invoice  NewInvoice=new Invoice( 
						   0,
						   Brokerid,
						   TransactionID,
						   InvoiceSendStatus,	
						   InvoiceType,
						   InvoiceDate,
						   InvoiceRecieverFirstName,
						   InvoiceRecieverLastName,
						   InvoiceRecieverEmail,
						   InvoiceUnit,
						   InvoiceStreetName,
						   InvoiceStreetNumber,
						   InvoiceCity,
						   InvoiceProvince,
						   InvoicePostalCode,
						   InvoiceCountry,
						   InvoiceSalesPrice,
						   InvoicecommissionPayable,	
						   InvoiceHST,	
						   InvoiceDeposit,
						   InvoiceBalance,	
						   InvoiceClosingDate,
						   Party1,Party2);

				 RDS.NEWInvoice( NewInvoice ,con );
	    		  
	    		  
	    	  }
	    	  
	    	  else { 
	    		  
	    		  
				   String newParty1=VendorOfficer1+VendorFirstName1+" "+VendorLastName1+","+VendorOfficer2+VendorFirstName2+" "+VendorLastName2+","+VendorOfficer3+VendorFirstName3+" "+VendorLastName3+","+VendorOfficer4+VendorFirstName4+" "+VendorLastName4;
				   
				   String newParty2=PurchaserOfficer1+PurchaserFirstName1+" "+PurchaserLastName1+","+PurchaserOfficer2+PurchaserFirstName2+" "+PurchaserLastName2+","+PurchaserOfficer3+VendorFirstName3+" "+PurchaserLastName3+","+PurchaserOfficer4+PurchaserFirstName4+" "+PurchaserLastName4;;

				   String newInvoiceSendStatus=MyInvoice.SendStatus;	

				   String newInvoiceType="";
				   
				   Timestamp newInvoiceClosingDate=PropertyClosingDate;

				   double TotalDeposits=0;
				   
				   if( DepositAmount4==null || DepositAmount4.isEmpty()|| DepositAmount4.equals("") ) {}else{   TotalDeposits=TotalDeposits+  Double.parseDouble(DepositAmount4); }
				   
				   if( DepositAmount3==null || DepositAmount3.isEmpty()|| DepositAmount3.equals("")) {} else{   TotalDeposits=TotalDeposits+  Double.parseDouble(DepositAmount3);}
				   
				   if( DepositAmount2==null || DepositAmount2.isEmpty()|| DepositAmount2    .equals("")) {} else{   TotalDeposits=TotalDeposits+  Double.parseDouble(DepositAmount2);}
				   
				   if( DepositAmount1==null || DepositAmount1.isEmpty()|| DepositAmount1.equals("")) {} else{   TotalDeposits=TotalDeposits+  Double.parseDouble(DepositAmount1 );}
				   
				  //Double.parseDouble(DepositAmount3)+Double.parseDouble(DepositAmount2)+Double.parseDouble(DepositAmount1);
				   
				   double TotalCommissions;
				   
				   String newInvoiceSalesPrice=ProPertyListingPrice;  

				   //String newInvoicecommissionPayable="";
				   
				   String Listing=request.getParameter("ListingComiissionFixedAmount");
				   
				   String Selling=request.getParameter("SellingComiissionFixedAmount");
				   
				   double ListCommission;
				   
				   double SellCommission;
				   
				   double newInvoiceBalance=0.00;
				   
	
					  
				   if(Listing==null) {  ListCommission=(Double.parseDouble(PropertyListingComission)*Double.parseDouble(ProPertyListingPrice))/100;  }else { ListCommission=Double.parseDouble(PropertyListingComission);}
				   
				   if(Selling==null) {  SellCommission=(Double.parseDouble(PropertySellingComission)*Float.parseFloat(ProPertyListingPrice))/100;  }else { SellCommission=Double.parseDouble(PropertySellingComission);}
				   
				   if (PropertyListingType.equals("Buyer-Side") || PropertyListingType .equals("Tenant-Side") || PropertyListingType.equals("BuyerSide-Self-Represented-Vendor") || PropertyListingType .equals( "TenantSide-Self-Represented-Landlord") ) {
					   
					   TotalCommissions=  SellCommission; 
					   
				   }else    { 	TotalCommissions=  SellCommission+ListCommission; }
				   
				   double newInvoiceHST=(Double.parseDouble(HST.replace("%",""))*TotalCommissions)/100;
				   
				   
					  if( TotalDeposits > TotalCommissions ) { newInvoiceType="STATMENT";      newInvoiceBalance= TotalDeposits- (TotalCommissions+newInvoiceHST);     }
					  
					  else if( TotalDeposits<TotalCommissions ) { newInvoiceType="INVOICE"; newInvoiceBalance=(TotalCommissions+newInvoiceHST)-TotalDeposits; }
					  
					  else {  newInvoiceType="INVOICE";  newInvoiceBalance=(TotalCommissions+newInvoiceHST)-TotalDeposits;}
				   

				   
				  // if(request.getParameter("hiddeninvoiceCommission")==null || request.getParameter("hiddeninvoiceCommission")=="" || request.getParameter("hiddeninvoiceCommission").isEmpty()) {}

					  
					  
					  System.out.println("TotalCommissions"+TotalCommissions);
					  
					  System.out.println("HST"+Double.parseDouble(HST.replace("%","")));
					  
					  System.out.println("newInvoiceHST"+" "+newInvoiceHST);
					  
					  System.out.println("newInvoiceBalance"+" "+newInvoiceBalance);
					  
					  //System.out.println();
	    		  
				   Invoice UpdateInvoice=new Invoice( 
						   MyInvoice.ID,
						   Brokerid,
						   TransactionID,
						   newInvoiceSendStatus,	
						   newInvoiceType,
						   MyInvoice.Date,
						   newInvoiceRecieverFirstName,
						   newInvoiceRecieverLastName,
						   newInvoiceRecieverEmail,
						   newInvoiceUnit,
						   newInvoiceStreetName,
						   newInvoiceStreetNumber,
						   newInvoiceCity,
						   newInvoiceProvince,
						   newInvoicePostalCode,
						   newInvoiceCountry,
						   newInvoiceSalesPrice,
						   String.format("%.2f",TotalCommissions),	
						   String.format("%.2f", newInvoiceHST),	
						   String.format("%.2f",TotalDeposits),
						   String.format("%.2f",newInvoiceBalance),	
						   newInvoiceClosingDate,
						   newParty1,newParty2);
	    		  
	    		  
	    		  
	    		  RDS.UpdateInvoice( UpdateInvoice ,con); }
	    	  
	    	  
//********************* Referral Fee  *********************//
	    	  
 		     Referral MyReferral=new Referral();

 		     MyReferral=RDS.SearchReferral(TransactionID , Brokerid ,con);
	    	  
	    	  if(  MyReferral.ID==0) {

	    		         if( ReferralFee!=null ) {

		 				       RDS.NEWReferral( ReferalCondition1 , ReferalCondition2, ReferralFeeAmount,ReferralAgent1Percentage,ReferralAgent2Percentage, ReferralAgentFirstName, ReferralAgentLastName,ReferralBrokerage,
		 				       ReferralPhone,ReferralExtraContact,ReferralExtraContactNumber,ReferralStreetName,ReferralStreetNumber,ReferralUnit,ReferralCity,ReferralMainProvince,ReferralPostalCode,ReferralCountry,ReferralEmail,ReferralHSTNumber1,ReferralHSTNumber2,TransactionID , Brokerid ,con); }
	    	  
	    		           else { }  
	    		
	    		
	    	  }else { 
	    		  
	    	          if( ReferralFee!=null ) {
	    	    	   
	    		              RDS.UpdateReferral( ReferalCondition1 , ReferalCondition2, ReferralFeeAmount,ReferralAgent1Percentage,ReferralAgent2Percentage, ReferralAgentFirstName, ReferralAgentLastName,ReferralBrokerage,
	            		 
			                  ReferralPhone,ReferralExtraContact,ReferralExtraContactNumber,ReferralStreetName,ReferralStreetNumber,ReferralUnit,ReferralCity,ReferralMainProvince,ReferralPostalCode,ReferralCountry,ReferralEmail,ReferralHSTNumber1,ReferralHSTNumber2,TransactionID , MyReferral.ID, Brokerid ,con ); }
	    	       
	    	           else {  RDS.DeleteReferral(  Brokerid ,  MyReferral.ID ,  TransactionID ,con); }
	    	       
	    	       
                    }

	
	    	  
//********************* Rebate  *********************//    	  
	    	  
	    	  
	         Rebate MyRebate=new Rebate();

	    	 MyRebate=RDS.SearchRebates( TransactionID , Brokerid,con );
	    	  
	    	  if(  MyRebate.ID==0  ) {

	    		       if( Rebate!=null) {
 
			                 RDS.NEWRebate(RebateCondition1, RebateCondition2, RebateAmount1 , RebateCustomer1 , RebateAmount2 , RebateCustomer2 , RebateAmount3 , RebateCustomer3 , RebateAmount4, RebateCustomer4 ,TotalRebates,RebateAgent1Percentage,RebateAgent2Percentage, TransactionID, Brokerid ,con);  }
	    		
	    	         	else { }
	    		      
	    	  }else { 
	    		  
	    		  if( Rebate!=null) {
	    			  
	    		     RDS.UpdateRebate(RebateCondition1, RebateCondition2, RebateAmount1 , RebateCustomer1 , RebateAmount2 , RebateCustomer2 , RebateAmount3 , RebateCustomer3 , RebateAmount4, RebateCustomer4 ,TotalRebates,RebateAgent1Percentage,RebateAgent2Percentage, TransactionID,MyRebate.ID , Brokerid, con);  }
	    		  
	    		  else{  RDS.DeleteRebate(   Brokerid , MyRebate.ID , TransactionID,con ); }
	    		  
	    		  
	    	  } //End of else MyRebate.ID==0 

	    	  
	    	  if( RebateAmount1.isEmpty() || RebateAmount1==null || RebateAmount1==" ") { RebateAmount1="0.00"; }else { RebateAmount1=request.getParameter("FirstRebateAmount"); }
	    	  
	     	  if( RebateAmount2.isEmpty() || RebateAmount2==null || RebateAmount2==" ") { RebateAmount2="0.00"; }else { RebateAmount2=request.getParameter("SecondRebateAmount"); }
	    	  
	     	  if( RebateAmount3.isEmpty() || RebateAmount3==null || RebateAmount3==" ") { RebateAmount3="0.00"; }else { RebateAmount3=request.getParameter("ThirdRebateAmount"); }
	    	  
	     	  if( RebateAmount4.isEmpty() || RebateAmount4==null || RebateAmount4==" ") { RebateAmount4="0.00"; }else { RebateAmount4=request.getParameter("ForthRebateAmount"); }
	    	  
	    	  
	    	  double TotalAmountRebats=Double.parseDouble( RebateAmount1.replace(",","") )+ Double.parseDouble( RebateAmount2.replace(",","") )+Double.parseDouble(  RebateAmount3.replace(",","") )+ Double.parseDouble(RebateAmount4.replace(",","") );
	   //*********************** The following section is to save the documents which users have been uploaded

	   	   
	   //------------------------ Property Picture -------------------------------

	        Part filePart= request.getPart("PropertyImg");
	        
	   	    InputStream fileInputStream = filePart.getInputStream();
	   	    
	            if(  fileInputStream.available()==0    ) {  } //closing of If
	           
	           else {
	   	   
	   	               String fileName =filePart.getSubmittedFileName();

	   	               String FILENAME="Property"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	               S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Property-Picture", fileInputStream, filePart , FILENAME ,s3client);
	   	    
	           } //Closing else	   
	   	   
 //------------------------ Deposits' Documents -------------------------------	   
	   	   
	      Part filePart1= request.getPart("DepositDepositReceipt1Before");

	   	  InputStream fileInputStream1= filePart1.getInputStream();
	   	    
	           if(  fileInputStream1.available()==0  ) {  } //closing of If
	           
	           else {
	   	   
	   	             String fileName1 =filePart1.getSubmittedFileName();

	   	             String FILENAME1="1-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	             S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Deposits", fileInputStream1, filePart1 , FILENAME1 ,s3client);
	   	    
	           } //Closing else
	           
 //-------------------------------------------------------------------------------------------------------------------------------
	           
	      Part filePart2= request.getPart("DepositDepositReceipt2Before");

	   	  InputStream fileInputStream2 = filePart2.getInputStream();
	   	    
	           if(  fileInputStream2.available()==0   ) {  } //closing of If
	           
	           else {
	   	   
	   	               String fileName2 =filePart2.getSubmittedFileName();


	   	               String FILENAME2="2-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	               S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Deposits", fileInputStream2, filePart2 , FILENAME2,s3client );
	   	    
	              } //Closing else
	           
 //-------------------------------------------------------------------------------------------------------------------------------
	           
	       Part filePart3= request.getPart("DepositDepositReceipt3Before");

	   	    InputStream fileInputStream3 = filePart3.getInputStream();
	   	    
	           if(  fileInputStream3.available()==0 ) {  } //closing of If
	           
	           else {
	   	   
	   	                 String fileName3 =filePart3.getSubmittedFileName();

	   	                 String FILENAME3="3-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	                 S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Deposits", fileInputStream3, filePart3 , FILENAME3 ,s3client);
	   	    
	           } //Closing else
	           
//-------------------------------------------------------------------------------------------------------------------------------
	           
	          Part filePart4= request.getPart("DepositDepositReceipt4Before");

	   	      InputStream fileInputStream4 = filePart4.getInputStream();
	   	    
	           if( fileInputStream4.available()==0  ) {    } //closing of If
	           
	           else {
	   	   
	   	               String fileName4 =filePart4.getSubmittedFileName();

	   	               String FILENAME4="4-Deposit"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	               S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Deposits", fileInputStream4, filePart4 , FILENAME4 ,s3client);
	   	    
	              } //Closing else
	   	   
	   //------------------------ Referral Document -------------------------------
	           
	        Part filePart5= request.getPart("ReferralDisclosureDoc");

	   	    InputStream fileInputStream5 = filePart5.getInputStream();
	   	    
	           if(  fileInputStream5.available()==0  ) {   } //closing of If
	           
	           else {
	   	   
	   	             String fileName5 =filePart5.getSubmittedFileName();

	   	             String FILENAME5="Referral-Disclosure"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	             S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Referral-Disclosure-Documents", fileInputStream5, filePart5 , FILENAME5  ,s3client);
	   	    
	           } //Closing else 
	           
	   //------------------------ Rebate Document ----------------------------------    
	           
	          Part filePart6= request.getPart("RebateAgreementDoc");

	   	      InputStream fileInputStream6 = filePart6.getInputStream();

	           if(  fileInputStream6.available()==0 ) {  System.out.println("there is no file to uplaod");  } //closing of If
	           
	           else {
	   	   
	   	              String fileName6 =filePart6.getSubmittedFileName();

	   	              String FILENAME6="Rebate-Agreement"+"-"+String.valueOf(TransactionID)+"-"+String.valueOf(Brokerid);
	   	     
	   	              S3. UploadToS3( TransactionID , "probroker/Mastere/TRS/Rebate-Agreement-Documents", fileInputStream6, filePart6 , FILENAME6 ,s3client );
	   	    
	           } //Closing else*/

	    //------------------------ Commission Details ----------------------------------           
          
		          if( CheckFinalize==1 ) {

		                 
	                              double CapReached=0.00;

	                               System.out.println("ProPertyListingSource"+" "+ProPertyListingSource);
	                               
		                	 
		                	      if (  ProPertyListingSource.equals("Agent-lead") ){ System.out.println("1"); CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(TRSRecordSheetNetFee.replace(",","")); }
		                	 
		                	      else {

		                	    	          System.out.println("2");
		                	    	          
		                		              if( OfficeLeadPercentegeApplyAgainstSelling==1 ) { System.out.println("3"); CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(SellingCommission.replace(",","")); }
	
		                		              else if( OfficeLeadPercentegeAgainstListing==1 ){ System.out.println("4"); CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(ListingCommission.replace(",","")); }
		                		 
		                		              else if( OfficeLeadPercentegeAgainst==1 ){ System.out.println("5"); CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(TRSRecordSheetNetFee.replace(",",""));   }
		                		 
		                		              else { CapReached=Double.parseDouble(myCompany.Temp.replace(",","")); }
 
		                	          }//End of else

		                	      
		                	      

		                	      System.out.println("CapReached"+" "+CapReached);

		                          RDS. UpdateCompanyTemp( String.valueOf(CapReached), Brokerid ,con); 
		                          
		                          CommissionDetails  mycom = RDS.SearchSpesificCommission( TransactionID  , NewDeal.LastCommissionDealID ,con);

		                          System.out.println("mycom.ID"+" "+mycom.ID );
		                    
		                          CommissionDetails  FinalizedCom=new CommissionDetails(
	
		                        		 mycom.ID, PropertyListingType,Propertyunit+"-"+PropertystreetNumber+","+PropertyStreetName+","+PropertyCity+","+PropertyProvince, FinalizedDate,new Timestamp(PropertyClosingDate.getTime()), ProPertyListingPrice,
		       	   					 
		       	   					     TRSRecordSheetAgent1CommissionAmount, SellingCommission, ListingCommission,TotalCommission,TRSRecordSheetAgent1Split, Agent1Portion,   String.valueOf(TotalAmountRebats), 
		       	   					 
		       	   					     Payment2, Payment7,TRSRecordSheetNetFee,"Balance", AddAgaintCap, AddAgaintCapDS, String.valueOf(CapReached), Brokerid,  Brokerid, TransactionID,  Permanant ,"Deal" )  ;      
		                          
		                            RDS. UpdateCommissionDetails( FinalizedCom ,con);

		                          
		    	                     RecordSheet  UpdateRecord=new RecordSheet(
			 			   
		    			                       Record.ID ,  TransactionID ,  RefoundAmount,  RefoundLabel , ListingCommission , SellingCommission , TotalCommission ,

		    			                       Agent1.User_Split,Agent1.User_Split2, Agent1.User_Split3, TRSRecordSheetAgent2Split, Agent2.User_Split2, Agent2.User_Split3 ,  Allocation1  , Allocation2 ,
	 
				 			                   TRSRecordSheetNetFee ,  TRSRecordSheetNetHST , TRSRecordSheetNetTotal ,  HST1 , HST2 , HST3,

				 			                   HST4 ,  HST5, HST6 , HST7, HST8 , HST9 ,HST10, Payment1 , Payment2 ,Payment3, Payment4 ,Payment5, Payment6 ,Payment7, Payment8 , Payment9 , Payment10,  Brokerid ,Agent1.User_Cap, 
				 			                   
				 			                   Agent1.User_Cap2 ,Agent1.User_Cap3, Agent2.User_Cap, Agent2.User_Cap2, Agent2.User_Cap3,CurrentCompanies.CommissionBankNumber,CurrentCompanies.CommissionTransitNumber,
				 			                   
				 			                   CurrentCompanies.CommissionAccountNumber  );
		           
		           
	     	                     RDS.UpdateTradeRecordes( UpdateRecord ,con);  

		          
		               }//End of if CheckFinalize==1 
		          
		              else {    }//End of Else

		          System.out.println("FinalProgressMark"+" "+FinalProgressMark);
		          
		          if( CheckSave==1  ||  Integer. parseInt(FinalProgressMark)>=3  ) {

     	             RecordSheet  UpdateRecord=new RecordSheet(
		 			   
	    			              Record.ID ,  TransactionID ,  RefoundAmount,  RefoundLabel , ListingCommission , SellingCommission , TotalCommission ,

	    			              Agent1.User_Split ,Agent1.User_Split2, Agent1.User_Split3, Agent2.User_Split, Agent2.User_Split2, Agent2.User_Split3 ,  Allocation1  , Allocation2 ,

			 			          TRSRecordSheetNetFee ,  TRSRecordSheetNetHST , TRSRecordSheetNetTotal ,  HST1 , HST2 , HST3,

			 			          HST4 ,  HST5, HST6 , HST7, HST8 ,  HST9, HST10 ,Payment1 ,  Payment2 ,Payment3,

			 			          Payment4 ,Payment5, Payment6 ,Payment7, Payment8 , Payment9, Payment10, Brokerid ,Agent1.User_Cap, Agent1.User_Cap2 ,Agent1.User_Cap3, Agent2.User_Cap, Agent2.User_Cap2, Agent2.User_Cap3,CurrentCompanies.CommissionBankNumber,CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber  );
	           
	           
  	                  RDS.UpdateTradeRecordes( UpdateRecord ,con);  
  	                 
  	                  CommissionDetails  mycom = RDS.SearchSpesificCommission(  TransactionID  ,  NewDeal.LastCommissionDealID ,con);
  	                 
                      CommissionDetails  Com=new CommissionDetails(

                     		    mycom.ID, PropertyListingType, Propertyunit+"-"+PropertystreetNumber+","+PropertyStreetName+","+PropertyCity+","+PropertyProvince, FinalizedDate, new Timestamp( PropertyClosingDate.getTime()), 
			 
			                     ProPertyListingPrice, TRSRecordSheetAgent1CommissionAmount, SellingCommission, ListingCommission,TotalCommission,TRSRecordSheetAgent1Split, Agent1Portion, 
			 
			                     String.valueOf(TotalAmountRebats),  Payment2, Payment7, TRSRecordSheetNetFee, "Balance",  "0", "0", myCompany.Temp,Brokerid,  Brokerid, TransactionID, Permanant,"Deal"	)  ;    
                      
                       System.out.println("Update Commission");
                      
                       RDS. UpdateCommissionDetails( Com ,con);
                      
                       System.out.println("Update Done on Commission ");

		          }else { }
	    		
	    }//Delete else
	   
	   
	    else if( Save14!=null) {

		       String Email1=request.getParameter("emailValueAddressee0");

		       String  Email2=request.getParameter("emailValueoptional0");
		       
		       String Email3=request.getParameter("emailValueoptional1");
		          
		       String Email4=request.getParameter("emailValueoptional2");
				   
		       String Email5=request.getParameter("emailValueoptional3");
			    						   
		       String  Email6=request.getParameter("emailValueoptional4");
			       
		       String Email7=request.getParameter("emailValueoptional5");
			       
		       String Email8=request.getParameter("emailValueoptional6");
			       
		       String Email9=request.getParameter("emailValueoptional7");
			       
		       String Email10=request.getParameter("emailValueoptional8");
			       
		       String Email11=request.getParameter("emailValueoptional9");
			      
		       String  Email12=request.getParameter("emailValueAddressee1");
			       
		       String Email13=request.getParameter("emailValueAddressee2");
			       
		       String Email14=request.getParameter("emailValueAddressee3");
			      
		       String Email15=request.getParameter("emailValueoptional10");

		       
				  String  send1=request.getParameter("Addressee0");
				    
				  String  send2=request.getParameter("optional0");
				    
				  String  send3=request.getParameter("optional1");
				    
				  String  send4=request.getParameter("optional2");
				    
				  String  send5=request.getParameter("optional3");
				    
				  String  send6=request.getParameter("optional4");
				    
				  String  send7=request.getParameter("optional5");
				  
				  String  send8=request.getParameter("optional6");
				  
				  String  send9=request.getParameter("optional7");
				  
				  String  send10=request.getParameter("optional8");
				  
				  String  send11=request.getParameter("optional9");
		       
		       
		       

		       
		       
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		       
		       


		       
			  // HttpSession Existingsession = request.getSession();
			   
			   String MyEmail=(String) Existingsession.getAttribute("Email");

			   String SendmeACopy=request.getParameter("Secondary7");
			   
			   
			   String test="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/ManuBarLogo.png";

			    String Subject=request.getParameter("subjectLineEmail");
			    
			    String EmailBody=request.getParameter("messageEmail");

		        String fromEmail = "admin@my.masterre.ca";
		        
		        String password = "Pollock@2021";
		        
		        
		        
		        try {
		    		   
	                System.out.println("varifying email");

		            Properties pr = new Properties();

	                pr.put("mail.smtp.host", "mocha6007.mochahost.com");
	                
	                pr.put("mail.smtp.port", "2525");
	            
	                pr.put("mail.smtp.auth", "true");
	                
	                pr.setProperty("mail.smtp.starttls.enable","true");
		       

		    
		            //get session to authenticate the host email address and password
		            
		            Session session = Session.getInstance(pr, new Authenticator() {
		            	
		                @Override
		                
		              public PasswordAuthentication getPasswordAuthentication() {
		                	
		                	 System.out.println("done");
		                	 
		                    return new PasswordAuthentication(fromEmail, password);
		                    
		             
		                }
		               
		            });
		            
		            
					SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
					 
					String CurrDate = formatter.format(new Date( ));
					
		            String commissionDiv = ""; String Balanceside = ""; String PaymentTo = ""; String Vendors = ""; String Purchasers = ""; String PropertyAdd = ""; String recParty = "";
					if(!(Propertyunit.isEmpty())){
						PropertyAdd += Propertyunit+"-";
					}
					PropertyAdd += PropertystreetNumber+", "+ PropertyStreetName+", "+PropertyCity+", "+PropertyProvince+", "+PropertyPostalCode;
					
					Vendors = VendorOfficer1+ VendorFirstName1+" "+VendorLastName1;

					if(!(VendorBusinessName2.isEmpty())){
						Vendors += ", " + VendorBusinessName2;
					}else if(!(VendorFirstName2.isEmpty())){
						Vendors += ", " + VendorFirstName2+" "+VendorLastName2;
					}
					if(!(VendorBusinessName3.isEmpty())){
						Vendors += ", "+  VendorBusinessName3;
					}else if(!(VendorFirstName3.isEmpty())){
						Vendors += ", "+VendorFirstName3+" "+VendorLastName3;
					}
					if(!(VendorBusinessName4.isEmpty())){
						Vendors += ", "+  VendorBusinessName4;
					}else if(!(VendorFirstName4.isEmpty())){
						Vendors += ", "+ VendorFirstName4+" "+VendorLastName4;
					}

					Purchasers = PurchaserBusinessName1+ PurchaserFirstName1+" "+PurchaserLastName1;
					if(!(PurchaserBusinessName2.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName2;
					}else if(!(PurchaserFirstName2.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName2+" "+PurchaserLastName2;
					}
					if(!(PurchaserBusinessName3.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName3;
					}else if(!(PurchaserFirstName3.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName3+" "+PurchaserLastName3;
					}
					if(!(PurchaserBusinessName4.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName4;
					}else if(!(PurchaserFirstName4.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName4+" "+PurchaserLastName4;
					}
					

					if(PropertyListingType.equals("Tenant-Side") || PropertyListingType.equals("Landlord-Side") || PropertyListingType.equals("Lease-DoubleSided") || PropertyListingType.equals("TenantSide-Self-Represented-Landlord")){
						commissionDiv =  "<p style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-left: 14px; padding-bottom: 10px; line-height: 1.4;text-align: center;'>Commission for our services rendered in accordance with the relevant Rental Agreement.</p>\n";
						if((Commissions+HSTInvoice) <= Deposits){
							recParty = "Landlord(s)";
							Balanceside = "Balance due to Landlord:";
						}else{
							Balanceside = "Balance due to Broker:";
						}
					}else{
						commissionDiv =  "<p style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-left: 14px; padding-bottom: 10px; line-height: 1.4;text-align: center;'>Commission for our services rendered in accordance with the relevant Agreement of Purchase and Sale.</p>\n";
						
						if((Commissions+HSTInvoice) <= Deposits){
							Balanceside = "Balance due to Vendor:";
							recParty = "Vendor(s)";
						}else{
							Balanceside = "Balance due to Broker:";
						}
					}

					if((Commissions+HSTInvoice - Deposits)<0){
						PaymentTo = "<div style='padding: 16px; padding-top: 12px; background-color: #eef3f6; width: calc(100% + 14px); height: auto; margin: 20px; margin-left: -14px; line-height: 1.4;  text-align: center;'>\n" + 
		    				"          		<div style='text-align: center;'>\n" + 
		    				"            		<label style='display: inline-block; color: black; margin: 5px; width: auto; height: 17px; margin-left: 0px; margin-bottom: 0px;line-height: 1.4; text-align: center; padding:5px; font-weight: bold;'>A sum of $"+String.format("%.2f", Math.abs(Commissions+HSTInvoice - Deposits)).trim()+ " is owning to the "+recParty+" on closing.</label></div>"+
		    				"          			<p style='display: block; color: black; margin-top: 5px; margin-bottom: 0; text-align: center;'>Please contact our office, if you have any questions.</p>\n" + 
		    				"        	</div>";
					}else{
						PaymentTo = "<div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
		    				"            	<p style='margin-bottom: 0; padding: 13px 16px 8px 16px; '> Please mail a cheque payable to"+" "+CurrentCompanies.BusinessName+" "+" or make an electronic payment to our commission trust account:</p>\n" + 
		    				"\n" + 
		    				"            	<div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 

							"           	 	<div style='width: 100%;'>\n" + 
		    				"           	 	       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Bank:</label>\n" + 
		    				"           	 	       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionBankNumber+"</label>\n" + 
		    				"           	 	</div>\n" + 
							"\n" + 		
							"                   <div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"                          <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Transit:</label>\n" + 	
		    				"                          <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionTransitNumber+"</label>\n" +
		    				"                   </div>\n" + 
		    				"\n" + 
							"                   <div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"                          <label style='font-weight: bold; display: inline-block; width: 100px;  margin: 0;'>Account:</label>\n" + 
		    				"                          <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionAccountNumber+"</label>\n" + 
		    				"                   </div>\n" + 
		    				"          		</div>\n" + 
		    				"        	</div>";
					}
					
		    				
		            MimeBodyPart htmlPart = new MimeBodyPart();
		            
		    		String HTML = "     "
                            + " <div  style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"        <div>\n" +  
		    				"           <div style='position: relative; float: right; right: 1px;'>\n" + 
		    				"             <img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" style='width: 150px; margin-right: 20px;'>\n" + 
		    				"           </div>\n" + 
		    				"\n" + 
		    				"			<div>"+
							"					<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"			</div>"+
		    				"\n" + 
		    				"           <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                  <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+  CurrDate +"</label>\n" + 
		    				"           </div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"        	 	   <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+InvoiceRecieverFirstName+" "+InvoiceRecieverLastName+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%;'>\n" + 
		    				"        	  <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ InvoiceUnit+"-"+InvoiceStreetNumber+" "+InvoiceStreetName+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%;'>\n" + 
		    				"        	  <br><label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+InvoiceCity+", "+InvoiceProvince+", "+InvoicePostalCode+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"           	 	<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Property:</label>\n" + 
		    				"           	 	<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+PropertyAdd +"</label>\n" + 
		    				"         		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"            		<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Vendor(s)&#8282;</label>\n" + 
		    				"         	   		<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ Vendors + "</label>\n" + 
		    				"         	 	</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"            		<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Puchaser(s):</label>\n" + 
		    				"            		<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ Purchasers + "</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"          		  <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Closing:</label>\n" + 
		    				"          		  <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+PropertyClosingDate+"</label>\n" + 	
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"        	</div>\n" + 
							"\n" + 
		    				"\n" + 		commissionDiv+
							"\n" + 
		    				"        	<div style='padding-right: 25px; margin-top: 30px;'>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; width: 100%;'>\n" + 
		    				"           		<label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Price</label>\n" + 
		    				"           		<label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"           		<label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(InvoiceSalesPrice))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"         		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"         		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Commission Payable</label>\n" + 
		    				"         		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"         		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(InvoicecommissionPayable))+"</label>\n" + 
		    				"         		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px; border-bottom: 1px solid lightgrey;'>\n" + 	
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+CurrentCompanies.HSTNumberPart1+" "+"RT"+" "+CurrentCompanies.HSTNumberPart2+")</label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(InvoiceHST))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 		
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Total Commission</label>\n" + 	
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 	
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>" + CanadaVal.format( Commissions+HSTInvoice)+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 	
							"          		<div style='display: flex; width: 100%; margin-top: 16px; border-bottom: 1px solid lightgrey;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Deposit held in trust:</label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(InvoiceDeposit))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 		
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>"+Balanceside+"</b></label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'><b>$</b></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'><b>"+CanadaVal.format(Math.abs(Commissions+HSTInvoice - Deposits))+"</b></label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"        	</div>\n" + 
		    				"\n" + PaymentTo + 
		    				"\n" + 
		    				"\n" + 
		    				"        	<div>\n" + 
		    				"\n" + 
		    				"          		<label style='display: inline-block;margin: 5px 5px 0 0;    height: auto;    color: black;'>Sincerely,</label>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;padding-left: 0;margin: 5px 5px 0 0;  margin-top: 34px;    height: auto;    color: black;''>"+MyInformation.Firstname+" "+MyInformation.Lastname+"</label>\n" + 
		    				"          		<br>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>Broker of Record</label>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.BusinessName+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Phone+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'><a target='_blank' href=\"mailto:"+myCompany.Email+"\">"+myCompany.Email+"</a></label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Unit+"-"+myCompany.StreetNumber+", "+myCompany.StreetName+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.City+", "+myCompany.Province+", " +myCompany.PostalCode+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+"</label>\n" + 
		    				"\n" + 
		    				"      		</div>\n" + 
		    				"         </div>\n" + 
		    				"       </div>\n";	            
		    		
		    		String absoluteFilesystemPath = getServletContext().getRealPath("/");
		    		
		    		System.out.println(absoluteFilesystemPath);

		    		FileOutputStream  fileOutputStream = new FileOutputStream( new File(absoluteFilesystemPath+"Contacts.pdf") );

					HtmlConverter.convertToPdf(HTML, fileOutputStream );

		    	    System.out.println( "PDF Created!" );   
		            
		            
		            

		            System.out.println("start");
		            
		            //set email message details
		            
		            
		            
		            if(send1!=null) {
		            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		            if(send2!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email2));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		            if(send3!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email3));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		            if(send4!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email4));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		            if(send5!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email5));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            if(send6!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email6));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            if(send7!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email7));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		           
		            if(send8!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email8));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            if(send9!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email9));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            if(send10!=null) {
			            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		    		//set to email address or destination email address
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email10));
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
		    		
		    		//set email subject
		            
		            mess.setSubject(Subject);
		            
		            BodyPart messageBodyPart1 = new MimeBodyPart(); 
		            
		            messageBodyPart1.setText(EmailBody);  

			
					//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

		             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		          
		             String filename ="Contacts.pdf"; 
		            
		             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
		            
		             messageBodyPart2.setDataHandler(new DataHandler(source));  
		            
		             messageBodyPart2.setFileName(filename);  

		             Multipart multipart = new MimeMultipart();  
		            
		            multipart.addBodyPart(messageBodyPart1); 
		            
		            //multipart.addBodyPart(htmlPart); 
		               
		              multipart.addBodyPart(messageBodyPart2);  
		          
		            //6) set the multiplart object to the message object 
		            
		             mess.setContent(multipart );  
		             
		            //7) send message  
		            
		            Transport.send(mess);  }
		            
		            
		            if(send11!=null) {
			            
			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			    		//set to email address or destination email address
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
			    		
			    		//set email subject
			            
			            mess.setSubject(Subject);
			            
			            BodyPart messageBodyPart1 = new MimeBodyPart(); 
			            
			            messageBodyPart1.setText(EmailBody);  

				
						//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

			             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
			          
			             String filename ="Contacts.pdf"; 
			            
			             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
			            
			             messageBodyPart2.setDataHandler(new DataHandler(source));  
			            
			             messageBodyPart2.setFileName(filename);  

			             Multipart multipart = new MimeMultipart();  
			            
			            multipart.addBodyPart(messageBodyPart1); 
			            
			            //multipart.addBodyPart(htmlPart); 
			               
			              multipart.addBodyPart(messageBodyPart2);  
			          
			            //6) set the multiplart object to the message object 
			            
			             mess.setContent(multipart );  
			             
			            //7) send message  
			            
			            Transport.send(mess);  }
		            
		            if(SendmeACopy!=null) {

			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			    		//set to email address or destination email address
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(MyEmail));
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress("Negarnajafi90.nn@gmail.com"));
			    		
			    		//set email subject
			            
			            mess.setSubject(Subject);
			            
			            BodyPart messageBodyPart1 = new MimeBodyPart(); 
			            
			            messageBodyPart1.setText(EmailBody);  

				
						//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

			             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
			          
			             String filename ="Contacts.pdf"; 
			            
			             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
			            
			             messageBodyPart2.setDataHandler(new DataHandler(source));  
			            
			             messageBodyPart2.setFileName(filename);  

			             Multipart multipart = new MimeMultipart();  
			            
			            multipart.addBodyPart(messageBodyPart1); 
			            
			            //multipart.addBodyPart(htmlPart); 
			               
			              multipart.addBodyPart(messageBodyPart2);  
			          
			            //6) set the multiplart object to the message object 
			            
			             mess.setContent(multipart );  
			             
			            //7) send message  
			            
			            Transport.send(mess);  
		            	
		            	
		            }
		            
		       } 
		            
		        
		            
	
		    	   
		    	  catch (Exception e) {  e.printStackTrace();    }

	    } // End of Save14!=null
	 



	    else { /* ****** Do nothing ****** */ }


	 } //Big else     

	   
//*********************************************************************************************************************************************************************
        
		
	 response.sendRedirect("BrokerFiles/Dashboard.jsp"); 
	       
	    }

}