 package FULLBackendPart;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

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

import ProMasterClasses.AuditTrail;
import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Companies;
import ProMasterClasses.ExtraDocuments;
import ProMasterClasses.Invoice;
import ProMasterClasses.Parties;
import ProMasterClasses.RecordSheet;
import ProMasterClasses.Transaction;
import ProMasterClasses.Users;
import RDS.RDSFunctions;
import S3.ConnectionToS3;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

 
import java.util.Date;

import com.amazonaws.services.s3.AmazonS3;

import com.itextpdf.commons.exceptions.ITextException;

import com.itextpdf.html2pdf.HtmlConverter;

import com.itextpdf.styledxmlparser.IXmlParser;

import com.itextpdf.io.source.OutputStream;

import  com.itextpdf.layout.Document;

import com.itextpdf.io.font.FontCacheKey;

import com.itextpdf.svg.processors.ISvgConverterProperties;





/**
 * Servlet implementation class Appraisal
 */


@WebServlet(
		
        name = "Appraisal"

		
		)

@MultipartConfig

public class Appraisal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Appraisal() {
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
		
		
		
		
//****************************************************************************************************************************************************************************************************************************************************************		
		
		System.out.println("TESTTTTTTTTT");
		
		//In this section the system checks if the user is finalizing the deal or just saving it and wants to complete it again . Because if they are not finalizing a deal then there is no new contact in their contact list
		
		//We check which buttons they have pressed to come in this stage

	    String Finilize= request.getParameter("Finalized");
	
	    String Save=request.getParameter("SaveExit");	
	    
	    String Delete=request.getParameter("Delete");
	    
	    String TransactionSave=request.getParameter("TransactionSave");
	  
	    String ClientSave=request.getParameter("ClientSave");
	    
	    String OwnerSave=request.getParameter("OwnerSave");
	    
	    String InvoiceSave=request.getParameter("InvoiceSave");
	    
	    String ApprasialRecordSheetSave=request.getParameter("ApprasialRecordSheetSave");
	    
	    String SendEmailInvoice=request.getParameter("SendEmailInvoice");

	    //String deleteExtradoc=request.getParameter("deleteExtradoc");
	    
	    String DocumentsSave=request.getParameter("DocumentsSave");
	    
	    String reopenDeal=request.getParameter("reopenDeal");
	    
	    String Savedoc=request.getParameter("documentSubmitbtn");
	    
	    String Savenote=request.getParameter("savenote");

	    String Permanant="";

	    String AddAgaintCap="";
	    
	    String AddAgaintCapDS="";
	    
	    int CheckFinalize=0;
	    
	    int CheckSave=0;
	    
	    String FinalProgressMark="0";

	    if( Finilize!=null  ) {  System.out.println("Finilized"); Permanant="1"; CheckFinalize=1; CheckSave=0;}  
	    
	    else if(  Save!=null )   {  System.out.println("save");     Permanant="0"; CheckFinalize=0; CheckSave=0 ;}
	    
	    else if(  Delete!=null )   {  System.out.println("Delete");     Permanant="0";  CheckFinalize=0; CheckSave=0; }
	    
	    else if(  TransactionSave !=null ) { System.out.println("TransactionSave"); Permanant="0";  CheckFinalize=0; CheckSave=0; }
	    
	    else if(  ClientSave !=null ) { System.out.println("ClientSave"); Permanant="0"; CheckFinalize=0; CheckSave=0; }
	    
	    else if(  OwnerSave !=null ) { System.out.println("OwnerSave"); Permanant="0"; CheckFinalize=0; CheckSave=0;}
	    
	    else if(  InvoiceSave !=null ) { System.out.println("InvoiceSave"); Permanant="0"; CheckFinalize=0; CheckSave=0; CheckSave=0; }
	    
	    else if(  ApprasialRecordSheetSave !=null ) { System.out.println("ApprasialRecordSheetSave"); Permanant="0"; CheckFinalize=0;  CheckSave=1; }

	    else if(  SendEmailInvoice !=null ) { System.out.println(" SendEmailInvoice"); Permanant="0"; CheckFinalize=0; CheckSave=0; }
	    
	    else if(  reopenDeal !=null ) { System.out.println("reopenDeal"); Permanant="0"; CheckFinalize=0; CheckSave=0; }
	    
	    else if(  Savedoc !=null ) { System.out.println("Savedoc"); Permanant="0"; CheckFinalize=0; CheckSave=0; }

	    else {   System.out.println("else");   }
	    
	    System.out.println("Permanant print"+" "+Permanant);
		RDSFunctions RDS= new RDSFunctions();
		
		 //Getting the current Broker and the user Type(if it is Broker , Agent or Admin )

            HttpSession Existingsession = request.getSession();

	        int Brokerid=(int) Existingsession.getAttribute("Brokerid");
	      
	        int UserID=(int) Existingsession.getAttribute("Userid");

	        int Author= (int) Existingsession.getAttribute("Userid");
	      
	        String Type=(String) Existingsession.getAttribute("Type");

            int  AuthorType= Integer.parseInt(Type);
           
            int TransactionID=(int) Existingsession.getAttribute("TransactionID");
            
            Connection con=(Connection) Existingsession.getAttribute("Connection");
		    
            AmazonS3 s3client=(AmazonS3) Existingsession.getAttribute("S3");
            
		    System.out.println("The TransID"+" "+TransactionID);
		    
		    Transaction NewDeal=new Transaction();

		    NewDeal= RDS.GetTransactionsbyID( TransactionID , Brokerid ,con);
		        
		    System.out.println( "This is the deal ID"+NewDeal.id );
		    
		    Companies myCompany=RDS.GetaCompanyBuyBrokerID(Brokerid,con);
				   
		 	Users MyInformation=new Users();
				 
		 	MyInformation=RDS.GetAnyUserById(Brokerid,con); //Getting the current company information for a specific broker

			Companies CurrentCompanies=new Companies();
			 
			CurrentCompanies=RDS.GetaCompanyBuyBrokerID(Brokerid,con);
			
			ConnectionToS3 S3= new ConnectionToS3();
		
		
		
   if(reopenDeal!=null) {
	    	
	    	
		 RDS.ReopenTransaction( Brokerid , TransactionID ,"0" ,"Reopened",con)  ; 	

		 CommissionDetails newcom=RDS.SearchSpesificCommission( Brokerid , NewDeal.LastCommissionDealID ,con);
	   	     
	   	 double Cap=0.00;
	   	     
	   	     if( Double.parseDouble(myCompany.Temp)>= Double.parseDouble(newcom.SplitWithBroker) ) {

	   	         Cap=Double.parseDouble(myCompany.Temp)-Double.parseDouble(newcom.SplitWithBroker);
	   	     
	   	     }else {Cap=0.00;}
	   	     
	   	     newcom.TradeID=TransactionID;
	   	     
	   	     newcom.BrokerID=Brokerid;
	   	  
	   	     newcom.AgentId=Brokerid;
	   	     
	   	     newcom.Status="Delete";

	    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	    	 
	         Date date = new Date( ); 
	    	 
		     String Date=formatter.format(date); 
		     
	         RDS. UpdateCompanyTemp( String.valueOf(Cap), Brokerid ,con); 
	 
	   	     newcom.Date=new Timestamp(date.getTime());
	   	     
	   	     newcom.CapReached=String.valueOf(Cap);
	   	     
	   	     RDS.AddCommissionDetails( newcom ,con) ;
	    
	   	     newcom.Finalized="1";

	   	     newcom.CapReached=String.valueOf(Cap);

	   	     newcom.Status="Deal";

	   	     int LastCommissionID= RDS.AddCommissionDetails(newcom,con) ; //Creating the new Row of data 
	   	       
	   	     RDS.UpdateDealCommision(     Brokerid ,   TransactionID , LastCommissionID ,con); //Updating the last Deal number where the type is deal (which means the deal hasent been deleted)
	   	       
	   	     RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID

   
   } // End of if reopenDeal!=null
   
   else if( Savedoc!=null) {
   	
 	          String ExtraDocumentName = request.getParameter("FileName"); 

	   	      System.out.println("EXtraDocumentName1"+" "+ExtraDocumentName);
	   	      
	   	      Part filePart7= request.getPart("FileName0");
	   	     
	          if(ExtraDocumentName.isEmpty() ) { ExtraDocumentName="OtherExtraDocument" ;}
	   	    
	                

	   	            InputStream fileInputStream7 = filePart7.getInputStream();
	   	    
	           if(  fileInputStream7.available()==0  ) {  System.out.println("there is no file to uplaod");  } //closing of If
	           
	           else {
	   	   
	   	                String fileName7 =filePart7.getSubmittedFileName();

	   	                System.out.println("Name"+"   "+fileName7);

	   	                String FILENAME7=ExtraDocumentName+"%"+String.valueOf(TransactionID)+"%"+String.valueOf(Brokerid);
	   	     
	   	                S3. UploadToS3( TransactionID , "probroker/Mastere/Other/ExtraDocuments", fileInputStream7, filePart7 , FILENAME7,s3client );
	   	    
	           } //Closing else	
 	
 	
 	
 	
 }
   
   else if( Savenote!=null ) {
	   
		  
	   String ExteraNotes=request.getParameter("allNotesDocuments");
	   
	    System.out.println("ExteraNotes"+" "+ExteraNotes);
        
        
        if ( !ExteraNotes.isEmpty() || ExteraNotes!="" || ExteraNotes!=null ) {
        	
        	
        	
	    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	    	 
	         Date date = new Date( ); 

        	
        	AuditTrail auditRecord=new AuditTrail(
        			
        			
       			 0,  TransactionID,  ExteraNotes,  formatter.format(date),  "Note",	  Brokerid ,  UserID ,  MyInformation.Firstname+" "+ MyInformation.Lastname );
        			
        			
        			
        			
        	RDS.AddNewAudit( auditRecord,con); 		
        	
        	
        	
        }
                
	   
	   
   }
		
