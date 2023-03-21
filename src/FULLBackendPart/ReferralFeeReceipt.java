package FULLBackendPart;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.itextpdf.html2pdf.HtmlConverter;

import ProMasterClasses.Transaction;
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


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


import com.amazonaws.services.s3.AmazonS3;

//import com.itextpdf.commons.exceptions.ITextException;

import com.itextpdf.html2pdf.HtmlConverter;

import com.itextpdf.styledxmlparser.IXmlParser;

import com.itextpdf.io.source.OutputStream;

import  com.itextpdf.layout.Document;

import com.itextpdf.io.font.FontCacheKey;

import com.itextpdf.svg.processors.ISvgConverterProperties;



/**
 * Servlet implementation class ReferralFeeReciepent
 * 
 * 
 */



@WebServlet(
		
        name = "ReferralFeeReciepent"

		
		)

@MultipartConfig


public class ReferralFeeReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReferralFeeReceipt() {
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
		
	   //In this section the system checks if the user is finalizing the deal or just saving it and wants to complete it again . Because if they are not finalizing a deal then there is no new contact in their contact list
		
		//We check which buttons they have pressed to come in this stage

	    String Finilize= request.getParameter("Finalized");
	    		
	    String Save=request.getParameter("SaveExit");	
	    
	    String Delete=request.getParameter("Delete");
	    
	    String TransactionSave=request.getParameter("TransactionSave");
	  
	    String ClientSave=request.getParameter("ClientSave");
	    
	    String ReferralSourceSave=request.getParameter("ReferralSourceSave");
	    
	    String InvoiceSave=request.getParameter("InvoiceSave");
	    
	    String ReferralFeeRecordSheetSave=request.getParameter("ReferralFeeRecordSheetSave");
	    
	    String SendEmailInvoice=request.getParameter("SendEmailInvoice");
	    
	    String DocumentsSave=request.getParameter("DocumentsSave");

	    String ReferraldocDelete=request.getParameter("ReferraldocDelete");
	    
	    String reopenDeal=request.getParameter("reopenDeal");
	    
	    String Submitdoc=request.getParameter("documentSubmitbtn");
	    
	    String Submitnote=request.getParameter("savenote");
	    
	    
	   // String CloseDeal=request.getParameter("");

	    String Permanant="";
	    
	    int CheckFinalize=0;
	    
	    String AddAgaintCap="";
	    
	    String AddAgaintCapDS="";
	    
	    int CheckSave=0;
	    
	    if( Finilize!=null  ) {  System.out.println("Finilized"); Permanant="1";  CheckFinalize=1; CheckSave=0;} 
	    
	    else if( Save!=null )   {  System.out.println("save");     Permanant="0";  CheckFinalize=0; CheckSave=0; }
	    
	    else if( Delete!=null)  {  System.out.println("Delete");  Permanant="0";  CheckFinalize=0; CheckSave=0; }

	    else if( TransactionSave !=null ) { System.out.println("TransactionSave"); Permanant="0"; CheckFinalize=0; CheckSave=0;  }
	    
	    else if( ClientSave !=null ) { System.out.println("ClientSave"); Permanant="0";  CheckFinalize=0; CheckSave=0; }

	    else if( InvoiceSave !=null ) { System.out.println("InvoiceSave"); Permanant="0";  CheckFinalize=0; CheckSave=0; }
	    
	    else if( ReferralSourceSave !=null ) { System.out.println("ReferralSourceSave"); Permanant="0"; CheckFinalize=0;  CheckSave=0;}
	    
	    else if( ReferralFeeRecordSheetSave !=null ) { System.out.println(" ReferralFeeRecordSheetSave"); Permanant="0";  CheckFinalize=0;  CheckSave=1 ;}
	    
	    else if( SendEmailInvoice !=null ) { System.out.println(" SendEmailInvoice"); Permanant="0"; CheckFinalize=0; CheckSave=0; }
	    
	    else if( DocumentsSave !=null ) { System.out.println(" DocumentsSave"); Permanant="0"; CheckFinalize=0; CheckSave=0; }
	    
	    else if( reopenDeal !=null ) { System.out.println(" reopenDeal");  Permanant="0"; CheckFinalize=0;  CheckSave=0;}
	    
	    else if( Submitdoc !=null ) { System.out.println(" Submitdoc"); CheckFinalize=0;  CheckSave=0;}

	    else {  System.out.println("else");  Permanant="0";  CheckFinalize=0; CheckSave=0; }

		  RDSFunctions RDS= new RDSFunctions();
		  
	      HttpSession Existingsession = request.getSession();

	      int Brokerid=(int) Existingsession.getAttribute("Brokerid");
	      
	      int UserID=(int) Existingsession.getAttribute("Userid");

	      int Author= (int) Existingsession.getAttribute("Userid");
	      
	      String Type=(String) Existingsession.getAttribute("Type");
	      
	      Connection con=(Connection) Existingsession.getAttribute("Connection");
	      
	      AmazonS3 s3client=(AmazonS3) Existingsession.getAttribute("S3");

	      int  AuthorType= Integer.parseInt(Type);
	      
		  int TheDealID=(int) Existingsession.getAttribute("TransactionID");

		  System.out.println("The TransID"+" "+TheDealID);

		  Transaction NewDeal=new Transaction();

		  NewDeal= RDS.GetTransactionsbyID( TheDealID , Brokerid,con);
		        
		  System.out.println( "This is the deal ID"+NewDeal.id );
		    
	 	  Users MyInformation=new Users();
	 	  
		  Companies myCompany=RDS.GetaCompanyBuyBrokerID(Brokerid,con);
			 
	 	  MyInformation=RDS.GetAnyUserById(Brokerid,con); 

		  Companies CurrentCompanies=new Companies();
		 
		  CurrentCompanies=RDS.GetaCompanyBuyBrokerID(Brokerid , con); //Getting the current company information for a specific broker
		  
		  ConnectionToS3 S3= new ConnectionToS3();
		  
		  String FinalProgressMark="0";

		  
	 if(reopenDeal!=null) { 
		 
		 RDS.ReopenTransaction( Brokerid , TheDealID ,"0","Reopened" ,con)  ;  
		 
   	     CommissionDetails newcom=RDS.SearchSpesificCommission( TheDealID , NewDeal.LastCommissionDealID , con) ;
   	     
   	     double Cap=0.00;
   	     
   	     if( Double.parseDouble(myCompany.Temp)>= Double.parseDouble(newcom.SplitWithBroker) ) {

   	         Cap=Double.parseDouble(myCompany.Temp)-Double.parseDouble(newcom.SplitWithBroker);
   	     
   	     }else {Cap=0.00;}
   	     
   	     newcom.TradeID=TheDealID;
   	     
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
   	       
 	     RDS.UpdateDealCommision(     Brokerid ,  TheDealID , LastCommissionID ,con); //Updating the last Deal number where the type is deal (which means the deal hasent been deleted)
 	       
 	     RDS.UpdateLastCommmissionID(  Brokerid , TheDealID , LastCommissionID ,con);   // We are updating the latest version of commission ID

	 }

	// else if(CloseDeal!=null) { RDS.ReopenTransaction( Brokerid , TheDealID ,"1")  ;  }

	 else if( ReferraldocDelete !=null ) {  
	    	
	        String Key="Mastere/ReferralFee/disclosure-agreement/disclosure-agreement-"+String.valueOf(TheDealID)+"-"+String.valueOf(Brokerid);

	    	S3.DeleteBucketInS3(Key,s3client); 
        
	    
	    }//End of ReferraldocDelete
	    
