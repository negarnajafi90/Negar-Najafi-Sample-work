package FULLBackendPart;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.amazonaws.services.s3.AmazonS3;

import ProMasterClasses.Companies;
import ProMasterClasses.Users;
import RDS.RDSFunctions;
import S3.ConnectionToS3;

/**
 * Servlet implementation class CompanyRegistration
 */



@WebServlet(
		
        name = "CompanyRegistration"

		
		)

@MultipartConfig


public class CompanyRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyRegistration() {
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
		
		
		System.out.println("Hello1");
		
		//Getting the buttons information , to check which button has been clicked by the user
		
		 String Finilize= request.getParameter("Finalized");
		
		 String Save1= request.getParameter("Nextbutton1");

		 String Save2= request.getParameter("Nextbutton2");
		 
		 //Getting the session data such as user ID and Broker id and user Type and password

		 HttpSession Existingsession = request.getSession();
			
		 int id=(int) Existingsession.getAttribute("Userid");	
		 
		 int BrokerID=(int) Existingsession.getAttribute("Brokerid");;	
			
		 String Type=(String) Existingsession.getAttribute("Type");	
		 
	     String Pass=(String) Existingsession.getAttribute("Password");
	     
	     Connection con=(Connection) Existingsession.getAttribute("Connection");
	     
		 AmazonS3 s3client=(AmazonS3) Existingsession.getAttribute("S3");
	     
	     int TheCompanyId=0;


	 	 RDSFunctions RDS=new RDSFunctions();

	 	 
			String BusinessName1 = null;
			
			String FiscalYearEnd1 = null;
			
			String Unit1 = null;
			
			String StreetNumber1 = null;
			
			String StreetName1 = null;
			
			String City1 = null;
			
			String Province1 = null;
			
			String PostalCode1 = null;
			
			String Email1 = null;
			
			String phone1 = null;
 
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	 	 
	 	//The following if condition will get the data for the company and add them into the database 
	 	 