   else {
//****************************************************************************************************************************************************************************************************************************************************************	
		
    	int OfficeLeadAllocatonAgainst =0; // This variable is to keep track of if the user has requested  Office Lead Allocation Against cap
    	
    	String OfficeLeadAllocatonPercentage="0";
		
//****************************************************************************************************************************************************************************************************************************************************************		
		
		//Getting the Deal Information
		
		String AppraisalDealType = request.getParameter("DealType");
		
		String AppraisalFeeAmount = request.getParameter("AppraisalFee");
		
		String AppraisalSource = request.getParameter("AppraisalSource");
		
		//The system checks if the Deal source is Agent-lead of Office-Lead and sets the variable values 

		
		if( AppraisalSource!=null) {

		        if( AppraisalSource.equals("Agent-lead") ) { OfficeLeadAllocatonPercentage="0";   OfficeLeadAllocatonAgainst=0;    AddAgaintCap="1";    AddAgaintCapDS="0"; } //End of if AppraisalSource.equals("Agent-lead")
		
	 	        else { 

			            OfficeLeadAllocatonPercentage = request.getParameter("OfficeLeadAllocatonPercentage");

			            if(request.getParameter("OfficeLeadAgainstCap")==null) { OfficeLeadAllocatonAgainst=0;   AddAgaintCap="0";    AddAgaintCapDS="0";	} else{  OfficeLeadAllocatonAgainst=1;   AddAgaintCap="1";    AddAgaintCapDS="0"; }

		        }//End if else
		        
		} else { OfficeLeadAllocatonAgainst=0;   OfficeLeadAllocatonPercentage="0";    }
		
		System.out.println( "OfficeLeadAllocatonAgainst" +" "+OfficeLeadAllocatonAgainst );
		
		Date AppraisalCompletetionDate=null;
		try {
			AppraisalCompletetionDate = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US).parse(  request.getParameter("CompletionDate")+" "+"00:00:00");
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String AppraisalPropertyType= request.getParameter("PropertyType");
		
		String AppraisalPropertyUnit = request.getParameter("UnitNumber");
		
		String AppraisalPropertyStreetNumber= request.getParameter("StreetNumber");
		
		String AppraisalPropertyStreetName= request.getParameter("StreetName");
		
		String AppraisalPropertyCity= request.getParameter("City");
		
		String AppraisalPropertyPostalCode= request.getParameter("PostalCode");
		
		String AppraisalPropertyProvince= request.getParameter("PropertyProvince");
		
		String AppraisalPropertyOtherProvince= request.getParameter("PropertyOtherProvince");
		
		String AppraisalPropertyCountry= request.getParameter("Country");

		String ServiceDescription=request.getParameter("ServiceDescription");
		
		System.out.println("this is Description"+ServiceDescription);
		
		String MainProvince="";
		
		if( AppraisalPropertyProvince!=null) {

		      if( AppraisalPropertyProvince.equals("Other") ) { MainProvince=AppraisalPropertyOtherProvince ; } else { MainProvince=AppraisalPropertyProvince; }
		
		}else {  MainProvince=""; }

		System.out.println("MainProvince"+""+MainProvince);

        Timestamp PropertyListingDate=null;
   	    
        Timestamp PropertyClosingDate=null;
	    
        Timestamp PropertyExpireDate=null;

        Timestamp OfferDate=null;
	    
        Timestamp OfferExpiretionDate=null;
	    
        Timestamp OfferAcceptanceDate=null;
	    
        Timestamp ConditionExpirationDate=null;
	    
        Timestamp ConditionCompletationDate=null;
	    
        Timestamp OfferWithrawalDate=null;
	    
        Timestamp InspectionDate=null;
	    
        Timestamp AccupancyDate=null;
	    
        Timestamp OffMarketDate=null;
	    
        String ReferralFeeNote=null;
	    
	    String ProgressMark=request.getParameter("progressMarks");
	    
	    Timestamp  CreateDate=null;
	    
	    Timestamp  FinalizedDate=null;
	    
//****************************************************************************************************************************************************************************************************************************************************************
		
		//Getting the agent's IDs 
		
		int FirstAgentID=0;
		
		int SecondAgentID=0;
		
	    String AppraisalFirstAgentName= request.getParameter("FirstAgentID");
	    
	    System.out.println( "AgentName"+" "+ AppraisalFirstAgentName ) ;
	    	    
	    if( AppraisalFirstAgentName==null || AppraisalFirstAgentName.equals("") || AppraisalFirstAgentName.isEmpty() ) { FirstAgentID=0; }

	    else {  String Agent1= AppraisalFirstAgentName.replaceAll("[^0-9]", "");  FirstAgentID=Integer.parseInt(Agent1);  }

	    System.out.println( " First Agent ID"+" "+ FirstAgentID ) ;

	    String AppraisalsecondAgentName= request.getParameter("SecondAgentID");
	    
	    String AddAgent= request.getParameter("AddSecondAgentCheckBox");
	    
	   if( AddAgent!=null) {
	    
	        if( AppraisalsecondAgentName==null || AppraisalsecondAgentName.equals("") ||  AppraisalsecondAgentName.isEmpty() ) {  SecondAgentID=0;  AppraisalsecondAgentName="0";  }
	        
	        else { String Agent2= AppraisalsecondAgentName.replaceAll("[^0-9]", "");  SecondAgentID=Integer.parseInt(Agent2); }
	        
	   } else {  SecondAgentID=0;    }
	    
	    
	    System.out.println( " Second  Agent ID"+" "+ SecondAgentID ) ;
	    
	    
	 	/*Users Agent1=new Users();
		 
	 	Agent1=RDS.GetAnyUserById(FirstAgentID); //Getting the current company information for a specific broker
	 	
	 	
	 	Users Agent2=new Users();
		 
	 	Agent2=RDS.GetAnyUserById(SecondAgentID); //Getting the current company information for a specific broker*/
	    
//****************************************************************************************************************************************************************************************************************************************************************	    
	    

		String AppraisalFirstAgentCommissionPercentage= request.getParameter("FirstAgentCommissionPercentage");
		
		String AppraisalSecondAgentCommissionPercentage= request.getParameter("SecondAgentCommissionPercentage");
		
		
//****************************************************************************************************************************************************************************************************************************************************************		
		
        //Getting the Clients Information
		
        String AppraisalClientType1 = request.getParameter("ClientType1");
		
		String AppraisalClientBusinessName1 = request.getParameter("ClientBusinessName1");
		
		String AppraisalClientSigningOfficer1 = request.getParameter("ClientSigningOfficere1");
		
		String AppraisalClientFirstName1= request.getParameter("ClientFirstName1");
		
		String AppraisalClientLastName1 = request.getParameter("ClientLastName1");

		String AppraisalClientUnit1 = request.getParameter("ClientUnitNumber1");
		
		String AppraisalClientStreetNumber1= request.getParameter("ClientStreetNumber1");
		
		String AppraisalClientStreetName1= request.getParameter("ClientStreetName1");
		
		String AppraisalClientCity1= request.getParameter("ClientCity1");
		
		String AppraisalClientPostalCode1= request.getParameter("ClientPostalCode1");
		
		String AppraisalClientProvince1= request.getParameter("ClientProvince1");
		
		String AppraisalClientCountry1= request.getParameter("ClientCountry1");
		
		String AppraisalClientEmail1= request.getParameter("ClientEmail1");
		
	    String AppraisalClientPhone1= request.getParameter("ClientPhone1");
		
	    String AppraisalClientExtraContact1= request.getParameter("ClientExteraContactInformationLabel1");
	    
	    String AppraisalClientExtraContactNumber1= request.getParameter("ClientExteraContact1");

	    String AppraisalClientOtherProvince1= request.getParameter("ClientOtherProvince1");
	    
	    String AppraisalClientPowerofattorney1= request.getParameter(" ");
	    
	    String MainClinetProvince1="";
	    
	    if( AppraisalClientProvince1 !=null) {

	             if( AppraisalClientProvince1.equals("Other") ) {  MainClinetProvince1=AppraisalClientOtherProvince1;  }
	             
	             else {  MainClinetProvince1=AppraisalClientProvince1;   }
	    
	    }else {  MainClinetProvince1=""; }

	    //----------------------------------------------------------------------------------------------------

	    String AppraisalClientType2 = request.getParameter("ClientType2");
		
	    String AppraisalClientBusinessName2 = request.getParameter("ClientBusinessName2");
	  		
	    String AppraisalClientSigningOfficer2= request.getParameter("ClientSigningOfficere2");
	  		
	    String AppraisalClientFirstName2= request.getParameter("ClientFirstName2");
	   		
	    String AppraisalClientLastName2 = request.getParameter("ClientLastName2");

	    String AppraisalClientUnit2 = request.getParameter("ClientUnitNumber2");
	  		
	    String AppraisalClientStreetNumber2= request.getParameter("ClientStreetNumber2");
	  		
	    String AppraisalClientStreetName2= request.getParameter("ClientStreetName2");
	  		
	    String AppraisalClientCity2= request.getParameter("ClientCity2");
	  		
	    String AppraisalClientPostalCode2= request.getParameter("ClientPostalCode2");
	  		
	    String AppraisalClientProvince2= request.getParameter("ClientProvince2");
	   		
	    String AppraisalClientCountry2= request.getParameter("ClientCountry2");
	  		
	    String AppraisalClientEmail2= request.getParameter("ClientEmail2");
	  		
	    String AppraisalClientPhone2= request.getParameter("ClientPhone2");
	  		
	    String AppraisalClientExtraContact2= request.getParameter("ClientExteraContactInformationLabel2");
	  	    
	    String AppraisalClientExtraContactNumber2= request.getParameter("ClientExteraContact2");
	    
	    String AppraisalClientOtherProvince2= request.getParameter("ClientOtherProvince2");
	    
	    String AppraisalClientPowerofattorney2= request.getParameter(" ");
	    
	    String MainClinetProvince2="";
	    
	    if( AppraisalClientProvince2!=null ) {

	          if( AppraisalClientProvince2.equals("Other") ) {  MainClinetProvince2=AppraisalClientOtherProvince2;  }
	       
	          else {  MainClinetProvince2=AppraisalClientProvince2;   }
	         
	    }else {  MainClinetProvince2="";  }
	    

//****************************************************************************************************************************************************************************************************************************************************************	    
	   
	   //Getting the Owner Information
			
	   String AppraisalOwnerType1 = request.getParameter("OwnerType1");
			
	   String AppraisalOwnerBusinessName1 = request.getParameter("OwnerBusinessName1");
			
	   String AppraisalOwnerSigningOfficer1 = request.getParameter("OwnerSigningOfficere1");
			
	   String AppraisalOwnerFirstName1= request.getParameter("OwnerFirstName1");
			
	   String AppraisalOwnerLastName1 = request.getParameter("OwnerLastName1");

	   String AppraisalOwnerUnit1 = request.getParameter("OwnerUnitNumber1");
			
	   String AppraisalOwnerStreetNumber1= request.getParameter("OwnerStreetNumber1");
			
	   String AppraisalOwnerStreetName1= request.getParameter("OwnerStreetName1");
			
	   String AppraisalOwnerCity1= request.getParameter("OwnerCity1");
			
	   String AppraisalOwnerPostalCode1= request.getParameter("OwnerPostalCode1");
			
	   String AppraisalOwnerProvince1= request.getParameter("OwnerProvince1");
			
	   String AppraisalOwnerCountry1= request.getParameter("OwnerCountry1");
			
	   String AppraisalOwnerEmail1= request.getParameter("OwnerEmail1");
			
	   String AppraisalOwnerPhone1= request.getParameter("OwnerPhone1");
			
	   String AppraisalOwnerExtraContact1= request.getParameter("OwnerExteraContactInformationLabel1");
		    
	   String AppraisalOwnerExtraContactNumber1= request.getParameter("OwnerExteraContact1");

	   String AppraisalOwnerOtherProvince1= request.getParameter("OwnerOtherProvince1");
	   
	    String AppraisalOwnerowerofattorney1= request.getParameter(" ");
	   
	    String MainOwnerProvince1="";
	    
	    if(AppraisalOwnerProvince1 !=null) {

	           if( AppraisalOwnerProvince1.equals("Other") ) {  MainOwnerProvince1=AppraisalOwnerOtherProvince1;  }
	    
	           else { MainOwnerProvince1=AppraisalOwnerProvince1;   }
	   
	    }else { MainOwnerProvince1="";  }
	   //----------------------------------------------------------------------------------------------------

	   String AppraisalOwnerType2 = request.getParameter("OwnerType2");
			
	   String AppraisalOwnerBusinessName2 = request.getParameter("OwnerBusinessName2");
		  		
	   String AppraisalOwnerSigningOfficer2= request.getParameter("OwnerSigningOfficere2");
		  		
       String AppraisalOwnerFirstName2= request.getParameter("OwnerFirstName2");
		  		
	   String AppraisalOwnerLastName2 = request.getParameter("OwnerLastName2");

	   String AppraisalOwnerUnit2 = request.getParameter("OwnerUnitNumber2");
		  		
	   String AppraisalOwnerStreetNumber2= request.getParameter("OwnerStreetNumber2");
		  		
	   String AppraisalOwnerStreetName2= request.getParameter("OwnerStreetName2");
		  		
	   String AppraisalOwnerCity2= request.getParameter("OwnerCity2");
		  		
	   String AppraisalOwnerPostalCode2= request.getParameter("OwnerPostalCode2");
		  		
	   String AppraisalOwnerProvince2= request.getParameter("OwnerProvince2");
		  		
	   String AppraisalOwnerCountry2= request.getParameter("OwnerCountry2");
		  		
	   String AppraisalOwnerEmail2= request.getParameter("OwnerEmail2");
		  		
	   String AppraisalOwnerPhone2= request.getParameter("OwnerPhone2");
		  		
	   String AppraisalOwnerExtraContact2= request.getParameter("OwnerExteraContactInformationLabel2");
		  	    
	   String AppraisalOwnerExtraContactNumber2= request.getParameter("OwnerExteraContact2");

	   String AppraisalOwnerOtherProvince2= request.getParameter("OwnerOtherProvince2");
	   
	    String AppraisalOwnerowerofattorney2= request.getParameter(" ");
	   
	    String MainOwnerProvince2="";
	    
	    if(AppraisalOwnerProvince2!=null) {

	               if( AppraisalOwnerProvince2.equals("Other") ) {  MainOwnerProvince2=AppraisalOwnerOtherProvince2;  }
	    
	               else { MainOwnerProvince2=AppraisalOwnerProvince2;   }
	    
	    }else { MainOwnerProvince2=""; }
	   
	 //****************************************************************************************************************************************************************************************************************************************************************	   
	   
	   //Getting the AppraisalInvoice Information
	  
	   String AppraisalInvoiceReciverFirtsName="";
	   
	   String AppraisalInvoiceReciverLastName="";

	   String AppraisalInvoiceUnit =AppraisalOwnerUnit1;

	   String AppraisalInvoiceStreetNumber=AppraisalOwnerStreetNumber1;
			
	   String AppraisalInvoiceStreetName=AppraisalOwnerStreetName1;
			
	   String AppraisalInvoiceCity=AppraisalOwnerCity1;
			
	   String AppraisalInvoicePostalCode=AppraisalOwnerPostalCode1;
			
	   String AppraisalInvoiceProvince=AppraisalOwnerProvince1;
			
	   String AppraisalInvoiceCountry= AppraisalOwnerCountry1;
	   
	   String InvoiceSendStatus="0";
	   
	   if( AppraisalClientBusinessName1.isEmpty() || AppraisalClientBusinessName1==null) {
		   
			AppraisalInvoiceReciverFirtsName =AppraisalClientFirstName1;
				   
			AppraisalInvoiceReciverLastName	= AppraisalClientLastName1;  
		   
	   }else {
		   
	    	String s = AppraisalClientSigningOfficer1;
	    	
	    	String[] FullName= s.split("\\s");
	    	
	    	int size=FullName.length;
		   
	    	AppraisalInvoiceReciverFirtsName =FullName[0];

	    	if( size==1 ) { AppraisalInvoiceReciverLastName="";}
				   
	    	else{ AppraisalInvoiceReciverLastName = FullName[1];  }
		   

	     }

	   Timestamp AppraisalInvoiceDate= null;
	   
	   Date theAppraisalInvoiceDate= null;
			   
			   //request.getParameter("HiddenInvoicePropertyReportDate");
	   
	   
	    if(request.getParameter("HiddenInvoicePropertyReportDate").isEmpty()) {
	    	
	    	OfferAcceptanceDate=null;
	    	
	    }else {
	    	
	    	try {
				theAppraisalInvoiceDate=new SimpleDateFormat("dd MMM yyyy HH:mm:ss").parse(request.getParameter("HiddenInvoicePropertyReportDate")+" "+"00:00:00");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	AppraisalInvoiceDate=new Timestamp( theAppraisalInvoiceDate.getTime() ); }

	   String AppraisalInvoiceFee= AppraisalFeeAmount;
	   
	   System.out.println("AppraisalInvoiceFee"+" "+AppraisalInvoiceFee);
	   
	   String AppraisalInvoiceHST= request.getParameter("HiddenPropertyHSTInvoice");
	   
	   String AppraisalInvoiceBalanceAmount= request.getParameter("HiddenBalanceInvoice");
	   

//****************************************************************************************************************************************************************************************************************************************************************	   
	   
	   //Getting the Record Sheet Information

	   String AppraisalRecordSheetGrossFee= request.getParameter("BreakdownGrossFeeAmount");
	   
	   String AppraisalRecordSheetGRossFeeHST= request.getParameter("BreakdownGrossFeeAmountHSTPercent");
	   
	   String AppraisalRecordSheetGrossFeeTotalAmount= request.getParameter("BreakdownGrossFeeTotal");

	   String AppraisalRecordSheetAgent1Split= request.getParameter("BreakdownAgent1Split");
	   
	   String Payment1=AppraisalRecordSheetGrossFee;
	   
	   String Payment2= request.getParameter("BreakdownAgent1Amount");
	   
	   String AppraisalRecordSheetAgent1HST= request.getParameter("BreakdownAgent1HSTPercent");
	   
	   String AppraisalRecordSheetAgent1TotalCommission= request.getParameter("BreakdownAgent1Total");

	   String AppraisalRecordSheetAgent2Split= request.getParameter("BreakdownAgent2Split");
	   
	   String Payment3= request.getParameter("BreakdownAgent2Amount");
	   
	   String AppraisalRecordSheetAgent2HST= request.getParameter("BreakdownAgent2HSTPercent");
	   
	   String AppraisalRecordSheetAgent2TotalCommission= request.getParameter("BreakdownAgent2Total");
	   
	   String AppraisalRecordSheetNetFee= request.getParameter("BreakdownNetFee");
	   
	   String AppraisalRecordSheetNetHST= request.getParameter("BreakdownNetHST");
	   
	   String AppraisalRecordSheetNetTotal= request.getParameter("BreakdownNetTotal");
	   
	   
	   Users Agent1=new Users();
	   
	   Agent1=RDS.GetAnyUserById(FirstAgentID,con);
	   
	   Users Agent2=new Users();
	   
	   Agent2=RDS.GetAnyUserById(SecondAgentID,con);
	   
	   String  TRSRecordSheetAgent1Cap=Agent1.User_Cap;
	   
	   String  TRSRecordSheetAgent2Cap=Agent2.User_Cap;

	   String ExteraNotes=request.getParameter("allNotesDocuments");
	   
//****************************************************************************************************************************************************************************************************************************************************************

	    
	    

	      //Here We are checking the type of the user who are creating the deal ,
	      
	      //If it is 1 means , its a broker , so we do not need agents approval automatically the deal is approved by both agents
	      
	      //If it is 2 , it means it is an Agent who is creating the deal.So we have to check if there is second agent to approve before the broker approves .if there is no second agent we need broker approval
	      
	      //If it is 3 ,it means it is an admin who are creating the deal. So we need first agents to approve the deal.
	      
	          String BerokerSign="0";
	      
	          String AgentSign1="0";
	    
	          String AgentSign2="0";
	      
	          String TransactionStatus="";
	      
	         if(Finilize!=null || ApprasialRecordSheetSave !=null ) {
	
	                     if(  AuthorType==1 ) {  BerokerSign="1"; AgentSign1="1"; AgentSign2="1"; TransactionStatus="Complete";  } //End of AuthorType==1

	                      else if( AuthorType==3 ){
	    	  
	    	                      BerokerSign="0" ;  AgentSign1="0";
	    	  
	    	                      if( request.getParameter("AddAgent")==null ) { AgentSign2="1"; }else { AgentSign2="0";  }
	    	  
	    	                      TransactionStatus="Needs First Agent Approval"; } //End of AuthorType==3

	                       else {
	    	  
	    	                      BerokerSign="0" ;
	    	  
	    	                      AgentSign1="1";
	    	  
	    	                      if( request.getParameter("AddAgent")==null ) { AgentSign2="1";  TransactionStatus="Needs Broker Approval";}
	    	  
	    	                      else { AgentSign2="0"; 	TransactionStatus="Needs Second Agent Approval"; }
	  
	    	                   } //End of inner else
	                   
	           } //End of Finilize!=null || ApprasialRecordSheetSave !=null 
	         
	         
	           else {   BerokerSign="0";   AgentSign1="0";  AgentSign2="0";  TransactionStatus="Incomplete"; }
	   
//****************************************************************************************************************************************************************************************************************************************************************

		    //Creating a object of deal information to save to the data base /
	      
		
			
		  
			
		    RecordSheet Record=new RecordSheet();
		      
		        String Province= MainProvince;

		    	String HST="0.00";

		    	if(Province.equals("AB") || Province.equals("BC") || Province.equals("MB")  || Province.equals("NWT") || Province.equals("NU") || Province.equals("QC") || Province.equals("SK") || Province.equals("YT") ){ 

		    		HST="5.00"+"%";  }

		    	else if(Province.equals("ON") ){ HST="13.00"+"%"; }

		    	else if(Province.equals("PE") || Province.equals("NS")  || Province.equals("NB" ) || Province.equals("NL")    ){ HST="15.00"+"%"; }

		        else if(Province.equals("Other") ){  HST="0.00"+"%";  }

		    	
		    	System.out.println("MainProvince"+" "+MainProvince);
		    	
		    	System.out.println("Province"+" "+Province);
		    	
		    	System.out.println("HST"+" "+HST);
		    	
		    	Timestamp theAppraisalCompletetionDate=new Timestamp(AppraisalCompletetionDate.getTime());

		    if( NewDeal.id==0 ) {  
		    	
			     
			     System.out.println("Creating New Deal");
			     
			     System.out.println("Permanant"+" "+Permanant);
			     
		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		    	 //SimpleDateFormat formattertime = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 
		    	 
			     CreateDate=new Timestamp(date.getTime());
			     
			     System.out.println("CreateDate"+" "+CreateDate);

			     
			     if (Permanant=="1" ) {	 FinalizedDate=new Timestamp(date.getTime()); }else { FinalizedDate=null; }

			            NewDeal=new Transaction(
			    		
			    		TransactionID,
			    		
			    		AuthorType,
			    		
			    		Author,
			    		
			    		Brokerid,
			    		
			    		"MLS",
			    		
			    		AppraisalPropertyStreetName,
			    		
			    		AppraisalPropertyStreetNumber,
			    		
			    		AppraisalPropertyUnit,
						
			    		AppraisalPropertyCity,
			    		
			    		MainProvince,
			    		
			    		AppraisalPropertyPostalCode,
			    		
			    		AppraisalPropertyType ,
			    		
			    		FirstAgentID,
			    		
			    		SecondAgentID,
			    		
			    		AppraisalFirstAgentCommissionPercentage, 
						 
			    		AppraisalSecondAgentCommissionPercentage, 
			    		
			    		AppraisalFeeAmount,
			    		
			    		AppraisalSource, 
			    		
			    		AppraisalDealType , 
			    		
			    		PropertyListingDate ,
			    		
			    		theAppraisalCompletetionDate,
			    		
			    		OfferExpiretionDate,
			    		
			    		"0.00",
						 
						"0.00","Status", AgentSign1, AgentSign2, BerokerSign, TransactionStatus, OfficeLeadAllocatonPercentage, OfficeLeadAllocatonAgainst ,
						 
						"0", 0, "0",0,"Note", Permanant, ReferralFeeNote,"Role1", "Role2",ServiceDescription,
						
						 OfferDate,OfferExpiretionDate,OfferAcceptanceDate,ConditionExpirationDate,	ConditionCompletationDate ,OfferWithrawalDate, InspectionDate, AccupancyDate,OffMarketDate,ProgressMark, CreateDate,FinalizedDate,0,0);
		    	
			            System.out.println("Permanant print"+" "+Permanant);
			            
		    	RDS.NEWTransaction( NewDeal ,con);	 

		    	RDS.UpdateCompanyTransaction( TransactionID ,  Brokerid,con) ;

		    	  Record=new RecordSheet(
			 			   
				 			 0 ,  TransactionID ,  "RefoundAmount" ,  "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,
				 			 
				 			 Agent1.User_Split ,Agent1.User_Split2, Agent1.User_Split3, Agent2.User_Split ,Agent2.User_Split2, Agent2.User_Split3, "100.00", "0.00" ,

				 			 AppraisalRecordSheetNetFee ,  AppraisalRecordSheetNetHST , AppraisalRecordSheetNetTotal ,  HST , HST , "0.00",

				 			 "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" ,  "HST9","HST10", "0.00" ,  "0.00" ,"0.00" ,

				 			 "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00", Brokerid , Agent1.User_Cap , Agent1.User_Cap2 , Agent1.User_Cap3 , Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 , CurrentCompanies.CommissionBankNumber , CurrentCompanies.CommissionTransitNumber , CurrentCompanies.CommissionAccountNumber  );
			 	   
			 	   
			 	           RDS.NewTradeRecordes(Record,con);
			 	           
				   	       SimpleDateFormat formatter1 = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

				          // Date Commissondate = new Date( ); 
				    	 
					       String Date=formatter1.format(date); 
			 	            
				 	       CommissionDetails com=new CommissionDetails();

				 	       com.TradeID=TransactionID;
				 	   	 
				 	       com.BrokerID=Brokerid;
				 	   	 
				 	       com. AgentId=Brokerid;
	
				 	       com. Status="Deal";
				 	       
				 	       com. Date=new Timestamp(date.getTime());
				 	       
					 	   com. AddtoCap="0";
					 	      
					 	   com. AddtoCapDS="0";
					 	      
					 	   com. Finalized="0";
				 	      
					 	    int LastCommissionID=RDS.AddCommissionDetails(com,con);
					 	      
					 	    RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID
					 	      
					 	    RDS.UpdateDealCommision( Brokerid , TransactionID , LastCommissionID ,con );


		       } //End of if NewDeal.id==0

		    else {   
		    	
		    	
		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 
		    	
		    	 String NewPermanant="";

		        if ( NewDeal.Permanent.equals("1") ) { NewPermanant="1" ;  } else {  NewPermanant=Permanant; } 
		        
		        if ( NewDeal.Permanent.equals("0") && Permanant.equals("1") ) {  FinalizedDate=new Timestamp(date.getTime());  NewPermanant = Permanant;} else {  FinalizedDate=NewDeal.FinalizedDate; NewPermanant = NewDeal.Permanent; } 
		        
		        
				if(Integer. parseInt(NewDeal.progressMarks) >= Integer. parseInt(ProgressMark) ) {

					FinalProgressMark=NewDeal.progressMarks; }else { FinalProgressMark=ProgressMark; }
		        
                    NewDeal=new Transaction(
		    		
		    		TransactionID,AuthorType,Author,Brokerid,"MLS",AppraisalPropertyStreetName,AppraisalPropertyStreetNumber,AppraisalPropertyUnit,
					
		    		AppraisalPropertyCity,MainProvince,AppraisalPropertyPostalCode, AppraisalPropertyType ,FirstAgentID,SecondAgentID,AppraisalFirstAgentCommissionPercentage, 
					 
		    		AppraisalSecondAgentCommissionPercentage, AppraisalFeeAmount, AppraisalSource, AppraisalDealType , theAppraisalCompletetionDate ,theAppraisalCompletetionDate, theAppraisalCompletetionDate , "0.00",
					 
					"0.00","Status", AgentSign1, AgentSign2, BerokerSign, TransactionStatus, OfficeLeadAllocatonPercentage, OfficeLeadAllocatonAgainst ,
					 
					"0", 0, "0",0,"Note", NewPermanant, ReferralFeeNote,"Role1", "Role2",ServiceDescription ,
					
					OfferDate,OfferExpiretionDate,OfferAcceptanceDate,ConditionExpirationDate,	ConditionCompletationDate ,OfferWithrawalDate, InspectionDate, AccupancyDate,OffMarketDate , FinalProgressMark, NewDeal.CreateDate, FinalizedDate ,NewDeal.LastCommissionID,NewDeal.LastCommissionDealID);
                    
                    Record =RDS.SearchTradeRecordes( TransactionID , Brokerid ,con) ;
    	            
 	               if(Record.ID==0) {
 	            	
 	            	
 	              	     Record=new RecordSheet(
 				 			   
 	              	 		 0 ,  TransactionID ,  "RefoundAmount" ,  "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,
				 			 
 				 			Agent1.User_Split , Agent1.User_Split2,  Agent1.User_Split3 ,  AppraisalRecordSheetAgent2Split , Agent2.User_Split2  , Agent2.User_Split3 , "100.00", "0.00",

 				 			AppraisalRecordSheetNetFee ,  AppraisalRecordSheetNetHST , AppraisalRecordSheetNetTotal ,  HST , HST , HST,

 				 			 "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" , "HST9", "HST10" , "0.00" ,  "0.00" ,"0.00" ,

 				 			 "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00", Brokerid , TRSRecordSheetAgent1Cap , Agent1.User_Cap2 , Agent1.User_Cap3 , TRSRecordSheetAgent2Cap ,  Agent2.User_Cap2 , Agent2.User_Cap3, CurrentCompanies.CommissionBankNumber , CurrentCompanies.CommissionTransitNumber , CurrentCompanies.CommissionAccountNumber);
 			 	   
 			 	   
 			 	           RDS.NewTradeRecordes(Record , con);    }else {       
 			 	        	   
 			 	        	   
                        	   
                        	   if(Payment1==null || Payment1.isEmpty() ) {Payment1= Record.Payment1 ;} else{   Payment1= AppraisalRecordSheetNetFee; }
                        	   
                        	   if(Payment2==null || Payment2.isEmpty() ) {Payment2= Record.Payment2 ;} else{  Payment2= request.getParameter("BreakdownAgent1Amount"); }  
                        	   
                        	   if(Payment2==null || Payment3.isEmpty() ) {Payment3= Record.Payment2 ;} else{  Payment3= request.getParameter("BreakdownAgent2Amount"); }  
 			 	        	   
 			 	        	   
 			 	        	   
 			 	           }
                    
                    System.out.println("the Deal exist and we updating");   
                    
                    
		       }


	        ArrayList<Parties> MyClients = new ArrayList<Parties>();
	    	
	    	MyClients=RDS.SearchParties(  TransactionID ,"Client", Brokerid,con) ;
	    	
	    	
	    	ArrayList<Parties> MyOwner = new ArrayList<Parties>();
	    	
	    	MyOwner=RDS.SearchParties(  TransactionID ,"Owner",Brokerid ,con) ;
	    	

	    	int ClientSize=MyClients.size();

	    	int OwnerSize=MyOwner.size();
	    	
	    	System.out.println("OwnerSize"+" "+OwnerSize);
	    	
	    	Invoice  myinvoice=RDS.SearchInvoiceByTransactionID( TransactionID, Brokerid , con);

	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	   

			  
			    ArrayList<ExtraDocuments> Documents=new ArrayList<ExtraDocuments>();
			    
			    Documents=S3.SearchExtraFilesfroms3("Mastere/ReferralFee/Extra-Documents/",Brokerid,TransactionID ,s3client); 
		      
			    for(int counter=0; counter< Documents.size() ; counter++ ) {
			    	
				    String ExtradocDelete=request.getParameter("ExtradocDelete"+counter);	
				    
				    
				    if(ExtradocDelete!=null) {  S3.DeleteBucketInS3( "Mastere/ReferralFee/Extra-Documents/"+Documents.get(counter).Name+";"+String.valueOf( TransactionID )+";"+String.valueOf(Brokerid) ,s3client);   System.out.println("Delete"); }else {}

			    }
			    
			    
			    
			    ArrayList<AuditTrail> Notes=new ArrayList<AuditTrail>();
			    
				  Notes=RDS.SearchAuditTrail(  TransactionID ,  Brokerid ,"Note",con ); 
			      
				    for(int counter=0; counter< Notes.size() ; counter++ ) {

					    String ExtraNoteDelete=request.getParameter("Deletenote"+counter);	

					    
					    if(ExtraNoteDelete!=null) {  RDS. DeletAudit(    Brokerid , "Note" ,TransactionID,  Notes.get(counter).ID ,con  ) ;   }else {}
				    	
				    	
				    }	    

	    if(  Save!=null  ||  Finilize!=null ||  TransactionSave!=null || ClientSave!=null  ||  OwnerSave!=null || InvoiceSave!=null || ApprasialRecordSheetSave!=null || DocumentsSave!=null )  {

	    	
	    	
	    	System.out.println("Start");

	    	RDS.UpdateTransaction( NewDeal ,con);
	    	
	    	System.out.println("Update deal");

	    	if(ClientSize==0) {

	    	         if(  !AppraisalClientBusinessName1.isEmpty() || !AppraisalClientSigningOfficer1.isEmpty() || !AppraisalClientFirstName1.isEmpty() || !AppraisalClientLastName1.isEmpty() ||

			    		  !AppraisalClientUnit1.isEmpty() || !AppraisalClientStreetNumber1.isEmpty() ||  !AppraisalClientStreetName1.isEmpty() 	||  !AppraisalClientCity1.isEmpty() || !AppraisalClientPostalCode1.isEmpty()||
			    		 
			    		  !AppraisalClientEmail1.isEmpty() || !AppraisalClientPhone1.isEmpty() || ! AppraisalClientExtraContactNumber1.isEmpty() ) {
	    	        	   
	    	        	   
			                         RDS.NEWPatry(AppraisalClientType1,AppraisalClientBusinessName1,AppraisalClientSigningOfficer1,AppraisalClientFirstName1, AppraisalClientLastName1 ,AppraisalClientStreetName1,
			    		             AppraisalClientStreetNumber1 , AppraisalClientUnit1,AppraisalClientCity1, MainClinetProvince1,AppraisalClientPostalCode1,AppraisalClientCountry1,AppraisalClientPhone1,AppraisalClientExtraContact1,
			    		             AppraisalClientExtraContactNumber1, AppraisalClientEmail1, "Client", TransactionID, Brokerid,AppraisalClientPowerofattorney1 ,con) ;}else {}
			    
			    
			            if(  !AppraisalClientBusinessName2.isEmpty() || !AppraisalClientSigningOfficer2.isEmpty() || !AppraisalClientFirstName2.isEmpty() || !AppraisalClientLastName2.isEmpty() ||

			    		    !AppraisalClientUnit2.isEmpty() || !AppraisalClientStreetNumber2.isEmpty() ||  !AppraisalClientStreetName2.isEmpty() 	||  !AppraisalClientCity2.isEmpty() || !AppraisalClientPostalCode2.isEmpty()||
			    		 
			    		    !AppraisalClientEmail2.isEmpty() || !AppraisalClientPhone2.isEmpty() || ! AppraisalClientExtraContactNumber2.isEmpty() ) {
			    
			                       RDS.NEWPatry(AppraisalClientType2,AppraisalClientBusinessName2,AppraisalClientSigningOfficer2,AppraisalClientFirstName2, AppraisalClientLastName2 ,AppraisalClientStreetName2,
			    		           AppraisalClientStreetNumber2 , AppraisalClientUnit2,AppraisalClientCity2, MainClinetProvince2,AppraisalClientPostalCode2,AppraisalClientCountry2,AppraisalClientPhone2,AppraisalClientExtraContact2,
			    		           AppraisalClientExtraContactNumber2, AppraisalClientEmail2, "Client", TransactionID, Brokerid , AppraisalClientPowerofattorney2,con ) ;} else {}

              }//End of Size==0
	
	
	       else if( ClientSize==1) { 

                      if( !AppraisalOwnerBusinessName1.isEmpty() || !AppraisalOwnerSigningOfficer1.isEmpty() || !AppraisalOwnerFirstName1.isEmpty() || !AppraisalOwnerLastName1.isEmpty() ||

   		                   !AppraisalOwnerUnit1.isEmpty() || !AppraisalOwnerStreetNumber1.isEmpty() ||  !AppraisalOwnerStreetName1.isEmpty() 	||  !AppraisalOwnerCity1.isEmpty() || !AppraisalOwnerPostalCode1.isEmpty()||
   		 
   		                   !AppraisalOwnerEmail1.isEmpty() || !AppraisalOwnerPhone1.isEmpty() || ! AppraisalOwnerExtraContactNumber1.isEmpty()  ) {
		  
		                             RDS.UpdatePatry(AppraisalClientType1,AppraisalClientBusinessName1,AppraisalClientSigningOfficer1,AppraisalClientFirstName1, AppraisalClientLastName1 ,AppraisalClientStreetName1,
    		                         AppraisalClientStreetNumber1 , AppraisalClientUnit1,AppraisalClientCity1, MainClinetProvince1,AppraisalClientPostalCode1,AppraisalClientCountry1,AppraisalClientPhone1,AppraisalClientExtraContact1,
    		                         AppraisalClientExtraContactNumber1, AppraisalClientEmail1, "Client", TransactionID, MyClients.get(0).ID, Brokerid  , AppraisalClientPowerofattorney1 ,con) ; }
                      
                       else {   RDS.DeleteParty(  TransactionID ,   Brokerid  , MyClients.get(0).ID ,con) ;  }
		       
		     
		     
			       if(    !AppraisalClientBusinessName2.isEmpty() || !AppraisalClientSigningOfficer2.isEmpty() || !AppraisalClientFirstName2.isEmpty() || !AppraisalClientLastName2.isEmpty() ||

			    		  !AppraisalClientUnit2.isEmpty() || !AppraisalClientStreetNumber2.isEmpty() ||  !AppraisalClientStreetName2.isEmpty() 	||  !AppraisalClientCity2.isEmpty() || !AppraisalClientPostalCode2.isEmpty()||
			    		 
			    		  !AppraisalClientEmail2.isEmpty() || !AppraisalClientPhone2.isEmpty() || ! AppraisalClientExtraContactNumber2.isEmpty() ) {
			    
			                    RDS.NEWPatry(AppraisalClientType2,AppraisalClientBusinessName2,AppraisalClientSigningOfficer2,AppraisalClientFirstName2, AppraisalClientLastName2 ,AppraisalClientStreetName2,
			    		        AppraisalClientStreetNumber2 , AppraisalClientUnit2,AppraisalClientCity2, MainClinetProvince2,AppraisalClientPostalCode2,AppraisalClientCountry2,AppraisalClientPhone2,AppraisalClientExtraContact2,
			    		        AppraisalClientExtraContactNumber2, AppraisalClientEmail2, "Client", TransactionID, Brokerid , AppraisalClientPowerofattorney2,con ) ;} else {}
		     
	              } //End of Size==1
	
	         else if( ClientSize==2 ) {    
		
	        	 
	                   if( !AppraisalOwnerBusinessName1.isEmpty() || !AppraisalOwnerSigningOfficer1.isEmpty() || !AppraisalOwnerFirstName1.isEmpty() || !AppraisalOwnerLastName1.isEmpty() ||

 		                   !AppraisalOwnerUnit1.isEmpty() || !AppraisalOwnerStreetNumber1.isEmpty() ||  !AppraisalOwnerStreetName1.isEmpty() 	||  !AppraisalOwnerCity1.isEmpty() || !AppraisalOwnerPostalCode1.isEmpty()||
 		 
 		                   !AppraisalOwnerEmail1.isEmpty() || !AppraisalOwnerPhone1.isEmpty() || ! AppraisalOwnerExtraContactNumber1.isEmpty()  ) {
		
	                               RDS.UpdatePatry(AppraisalClientType1,AppraisalClientBusinessName1,AppraisalClientSigningOfficer1,AppraisalClientFirstName1, AppraisalClientLastName1 ,AppraisalClientStreetName1,
		                           AppraisalClientStreetNumber1 , AppraisalClientUnit1,AppraisalClientCity1, MainClinetProvince1,AppraisalClientPostalCode1,AppraisalClientCountry1,AppraisalClientPhone1,AppraisalClientExtraContact1,
		                           AppraisalClientExtraContactNumber1, AppraisalClientEmail1, "Client", TransactionID, MyClients.get(0).ID , Brokerid , AppraisalClientPowerofattorney1 ,con) ;  }
	             
	                  else {     RDS.DeleteParty(  TransactionID ,   Brokerid  , MyClients.get(0).ID,con ) ; }
	                   

			         if(    !AppraisalClientBusinessName2.isEmpty() || !AppraisalClientSigningOfficer2.isEmpty() || !AppraisalClientFirstName2.isEmpty() || !AppraisalClientLastName2.isEmpty() ||

			    		  !AppraisalClientUnit2.isEmpty() || !AppraisalClientStreetNumber2.isEmpty() ||  !AppraisalClientStreetName2.isEmpty() 	||  !AppraisalClientCity2.isEmpty() || !AppraisalClientPostalCode2.isEmpty()||
			    		 
			    		  !AppraisalClientEmail2.isEmpty() || !AppraisalClientPhone2.isEmpty() || ! AppraisalClientExtraContactNumber2.isEmpty() ) {
		
	                               RDS.UpdatePatry(AppraisalClientType2,AppraisalClientBusinessName2,AppraisalClientSigningOfficer2,AppraisalClientFirstName2, AppraisalClientLastName2 ,AppraisalClientStreetName2,
	    		                   AppraisalClientStreetNumber2 , AppraisalClientUnit2,AppraisalClientCity2, MainClinetProvince2,AppraisalClientPostalCode2,AppraisalClientCountry2,AppraisalClientPhone2,AppraisalClientExtraContact2,
	    		                    AppraisalClientExtraContactNumber2, AppraisalClientEmail2, "Client", TransactionID,MyClients.get(1).ID, Brokerid , AppraisalClientPowerofattorney2 ,con) ;}
	             
	                  else {    RDS.DeleteParty(  TransactionID ,   Brokerid  , MyClients.get(1).ID,con ) ; }

		
	                }

	    	 
	    	 if(OwnerSize==0) {
	    		 
	    		 
		                  if( !AppraisalOwnerBusinessName1.isEmpty() || !AppraisalOwnerSigningOfficer1.isEmpty() || !AppraisalOwnerFirstName1.isEmpty() || !AppraisalOwnerLastName1.isEmpty() ||
		        			
		    		          !AppraisalOwnerUnit1.isEmpty() || !AppraisalOwnerStreetNumber1.isEmpty() ||  !AppraisalOwnerStreetName1.isEmpty() 	||  !AppraisalOwnerCity1.isEmpty() || !AppraisalOwnerPostalCode1.isEmpty()||
		    		 
		    		         !AppraisalOwnerEmail1.isEmpty() || !AppraisalOwnerPhone1.isEmpty() || ! AppraisalOwnerExtraContactNumber1.isEmpty()) {
				      
					                   RDS.NEWPatry(AppraisalOwnerType1,AppraisalOwnerBusinessName1,AppraisalOwnerSigningOfficer1,AppraisalOwnerFirstName1, AppraisalOwnerLastName1 ,AppraisalOwnerStreetName1,
					    		       AppraisalOwnerStreetNumber1 , AppraisalOwnerUnit1,AppraisalOwnerCity1, MainOwnerProvince1,AppraisalOwnerPostalCode1,AppraisalOwnerCountry1,AppraisalOwnerPhone1,AppraisalOwnerExtraContact1,
					    		       AppraisalOwnerExtraContactNumber1, AppraisalOwnerEmail1, "Owner", TransactionID, Brokerid, AppraisalOwnerowerofattorney1 ,con) ;  }else {}
					    
					         if( !AppraisalOwnerBusinessName2.isEmpty() || !AppraisalOwnerSigningOfficer2.isEmpty() || !AppraisalOwnerFirstName2.isEmpty() || !AppraisalOwnerLastName2.isEmpty() ||
		
					    		  !AppraisalOwnerUnit2.isEmpty() || !AppraisalOwnerStreetNumber2.isEmpty() ||  !AppraisalOwnerStreetName2.isEmpty() 	||  !AppraisalOwnerCity2.isEmpty() || !AppraisalOwnerPostalCode2.isEmpty()||
					    		 
					    		  !AppraisalOwnerEmail2.isEmpty() || !AppraisalOwnerPhone2.isEmpty() || ! AppraisalOwnerExtraContactNumber2.isEmpty()) {
					    	
					                      RDS.NEWPatry(AppraisalOwnerType2,AppraisalOwnerBusinessName2,AppraisalOwnerSigningOfficer2,AppraisalOwnerFirstName2, AppraisalOwnerLastName2 ,AppraisalOwnerStreetName2,
					            		 
					    		          AppraisalOwnerStreetNumber2 , AppraisalOwnerUnit2,AppraisalOwnerCity2, MainOwnerProvince2,AppraisalOwnerPostalCode2,AppraisalOwnerCountry2,AppraisalOwnerPhone2,AppraisalOwnerExtraContact2,
					    		
					    		          AppraisalOwnerExtraContactNumber2, AppraisalOwnerEmail2, "Owner", TransactionID, Brokerid , AppraisalOwnerowerofattorney2 ,con) ;   } else {}   	
					         
	    	               } //Owner size 0
	    	
					    
	    	    else if( OwnerSize==1) { 

	                     if( !AppraisalOwnerBusinessName1.isEmpty() || !AppraisalOwnerSigningOfficer1.isEmpty() || !AppraisalOwnerFirstName1.isEmpty() || !AppraisalOwnerLastName1.isEmpty() ||
			        			
	    		            !AppraisalOwnerUnit1.isEmpty() || !AppraisalOwnerStreetNumber1.isEmpty() ||  !AppraisalOwnerStreetName1.isEmpty() 	||  !AppraisalOwnerCity1.isEmpty() || !AppraisalOwnerPostalCode1.isEmpty()||
	    		 
	    		            !AppraisalOwnerEmail1.isEmpty() || !AppraisalOwnerPhone1.isEmpty() || ! AppraisalOwnerExtraContactNumber1.isEmpty()) {
	    	    	
	    	    	 
				                    RDS.UpdatePatry(AppraisalOwnerType1,AppraisalOwnerBusinessName1,AppraisalOwnerSigningOfficer1,AppraisalOwnerFirstName1, AppraisalOwnerLastName1 ,AppraisalOwnerStreetName1,
				    		        AppraisalOwnerStreetNumber1 , AppraisalOwnerUnit1,AppraisalOwnerCity1, MainOwnerProvince1,AppraisalOwnerPostalCode1,AppraisalOwnerCountry1,AppraisalOwnerPhone1,AppraisalOwnerExtraContact1,
				    		        AppraisalOwnerExtraContactNumber1, AppraisalOwnerEmail1, "Owner", TransactionID, MyOwner.get(0).ID , Brokerid , AppraisalOwnerowerofattorney1 ,con) ;  
				                    
	                     }else { RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(0).ID ,con); }

	    	
						    if(      !AppraisalOwnerBusinessName2.isEmpty() || !AppraisalOwnerSigningOfficer2.isEmpty() || !AppraisalOwnerFirstName2.isEmpty() || !AppraisalOwnerLastName2.isEmpty() ||

						    		 !AppraisalOwnerUnit2.isEmpty() || !AppraisalOwnerStreetNumber2.isEmpty() ||  !AppraisalOwnerStreetName2.isEmpty() 	||  !AppraisalOwnerCity2.isEmpty() || !AppraisalOwnerPostalCode2.isEmpty()||
						    		 
						    		 !AppraisalOwnerEmail2.isEmpty() || !AppraisalOwnerPhone2.isEmpty() || ! AppraisalOwnerExtraContactNumber2.isEmpty()) {
						    	
						                        RDS.NEWPatry(AppraisalOwnerType2,AppraisalOwnerBusinessName2,AppraisalOwnerSigningOfficer2,AppraisalOwnerFirstName2, AppraisalOwnerLastName2 ,AppraisalOwnerStreetName2,
						            		 
						    		            AppraisalOwnerStreetNumber2 , AppraisalOwnerUnit2,AppraisalOwnerCity2, MainOwnerProvince2,AppraisalOwnerPostalCode2,AppraisalOwnerCountry2,AppraisalOwnerPhone2,AppraisalOwnerExtraContact2,
						    		
						    		            AppraisalOwnerExtraContactNumber2, AppraisalOwnerEmail2, "Owner", TransactionID, Brokerid , AppraisalOwnerowerofattorney2 ,con) ;   } else {}

	    	                 }//Owner size 1
	    	
	    	
	    	    else if( OwnerSize==2) {  
	    	    	
	    	    	
                          if( !AppraisalOwnerBusinessName1.isEmpty() || !AppraisalOwnerSigningOfficer1.isEmpty() || !AppraisalOwnerFirstName1.isEmpty() || !AppraisalOwnerLastName1.isEmpty() ||
		        			
   		                      !AppraisalOwnerUnit1.isEmpty() || !AppraisalOwnerStreetNumber1.isEmpty() ||  !AppraisalOwnerStreetName1.isEmpty() 	||  !AppraisalOwnerCity1.isEmpty() || !AppraisalOwnerPostalCode1.isEmpty()||
   		 
   		                      !AppraisalOwnerEmail1.isEmpty() || !AppraisalOwnerPhone1.isEmpty() || ! AppraisalOwnerExtraContactNumber1.isEmpty()) {
	    		
	                                    RDS.UpdatePatry(AppraisalOwnerType1,AppraisalOwnerBusinessName1,AppraisalOwnerSigningOfficer1,AppraisalOwnerFirstName1, AppraisalOwnerLastName1 ,AppraisalOwnerStreetName1,
	    		                        AppraisalOwnerStreetNumber1 , AppraisalOwnerUnit1,AppraisalOwnerCity1, MainOwnerProvince1,AppraisalOwnerPostalCode1,AppraisalOwnerCountry1,AppraisalOwnerPhone1,AppraisalOwnerExtraContact1,
	    		                        AppraisalOwnerExtraContactNumber1, AppraisalOwnerEmail1, "Owner", TransactionID, MyOwner.get(0).ID , Brokerid , AppraisalOwnerowerofattorney1 ,con) ;}
                          
                          else { RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(0).ID ,con); }
  
						   if( !AppraisalOwnerBusinessName2.isEmpty() || !AppraisalOwnerSigningOfficer2.isEmpty() || !AppraisalOwnerFirstName2.isEmpty() || !AppraisalOwnerLastName2.isEmpty() ||

							    !AppraisalOwnerUnit2.isEmpty() || !AppraisalOwnerStreetNumber2.isEmpty() ||  !AppraisalOwnerStreetName2.isEmpty() 	||  !AppraisalOwnerCity2.isEmpty() || !AppraisalOwnerPostalCode2.isEmpty()||
							    		 
							    !AppraisalOwnerEmail2.isEmpty() || !AppraisalOwnerPhone2.isEmpty() || ! AppraisalOwnerExtraContactNumber2.isEmpty()) {  

	                                     RDS.UpdatePatry(AppraisalOwnerType2,AppraisalOwnerBusinessName2,AppraisalOwnerSigningOfficer2,AppraisalOwnerFirstName2, AppraisalOwnerLastName2 ,AppraisalOwnerStreetName2,
	            		 
			                             AppraisalOwnerStreetNumber2 , AppraisalOwnerUnit2,AppraisalOwnerCity2, MainOwnerProvince2,AppraisalOwnerPostalCode2,AppraisalOwnerCountry2,AppraisalOwnerPhone2,AppraisalOwnerExtraContact2,
			    		
			                             AppraisalOwnerExtraContactNumber2, AppraisalOwnerEmail2, "Owner", TransactionID,MyOwner.get(1).ID  ,Brokerid , AppraisalOwnerowerofattorney2,con ) ;  }
						   
						  else { RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(1).ID ,con ); }
	                          
	    	
	    	   } //Owner size 2
	    	
				    	
				    	if(myinvoice.ID==0) {
				    		
				    		
				    	     Date date = new Date( ); 
					    	 
				    	     Timestamp InvoiveCreateDate=new Timestamp(date.getTime());

						   Invoice  NewInvoice=new Invoice( 
								   0,
								   Brokerid,
								   TransactionID,
								   InvoiceSendStatus,	
								   "INVOICE",
								   InvoiveCreateDate,
								   AppraisalInvoiceReciverFirtsName,
								   AppraisalInvoiceReciverLastName,
								   AppraisalClientEmail1,
								   AppraisalInvoiceUnit,
								   AppraisalInvoiceStreetName,
								   AppraisalInvoiceStreetNumber,
								   AppraisalInvoiceCity,
								   AppraisalInvoiceProvince,
								   AppraisalInvoicePostalCode,
								   AppraisalInvoiceCountry,
								   AppraisalInvoiceFee,
								   "",	
								   AppraisalInvoiceHST,	
								   "",
								   AppraisalInvoiceBalanceAmount,	
								   theAppraisalCompletetionDate,"","");
						   
							        RDS.NEWInvoice( NewInvoice ,con );
				    	}   
				    	