	 else if( Submitdoc!=null) {
		 
		 
         String ExtraDocumentName = request.getParameter("FileName"); 

         System.out.println("EXtraDocumentName1"+" "+ExtraDocumentName);
    
         if(ExtraDocumentName.isEmpty() ) { ExtraDocumentName="ReferralExtraDocument" ;}
    
    Part filePart2= request.getPart("FileName0");

         InputStream fileInputStream2 = filePart2.getInputStream();
    
    if(  fileInputStream2.available()==0  ) {  System.out.println("there is no file to uplaod");  } //closing of If
  
   else {
   
                 String fileName2 = filePart2.getSubmittedFileName();

                 System.out.println("Name"+"   "+fileName2);

                 String FILENAME2=ExtraDocumentName+"%"+String.valueOf( TheDealID )+"%"+String.valueOf(Brokerid);
                
                 System.out.println("FILENAME2"+" "+FILENAME2);
     
                 S3. UploadToS3( TheDealID , "probroker/Mastere/ReferralFee/Extra-Documents", fileInputStream2, filePart2 , FILENAME2 ,s3client);
    
    } //Closing else 
    	 
		 
		 
	 }
	 
	 
	    else if(Submitnote!=null) {
	    	
		    String ExteraNotes=request.getParameter("allNotesDocuments");
	    	
	        System.out.println("ExteraNotes"+" "+ExteraNotes);
	        
	        
	        if ( !ExteraNotes.isEmpty() || ExteraNotes!="" || ExteraNotes!=null ) {
	        	
	        	
	        	
		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 

	        	
	        	AuditTrail auditRecord=new AuditTrail(
	        			
	        			
	       			 0,  TheDealID,  ExteraNotes,  formatter.format(date),  "Note",	  Brokerid ,  UserID ,  MyInformation.Firstname+" "+ MyInformation.Lastname );
	        			
	        			
	        			
	        			
	        	RDS.AddNewAudit( auditRecord,con); 		
	        	
	        	
	        	
	        }	
	    	
	    }
	 
	 
	 else {

//****************************************************************************************************************************************************************************************************************************************************************		
		
		String OfficeLeadAllocatonPercentage = request.getParameter("ReferralOfficeLeadAllocatonPercentage");
		
	     int OfficeLeadAllocatonAgaint =0;
		
		if( request.getParameter("ReferralOfficeLeadAgainstCap")==null ) {
			
			OfficeLeadAllocatonAgaint=0;	AddAgaintCap="0";    AddAgaintCapDS="0";
			
		}else{ OfficeLeadAllocatonAgaint=1; AddAgaintCap="1";    AddAgaintCapDS="0";}
		

		
//****************************************************************************************************************************************************************************************************************************************************************		
		
		//Getting the agent's IDs 
		
		int FirstAgentID=0;
		
		int SecondAgentID=0;
		
	    String ReferralFirstAgentName= request.getParameter("FirstAgentID");
	    
	    System.out.println( "AgentName"+" "+ ReferralFirstAgentName ) ;
	    	    
	    if( ReferralFirstAgentName==null || ReferralFirstAgentName.equals("") || ReferralFirstAgentName.isEmpty() ) { FirstAgentID=0; }
	    
	    
	    else {
	    
	      String Agent1= ReferralFirstAgentName.replaceAll("[^0-9]", "");  FirstAgentID=Integer.parseInt(Agent1);

	    }
	    
	    
	    System.out.println( " First Agent ID"+" "+ FirstAgentID ) ;
	    
	    
	    String ReferralsecondAgentName= request.getParameter("SecondAgentID");
	    
	    String AddAgent= request.getParameter("AddSecondAgentCheckBox");
	    
	    if(ReferralsecondAgentName==null || ReferralsecondAgentName.equals("") ||  ReferralsecondAgentName.isEmpty() ) { SecondAgentID=0; ReferralsecondAgentName="0"; }else {

	    	String Agent2= ReferralsecondAgentName.replaceAll("[^0-9]", "");  SecondAgentID=Integer.parseInt(Agent2);
	    	
		}
	    
	    
	    System.out.println( " Second  Agent ID"+" "+ SecondAgentID ) ;
	    
	    
        Timestamp PropertyListingDate=null;
   	    
	    String PropertyClosingDate="";
	    
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

	    String ReferralFeeNote=request.getParameter("ReferralExplanation");

	    String ProgressMark=request.getParameter("progressMarks");
	    
	    Timestamp  CreateDate=null;
	    
	    Timestamp  FinalizedDate=null;
	    
		Timestamp InvoiceDate =null; 
	    
	    String ExteraNotes=request.getParameter("allNotesDocuments");
	    
//****************************************************************************************************************************************************************************************************************************************************************		
		
		String ReferralDealType = request.getParameter("ReferralDealType");
		
		String ReferralFeeAmount = request.getParameter("ReferralFee");
		
		String ReferralSource = request.getParameter("ReferralSource");
		
	    Timestamp ReferralCompletetionDate=null;
	    
	    Date theReferralCompletetionDate=null;
	    
		try {
			
			if( request.getParameter("ReferralDate").isEmpty() ) {       }else {
				
			theReferralCompletetionDate = new SimpleDateFormat("dd MMM yyyy HH:mm:ss" , Locale.US ).parse( request.getParameter("ReferralDate")+" "+"00:00:00");
			
		    System.out.println("Closing Date"+" "+theReferralCompletetionDate);
			
			ReferralCompletetionDate=new Timestamp(theReferralCompletetionDate.getTime());
			
			}
		} catch (ParseException e2) {

			e2.printStackTrace();
		}
		
		String ReferralPropertyType= request.getParameter("ReferralPropertyType");

		String ReferralFirstAgentCommissionPercentage= request.getParameter("FirstAgentCommissionPercentage");
		
		String ReferralSecondAgentCommissionPercentage= request.getParameter("SecondAgentCommissionPercentage");

		String ReferralNotes= request.getParameter("ReferralExplanation");

		String DiscloseToALLParties=" ";
		
		DiscloseToALLParties= request.getParameter("ReferralDiscloseYES");
		
		if( DiscloseToALLParties==null ) { DiscloseToALLParties="0"; }else {  DiscloseToALLParties="1";  }
		
        //Getting the Clients Information
		
        String ReferralClientType1 = request.getParameter("ClientType1");
		
		String ReferralClientBusinessName1 = request.getParameter("ClientBusinessName1");
		
		String ReferralClientSigningOfficer1 = request.getParameter("ClientSigningOfficere1");
		
		String ReferralClientFirstName1= request.getParameter("ClientFirstName1");
		
		String ReferralClientLastName1 = request.getParameter("ClientLastName1");

		String ReferralClientUnit1 = request.getParameter("ClientUnitNumber1");
		
		String ReferralClientStreetNumber1= request.getParameter("ClientStreetNumber1");
		
		String ReferralClientStreetName1= request.getParameter("ClientStreetName1");
		
		String ReferralClientCity1= request.getParameter("ClientCity1");
		
		String ReferralClientPostalCode1= request.getParameter("ClientPostalCode1");
		
		String ReferralClientProvince1= request.getParameter("ClientProvince1");
		
		String ReferralClientCountry1= request.getParameter("ClientCountry1");
		
		String ReferralClientEmail1= request.getParameter("ClientEmail1");
		
	    String ReferralClientPhone1= request.getParameter("ClientPhone1");
		
	    String ReferralClientExtraContact1= request.getParameter("ClientExteraContactInformationLabel1");
	    
	    String ReferralClientExtraContactNumber1= request.getParameter("ClientExteraContact1");
	    
	    String ReferralClientOtherProvince1= request.getParameter("ClientOtherProvince1");
	    
	    String ReferralClientPowerofattorney1=request.getParameter(" ");
	    
	    String MainClinetProvince1="";

	    if( ReferralClientProvince1.equals("Other") ) {  MainClinetProvince1=ReferralClientOtherProvince1;  }else {
	    	
	    	MainClinetProvince1=ReferralClientProvince1;  }

	    //------------------------------------------------------------------------------------------------------

	    String ReferralClientType2 = request.getParameter("ClientType2");
		
	    String ReferralClientBusinessName2 = request.getParameter("ClientBusinessName2");
	  		
	    String ReferralClientSigningOfficer2= request.getParameter("ClientSigningOfficere2");
	  		
	    String ReferralClientFirstName2= request.getParameter("ClientFirstName2");
	   		
	    String ReferralClientLastName2 = request.getParameter("ClientLastName2");

	    String ReferralClientUnit2 = request.getParameter("ClientUnitNumber2");
	  		
	    String ReferralClientStreetNumber2= request.getParameter("ClientStreetNumber2");
	  		
	    String ReferralClientStreetName2= request.getParameter("ClientStreetName2");
	  		
	    String ReferralClientCity2= request.getParameter("ClientCity2");
	  		
	    String ReferralClientPostalCode2= request.getParameter("ClientPostalCode2");
	  		
	    String ReferralClientProvince2= request.getParameter("ClientProvince2");
	   		
	    String ReferralClientCountry2= request.getParameter("ClientCountry2");
	  		
	    String ReferralClientEmail2= request.getParameter("ClientEmail2");
	  		
	    String ReferralClientPhone2= request.getParameter("ClientPhone2");
	  		
	    String ReferralClientExtraContact2= request.getParameter("ClientExteraContactInformationLabel2");
	  	    
	    String ReferralClientExtraContactNumber2= request.getParameter("ClientExteraContact2");
	    
	    String ReferralClientOtherProvince2= request.getParameter("ClientOtherProvince2");
	    
	    String ReferralClientPowerofattorney2=request.getParameter(" ");
	    
	    String MainClinetProvince2="";
	    
	    if(ReferralClientProvince2!=null ) {

	    if( ReferralClientProvince2.equals("Other") ) {  MainClinetProvince2=ReferralClientOtherProvince2;  }else {
	    	
	    	MainClinetProvince2=ReferralClientProvince2;   }
	    
	    }else { MainClinetProvince2=""; }

 //****************************************************************************************************************************************************************************************************************************************************************		
			    
	   //Getting the Owner Information
			
	   String ReferralSourceType1 = request.getParameter("ReferralSourceType1");
			
	   String ReferralSourceBusinessName1 = request.getParameter("ReferralSourceBusinessName1");
			
	   String ReferralSourceSigningOfficer1 = request.getParameter("ReferralSourceSigningOfficere1");
			
	   String ReferralSourceFirstName1= request.getParameter("ReferralSourceFirstName1");
			
	   String ReferralSourceLastName1 = request.getParameter("ReferralSourceLastName1");

	   String ReferralSourceUnit1 = request.getParameter("ReferralSourceUnitNumber1");
			
	   String ReferralSourceStreetNumber1= request.getParameter("ReferralSourceStreetNumber1");
			
	   String ReferralSourceStreetName1= request.getParameter("ReferralSourceStreetName1");
			
	   String ReferralSourceCity1= request.getParameter("ReferralSourceCity1");
			
	   String ReferralSourcePostalCode1= request.getParameter("ReferralSourcePostalCode1");
			
	   String ReferralSourceProvince1= request.getParameter("ReferralSourceProvince1");
			
	   String ReferralSourceCountry1= request.getParameter("ReferralSourceCountry1");
			
	   String ReferralSourceEmail1= request.getParameter("ReferralSourceEmail1");
			
	   String ReferralSourcePhone1= request.getParameter("ReferralSourcePhone1");
			
	   String ReferralSourceExtraContact1= request.getParameter("ReferralSourceExteraContactInformationLabel1");
		    
	   String ReferralSourceExtraContactNumber1= request.getParameter("ReferralSourceExteraContact1");

	   String ReferralOwnerOtherProvince1= request.getParameter("ReferralOtherProvince1");
	   
	   String ReferralSourcePowerofattorney1=request.getParameter(" ");
	   
	   String MainOwnerProvince1="";

	   if( ReferralSourceProvince1.equals("Other") ) {  MainOwnerProvince1=ReferralOwnerOtherProvince1;  }else {
	    	
	    	MainOwnerProvince1=ReferralSourceProvince1;   }
	    
	   
 //*******************************************************************************************************************************************************************************	   
	   
	   //Getting the Referral Invoice Information

	   String ReferralInvoiceReciverFirstName= "";
	   
	   String ReferralInvoiceReciverLastName="";

	   if( ReferralSourceBusinessName1.isEmpty() || ReferralSourceBusinessName1==null )  {
		   
		   ReferralInvoiceReciverFirstName= ReferralSourceFirstName1;
		   
		   ReferralInvoiceReciverLastName=ReferralSourceLastName1;   }
	   
	   else {
		   
	    	String s = ReferralSourceSigningOfficer1;
	    	
	    	String[] FullName= s.split("\\s+");
	    	
	    	int size=FullName.length;
	    	
		    ReferralInvoiceReciverFirstName= FullName[0];
		    
			if( size==1 ) { ReferralInvoiceReciverLastName="";}
		   
			else { ReferralInvoiceReciverLastName=FullName[1];} 
		   
	   }

	   String ReferralInvoiceUnit =ReferralClientUnit1;
			
	   String ReferralInvoiceStreetNumber=ReferralClientStreetNumber1;
			
	   String ReferralInvoiceStreetName=ReferralClientStreetName1;
			
	   String ReferralInvoiceCity=ReferralClientCity1;
			
	   String ReferralInvoicePostalCode=ReferralClientPostalCode1;
			
	   String ReferralInvoiceProvince=ReferralClientProvince1;
			
	   String ReferralInvoiceCountry= ReferralClientCountry1;
	   
		
	   String Parties1=request.getParameter("HiddenInvoiceClients");
	   
	  // System.out.println(request.getParameter("hiddenInvoiceDate"));


	   
		/*try {
			
			if( request.getParameter("hiddenInvoiceDate")==null ) { InvoiceDate=null; }else {
			
			   InvoiceDate = (Timestamp) new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("hiddenInvoiceDate"));
			}
			
		} catch (ParseException e1) {
	
			e1.printStackTrace();
		}*/
		
		
		
	   
	   String ReferralInvoiceFee=ReferralFeeAmount;
	   
	   String ReferralInvoiceHST= request.getParameter("HiddenPropertyHSTInvoice");
	   
	   System.out.println("ReferralInvoiceHST"+""+ReferralInvoiceHST);
	   
	   String ReferralInvoiceBalanceAmount= request.getParameter("HiddenBalanceInvoice");
	   
	   String ReferralInvoiceEmail= ReferralClientEmail1;
	   
//*******************************************************************************************************************************************************************************	   
	   
	   //Getting the Record Sheet Information
	   
	   
	   System.out.println("Negarrrrr");

	   String ReferralRecordSheetGrossFee= request.getParameter("BreakdownGrossFeeAmount");
	   
	   String ReferralRecordSheetGRossFeeHST= request.getParameter("BreakdownGrossFeeAmountHSTPercent");
	   
	   String ReferralRecordSheetGrossFeeTotalAmount= request.getParameter("BreakdownGrossFeeTotal");

	   String Payment1=ReferralRecordSheetGrossFee;

	   String ReferralRecordSheetAgent1Split= request.getParameter("BreakdownAgent1Split");
	   
	   String Payment2= request.getParameter("BreakdownAgent1Amount");
	   
	   String ReferralRecordSheetAgent1HST= request.getParameter("BreakdownAgent1HSTPercent");
	   
	   
	   System.out.println("Negarrrrr");

	   System.out.println(ReferralRecordSheetGRossFeeHST);
	   
	   System.out.println(ReferralRecordSheetAgent1HST);
	   
	   String ReferralRecordSheetAgent1TotalCommission= request.getParameter("BreakdownAgent1Total");

	   String ReferralRecordSheetAgent2Split= request.getParameter("BreakdownAgent2Split");
	   
	   String Payment3= request.getParameter("BreakdownAgent2Amount");
	   
	   String ReferralRecordSheetAgent2HST= "0.00%";//request.getParameter("BreakdownAgent2HSTPercent");
	   
	   String ReferralRecordSheetAgent2TotalCommission= request.getParameter("BreakdownAgent2Total");
	   
	   String ReferralRecordSheetNetFee= request.getParameter("BreakdownNetFee");
	   
	   String ReferralRecordSheetNetHST= request.getParameter("BreakdownNetHST");
	   
	   String ReferralRecordSheetNetTotal= request.getParameter("BreakdownNetTotal");
	   
	   
	   Users Agent1=new Users();
	   
	   Agent1=RDS.GetAnyUserById(FirstAgentID,con);
	   
	   Users Agent2=new Users();
	   
	   Agent2=RDS.GetAnyUserById(SecondAgentID,con);
	   
	   String  TRSRecordSheetAgent1Cap=Agent1.User_Cap;
	   
	   String  TRSRecordSheetAgent2Cap=Agent2.User_Cap;

	   
//*******************************************************************************************************************************************************************************	   

	   //Getting the current Broker and the user Type(if it is Broker , Agent or Admin )

	      //Here We are checking the type of the user who are creating the deal ,
	      
	      //If it is 1 means , its a broker , so we do not need agents approval automatically the deal is approved by both agents
	      
	      //If it is 2 , it means it is an Agent who is creating the deal.So we have to check if there is second agent to approve before the broker approves .if there is no second agent we need broker approval
	      
	      //If it is 3 ,it means it is an admin who are creating the deal. So we need first agents to approve the deal.
	      
	      String BerokerSign="0";
	      
	      String AgentSign1="0";
	    
	      String AgentSign2="0";
	      
	      String TransactionStatus="";
	      
		    ArrayList<ExtraDocuments> Documents=new ArrayList<ExtraDocuments>();
		    
		    Documents=S3.SearchExtraFilesfroms3("Mastere/ReferralFee/Extra-Documents/",Brokerid,TheDealID,s3client); 
	      
		    for(int counter=0; counter< Documents.size() ; counter++ ) {
		    	
		    	
		    	
			    String ExtradocDelete=request.getParameter("ExtradocDelete"+counter);	
			    
			    
			    if(ExtradocDelete!=null) {  S3.DeleteBucketInS3( "Mastere/ReferralFee/Extra-Documents/"+Documents.get(counter).Name+"%"+String.valueOf( TheDealID )+"%"+String.valueOf(Brokerid) ,s3client);   System.out.println("Delete"); }else {}
		    	
		    	
		    }
		    

		    
		    
		    ArrayList<AuditTrail> Notes=new ArrayList<AuditTrail>();
		    
		    Notes=RDS.SearchAuditTrail(  TheDealID ,  Brokerid ,"Note" ,con); 
	      
		    for(int counter=0; counter< Notes.size() ; counter++ ) {

			    String ExtraNoteDelete=request.getParameter("Deletenote"+counter);	
			    
			    

			    
			    if(ExtraNoteDelete!=null) {  RDS.DeletAudit(    Brokerid , "Note" ,TheDealID,  Notes.get(counter).ID ,con  ) ;   }else {}
		    	
		    	
		    }
		    
	      if(Finilize!=null) {
	
	         if(  AuthorType==1 ) {

	    	        BerokerSign="1"; AgentSign1="1"; AgentSign2="1"; TransactionStatus="Complete"; }
	      
	      
	          else if( AuthorType==3 ){
	    	  
	    	       BerokerSign="0" ;  AgentSign1="0";
	    	  
	    	       if( request.getParameter("AddAgent")==null ) { AgentSign2="1"; }else { AgentSign2="0";  }
	    	  
	    	        TransactionStatus="Needs First Agent Approval"; }

	          else {
	    	  
	    	        BerokerSign="0" ;
	    	  
	    	        AgentSign1="1";
	    	  
	    	        if( request.getParameter("AddAgent")==null ) { AgentSign2="1";  TransactionStatus="Needs Broker Approval";}
	    	  
	    	          else { AgentSign2="0"; 	TransactionStatus="Needs Second Agent Approval"; }
	  
	    	       }
	      } else {   BerokerSign="0";   AgentSign1="0";  AgentSign2="0";  TransactionStatus="Incomplete"; }


		   
		   //Creating a object of deal information to save to the data base /
	      
	      
	        String Province= MyInformation.User_Province ;

	    	String HST="0.00";
	    

	    	if(Province.equals("AB") || Province.equals("BC") || Province.equals("MB")  || Province.equals("NWT") || Province.equals("NU") || Province.equals("QC") || Province.equals("SK") || Province.equals("YT") ){ 

	    		HST="5.00"+"%";  }

	    	else if(Province.equals("ON") ){ HST="13.00"+"%"; }

	    	else if(Province.equals("PE") || Province.equals("NC")  || Province.equals("NB" ) || Province.equals("NL")    ){ HST="15.00"+"%"; }

	        else if(Province.equals("Other") ){  HST="0.00"+"%";  }
	    	
	    	System.out.println("HST is"+" "+HST);
	      
	      
	      RecordSheet Record=new RecordSheet();
	      
	      int CheckDeal=0;
	      

		   
		    if( NewDeal.id==0 ) {   
		    	
		       CheckDeal=0;

		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 SimpleDateFormat formattertime = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		         Date date = new Date( ); 
		    	 
			     CreateDate=Timestamp.valueOf(formatter.format(date));  
			     
			     System.out.println("CreateDate"+" "+CreateDate);

			     
			     if (Permanant=="1" ) {	 FinalizedDate=Timestamp.valueOf(formattertime.format(date)); }else { FinalizedDate=null; }

	            NewDeal=new Transaction(
	    	    		
	        	TheDealID,AuthorType,Author,Brokerid,"","","", "",
				
				"","","", ReferralPropertyType ,FirstAgentID,SecondAgentID,ReferralFirstAgentCommissionPercentage, 
				 
				ReferralSecondAgentCommissionPercentage, ReferralFeeAmount , ReferralSource , ReferralDealType , PropertyListingDate ,ReferralCompletetionDate ,OfferExpiretionDate, "0.00",
				 
				"0.00", "PropertyStatus", AgentSign1, AgentSign2, BerokerSign, TransactionStatus, OfficeLeadAllocatonPercentage , OfficeLeadAllocatonAgaint,
				 
				"", 0,"", 0,"Note",Permanant,ReferralFeeNote,"Role1", "Role2","Referral Fee",OfferDate,OfferExpiretionDate,OfferAcceptanceDate,ConditionExpirationDate,	ConditionCompletationDate ,OfferWithrawalDate, InspectionDate, AccupancyDate,OffMarketDate ,ProgressMark,CreateDate,FinalizedDate,0,0);

		    	RDS.NEWTransaction( NewDeal ,con);	 
		    	
		    	RDS.UpdateCompanyTransaction( TheDealID ,  Brokerid ,con) ;  
		    	
		       // RDS.UpdateCompanyTemp( 0 , Brokerid ) ; 

			 	  Record=new RecordSheet(

           	    		     0 ,  TheDealID ,  "RefoundAmount" ,   "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

				 			  Agent1.User_Split ,Agent1.User_Split2, Agent1.User_Split3, Agent2.User_Split ,Agent2.User_Split2, Agent2.User_Split3,

				 			  "100.00","0.00" ,ReferralRecordSheetNetFee ,  ReferralRecordSheetNetHST ,  ReferralRecordSheetNetTotal ,  HST ,  HST , HST,

				 			  "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" ,"HST9","HST10" , " 0.00" ,  "0.00" ,"0.00" ,

				 			  "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00",Brokerid , Agent1.User_Cap , Agent1.User_Cap2, Agent1.User_Cap3, Agent2.User_Cap , Agent2.User_Cap2, Agent2.User_Cap3 , CurrentCompanies.CommissionBankNumber, CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber  );
			 	   
			 	   
			 	            RDS.NewTradeRecordes(Record ,con);
			 	            
			 	            
				 	      CommissionDetails com=new CommissionDetails();
			
			 	           
				   	      SimpleDateFormat formatter1 = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
				   	       
				   	      String Date=formatter1.format(date);    
				 	           
				 	      com.TradeID=TheDealID;
				 	   	 
				 	      com.BrokerID=Brokerid;
				 	   	 
				 	      com. AgentId=Brokerid;
				 	      
				 	      com. Status="Deal";
	
				 	      com. Date=new Timestamp(date.getTime());
				 	      
				 	      com. AddtoCap="0";
				 	      
				 	      com. AddtoCapDS="0";
				 	      
				 	      com. Finalized="0";
				 			
				 	      int LastCommissionID=RDS.AddCommissionDetails(com,con);
				 	      
				 	      RDS.UpdateLastCommmissionID(  Brokerid , TheDealID , LastCommissionID,con );   // We are updating the latest version of commission ID
				 	      
				 	      RDS.UpdateDealCommision( Brokerid , TheDealID , LastCommissionID,con );

				 	     InvoiceDate =CreateDate;
		    }

		    else {   
		    	
		    	   CheckDeal=1;
		    	 
		    	  // SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		    	   SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

		           Date date = new Date( ); 
		    	
		    	   String NewPermanant="";

			    	  Timestamp NewFinalizedDate=null;

			          if ( NewDeal.Permanent.equals("1") ) { NewPermanant="1" ;  } else {  NewPermanant=Permanant; } 
			        
			          if ( NewDeal.Permanent.equals("0") && Permanant.equals("1") ) { 

			        	    FinalizedDate=Timestamp.valueOf(dateFormat.format(date));    NewPermanant="1";  } 
			          
			          else {  FinalizedDate=NewDeal.FinalizedDate; } 
			          
			          
						if(Integer. parseInt(NewDeal.progressMarks) >= Integer. parseInt(ProgressMark) ) {

							FinalProgressMark=NewDeal.progressMarks; }else { FinalProgressMark=ProgressMark; }
			          
	               NewDeal=new Transaction(
	    	    		
	            			TheDealID,AuthorType,Author,Brokerid,"","","", "",
	        				
	        				"","","", ReferralPropertyType ,FirstAgentID,SecondAgentID,ReferralFirstAgentCommissionPercentage, 
	        				 
	        				ReferralSecondAgentCommissionPercentage, ReferralFeeAmount , ReferralSource , ReferralDealType , PropertyListingDate ,ReferralCompletetionDate,OfferExpiretionDate, "0.00",
	        				 
	        				"0.00", "PropertyStatus", AgentSign1, AgentSign2, BerokerSign, TransactionStatus, OfficeLeadAllocatonPercentage , OfficeLeadAllocatonAgaint,
	        				 
	        				"", 0,"", 0,"Note",NewPermanant,ReferralFeeNote,"Role1", "Role2","Referral Fee",OfferDate,OfferExpiretionDate,OfferAcceptanceDate,ConditionExpirationDate,	ConditionCompletationDate ,OfferWithrawalDate, InspectionDate, AccupancyDate,OffMarketDate ,FinalProgressMark,NewDeal.CreateDate,NewFinalizedDate,
                            NewDeal.LastCommissionID, NewDeal.LastCommissionDealID);

	               Record =RDS.SearchTradeRecordes( TheDealID , Brokerid ,con) ;
	            
	               if(Record.ID==0) {

	              	     Record=new RecordSheet(
				 			   
	              	    		 0 ,  TheDealID ,  "RefoundAmount" ,   "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

					 			  Agent1.User_Split ,Agent1.User_Split2, Agent1.User_Split3, Agent2.User_Split ,Agent2.User_Split2, Agent2.User_Split3,

					 			 "100.00","0.00" ,ReferralRecordSheetNetFee ,  ReferralRecordSheetNetHST ,  ReferralRecordSheetNetTotal ,  HST ,  HST , HST,

					 			 "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" , "HSt9","HST10", " 0.00" ,  "0.00" ,"0.00" ,

					 			 "0.00" ,  "0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00" , Brokerid ,Agent1.User_Cap , Agent1.User_Cap2, Agent1.User_Cap3, Agent2.User_Cap , Agent2.User_Cap2, Agent2.User_Cap3 , CurrentCompanies.CommissionBankNumber, CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber  );
			 	   
			 	   
			 	           RDS.NewTradeRecordes(Record,con);    }else {
			 	        	   
			 	        	   
                        	   if(Payment1==null || Payment1.isEmpty() ) { Payment1= Record.Payment1 ;} else{   Payment1=ReferralFeeAmount;  }
                        	   
                        	   if(Payment2==null || Payment2.isEmpty() ) { Payment2= Record.Payment2 ;} else{   Payment2=request.getParameter("BreakdownAgent1Amount"); }    
                        	   
                        	   if(Payment3==null || Payment3.isEmpty() ) { Payment3= Record.Payment3 ;} else{   Payment2=request.getParameter("BreakdownAgent2Amount"); }   
			 	        	   
			 	        	   
			 	        	   
			 	           }
	            	

                System.out.println("the Deal exist and we updating");  
                
                InvoiceDate = NewDeal.CreateDate;
                    
		    }
		    

 //*******************************************************************************************************************************************************************************	    

	   
	   /* if( Finilize!=null ) {  
	    	  
	    	        RDS.UpdateTransaction( NewDeal ) ; 
	    	        
				    RDS.NEWPatry(ReferralClientType1,ReferralClientBusinessName1,ReferralClientSigningOfficer1,ReferralClientFirstName1,ReferralClientLastName1 ,ReferralClientStreetName1,
		    		ReferralClientStreetNumber1 , ReferralClientUnit1,ReferralClientCity1,MainClinetProvince1,ReferralClientPostalCode1,ReferralClientCountry1,ReferralClientPhone1,ReferralClientExtraContact1,
		    		ReferralClientExtraContactNumber1,ReferralClientEmail1, "Client", TheDealID);
		    
		            if(     !ReferralClientBusinessName2.isEmpty() || !ReferralClientSigningOfficer2.isEmpty() || !ReferralClientFirstName2.isEmpty() || !ReferralClientLastName2.isEmpty() ||
				    		 
				    		 
				    		 !ReferralClientUnit2.isEmpty() || !ReferralClientStreetNumber2.isEmpty() ||  !ReferralClientStreetName2.isEmpty() 	||  !ReferralClientCity2.isEmpty() || !ReferralClientPostalCode2.isEmpty()||
				    		 
				    		 !ReferralClientEmail2.isEmpty() || !ReferralClientPhone2.isEmpty() || ! ReferralClientExtraContactNumber2.isEmpty()) {
		    
		            RDS.NEWPatry(ReferralClientType2,ReferralClientBusinessName2,ReferralClientSigningOfficer2,ReferralClientFirstName2,ReferralClientLastName2 ,ReferralClientStreetName2,
		    		ReferralClientStreetNumber2 , ReferralClientUnit2,ReferralClientCity2,MainClinetProvince2,ReferralClientPostalCode2,ReferralClientCountry2,ReferralClientPhone2,ReferralClientExtraContact2,
		    		ReferralClientExtraContactNumber2,ReferralClientEmail2, "Client", TheDealID);}else {}
		    
		    
		            RDS.NEWPatry(ReferralSourceType1,ReferralSourceBusinessName1,ReferralSourceSigningOfficer1,ReferralSourceFirstName1,ReferralSourceLastName1 ,ReferralSourceStreetName1,
		    		ReferralSourceStreetNumber1 , ReferralSourceUnit1,ReferralSourceCity1,ReferralSourceProvince1,ReferralSourcePostalCode1,ReferralSourceCountry1,ReferralSourcePhone1,ReferralSourceExtraContact1,
		    		ReferralSourceExtraContactNumber1,ReferralSourceEmail1, "Source", TheDealID);

	    	
	    } */
		    

			   
	    	ArrayList<Parties> MyClients = new ArrayList<Parties>();
	    	
	    	MyClients=RDS.SearchParties(  TheDealID ,"Client" , Brokerid ,con ) ;

	    	RDS.UpdateTransaction( NewDeal,con );

	    	int ClientSize=MyClients.size();
	    	
	    	ArrayList<Parties> MyOwner = new ArrayList<Parties>();
	    	
	    	MyOwner=RDS.SearchParties(  TheDealID ,"Source" , Brokerid ,con) ;

	    	RDS.UpdateTransaction( NewDeal ,con);

	    	int OwnerSize=MyOwner.size();
	    	
	    	System.out.println("Client Size"+" "+ClientSize);
	    	
	    	Invoice  myinvoice=RDS.SearchInvoiceByTransactionID( TheDealID, Brokerid ,con);

	    
	    if(  Save!=null || Finilize!=null ||  TransactionSave !=null  ||  ClientSave!=null  ||  InvoiceSave!=null  || ReferralSourceSave!=null   || ReferralFeeRecordSheetSave!=null  || DocumentsSave!=null  ) {  	 

	
    	RDS.UpdateTransaction( NewDeal ,con);
    	
        //Here we are adding the deal information to the data base 

    	//If the size is 0 it means that there is no client related to this deal so we will add the informations


    	
	    if(ClientSize==0) {
    		
            if(!ReferralClientBusinessName1.isEmpty() || !ReferralClientSigningOfficer1.isEmpty() || !ReferralClientFirstName1.isEmpty() || !ReferralClientLastName1.isEmpty() ||

   		 !ReferralClientUnit1.isEmpty() || !ReferralClientStreetNumber1.isEmpty() ||  !ReferralClientStreetName1.isEmpty() 	||  !ReferralClientCity1.isEmpty() || !ReferralClientPostalCode1.isEmpty()||
   		 
   		 !ReferralClientEmail1.isEmpty() || !ReferralClientPhone1.isEmpty() || ! ReferralClientExtraContactNumber1.isEmpty()) {

                  RDS.NEWPatry(ReferralClientType1,ReferralClientBusinessName1,ReferralClientSigningOfficer1,ReferralClientFirstName1,ReferralClientLastName1 ,ReferralClientStreetName1,
		           ReferralClientStreetNumber1 , ReferralClientUnit1,ReferralClientCity1,MainClinetProvince1,ReferralClientPostalCode1,ReferralClientCountry1,ReferralClientPhone1,ReferralClientExtraContact1,
		           ReferralClientExtraContactNumber1,ReferralClientEmail1, "Client", TheDealID, Brokerid , ReferralClientPowerofattorney1,con);
       
             }else { }

            if( !ReferralClientBusinessName2.isEmpty() || !ReferralClientSigningOfficer2.isEmpty() || !ReferralClientFirstName2.isEmpty() || !ReferralClientLastName2.isEmpty() ||

	    		 !ReferralClientUnit2.isEmpty() || !ReferralClientStreetNumber2.isEmpty() ||  !ReferralClientStreetName2.isEmpty() 	||  !ReferralClientCity2.isEmpty() || !ReferralClientPostalCode2.isEmpty()||
	    		 
	    		 !ReferralClientEmail2.isEmpty() || !ReferralClientPhone2.isEmpty() || ! ReferralClientExtraContactNumber2.isEmpty()) {

                        RDS.NEWPatry(ReferralClientType2,ReferralClientBusinessName2,ReferralClientSigningOfficer2,ReferralClientFirstName2,ReferralClientLastName2 ,ReferralClientStreetName2,
		                 ReferralClientStreetNumber2 , ReferralClientUnit2,ReferralClientCity2,MainClinetProvince2,ReferralClientPostalCode2,ReferralClientCountry2,ReferralClientPhone2,ReferralClientExtraContact2,
		                 ReferralClientExtraContactNumber2,ReferralClientEmail2, "Client", TheDealID, Brokerid,ReferralClientPowerofattorney1,con);} else {  }

       
     }//End of Size==0  

//If the size is 1 , it means there is already 1 client exist in the database related to this deal, so we have to update the information and checking for the second one

else if( ClientSize==1) { 

            if(!ReferralClientBusinessName1.isEmpty() || !ReferralClientSigningOfficer1.isEmpty() || !ReferralClientFirstName1.isEmpty() || !ReferralClientLastName1.isEmpty() ||

   		 !ReferralClientUnit1.isEmpty() || !ReferralClientStreetNumber1.isEmpty() ||  !ReferralClientStreetName1.isEmpty() 	||  !ReferralClientCity1.isEmpty() || !ReferralClientPostalCode1.isEmpty()||
   		 
   		 !ReferralClientEmail1.isEmpty() || !ReferralClientPhone1.isEmpty() || ! ReferralClientExtraContactNumber1.isEmpty()) {

                        RDS.UpdatePatry(ReferralClientType1,ReferralClientBusinessName1,ReferralClientSigningOfficer1,ReferralClientFirstName1,ReferralClientLastName1 ,ReferralClientStreetName1,
    		             ReferralClientStreetNumber1 , ReferralClientUnit1,ReferralClientCity1,MainClinetProvince1,ReferralClientPostalCode1,ReferralClientCountry1,ReferralClientPhone1,ReferralClientExtraContact1,
   		             ReferralClientExtraContactNumber1,ReferralClientEmail1, "Client", TheDealID, MyClients.get(0).ID , Brokerid,ReferralClientPowerofattorney1,con) ;
              
             }else {  RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(0).ID ,con); }
    
             if(!ReferralClientBusinessName2.isEmpty() || !ReferralClientSigningOfficer2.isEmpty() || !ReferralClientFirstName2.isEmpty() || !ReferralClientLastName2.isEmpty() ||

		         !ReferralClientUnit2.isEmpty() || !ReferralClientStreetNumber2.isEmpty() ||  !ReferralClientStreetName2.isEmpty() 	||  !ReferralClientCity2.isEmpty() || !ReferralClientPostalCode2.isEmpty()||
		    		 
		         !ReferralClientEmail2.isEmpty() || !ReferralClientPhone2.isEmpty() || ! ReferralClientExtraContactNumber2.isEmpty()) {
   
                        RDS.NEWPatry(ReferralClientType2,ReferralClientBusinessName2,ReferralClientSigningOfficer2,ReferralClientFirstName2,ReferralClientLastName2 ,ReferralClientStreetName2,
   		                ReferralClientStreetNumber2 , ReferralClientUnit2,ReferralClientCity2,MainClinetProvince2,ReferralClientPostalCode2,ReferralClientCountry2,ReferralClientPhone2,ReferralClientExtraContact2,
   		                ReferralClientExtraContactNumber2,ReferralClientEmail2, "Client", TheDealID, Brokerid, ReferralClientPowerofattorney2,con ); } else {  }
    
   }//End of ClientSize==1  

//if the size is 2 it means there are 2 clients related to this deal and we have to update them 

else if( ClientSize==2 ) {    

        if( !ReferralClientBusinessName1.isEmpty() || !ReferralClientSigningOfficer1.isEmpty() || !ReferralClientFirstName1.isEmpty() || !ReferralClientLastName1.isEmpty() ||

		     !ReferralClientUnit1.isEmpty() || !ReferralClientStreetNumber1.isEmpty() ||  !ReferralClientStreetName1.isEmpty() 	||  !ReferralClientCity1.isEmpty() || !ReferralClientPostalCode1.isEmpty()||
		 
		     !ReferralClientEmail1.isEmpty() || !ReferralClientPhone1.isEmpty() || ! ReferralClientExtraContactNumber1.isEmpty()) {

                  RDS.UpdatePatry(ReferralClientType1,ReferralClientBusinessName1,ReferralClientSigningOfficer1,ReferralClientFirstName1,ReferralClientLastName1 ,ReferralClientStreetName1,
	    		  ReferralClientStreetNumber1 , ReferralClientUnit1,ReferralClientCity1,MainClinetProvince1,ReferralClientPostalCode1,ReferralClientCountry1,ReferralClientPhone1,ReferralClientExtraContact1,
	    		  ReferralClientExtraContactNumber1,ReferralClientEmail1, "Client", TheDealID, MyClients.get(0).ID, Brokerid,ReferralClientPowerofattorney1,con ) ;}else { RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(0).ID ,con ); }
        
     
          if(!ReferralClientBusinessName2.isEmpty() || !ReferralClientSigningOfficer2.isEmpty() || !ReferralClientFirstName2.isEmpty() || !ReferralClientLastName2.isEmpty() ||
			
   		  !ReferralClientUnit2.isEmpty() || !ReferralClientStreetNumber2.isEmpty() ||  !ReferralClientStreetName2.isEmpty() 	||  !ReferralClientCity2.isEmpty() || !ReferralClientPostalCode2.isEmpty()||
   		 
   		  !ReferralClientEmail2.isEmpty() || !ReferralClientPhone2.isEmpty() || ! ReferralClientExtraContactNumber2.isEmpty()) {

                  RDS.UpdatePatry(ReferralClientType2,ReferralClientBusinessName2,ReferralClientSigningOfficer2,ReferralClientFirstName2,ReferralClientLastName2 ,ReferralClientStreetName2,
	    		  ReferralClientStreetNumber2 , ReferralClientUnit2,ReferralClientCity2,MainClinetProvince2,ReferralClientPostalCode2,ReferralClientCountry2,ReferralClientPhone2,ReferralClientExtraContact2,
	    		  ReferralClientExtraContactNumber2,ReferralClientEmail2, "Client", TheDealID ,MyClients.get(1).ID , Brokerid,ReferralClientPowerofattorney2 ,con ) ;}else { RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(1).ID ,con );  }

           }//End of Size==2



