package FULLBackendPart;

import java.io.IOException;
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


import java.io.File;

import java.io.InputStream;

import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;



/**
 * Servlet implementation class CompanyProfileUpdate
 */
@WebServlet(
		
        name = "CompanyProfileUpdate"

		
		)

@MultipartConfig

public class CompanyProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyProfileUpdate() {
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

		
  //Getting the current Broker and the user Type(if it is Broker , Agent or Admin )

	 HttpSession Existingsession = request.getSession();
		
	 int id=(int) Existingsession.getAttribute("Userid");	
		
	 int Brokerid=(int) Existingsession.getAttribute("Brokerid");;	
		
	 String Type=(String) Existingsession.getAttribute("Type");	
	 
	 Connection con=(Connection) Existingsession.getAttribute("Connection");
	 
	 AmazonS3 s3client=(AmazonS3) Existingsession.getAttribute("S3");

	 
	 RDSFunctions RDS= new RDSFunctions();
	 

	 Users CurrentUser=new Users();
	 
	 CurrentUser=RDS.GetAnyUserById(id,con); //Getting the current company information for a specific broker
	 
	 
	 Companies CurrentCompanies=new Companies();
	 
	 CurrentCompanies=RDS.GetaCompanyBuyBrokerID(Brokerid,con);

//*******************************************************************************************************************************************************************************
	 
	//These are the main data which we are checking to update  

	 
     int ID=CurrentCompanies.ID;
	 String BusinessName="";
	 String FiscalYearEnd="";
     String Unit="";
	 String StreetNumber="";
     String StreetName="";
	 String City="";
	 String Province="";
	 String PostalCode="";
	 String Email="";
	 String Phone="";
	 String HSTNumberPart1="";
     String HSTNumberPart2="";
     String RealEstateTrustBankNumber="";
	 String RealEstateTrustTransitNumber="";
	 String RealEstateTrustAccountNumber="";
     String RealEstateTrustAccountName2="";
     String RealEstateTrustAccountNikname2="";
	 String RealEstateTrustBankNumber2="";
	 String RealEstateTrustTransitNumber2="";
	 String RealEstateTrustAccountNumber2="";
	 String CommissionBankNumber="";
	 String CommissionTransitNumber="";
     String CommissionAccountNumber="";
     String GeneralAccountBankNumber="";
	 String GeneralAccountTransitNumber="";
	 String GeneralAccountAccountNumber="";
	 

	 //Alternative broker information
	 
	 String AlternativeBrokerOfRecords="";
	 String StartDate="";
	 String EndDate="";

	 

	 
//*******************************************************************************************************************************************************************************		 
		 

			 
			 
			 
			 String  UpdateBusinessName= request.getParameter("CompanyBusinessName");
			 
			 String  UpdateFiscalYearEnd= request.getParameter("CompanyFiscalyearend");
			 
			 String  UpdateUnit= request.getParameter("CompanyUnitNumber");	
			 
			 String  UpdateStreetNumber= request.getParameter("CompanyStreetNumber");	
			 
			 String  UpdateStreetName= request.getParameter("CompanyStreetName");	
			 
			 String  UpdateCity= request.getParameter("CompanyCity");	
			 
			 String  UpdateProvince= request.getParameter("CompanyProvince");
			 
			 String  UpdatePostalCode= request.getParameter("CompanyPostalcode");	
			 
			 String  UpdateEmail= request.getParameter("CompanyEmail");
			 
			 String  UpdatePhone= request.getParameter("CompanyPhone");
			 
		     String  UpdateHSTNumberpart1= request.getParameter("CompanyHSTNumbere");
			  
		     String  UpdateHSTNumberpart2= request.getParameter("CompanyHSTNumbereRT");

		     String  UpdateRealEstateTrustBankNumber= request.getParameter("RealEstateTrustCompanyBankNumber");
		      
			 String  UpdateRealEstateTrustTransitNumber= request.getParameter("RealEstateTrustCompanyTransitNumber");
			 
			 String  UpdateRealEstateTrustAccountNumber= request.getParameter("RealEstateTrustCompanyAccountNumber");
			 
			 String  UpdateRealEstateTrustAccountName2= request.getParameter("RealEstateTrustCompanyAccountName2");
			 
			 String  UpdateRealEstateTrustAccountNikname2= request.getParameter("RealEstateTrustCompanyAccountNickName2");
			 
			 String  UpdateRealEstateTrustBankNumber2= request.getParameter("RealEstateTrustCompanyBankNumber2");
			 
			 String  UpdateRealEstateTrustTransitNumber2= request.getParameter("RealEstateTrustCompanyTransitNumber2");
				
			 String  UpdateRealEstateTrustAccountNumber2= request.getParameter("RealEstateTrustCompanyAccountNumber2");
			 