				    	else {
				    		
				    		
							   Invoice  NewInvoice1=new Invoice( 
									   myinvoice.ID,
									   Brokerid,
									   TransactionID,
									   InvoiceSendStatus,	
									   "INVOICE",
									   myinvoice.Date,
									   AppraisalInvoiceReciverFirtsName,
									   AppraisalInvoiceReciverLastName,
									   AppraisalClientEmail1,
									   AppraisalInvoiceUnit,
									   AppraisalInvoiceStreetName,
									   AppraisalInvoiceStreetNumber,
									   AppraisalInvoiceCity,
									   AppraisalInvoiceProvince,
									   AppraisalInvoicePostalCode,
									   AppraisalInvoiceCountry,
									   AppraisalInvoiceFee,
									   "",	
									   AppraisalInvoiceHST,	
									   "",
									   AppraisalInvoiceBalanceAmount,	
									   theAppraisalCompletetionDate,"","");
							           RDS.UpdateInvoice( NewInvoice1 ,con);	   }
	    	
	    	
	    	
				         String ExtraDocumentName = request.getParameter("EXtraDocumentName1"); 

				   	     System.out.println("EXtraDocumentName1"+" "+ExtraDocumentName);
				   	     
			   	         if(ExtraDocumentName.isEmpty() ) { ExtraDocumentName="OtherExtraDocument" ;}
				   	    