if( OwnerSize==0) {

    if(!ReferralSourceBusinessName1.isEmpty() || !ReferralSourceSigningOfficer1.isEmpty() || !ReferralSourceFirstName1.isEmpty() || !ReferralSourceLastName1.isEmpty() ||
		
	  !ReferralSourceUnit1.isEmpty() || !ReferralSourceStreetNumber1.isEmpty() ||  !ReferralSourceStreetName1.isEmpty() 	||  !ReferralSourceCity1.isEmpty() || !ReferralSourcePostalCode1.isEmpty()||
	 
	  !ReferralSourceEmail1.isEmpty() || !ReferralSourcePhone1.isEmpty() || ! ReferralSourceExtraContactNumber1.isEmpty()) {

               RDS.NEWPatry(ReferralSourceType1,ReferralSourceBusinessName1,ReferralSourceSigningOfficer1,ReferralSourceFirstName1,ReferralSourceLastName1 ,ReferralSourceStreetName1,
		        ReferralSourceStreetNumber1 , ReferralSourceUnit1,ReferralSourceCity1,MainOwnerProvince1,ReferralSourcePostalCode1,ReferralSourceCountry1,ReferralSourcePhone1,ReferralSourceExtraContact1,
		        ReferralSourceExtraContactNumber1,ReferralSourceEmail1, "Source", TheDealID ,Brokerid ,ReferralSourcePowerofattorney1 ,con);}else {}

   }//End of owner size 0