		if(Save1!=null) {

		System.out.println("Hello");
		
		System.out.println("Save");
		
		//Getting the data of the first tab name " Company Details"  
		
		String BusinessName= request.getParameter("CompanyBusinessName");
		
		String FiscalYearEnd= request.getParameter("CompanyFiscalyearend");
		
		String Unit= request.getParameter("CompanyUnitNumber");
		
		String StreetNumber= request.getParameter("CompanyStreetNumber");
		
		String StreetName= request.getParameter("CompanyStreetName");
		
		String City= request.getParameter("CompanyCity");
		
		String Province= request.getParameter("CompanyProvince");
		
		String PostalCode= request.getParameter("CompanyPostalcode");
		
		String Email= request.getParameter("CompanyEmail");
		
		String phone= request.getParameter("CompanyPhone");
		
		
		  BusinessName1= BusinessName ;
		
		  FiscalYearEnd1= FiscalYearEnd;
		
		  Unit1= Unit;
		
		  StreetNumber1 =StreetNumber;
		
		  StreetName1= StreetName ;
		
		  City1= City;
		
		  Province1= Province;
		
		  PostalCode1= PostalCode;
		
		  Email1= Email;
		
		  phone1= phone;
		  
		 
		  
		  Companies MyCompany=new Companies();

		  MyCompany=RDS.GetaCompanyBuyBrokerID(BrokerID,con);
		  

		  
		  if(  MyCompany.ID==0 ) {  

			  
			  System.out.println( " No Data");
			  
			  System.out.println( MyCompany.ID );
			  
			   MyCompany= new Companies( 0, BusinessName, FiscalYearEnd,  Unit, StreetNumber, StreetName,  City, Province, PostalCode, Email, phone, "", "",  "",  "", "","", "", "",  "",  "", "", "", "", "", "","",BrokerID,0,"0.00" );
			  
			  TheCompanyId=RDS.NewCompany( MyCompany,con ) ;
		  }
	
		  else {   

			  System.out.println( "Data"); 
			  
			  System.out.println( MyCompany.ID );

		  
			  MyCompany= new Companies( MyCompany.ID, BusinessName, FiscalYearEnd,  Unit, StreetNumber, StreetName,  City, Province, PostalCode, Email, phone, MyCompany.HSTNumberPart1 ,MyCompany.HSTNumberPart2 , MyCompany.RealEstateTrustBankNumber , MyCompany.RealEstateTrustTransitNumber  , MyCompany.RealEstateTrustAccountNumber , MyCompany.RealEstateTrustAccountName2  , MyCompany.RealEstateTrustAccountNikname2 , MyCompany.RealEstateTrustBankNumber2 , MyCompany.RealEstateTrustTransitNumber2
					  
					  ,MyCompany.RealEstateTrustAccountNumber2 ,MyCompany.CommissionBankNumber, MyCompany.CommissionTransitNumber ,MyCompany.CommissionAccountNumber, MyCompany.GeneralAccountBankNumber ,MyCompany.GeneralAccountTransitNumber ,MyCompany.GeneralAccountAccountNumber,BrokerID, MyCompany.TransactionID , MyCompany.Temp );
			  
			  RDS.UpdateCompany(MyCompany,con);
			  
			  TheCompanyId=MyCompany.ID;
			  

		  }
		  

			ConnectionToS3 S3= new ConnectionToS3();
			 
		    Part filePart = request.getPart("CompanyLogo");
		    
		    System.out.println("filePart"+"   "+filePart);

		    InputStream fileInputStream = filePart.getInputStream();
		    
		    System.out.println("fileInputStream"+"   "+fileInputStream);
		    
		   // byte[] bytes =fileInputStream.readAllBytes();
		    
		    System.out.println("size"+"   "+ filePart.getSize());
		    
		   if( fileInputStream .available()==0 ) {  System.out.println("there is no file to uplaod");  }
		    
		   else { 	

			    //String fileName =filePart.getSubmittedFileName();

			    //System.out.println("Name"+"   "+fileName);
			    
			    //S3.UploadCompanyLogo(  ,  fileInputStream , filePart );
			    
			    String FILENAME=String.valueOf( TheCompanyId);	
			    
			    S3. UploadToS3( TheCompanyId , "probroker/Mastere/Companylogo" , fileInputStream ,  filePart ,  FILENAME ,s3client);	
		    	
		    	
		    }

			    
	
		
		}//Save1
		
		
		
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
		if(Save2!=null) {

		// Getting the Primary Broker of record Information Second tab " Primary Broker Of Record "
		
		String BrokerOfRecordTitle=request.getParameter("PrimaryBrokerTitle");

        String BrokerOfRecordFirstname=request.getParameter("PrimaryBrokerFirstName");
        
        String BrokerOfRecordLastname=request.getParameter("PrimaryBrokerLastName");
        
        String BrokerOfRecordStreetname=request.getParameter("PrimaryBrokerStreetName");
        
        String BrokerOfRecordStreetnumber=request.getParameter("PrimaryBrokerStreetNumber");
        
        String BrokerOfRecordUnit=request.getParameter("PrimaryBrokerUnitNumber");	
        
        String BrokerOfRecordCity=request.getParameter("PrimaryBrokerCity");	
        
        String BrokerOfRecordProvince=request.getParameter("PrimaryBrokerProvince");	
        
        String BrokerOfRecordPostalCode=request.getParameter("PrimaryBrokerPostalcode");	
        
        String BrokerOfRecordCountry="Canada";
        
        String BrokerOfRecordPhone=request.getParameter("PrimaryBrokerPhone");
        
        String BrokerOfRecordFaxOrMobile="Mobile";
        
        String BrokerOfRecordFaxOrMoNumber=request.getParameter("PrimaryBrokerMobile");	
        
        String BrokerOfRecordEmail=request.getParameter("PrimaryBrokerEmail");	
        
        String FirstLogin="0";
        
        Timestamp User_Anniversary=null;
        
        Timestamp Startdate=null;
        
        Timestamp Terminatedate=null;
        
        Timestamp DateOfBirth=null;
        
	    Timestamp StratAlternativeBroker=null;	
	    
	    Timestamp EndAlternativeBroker=null;

         Users PrimaryBroker=new Users(
        		 
		 BrokerID, 
		 
		 BrokerID,
		 
		 BrokerOfRecordFirstname,
		 
		 BrokerOfRecordLastname, 
		 
		 User_Anniversary,	
		 
		 "",	
		 
		 "",	
		 
		 "",	
		 
		 "",
		 
		 "",	
		 
		 "",
		 
		 "",	
		 
		 BrokerOfRecordStreetname,
		 
		 BrokerOfRecordStreetnumber, 
		 
		 BrokerOfRecordUnit,	 
		 
		 BrokerOfRecordCity, 
		 
		 BrokerOfRecordProvince, 
		 
		 BrokerOfRecordPostalCode,
		 
		 BrokerOfRecordCountry, 
		 
		 BrokerOfRecordPhone, 
		 
		 BrokerOfRecordFaxOrMobile, 
		 
		 BrokerOfRecordFaxOrMoNumber, 
		 
		 BrokerOfRecordEmail,	
		 
         Pass, "1", "", "", "", "", Startdate,Terminatedate,Type, FirstLogin, BrokerOfRecordTitle, DateOfBirth ,"","0", StratAlternativeBroker,EndAlternativeBroker, "", "", "");

	     RDS.UpdateUser( PrimaryBroker ,con);
        
	     System.out.println("Finish")	; 
	     
		}//Save2
        
        
		//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
		