				         Part filePart7= request.getPart("FileName0");

				   	     InputStream fileInputStream7 = filePart7.getInputStream();
				   	    
				           if(  fileInputStream7.available()==0  ) {  System.out.println("there is no file to uplaod");  } //closing of If
				           
				           else {
				   	   
				   	                String fileName7 =filePart7.getSubmittedFileName();

				   	                System.out.println("Name"+"   "+fileName7);
			  
				   	                String FILENAME7=ExtraDocumentName+"%"+String.valueOf(TransactionID)+"%"+String.valueOf(Brokerid);
				   	     
				   	                S3. UploadToS3( TransactionID , "probroker/Mastere/Other/ExtraDocuments", fileInputStream7, filePart7 , FILENAME7,s3client );
				   	    
				           } //Closing else
				           
				           

				        	        
				        	
				        		   
				        		    System.out.println("ExteraNotes"+" "+ExteraNotes);
				        	        
				        	        
				        	        if ( !ExteraNotes.isEmpty() || ExteraNotes!="" || ExteraNotes!=null ) {
				        	        	
				        	        	
				        	        	
				        		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
				        		    	 
				        		         Date date = new Date( ); 

				        	        	
				        	        	AuditTrail auditRecord=new AuditTrail(
				        	        			
				        	        			
				        	       			 0,  TransactionID,  ExteraNotes,  formatter.format(date),  "Note",	  Brokerid ,  UserID ,  MyInformation.Firstname+" "+ MyInformation.Lastname );
				        	        			
				        	        			
				        	        			
				        	        			
				        	        	RDS.AddNewAudit( auditRecord ,con); 	 }
				        	        
				        	        
				        	        
				        	        
				        	        
				        	        
				        	        