else if(OwnerSize==1){


if(!ReferralSourceBusinessName1.isEmpty() || !ReferralSourceSigningOfficer1.isEmpty() || !ReferralSourceFirstName1.isEmpty() || !ReferralSourceLastName1.isEmpty() ||
		
 !ReferralSourceUnit1.isEmpty() || !ReferralSourceStreetNumber1.isEmpty() ||  !ReferralSourceStreetName1.isEmpty() 	||  !ReferralSourceCity1.isEmpty() || !ReferralSourcePostalCode1.isEmpty()||

 !ReferralSourceEmail1.isEmpty() || !ReferralSourcePhone1.isEmpty() || ! ReferralSourceExtraContactNumber1.isEmpty()) {
	 

          RDS.UpdatePatry(ReferralSourceType1,ReferralSourceBusinessName1,ReferralSourceSigningOfficer1,ReferralSourceFirstName1,ReferralSourceLastName1 ,ReferralSourceStreetName1,
		   ReferralSourceStreetNumber1 , ReferralSourceUnit1,ReferralSourceCity1,MainOwnerProvince1,ReferralSourcePostalCode1,ReferralSourceCountry1,ReferralSourcePhone1,ReferralSourceExtraContact1,
		   ReferralSourceExtraContactNumber1,ReferralSourceEmail1, "Source", TheDealID,MyOwner.get(0).ID,Brokerid ,ReferralSourcePowerofattorney1,con );
          
           }else {  RDS.DeleteParty( TheDealID, Brokerid  , MyOwner.get(0).ID ,con);  }

}	//End of owner size 1

    	if(myinvoice.ID==0) {

    		
      	     Date date = new Date( ); 
        	 
       	     Timestamp InvoiveCreateDate=new Timestamp(date.getTime());
       	     
	           Invoice  NewInvoice=new Invoice( 
					   0,
					   Brokerid,
					   TheDealID,
					   "0",	
					   "INVOICE",
					   InvoiveCreateDate,
					   ReferralInvoiceReciverFirstName,
					   ReferralInvoiceReciverLastName,
					   ReferralInvoiceEmail,
					   ReferralInvoiceUnit,
					   ReferralInvoiceStreetName,
					   ReferralInvoiceStreetNumber,
					   ReferralInvoiceCity,
					   ReferralInvoiceProvince,
					   ReferralInvoicePostalCode,
					   ReferralInvoiceCountry,
					   ReferralInvoiceFee,
					   "",	
					   ReferralInvoiceHST,	
					   "",
					   ReferralInvoiceBalanceAmount,	
					   new Timestamp( ReferralCompletetionDate.getTime() ),
					   
					   
					   "",""
					   
	        		   );
		   
			        RDS.NEWInvoice( NewInvoice,con );
    	}   
    	
    	else {

    		
			   Invoice  NewInvoice=new Invoice( 
					   
					
					   myinvoice.ID,
					   Brokerid,
					   TheDealID,
					   "0",	
					   "INVOICE",
					   myinvoice.Date,
					   ReferralInvoiceReciverFirstName,
					   ReferralInvoiceReciverLastName,
					   ReferralInvoiceEmail,
					   ReferralInvoiceUnit,
					   ReferralInvoiceStreetName,
					   ReferralInvoiceStreetNumber,
					   ReferralInvoiceCity,
					   ReferralInvoiceProvince,
					   ReferralInvoicePostalCode,
					   ReferralInvoiceCountry,
					   ReferralInvoiceFee,
					   "",	
					   ReferralInvoiceHST,	
					   "",
					   ReferralInvoiceBalanceAmount,	
					   new Timestamp( ReferralCompletetionDate.getTime()), 
					   
					   
					   Parties1,"" 
					   
					   );
			   
			   
			           RDS.UpdateInvoice( NewInvoice ,con);	   }
    	
    	
    	
    	
        Part filePart1= request.getPart("ReferralDisclosureAgreementDocument");

        InputStream fileInputStream1 = filePart1.getInputStream();

        if( fileInputStream1.available()==0) {  System.out.println("there is no file to uplaod");  } //closing of If

         else {

               String fileName1 =filePart1.getSubmittedFileName();

               System.out.println("Name"+"   "+fileName1);
  
               String FILENAME1="disclosure-agreement"+"-"+String.valueOf(TheDealID)+"-"+String.valueOf(Brokerid);

               S3. UploadToS3( TheDealID , "probroker/Mastere/ReferralFee/disclosure-agreement", fileInputStream1, filePart1 , FILENAME1 ,s3client);

       }//Closing else
        
        
        
	         String ExtraDocumentName = request.getParameter("FileName"); 

	         System.out.println("EXtraDocumentName1"+" "+ExtraDocumentName);
	    
	         if(ExtraDocumentName.isEmpty() ) { ExtraDocumentName="ReferralExtraDocument" ;}
	    
        Part filePart2= request.getPart("FileName0");

	         InputStream fileInputStream2 = filePart2.getInputStream();
	    
        if(  fileInputStream2.available()==0  ) {  System.out.println("there is no file to uplaod");  } //closing of If
      
       else {
	   
	                 String fileName2 =filePart2.getSubmittedFileName();

	                 System.out.println("Name"+"   "+fileName2);

	                 String FILENAME2=ExtraDocumentName+"%"+String.valueOf( TheDealID )+"%"+String.valueOf(Brokerid);
	                
	                 System.out.println("FILENAME2"+" "+FILENAME2);
	     
	                 S3. UploadToS3( TheDealID , "probroker/Mastere/ReferralFee/Extra-Documents", fileInputStream2, filePart2 , FILENAME2 ,s3client);
	    
        } //Closing else 
        

        
		   


        System.out.println("ExteraNotes"+" "+ExteraNotes);
        
        
        if ( !ExteraNotes.isEmpty() || ExteraNotes!="" || ExteraNotes!=null ) {
        	
        	
        	
	    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	    	 
	         Date date = new Date( ); 

        	
        	AuditTrail auditRecord=new AuditTrail(
        			
        			
       			 0,  TheDealID,  ExteraNotes,  formatter.format(date),  "Note",	  Brokerid ,  UserID ,  MyInformation.Firstname+" "+ MyInformation.Lastname );
        			
        			
        			
        			
        	RDS.AddNewAudit( auditRecord ,con ); 		
        	
        	
        	
        }
        

        
        if( CheckFinalize==1 ) {

    	          System.out.println("Finalized ");
    
        	      double CapReached=0.00;
        	      
        	      System.out.println("ReferralSource"+" "+ReferralSource);
   
        	
        	      if ( ReferralSource.equals("Agent-lead") ){ 
        	    	  
        	    	  System.out.println("Here Yohoooo");

            	      System.out.println("ReferralRecordSheetNetFee"+" "+Double.parseDouble(ReferralRecordSheetNetFee.replace(",","")));

            	      System.out.println("Company Temp"+" "+Double.parseDouble(myCompany.Temp.replace(",","")));

        	    	  CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(ReferralRecordSheetNetFee.replace(",",""));

        	      }
        	   
        	      else {
        	    	  
        	    	    System.out.println("Here Yohoooo88888");
        		   
	                    if( OfficeLeadAllocatonAgaint==1 ){ 
	                    	
	                    	
	                        CapReached=Double.parseDouble(myCompany.Temp.replace(",",""))+Double.parseDouble(ReferralRecordSheetNetFee.replace(",",""));  
	              
	                    
	                    
	                    }
          		 
	                    else { /* do no thing  */ }   
        	     }
        	      
        	      System.out.println("CapReached"+" "+CapReached);

        	      RDS. UpdateCompanyTemp( String.valueOf(CapReached), Brokerid ,con); 
        	      
        	      System.out.println("Updated the Company Temp CapReached ");
        	      
        	      CommissionDetails  mycom = RDS.SearchSpesificCommission(  TheDealID  , NewDeal.LastCommissionDealID ,con);
        	      
        	      System.out.println("mycom.ID"+" "+mycom.ID );
        	   
        	      CommissionDetails  FinalizedCom=new CommissionDetails(
        				
        	    		     mycom.ID, ReferralPropertyType, ""+"-"+""+","+""+","+""+","+"", FinalizedDate, new Timestamp(ReferralCompletetionDate.getTime()), ReferralFeeAmount ,
	   					 
	   		    		     Payment1, "0.00", "0.00",ReferralFeeAmount,ReferralRecordSheetAgent1Split, Payment2, "0.00", 
	   					 
	   					     "0.00", Payment2,ReferralRecordSheetNetFee,"Balance", AddAgaintCap, AddAgaintCapDS, String.valueOf(CapReached), Brokerid,  Brokerid, TheDealID,  Permanant ,"Deal")  ;      
                  
                    RDS. UpdateCommissionDetails( FinalizedCom ,con);
                    
                    
                    

                    
                    
                   // System.out.println("ReferralRecordSheetAgent2HST"+" "+ReferralRecordSheetAgent2HST);
                    
                    

                    Record=new RecordSheet(
			     			   
		        			 Record.ID ,  TheDealID ,  "RefoundAmount" , "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

		        			 Agent1.User_Split ,Agent1.User_Split2 ,Agent1.User_Split3 , Agent2.User_Split , Agent2.User_Split2 ,Agent2.User_Split3  , "100.00" , "0.00" ,

		        			 ReferralRecordSheetNetFee ,  	 ReferralRecordSheetNetHST ,  	 ReferralRecordSheetNetTotal ,  ReferralRecordSheetGRossFeeHST , ReferralRecordSheetAgent1HST , ReferralRecordSheetAgent2HST,

		        			 "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" ,"HSt9", "HST10",  Payment1,  Payment2 , Payment3 ,

					 		 "0.00" ,  " 0.00" , "0.00" , "0.00" , "0.00" ,"0.00","0.00", Brokerid, Agent1.User_Cap, Agent1.User_Cap2 ,  Agent1.User_Cap3  , Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 ,  CurrentCompanies.CommissionBankNumber,  CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber   ); 

		        	        RDS.UpdateTradeRecordes(  Record ,con); 

        	   
        }  //End of CheckFinalize 
        
        
        else {  System.out.println("Done and finish nothing"); }              
        	
    

    	if(  CheckSave==1 || Integer. parseInt(FinalProgressMark) >= 3 )    { 
    		
    	      System.out.println("ReferralFeeRecordSheetSave");
    	      
    	      System.out.println("ReferralRecordSheetNetFee"+" "+ReferralRecordSheetNetFee);
    	      
    	      System.out.println("ReferralRecordSheetNetHST"+" "+ReferralRecordSheetNetHST);
    	      
    	      System.out.println("ReferralRecordSheetNetTotal"+" "+ReferralRecordSheetNetTotal);
    	      
    	      System.out.println("ReferralRecordSheetGRossFeeHST"+" "+ReferralRecordSheetGRossFeeHST);
    	      
              System.out.println("ReferralRecordSheetAgent1HST"+" "+ReferralRecordSheetAgent1HST);
    	      
    	      System.out.println("Payment2"+" "+Payment2);
    	      

    	      
    	      
	          Record=new RecordSheet(
	     			   
			  Record.ID ,  TheDealID ,  "RefoundAmount" , "RefoundLabel" ,   "0.00" ,  "0.00" ,  "0.00" ,

			  Agent1.User_Split,Agent1.User_Split2 ,Agent1.User_Split3 ,  Agent2.User_Split , Agent2.User_Split2 ,Agent2.User_Split3  , "100.00" , "0.00" ,

			  ReferralRecordSheetNetFee ,  	ReferralRecordSheetNetHST , ReferralRecordSheetNetTotal , 	ReferralRecordSheetGRossFeeHST , 	ReferralRecordSheetAgent1HST , 	ReferralRecordSheetAgent2HST,

			  "HST4" ,  "HST5",   "HST6" , "HST7",  "HST8" , "HST9","HST10", Payment1,  Payment2 , Payment3 ,

	 		  "0.00" ,  " 0.00" , "0.00" , "0.00" , "0.00" , "0.00","0.00",Brokerid, Agent1.User_Cap, Agent1.User_Cap2 ,  Agent1.User_Cap3  , Agent2.User_Cap , Agent2.User_Cap2 , Agent2.User_Cap3 ,  CurrentCompanies.CommissionBankNumber,  CurrentCompanies.CommissionTransitNumber, CurrentCompanies.CommissionAccountNumber   ); 

	         RDS.UpdateTradeRecordes(  Record ,con); 
	         
    
       
        CommissionDetails  mycom = RDS.SearchSpesificCommission(  TheDealID  , NewDeal.LastCommissionDealID ,con);
       
        CommissionDetails  Com=new CommissionDetails(

     		    mycom.ID, ReferralPropertyType, ""+"-"+""+","+""+","+""+","+"", FinalizedDate,new Timestamp( ReferralCompletetionDate.getTime()), 

     			ReferralFeeAmount, Payment1, "0.00", "0.00",	ReferralFeeAmount,	ReferralRecordSheetAgent1Split, Payment2, 

                 "0.00",  "0.00", Payment2, ReferralRecordSheetNetFee, "Balance",  "0", "0", myCompany.Temp,Brokerid,  Brokerid, TheDealID, Permanant,"Deal" )  ;    
      
       System.out.println("Update Commission");
      
       RDS. UpdateCommissionDetails( Com ,con);
      
       System.out.println("Update Done on Commission ");

  }else { }
        
        

    
    	
	    }//End of Save!=null || Finilize!=null

	    else if(   SendEmailInvoice!=null)  { 

	    	
	         System.out.println("ReferralInvoiceBalanceAmount"+" "+ReferralInvoiceBalanceAmount);
	         
	         System.out.println("ReferralInvoiceHST"+" "+ReferralInvoiceHST);


	    	
		       String Email1=request.getParameter("emailValueAddressee0");

		       String  Email2=request.getParameter("emailValueAddressee1");
		       
		       String Email3=request.getParameter("emailValueoptional0");
		          
		       String Email4=request.getParameter("emailValueoptional1");

		       
				  String  send1=request.getParameter("Addressee0");
				    
				  String  send2=request.getParameter("Addressee1");
				    
				  String  send3=request.getParameter("optional0");
				    
				  String  send4=request.getParameter("optional1");
				  
		    

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		       

			  // HttpSession Existingsession = request.getSession();
			   
			   String MyEmail=(String) Existingsession.getAttribute("Email");
			   
			   System.out.println("MyEmail"+" "+MyEmail);

			   String SendmeACopy=request.getParameter("Secondary7");
			   
			   
			   String test="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/47";
			   
			   
		       System.out.println("Email1"+" "+Email1);
		       
		       System.out.println("Email2"+" "+Email2);
		       
		       System.out.println("Email3"+" "+Email3);
		       
		       System.out.println("Email4"+" "+Email4);

			  
		       System.out.println("send1"+" "+send1);
		       
		       System.out.println("send2"+" "+send2);
		       
		       System.out.println("send3"+" "+send3);
		       
		       System.out.println("send4"+" "+send4);
		       
		       System.out.println("SendmeACopy"+" "+SendmeACopy);
			    
			    
			    String Subject=request.getParameter("subjectLineEmail");
			    
			    String EmailBody=request.getParameter("messageEmail");
			    
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

		            System.out.println("start");
		            
					SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss"); 
					String CurrDate = formatter.format(new Date( ));

					String clientAddress1 = "";
					String clientAddress2 = "";
					if((!ReferralSourceUnit1.isEmpty())) {
						clientAddress1 += ReferralSourceUnit1 + "-";
					}
					clientAddress1 += ReferralSourceStreetNumber1 + " " + ReferralSourceStreetName1 ;

					if(ReferralOwnerOtherProvince1.isEmpty()){
						clientAddress2 +=  ReferralSourceCity1 + ", " + ReferralSourcePostalCode1 + ", " + ReferralSourceProvince1 ;
					}else{
						clientAddress2 +=  ReferralSourceCity1 + ", " + ReferralSourcePostalCode1 + ", " + ReferralOwnerOtherProvince1 + ", " + ReferralSourceCountry1;
					}
		              

		           // MimeBodyPart htmlPart = new MimeBodyPart();
		            
		    		String  HTML ="                              <div style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"                                   <div>\n" + 
							"\n" + 
							"											<div style='position: relative; float: right; right: 1px;'>"+
							"													<img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" alt='' style='    width: 150px; margin-right: 20px;'>"+
							"											</div>"+
							"\n" + 
							"											<div>"+
							"													<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"											</div>"+
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+  CurrDate +"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ReferralInvoiceReciverFirstName+" "+ ReferralInvoiceReciverLastName+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress1+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ clientAddress2+ "</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'> \n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Referral</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;' >"+ReferralDealType+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" +  
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Client(s):</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ReferralClientSigningOfficer1+ ' ' + ReferralClientFirstName1+ ReferralClientLastName1 + " and " + ReferralClientSigningOfficer2+ ' '  + ReferralClientFirstName2 + ReferralClientLastName2+ ' ' + "</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Referral Date</label>\n" + 
							"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ReferralCompletetionDate+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div style='padding-right: 25px'>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%;'>" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Referral Fee</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;' >"+ReferralFeeAmount+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+CurrentCompanies.HSTNumberPart1+" "+"RT"+" "+CurrentCompanies.HSTNumberPart2+")</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+ ReferralInvoiceHST+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 7px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>Balance</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+  ReferralInvoiceBalanceAmount+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
		    				"                                                 <p style='margin-bottom: 0; padding: 13px 16px 8px 16px; 	'>\n" +  
		    				"                                                        Please mail a cheque payable to \""+ CurrentCompanies.BusinessName+"\" or make an electronic payment to our commission trust account: </p>\n" + 
		    				"\n" + 
							"                                                 <div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 
		    				"                                                 <div style='width: 100%;'>\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px; margin: 0;'>Bank:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionBankNumber+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" +  
		    				"                                                 <div style='width: 100%; margin-top: 5px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px; margin: 0;'>Transit:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionTransitNumber+"</label>\n" +
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='width: 100%; margin-top: 5px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px;  margin: 0;'>Account:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+CurrentCompanies.CommissionAccountNumber+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
							"                                              </div>\n" + 
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
		    				"\n" + 
		    				"                                          </div><!-- Closing SenderInformation -->\n" + 
		    				"\n" + 
		    				"                                   </div>\n" + 
		    				"                            </div>   ";
		            
		            
		            
			
	    		String absoluteFilesystemPath = getServletContext().getRealPath("/");
	    		
	    		System.out.println(absoluteFilesystemPath);

	    		FileOutputStream  fileOutputStream = new FileOutputStream( new File(absoluteFilesystemPath+"Invoice.pdf") );

				HtmlConverter.convertToPdf(HTML, fileOutputStream );

	    	    System.out.println( "PDF Created!" );  
	    	    
				
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
	          
	             String filename ="Invoice.pdf"; 
	            
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
		          
		             String filename ="Invoice.pdf"; 
		            
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
		          
		             String filename ="Invoice.pdf"; 
		            
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
		          
		             String filename ="Invoice.pdf"; 
		            
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
		          
		             String filename ="Invoice.pdf"; 
		            
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

	    	
	    }//End of SendEmailInvoice!=null

	    else if(Delete!=null) {
	    	
	    	if( ClientSize==1){  RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(0).ID ,con ); }
	    	
	    	else if( ClientSize==2 ) {
	    		
	        RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(0).ID ,con);	
	        
	    	RDS.DeleteParty( TheDealID, Brokerid  , MyClients.get(1).ID ,con);
	    	
	    	}
	    	else if( ClientSize==0 ){}
	    	
	    	if( OwnerSize==1 ) { RDS.DeleteParty( TheDealID, Brokerid  , MyOwner.get(0).ID ,con); }else {}

	    	RDS.DeleteInvoice(    Brokerid ,    myinvoice.ID , TheDealID,con );
	    	
	    	RDS.DeleteTransaction( Brokerid , TheDealID,con );  
	    	
	    
	    	S3.DeleteBucketInS3( "Mastere/ReferralFee/disclosure-agreement/disclosure-agreement-"+String.valueOf( TheDealID )+"-"+String.valueOf(Brokerid),s3client);
	    	
		    for(int counter=0; counter< Documents.size() ; counter++ ) {
			    
			    
		    // S3.DeleteBucketInS3( "Mastere/ReferralFee/Extra-Documents/"+Documents.get(counter).Name+"+"+String.valueOf( TheDealID )+"+"+String.valueOf(Brokerid) ); 
		    	
		    	
		    	 for(int counter1=0; counter1< Documents.size() ; counter1++ ) {
				
		            S3.DeleteBucketInS3( "Mastere/ReferralFee/Extra-Documents/"+Documents.get(counter1).Name+"%"+String.valueOf( TheDealID )+"%"+String.valueOf(Brokerid),s3client );    
				    	
				    	
				    }
		    	
		    	
		    }

			    for(int counter=0; counter< Notes.size() ; counter++ ) {
				    
			         RDS. DeletAudit(    Brokerid , "Note" ,TheDealID,  Notes.get(counter).ID ,con  ) ;    }

				 RDS. DeleteRecordSheet(  Brokerid , TheDealID ,con );

			     CommissionDetails newcom=RDS.SearchSpesificCommission( TheDealID  , NewDeal.LastCommissionDealID ,con);
			     
				 double Cap=0.00;

		    	 Cap=Double.parseDouble(myCompany.Temp.replace(",",""))-Double.parseDouble(newcom.SplitWithBroker.replace(",",""));

		         RDS. UpdateCompanyTemp( String.valueOf(Cap), Brokerid ,con); 
		         
		    	 SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
		    	 
		         Date date = new Date( ); 
		    	 
			     String Date=formatter.format(date); 
			     
		   	     newcom.TradeID=TheDealID;
		   	     
		   	     newcom.BrokerID=Brokerid;
		   	  
		   	     newcom.AgentId=Brokerid;
		   	 
		   	     newcom.Date=new Timestamp(date.getTime());
		   	     
		   	     newcom.Status="Delete";
		  
		    	 newcom.CapReached=String.valueOf(Cap);

		    	 int LastCommissionID=RDS.AddCommissionDetails( newcom,con) ;
		    	 
		    	 RDS.UpdateLastCommmissionID(  Brokerid , TheDealID , LastCommissionID,con );   // We are updating the latest version of commission ID
	    
	    }//End of Delete 

	    else {}
	    
	    
	 }//End of Big else
	    

	    response.sendRedirect("BrokerFiles/Dashboard.jsp"); 
        

	}

}