			 String  UpdateCommissionBankNumber= request.getParameter("CommissionTrustCompanyBankNumber");
			 
			 String  UpdateCommissionTransitNumber= request.getParameter("CommissionTrustCompanyTransitNumber");
			 
			 String  UpdateCommissionAccountNumber= request.getParameter("CommissionTrustCompanyAccountNumber");
				
			 String  UpdateGeneralAccountBankNumber= request.getParameter("GeneralAccountCompanyBankNumber");
			 
			 String  UpdateGeneralAccountTransitNumber= request.getParameter("GeneralAccountCompanyTransitNumber");
			 
			 String  UpdateGeneralAccountAccountNumber= request.getParameter("GeneralAccountCompanyAccountNumber"); 
			 
			 ConnectionToS3 S3= new ConnectionToS3();
			 
			 BusinessName=UpdateBusinessName;
			 
			 FiscalYearEnd= UpdateFiscalYearEnd;
			 
			 Unit= UpdateUnit;
			 
			 StreetNumber=UpdateStreetNumber;
			 
			 StreetName=UpdateStreetName;
			 
			 City= UpdateCity;
			 
			 Province= UpdateProvince;
			 
			 PostalCode=UpdatePostalCode;
			 
			 Email=UpdateEmail;
			 
			 Phone=UpdatePhone;
			 
			 HSTNumberPart1=UpdateHSTNumberpart1;
			 
		     HSTNumberPart2=UpdateHSTNumberpart2;
		  
		     RealEstateTrustBankNumber= UpdateRealEstateTrustBankNumber;
		     
			 RealEstateTrustTransitNumber=UpdateRealEstateTrustTransitNumber;
			 
			 RealEstateTrustAccountNumber=UpdateRealEstateTrustAccountNumber;

			 RealEstateTrustAccountName2=UpdateRealEstateTrustAccountName2;
			 
			 RealEstateTrustAccountNikname2=UpdateRealEstateTrustAccountNikname2;
			 
			 RealEstateTrustBankNumber2=UpdateRealEstateTrustBankNumber2;

			 RealEstateTrustTransitNumber2=UpdateRealEstateTrustTransitNumber2;
			 
			 RealEstateTrustAccountNumber2=UpdateRealEstateTrustAccountNumber2;
			 
			 CommissionBankNumber=UpdateCommissionBankNumber;
			 
			 CommissionTransitNumber=UpdateCommissionTransitNumber;
			 
			 CommissionAccountNumber=UpdateCommissionAccountNumber;
			 
			 GeneralAccountBankNumber=UpdateGeneralAccountBankNumber;
			 
			 GeneralAccountTransitNumber=UpdateGeneralAccountTransitNumber;
			 

				    Part filePart = request.getPart("CompanyLogo");
				    
				    System.out.println("filePart"+"   "+filePart);

				    InputStream fileInputStream = filePart.getInputStream();
				    
				    System.out.println("fileInputStream"+"   "+fileInputStream);
				    
				   // byte[] bytes =fileInputStream.readAllBytes();
				    
				    System.out.println("size"+"   "+ filePart.getSize());
				    
				   if( fileInputStream .available()==0 ) {  System.out.println("there is no file to uplaod");  }
				    
				   else { 	

					    String fileName =filePart.getName();

					    System.out.println("Name"+"   "+fileName);
					    
					    //S3.UploadCompanyLogo(  ,  fileInputStream , filePart );
					    
					    String FILENAME=String.valueOf( ID );	
					    
					    S3. UploadToS3( ID , "probroker/Mastere/Companylogo" , fileInputStream ,  filePart ,  FILENAME ,s3client);	
				    	
				    	
				    }

			 
			 Companies MyUpdateCompany= new Companies( 
				      ID,
					  BusinessName,
					  FiscalYearEnd,
				      Unit,
					  StreetNumber,
				      StreetName,
					  City,
					  Province,
					  PostalCode,
					  Email,
					  Phone,
					  HSTNumberPart1,
					  HSTNumberPart2,
					  RealEstateTrustBankNumber,
					  RealEstateTrustTransitNumber,
					  RealEstateTrustAccountNumber,
					  RealEstateTrustAccountName2,
					  RealEstateTrustAccountNikname2,
					  RealEstateTrustBankNumber2,
					  RealEstateTrustTransitNumber2,
					  RealEstateTrustAccountNumber2,
				      CommissionBankNumber,
					  CommissionTransitNumber,
					  CommissionAccountNumber,
					  GeneralAccountBankNumber,
					  GeneralAccountTransitNumber,
					  GeneralAccountAccountNumber,
					  Brokerid,CurrentCompanies.TransactionID , CurrentCompanies.Temp);

		 
//*******************************************************************************************************************************************************************************		 
		 
		 

		  
		  
		  
		     //Getting the data that user has been entered 
			 
					 
					/* String  UpdateAlternativeBrokerOfRecords= request.getParameter("AlternateBrokerOfRecord");
						
					 String  UpdateStartDate= request.getParameter("AlternateBrokerStartDate");
						
					 String  UpdateEndDate= request.getParameter("AlternateBrokerEndDate");
					 
					 
					 
					 AlternativeBrokerOfRecords=UpdateAlternativeBrokerOfRecords;
					 
					 UpdateStartDate=UpdateStartDate;	
					 
					 UpdateEndDate=UpdateEndDate;

			 
			 

			    if( UpdateAlternativeBrokerOfRecords.equals(  CurrentUser.AlternativeBroker ) ){  }else{  }
			 
			    if( UpdateStartDate.equals(  CurrentUser.StratAlternativeBroker) ){  }else{  }
			 
			    if( UpdateEndDate.equals(  CurrentUser.EndAlternativeBroker ) ){  }else{  }
			    
			    RDS.AddAlternativeBroker( ID, StartDate, EndDate, AlternativeBrokerOfRecords ) ;
			    
				response.sendRedirect("BrokerFiles/CompanyProfile.jsp"); */
				  

//*******************************************************************************************************************************************************************************		  
		 