				        	        if( CheckFinalize==1 ) {
				        	    
				        	        	      double CapReached=0.00;
				        	        	
				        	        	      if (  AppraisalSource.equals("Agent-lead") ){ CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(AppraisalRecordSheetNetFee.replace(",","")); }
				        	        	   
				        	        	      else {
				        	        		   
		                		                    if( OfficeLeadAllocatonAgainst==1 ){ CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(AppraisalRecordSheetNetFee.replace(",",""));   }
		      		                		 
		                		                    else { /* do no thing  */ }   
				        	        	     }
		
				        	        	      RDS. UpdateCompanyTemp( String.valueOf(CapReached), Brokerid ,con); 
				        	        	      
				        	                  CommissionDetails  mycom = RDS.SearchSpesificCommission( TransactionID ,  NewDeal.LastCommissionDealID,con);
				        	        	   
				        	        	      CommissionDetails  FinalizedCom=new CommissionDetails(
				        	        				
				        	        	    		 mycom.ID, AppraisalPropertyType,AppraisalPropertyUnit+"-"+AppraisalPropertyStreetNumber+","+AppraisalPropertyStreetName+","+AppraisalPropertyCity+","+AppraisalPropertyProvince,FinalizedDate,theAppraisalCompletetionDate, AppraisalFeeAmount ,
					       	   					 
					       	   		    		     Payment1, "0.00", "0.00",AppraisalFeeAmount,AppraisalRecordSheetAgent1Split, Payment2, "0.00", 
					       	   					 
					       	   					     "0.00", Payment2,AppraisalRecordSheetNetFee,"Balance", AddAgaintCap, AddAgaintCapDS, String.valueOf(CapReached), Brokerid,  Brokerid, TransactionID,  Permanant ,"Deal")  ;      
					                          
					                            RDS. UpdateCommissionDetails( FinalizedCom ,con);

					                            Record=new RecordSheet(
										     			   
									        			 Record.ID ,  TransactionID ,  "RefoundAmount" , "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

									        			 Agent1.User_Split ,Agent1.User_Split2 ,Agent1.User_Split3 , Agent2.User_Split , Agent2.User_Split2 ,Agent2.User_Split3  , "100.00" , "0.00" ,

									        			 AppraisalRecordSheetNetFee ,  AppraisalRecordSheetNetHST ,  AppraisalRecordSheetNetTotal ,  AppraisalRecordSheetGRossFeeHST , AppraisalRecordSheetAgent1HST , AppraisalRecordSheetAgent2HST,

									        			 "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" ,"HSt9", "HST10",  Payment1,  Payment2 , Payment3 ,

												 		 "0.00" ,  " 0.00" , "0.00" , "0.00" , "0.00" ,"0.00","0.00", Brokerid, Agent1.User_Cap, Agent1.User_Cap2 ,  Agent1.User_Cap3  , Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 ,  CurrentCompanies.CommissionBankNumber,  CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber   ); 

									        	        RDS.UpdateTradeRecordes(  Record,con ); 

				        	        	   
				        	        }  //End of CheckFinalize 
				        	        
				        	        
				        	        else { /* Do nothing */  }              
				        	        	
				        	    