		if( Finilize!=null) {
			
		//Getting the Tax and banking information third tab name " Tax and banking " 
	
		String HSTNumberpart1= request.getParameter("CompanyHSTNumbere");
		
		String HSTNumberpart2= request.getParameter("CompanyHSTNumbereRT");
		
		String RealEstateTrustBankNumber= request.getParameter("RealEstateTrustCompanyBankNumber");
		
		String RealEstateTrustTransitNumber= request.getParameter("RealEstateTrustCompanyTransitNumber");
		
		String RealEstateTrustAccountNumber= request.getParameter("RealEstateTrustCompanyAccountNumber");
		
		String RealEstateTrustBankNumber2= request.getParameter("RealEstateTrustCompanyBankNumber");
		
		String RealEstateTrustTransitNumber2= request.getParameter("RealEstateTrustCompanyTransitNumber");
		
		String RealEstateTrustAccountNumber2= request.getParameter("RealEstateTrustCompanyAccountNumber");
		
	    String RealEstateTrustAccountNikname2="";
	    
	    String RealEstateTrustAccountName2="";
		
		String CommissionBankNumber= request.getParameter("CommissionTrustCompanyBankNumber");
		
		String CommissionTransitNumber= request.getParameter("CommissionTrustCompanyTransitNumber");
		
		String CommissionAccountNumber= request.getParameter("CommissionTrustCompanyAccountNumber");
		
		String GeneralAccountBankNumber= request.getParameter("GeneralAccountCompanyBankNumber");
		
		String GeneralAccountTransitNumber= request.getParameter("GeneralAccountCompanyTransitNumber");
		
		String GeneralAccountAccountNumber= request.getParameter("GeneralAccountCompanyAccountNumber");
		
		  Companies MyCompany=new Companies();

		  MyCompany=RDS.GetaCompanyBuyBrokerID(BrokerID,con);

		 Companies MyCompany1= new Companies(MyCompany.ID , MyCompany.BusinessName, MyCompany.FiscalYearEnd,  MyCompany.Unit, MyCompany.StreetNumber, MyCompany.StreetName,  MyCompany.City, MyCompany.Province, MyCompany.PostalCode, MyCompany.Email, MyCompany.Phone,HSTNumberpart1, HSTNumberpart2 , 
				 
				 RealEstateTrustBankNumber , RealEstateTrustTransitNumber , RealEstateTrustAccountNumber ,RealEstateTrustAccountName2, RealEstateTrustAccountNikname2 , RealEstateTrustBankNumber2, 
				 
				 RealEstateTrustTransitNumber2 , RealEstateTrustAccountNumber2, CommissionBankNumber , CommissionTransitNumber , CommissionAccountNumber , GeneralAccountBankNumber 
				 
				 ,GeneralAccountTransitNumber , GeneralAccountAccountNumber ,BrokerID,MyCompany.TransactionID , MyCompany.Temp);
		 
		 
	     RDS.UpdateCompany(MyCompany1,con);


	    response.sendRedirect("BrokerFiles/PersonalProfileRegistration.jsp");     
        
	}//Finalized
        
	
       
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		
	}

}