		      /*if( UpdateBusinessName .equals( CurrentCompanies.BusinessName ) ){}else{ }

		      if( UpdateFiscalYearEnd.equals( CurrentCompanies.FiscalYearEnd  ) ) {  }else{  }

		      if( UpdateUnit.equals( CurrentCompanies.Unit )  ){ }else{ }

		      if(UpdateStreetNumber .equals(  CurrentCompanies.StreetNumber ) ){  }else{ }
			 	   
		      if( UpdateStreetName.equals( CurrentCompanies.StreetName )){  }else{ }

		      if( UpdateCity.equals( CurrentCompanies.City  ) ){  }else{ }

			  if( UpdateProvince.equals( CurrentCompanies.Province )){  }else{ }
 
		      if( UpdatePostalCode.equals( CurrentCompanies.PostalCode) ){ }else{  }
				   
			  if( UpdateEmail.equals( CurrentCompanies.Email )){  }else{ }
				   
			  if( UpdatePhone.equals( CurrentCompanies.Phone ) ){  }else{  } 

			  if(  UpdateHSTNumberpart1.equals( CurrentCompanies.HSTNumberPart1 )){  }else{ }

			  if( UpdateHSTNumberpart2.equals( CurrentCompanies.HSTNumberPart2 )){  }else{ }
			      
			  if( UpdateRealEstateTrustBankNumber.equals( CurrentCompanies.RealEstateTrustBankNumber )){  }else{ }

			  if( UpdateRealEstateTrustTransitNumber.equals( CurrentCompanies.RealEstateTrustTransitNumber )){  }else{ }

			  if( UpdateRealEstateTrustAccountNumber.equals( CurrentCompanies.RealEstateTrustAccountNumber )){  }else{ }

			  if( UpdateRealEstateTrustAccountName2.equals( CurrentCompanies.RealEstateTrustAccountName2 )){  }else{ }

			  if( UpdateRealEstateTrustAccountNikname2.equals( CurrentCompanies.RealEstateTrustAccountNikname2 )){  }else{ }

			  if( UpdateRealEstateTrustBankNumber2.equals( CurrentCompanies.RealEstateTrustBankNumber2 )){  }else{ }

			  if( UpdateRealEstateTrustTransitNumber2.equals( CurrentCompanies.RealEstateTrustTransitNumber2)){  }else{ }

			  if( UpdateRealEstateTrustAccountNumber2.equals( CurrentCompanies.RealEstateTrustAccountNumber2 )){  }else{ }
			 
			  if( UpdateCommissionBankNumber.equals( CurrentCompanies.CommissionBankNumber )){  }else{ }

			  if( UpdateCommissionTransitNumber.equals( CurrentCompanies.CommissionTransitNumber )){  }else{ }

			  if( UpdateCommissionAccountNumber.equals( CurrentCompanies.CommissionAccountNumber )){  }else{ }

			  if( UpdateGeneralAccountBankNumber.equals( CurrentCompanies.GeneralAccountBankNumber )){  }else{ }

			  if( UpdateGeneralAccountTransitNumber.equals( CurrentCompanies.GeneralAccountTransitNumber )){  }else{ }

			  if( UpdateGeneralAccountAccountNumber.equals( CurrentCompanies.GeneralAccountAccountNumber )){  }else{ }*/

			   RDS.UpdateCompany( MyUpdateCompany  ,con);
			   
			   response.sendRedirect("BrokerFiles/CompanyProfile.jsp"); 
			  
			
		 }


		
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		  
	}