						        	if( CheckSave==1 || Integer. parseInt(FinalProgressMark)>=3  )    { 
						        		
						        		
					        	          Record=new RecordSheet(
								     			   
					        			  Record.ID ,  TransactionID ,  "RefoundAmount" , "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

					        			  Agent1.User_Split,Agent1.User_Split2 ,Agent1.User_Split3 ,  Agent2.User_Split , Agent2.User_Split2 ,Agent2.User_Split3  , "100.00" , "0.00" ,

					        			  AppraisalRecordSheetNetFee ,  AppraisalRecordSheetNetHST ,  AppraisalRecordSheetNetTotal ,  AppraisalRecordSheetGRossFeeHST , AppraisalRecordSheetAgent1HST , AppraisalRecordSheetAgent2HST,

					        			  "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" , "HST9","HST10", Payment1,  Payment2 , Payment3  ,

								 		  "0.00" ,  " 0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00",Brokerid, Agent1.User_Cap, Agent1.User_Cap2 ,  Agent1.User_Cap3  , Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 ,  CurrentCompanies.CommissionBankNumber,  CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber   ); 

					        	         RDS.UpdateTradeRecordes(  Record ,con ); 
					        	         
			  	              
			  	                 
			  	                  CommissionDetails  mycom = RDS.SearchSpesificCommission( TransactionID  , NewDeal.LastCommissionDealID ,con);
			  	                 
			                      CommissionDetails  Com=new CommissionDetails(

			                     		    mycom.ID, AppraisalPropertyType, AppraisalPropertyUnit+"-"+AppraisalPropertyStreetNumber+","+AppraisalPropertyStreetName+","+AppraisalPropertyCity+","+AppraisalPropertyProvince, FinalizedDate,theAppraisalCompletetionDate, 
						 
			                     		   AppraisalFeeAmount, Payment1, "0.00", "0.00",AppraisalFeeAmount,AppraisalRecordSheetAgent1Split, Payment2, 
						 
					                         "0.00",  "0.00", Payment2, AppraisalRecordSheetNetFee, "Balance",  "0", "0", myCompany.Temp,Brokerid,  Brokerid, TransactionID, Permanant	,"Deal")  ;    
			                      
			                       System.out.println("Update Commission");
			                      
			                       RDS. UpdateCommissionDetails( Com ,con);
			                      
			                       System.out.println("Update Done on Commission ");

					          }else { }
	
	    	
	    }// Closing Save !=null  
	    
	    
	    else if(  SendEmailInvoice!=null ) {
	    	


		       String Email1=request.getParameter("emailValueAddressee0");

		       String  Email2=request.getParameter("emailValueAddressee1");
		       
		       String Email3=request.getParameter("emailValueoptional0");
		          
		       String Email4=request.getParameter("emailValueoptional1");
		       
		       System.out.println("Email1"+" "+Email1);

		       
				  String  send1=request.getParameter("Addressee0");
				    
				  String  send2=request.getParameter("Addressee1");
				    
				  String  send3=request.getParameter("optional0");
				    
				  String  send4=request.getParameter("optional1");
				  
			       System.out.println("send1"+" "+send1);
				  

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		       

			  // HttpSession Existingsession1 = request.getSession();
			   
			   String MyEmail=(String) Existingsession.getAttribute("Email");
			   
			   System.out.println("MyEmail"+" "+MyEmail);

			   String SendmeACopy=request.getParameter("Secondary7");
			   
		       System.out.println("SendmeACopy"+" "+SendmeACopy);
				  
			   
			   
			   //String test="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/47";
			   
			   
		       System.out.println("Email1"+" "+Email1);
		       
		       System.out.println("Email2"+" "+Email2);
		       
		       System.out.println("Email3"+" "+Email3);
		       
		       System.out.println("Email4"+" "+Email4);
		       
			  
			  
		       System.out.println("send1"+" "+send1);
		       
		       System.out.println("send2"+" "+send2);
		       
		       System.out.println("send3"+" "+send3);
		       
		       System.out.println("send4"+" "+send4);
		       

		       
	
			    
			    
			    String Subject=request.getParameter("subjectLineEmail");
			    
			    String EmailBody=request.getParameter("messageEmail");
			    
			    System.out.println("Subject"+""+Subject);
			    
			    System.out.println("messageEmail"+""+EmailBody);

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

					String PropAddress = "";
					if((!AppraisalPropertyUnit.isEmpty())) {
						PropAddress += AppraisalPropertyUnit + "-";
					}
					PropAddress += AppraisalPropertyStreetNumber + " " + AppraisalPropertyStreetName + ", " +  AppraisalPropertyCity + ", " + AppraisalPropertyPostalCode + ", ";

					if(AppraisalPropertyOtherProvince.isEmpty()){
						PropAddress += AppraisalPropertyProvince;
					}else{
						PropAddress += AppraisalPropertyOtherProvince + ", " + AppraisalPropertyCountry;
					}

					String clientAddress1 = "";
					String clientAddress2 = "";
					if((!AppraisalClientUnit1.isEmpty())) {
						clientAddress1 += AppraisalClientUnit1 + "-";
					}
					clientAddress1 += AppraisalClientStreetNumber1 + " " + AppraisalClientStreetName1 ;

					if(AppraisalClientOtherProvince1.isEmpty()){
						clientAddress2 +=  AppraisalClientCity1 + ", " + AppraisalClientPostalCode1 + ", " + AppraisalClientProvince1 ;
					}else{
						clientAddress2 +=  AppraisalClientCity1 + ", " + AppraisalClientPostalCode1 + ", " + AppraisalClientOtherProvince1 + ", " + AppraisalClientCountry1;
					}

		            MimeBodyPart htmlPart = new MimeBodyPart();
		            
		    		String  HTML ="                              <div style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"                                   <div>\n" + 
							"\n" + 
							"											<div style='position: relative; float: right; right: 1px;'>"+
							"													<img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" alt='' style='    width: 150px; margin-right: 20px;'>"+
							"											</div>"+
							"											<div>"+
							"													<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"											</div>"+
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+  CurrDate +"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+AppraisalInvoiceReciverFirtsName+" "+ AppraisalInvoiceReciverLastName+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress1+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress2+ "</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'> \n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Property:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ PropAddress+ "</label>\n" + 
		    				"                                                 </div>\n"  + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Report Date</label>\n" + 
							"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ AppraisalCompletetionDate+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div style='padding-right: 25px'>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%;'>" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>" + ServiceDescription +"</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;' >"+AppraisalFeeAmount+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+CurrentCompanies.HSTNumberPart1+" "+"RT"+" "+CurrentCompanies.HSTNumberPart2+")</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+AppraisalInvoiceHST+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 7px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>Balance</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'><b>$</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'><b>"+AppraisalInvoiceBalanceAmount+"</b></label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
							"\n" +
		    				"                                                 <p style='margin-bottom: 0; padding: 13px 16px 8px 16px; '>\n" +  
		    				"                                                        Please mail a cheque payable to \""+ CurrentCompanies.BusinessName+"\" or make an electronic payment to our commission trust account: </p>\n" + 
		    				"\n" + 
							"                                                 <div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 
							"\n" + 
		    				"                                                 		<div style='width: 100%;'>\n" + 
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Bank:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionBankNumber+"</label>\n" + 
		    				"                                                 		</div>\n" + 
		    				"\n" + 		
		    				"                                                 		<div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Transit:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionTransitNumber+"</label>\n" +
		    				"                                                 		</div>\n" + 
		    				"\n" + 		
		    				"                                                 		<div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px;  margin: 0;'>Account:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionAccountNumber+"</label>\n" + 
		    				"\n" + 		
		    				"                                                 		</div>\n" + 
		    				"\n" + 
							"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 35px 5px 0 0;    height: auto;    color: black;'>Sincerely,</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;padding-left: 0;margin: 5px 5px 0 0;  margin-top: 34px;    height: auto;    color: black;''>"+MyInformation.Firstname+" "+MyInformation.Lastname+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>Broker of Record</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+CurrentCompanies.BusinessName+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+CurrentCompanies.Phone+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br><br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'><a target='_blank' href=\"mailto:"+CurrentCompanies.Email+"\">"+CurrentCompanies.Email+"</a></label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+CurrentCompanies.Unit+"-"+CurrentCompanies.StreetNumber+", "+CurrentCompanies.StreetName+"</label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+CurrentCompanies.City+", "+CurrentCompanies.Province+", " +CurrentCompanies.PostalCode+"</label>\n" + 
							"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+"</label>\n" + 
		    				"\n" + 
		    				"                                          </div><!-- Closing SenderInformation -->\n" + 
		    				"\n" + 
		    				"                                   </div>\n" + 
		    				"                            </div>   ";

		            System.out.println("start");
		            
		    		String absoluteFilesystemPath = getServletContext().getRealPath("/");
		    		
		    		System.out.println(absoluteFilesystemPath);

		    		FileOutputStream  fileOutputStream = new FileOutputStream( new File(absoluteFilesystemPath+"Contacts.pdf") );

					HtmlConverter.convertToPdf(HTML, fileOutputStream );
					
					
					
					if(send1!=null) {

		    	    System.out.println( "PDF Created!" );   
		            
		            //set email message details
		            
		            Message mess = new MimeMessage(session);

		    		//set from email address
		            
		            mess.setFrom(new InternetAddress(fromEmail));
		            
		            
		            
		            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
		            
		            
		            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1)); 

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
					
					if(send2!=null) {

			    	    System.out.println( "PDF Created!" );   
			            
			            //set email message details
			            
			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			            
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
			            
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email2)); 

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
					
					if(send3!=null) {

			    	    System.out.println( "PDF Created!" );   
			            
			            //set email message details
			            
			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			            
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
			            
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email3)); 

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
					
					
					if(send4!=null) {

			    	    System.out.println( "PDF Created!" );   
			            
			            //set email message details
			            
			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			            
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
			            
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email4)); 

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
					
					
					if(SendmeACopy!=null) {

			    	    System.out.println( "PDF Created!" );   
			            
			            //set email message details
			            
			            Message mess = new MimeMessage(session);

			    		//set from email address
			            
			            mess.setFrom(new InternetAddress(fromEmail));
			            
			            
			            
			            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
			            
			            
			            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(MyEmail)); 

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
		        
		        

			 
    
		        

	    } // End of SendEmailInvoice
	    
	    
	    if( Delete!=null) {  
            
	    	if( ClientSize==1){  RDS.DeleteParty( TransactionID, Brokerid  , MyClients.get(0).ID ,con); }
	    	
	    	else if( ClientSize==2 ) {
	    		
	        RDS.DeleteParty( TransactionID, Brokerid  , MyClients.get(0).ID,con );	
	        
	    	RDS.DeleteParty( TransactionID, Brokerid  , MyClients.get(1).ID ,con); }
	    	
	    	else if( ClientSize==0 ){}
	    	
	    	if( OwnerSize==1 ) { RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(0).ID ,con); }
	    	
	    	else if( OwnerSize==2 ){
	    		
	    		RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(0).ID ,con);
	    		
	    		RDS.DeleteParty( TransactionID, Brokerid  , MyOwner.get(1).ID ,con); }
	    	
	    	else {}

	    	RDS.DeleteInvoice(  Brokerid ,    myinvoice.ID , TransactionID,con );
	    	
	    	RDS.DeleteTransaction( Brokerid , TransactionID,con );	
	    

	    	   for(int counter=0; counter< Documents.size() ; counter++ ) {
				    
				    
	  		     S3.DeleteBucketInS3( "Mastere/ReferralFee/Extra-Documents/"+Documents.get(counter).Name+"+"+String.valueOf( TransactionID )+"+"+String.valueOf(Brokerid) ,s3client); 
	  		     
	    	   }

	    	   
	    	   
			    for(int counter=0; counter< Notes.size() ; counter++ ) {
			    	
			    	
			    	
				  RDS. DeletAudit(    Brokerid , "Note" ,TransactionID,  Notes.get(counter).ID ,con  ) ; 
			    	
			    }	  
			    
			    
			    
				 RDS. DeleteRecordSheet(  Brokerid , TransactionID ,con );

			     CommissionDetails newcom=RDS.SearchSpesificCommission( TransactionID  ,NewDeal.LastCommissionDealID ,con);
			     
				 double Cap=0.00;
				
		    	 Cap=Double.parseDouble(myCompany.Temp.replace(",",""))-Double.parseDouble(newcom.SplitWithBroker.replace(",",""));

		         RDS. UpdateCompanyTemp( String.valueOf(Cap), Brokerid ,con); 
		         
		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 
		    	 
			     String Date=formatter.format(date); 
			     
		   	     newcom.TradeID=TransactionID;
		   	     
		   	     newcom.BrokerID=Brokerid;
		   	  
		   	     newcom.AgentId=Brokerid;
		   	 
		   	     newcom.Date=new Timestamp(date.getTime());
		   	     
		   	     newcom.Status="Delete";
		   	     
		   	     newcom. AddtoCap="0";
	 	      
		   	     newcom. AddtoCapDS="0";
		  
		    	 newcom.CapReached=String.valueOf(Cap);

		    	 int LastCommissionID=RDS.AddCommissionDetails( newcom,con) ;
		    	 
		    	 RDS.UpdateLastCommmissionID(  Brokerid , TransactionID , LastCommissionID ,con);   // We are updating the latest version of commission ID
	    	
	    }// end of Delete 
	    
	    

	    
	    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	    

	    

	    
	    
	    else {  }


	}//End of Big else
		   
	       response.sendRedirect("BrokerFiles/Dashboard.jsp");   
	   

	}
	
	 
}