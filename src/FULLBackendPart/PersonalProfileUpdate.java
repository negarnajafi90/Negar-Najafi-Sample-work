package FULLBackendPart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMasterClasses.Companies;
import ProMasterClasses.Users;
import RDS.RDSFunctions;

/**
 * Servlet implementation class PersonalProfileUpdate
 */
@WebServlet("/PersonalProfileUpdate")
public class PersonalProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalProfileUpdate() {
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
		
		
		System.out.println("Hello");

		 //Getting the current Broker and the user Type(if it is Broker , Agent or Admin )

		 HttpSession Existingsession = request.getSession();
			
		 int id=(int) Existingsession.getAttribute("Userid");	
			
		// System.out.println(id);
		 
		 int Brokerid=(int) Existingsession.getAttribute("Brokerid");
		 
		 Connection con=(Connection) Existingsession.getAttribute("Connection");
			
		 String Type=(String) Existingsession.getAttribute("Type");	
		 
		 String OrginalEmail=(String) Existingsession.getAttribute("Email");	
		 
//////////////////////////////////////////////////////////////////////////////////////////////////
		 
		 RDSFunctions RDS= new RDSFunctions();

		 Users CurrentUser=new Users();
		 
		 CurrentUser=RDS.GetAnyUserById(id,con);

		 //System.out.println("Current Data From Data ");
		 
		 //System.out.println("***********************************************************************************************************************");

		 /*System.out.println(CurrentUser.id);
		 System.out.println(CurrentUser.Firstname);	
		 System.out.println(CurrentUser.Lastname);
		 System.out.println(CurrentUser.User_Anniversary);	
		 System.out.println(CurrentUser.User_Cap);	
		 System.out.println(CurrentUser.User_PaymentMethod);
		 System.out.println(CurrentUser.User_Bank);
		 System.out.println(CurrentUser.User_Institution);	
		 System.out.println(CurrentUser.User_Split);
		 System.out.println(CurrentUser.User_Transit);	
		 System.out.println(CurrentUser.User_AccountNumber);
		 System.out.println(CurrentUser.User_StreetName);
		 System.out.println(CurrentUser.User_StreetNumber);
		 System.out.println(CurrentUser.User_Unit	);
		 System.out.println(CurrentUser.User_City);	
		 System.out.println(CurrentUser.User_Province );	
		 System.out.println(CurrentUser.User_PostalCode );
		 System.out.println(CurrentUser.User_Country);
		 System.out.println(CurrentUser.User_faxOrMobile );	
		 System.out.println(CurrentUser.User_faxOrMobileNumber );
		 System.out.println(CurrentUser.User_Email	);
		 System.out.println(CurrentUser.User_password	);
		 System.out.println(CurrentUser.User_Status);
		 System.out.println(CurrentUser.User_Split2);
		 System.out.println(CurrentUser.User_Split3);
		 System.out.println(CurrentUser.User_Cap2);
		 System.out.println(CurrentUser.User_Cap3);
		 System.out.println(CurrentUser.User_StartDate);	
		 System.out.println(CurrentUser.User_TerminateDate);	
		 System.out.println(CurrentUser.Type);
		 System.out.println(CurrentUser.FirstLogin);
		 System.out.println(CurrentUser.Title);
		 System.out.println(CurrentUser.DateOfBirth);		
		 System.out.println(CurrentUser.PREC);		
		 System.out.println(CurrentUser.AlternativeBroker);	
         System.out.println(CurrentUser.StratAlternativeBroker);		
		 System.out.println(CurrentUser.EndAlternativeBroker);
	     System.out.println(CurrentUser.HST);
		 System.out.println(CurrentUser.SinNumber);
		 System.out.println(CurrentUser.AccountName);*/
		 
//////////////////////////////////////////////////////////////////////////////////////////////////
		 
		/*String UpdatePersonalDetails= request.getParameter("SaveButton1");
		 
		String UpdateCommissionAndDisclosure= request.getParameter("SaveButtom2");
			 
		String UpdatePersonalTaxandBanking= request.getParameter("SaveButtom3");
		
		String UpdateAccess= request.getParameter("AccessFinalize");*/
	
//----------------------------------------------------------------------------------------------------------------------------------------------
		
        String Firstname="";
        String Lastname="";
        Timestamp Anniversary=null;	
        String Cap="";	
        String PaymentMethod="";	
        String Bank="";	
        String Institution="";
        String Split="";	
        String Transit="";	
        String AccountNumber="";	
        String Streetname="";
        String Streetnumber="";
        String Unit="";	
        String City="";	
        String Province="";	
        String PostalCode="";	
        String Country="";
        String Phone="";	
        String FaxOrMobile="";	
        String FaxOrMoNumber="";	
        String Email="";	
        String password="";
        String Status=CurrentUser.User_Status;
        String Cap2="";
        String Cap3="";
        String Split2="";
        String Split3="";
        Timestamp Startdate=null;
        Timestamp Terminatedate=CurrentUser.User_TerminateDate;
        String FirtsLogin=CurrentUser.FirstLogin;
        String Title="";	
		Timestamp DateOfBirth=null;
	    String PREC="";	
	    String AlternativeBroker="";
	    Timestamp StratAlternativeBroker=null;	
	    Timestamp EndAlternativeBroker=null;
		String HST ="";
	    String SinNumber="";
		String AccountName="";
		
		String UpdateTitle=request.getParameter("Title");
		
		String UpdatePREC=request.getParameter("PRECNum");

		Timestamp UpdateDateOfBirth=null;
		
		Date date_UpdateDateOfBirth=null;

		if( request.getParameter("DateOfBirth")==null || request.getParameter("DateOfBirth").isEmpty()|| request.getParameter("DateOfBirth").equals("null")) {
			
		
		}else {

			try {
				date_UpdateDateOfBirth=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("DateOfBirth"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	

			UpdateDateOfBirth=new Timestamp( date_UpdateDateOfBirth.getTime());  }
		
		String UpdateFirstname=request.getParameter("Firstname");
		 
		String UpdateLastname=request.getParameter("Lastname"); 
		 
		String UpdateStreetname=request.getParameter("StreetName");
		
		String UpdateStreetnumber=request.getParameter("StreetNumber");
		
		String UpdateUnit=request.getParameter("Unit");	
		
	    String UpdateCity=request.getParameter("City");	

        String UpdateProvince=request.getParameter("Province");	
        
        String UpdatePostalCode=request.getParameter("PostalCode");	
        
        Timestamp UpdateAnniversary=null;
        
        Date date_UpdateAnniversary=null;

		if( request.getParameter("AnniversaryDate")==null || request.getParameter("AnniversaryDate").isEmpty()|| request.getParameter("AnniversaryDate").equals("null")) {
			
			
		}else {

			try {
				date_UpdateAnniversary=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("AnniversaryDate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	

			UpdateAnniversary=new Timestamp(date_UpdateAnniversary.getTime());  }
		
        
        String UpdateCountry=request.getParameter("Country");
        
        String UpdatePhone=request.getParameter("Phone");
        
        String UpdateFaxOrMobile="Mobile";
        
        String UpdateFaxOrMobileNumber=request.getParameter("MobileNumber");	
        
        String UpdateEmail=request.getParameter("Email");	
	 
	    String UpdateSplit=request.getParameter("CommissionSplit1");
	   
	    String UpdateCap=request.getParameter("CommissionCap1");
	   
        String UpdateCap2=request.getParameter("CommissionCap2");
     
        String UpdateCap3=request.getParameter("CommissionCap3");
        
        String UpdateSplit2=request.getParameter("CommissionSplit2");
        
        String UpdateSplit3=request.getParameter("CommissionSplit3"); 
        
        Timestamp UpdateStartdate=null;
        
        Date date_UpdateStartdate=null;
        
		if( request.getParameter("StartDate")==null || request.getParameter("StartDate").isEmpty()|| request.getParameter("StartDate").equals("null")) {
			
			
		}else {

			try {
				date_UpdateStartdate=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("StartDate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	

			UpdateStartdate=new Timestamp(date_UpdateStartdate.getTime());   }
		
        
        String UpdateBank=request.getParameter("Bank");	

        String UpdateAccountName=request.getParameter("AccountName");
        
        String UpdateAccountNumber="";
        
        String UpdateTransit=request.getParameter("Transit");
        
        String UpdateHSTNumber=request.getParameter("HSTNumber");
        
        String UpdateSinNumber=request.getParameter("SinNumber");
        
	    String Updatepassword=request.getParameter("ConfirmNewPassword"); 
	    
	    String NewEmail=request.getParameter("NewLoginEmail"); 

	    System.out.println("This is Password"+password);
	    
	    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        String UpdatePaymentMethod="1";
        
		Title=UpdateTitle;
		
		PREC=UpdatePREC;
		
		DateOfBirth=UpdateDateOfBirth;
		
        Firstname=UpdateFirstname;
        
        Lastname= UpdateLastname;
        
        Streetname=UpdateStreetname;
        
        Streetnumber=UpdateStreetnumber;
        
        Unit=UpdateUnit;
        
        City=UpdateCity;
        
        Province=UpdateProvince;	
        
        PostalCode=UpdatePostalCode;	

        Country=UpdateCountry;
        
        Phone=UpdatePhone;
        
        FaxOrMobile=UpdateFaxOrMobile;
        
        FaxOrMoNumber=UpdateFaxOrMobileNumber;
        
        Email="";
        
	    Anniversary=UpdateAnniversary;
	    
	    Split=UpdateSplit;
	  
	    Cap=UpdateCap;
	    
        Cap2=UpdateCap2;
        
        Cap3=UpdateCap3;
       
        Split2=UpdateSplit2;
     
        Split3=UpdateSplit3;
     
        Startdate=UpdateStartdate;
     
        PaymentMethod=UpdatePaymentMethod;
        
        Bank=UpdateBank;
        
        AccountName=UpdateAccountName;
        
        AccountNumber=UpdateAccountNumber;
        
        Transit=UpdateTransit;
        
        HST=UpdateHSTNumber;
        
        SinNumber=UpdateSinNumber;
	        
		
	    if( Updatepassword.isEmpty() ){ password=CurrentUser.User_password; }else{  password=Updatepassword;  } 
	    
	    if( NewEmail.isEmpty() ){ Email=OrginalEmail; }else{  Email=NewEmail; } 
		//----------------------------------------------------------------------------------------------------------------------------------------------		
		
	    Users UpdateUserInformation=new Users();

			 
			 //System.out.println("UpdatePersonalDetails");
			 
		         UpdateUserInformation= new Users(
		        		id,		
		        		Brokerid,	
		        		Firstname,
		        		Lastname,
		        	    Anniversary,	
		        	    Cap,	
		        		PaymentMethod,	
		        		Bank,	
		        		Institution,
		        		Split,	
		        		Transit,
		        	    AccountNumber,
		                Streetname,
		                Streetnumber,
		                Unit,	
		                City,	
		                Province,	
		                PostalCode,	
		                Country,
		                Phone,	
		                "Mobile",	
		                FaxOrMoNumber,	
		             	Email,
		             	password,
		                Status,
		        		Cap2,
		        		Cap3,
		        	    Split2,
		        	    Split3,
		        	    Startdate,
		        	    Terminatedate,
		                Type,
		                FirtsLogin,
		                Title,
		                DateOfBirth,
		                PREC,
		                AlternativeBroker,
		                StratAlternativeBroker,
		                EndAlternativeBroker,
		                HST,
		                SinNumber,  		
		                AccountName);

				
			   /* if( UpdateTitle.equals( CurrentUser.Title ) ){}else{ }

				if( UpdatePREC.equals( CurrentUser.PREC ) ){}else{ }
				
				if( UpdateDateOfBirth.equals( CurrentUser.DateOfBirth ) ){}else{ }

		        if( UpdateFirstname.equals( CurrentUser.Firstname ) ){}else{ }
		   
		        if( UpdateLastname.equals( CurrentUser.Lastname ) ){}else{ }

		        if( UpdateLastname.equals( CurrentUser.User_StreetName ) ){}else{ }

		        if( UpdateStreetnumber.equals( CurrentUser.User_StreetNumber ) ){}else{ }

		        if( UpdateUnit.equals( CurrentUser.User_Unit ) ){}else{ }
		        
		        if( UpdateCity.equals( CurrentUser.User_City ) ){}else{ }

		        if( UpdateProvince.equals( CurrentUser.User_Province ) ){}else{ }

		        if( UpdatePostalCode.equals( CurrentUser.User_PostalCode ) ){}else{ }

		        if( UpdateCountry.equals( CurrentUser.User_Country ) ){}else{ }

		        if( UpdatePhone.equals( CurrentUser.User_Phone ) ){}else{ }
		        
		        if( FaxOrMoNumber.equals( CurrentUser.User_faxOrMobileNumber ) ){}else{ }

		        if( UpdateEmail.equals( CurrentUser.User_Email ) ){}else{ }

			    if( UpdateAnniversary .equals( CurrentUser.User_Anniversary ) ){}else{ }

			    if( UpdateSplit .equals( CurrentUser.User_Split ) ){}else{ }

			    if( UpdateCap .equals( CurrentUser.User_Cap) ){}else{ }

		        if( UpdateCap2 .equals( CurrentUser.User_Cap2 ) ){}else{ }

		        if( UpdateCap3 .equals( CurrentUser.User_Cap3 ) ){}else{ }

		        if( UpdateSplit2 .equals( CurrentUser.User_Split2 ) ){}else{ }

		        if( UpdateSplit3 .equals( CurrentUser.User_Split3 ) ){}else{ }

		        if( UpdateStartdate .equals( CurrentUser.User_StartDate ) ){}else{ }

		        if( UpdateBank .equals( CurrentUser.User_Bank ) ){}else{ }
   
		        if( UpdateAccountName .equals( CurrentUser.AccountName ) ){}else{ }

		        if( UpdateAccountNumber .equals( CurrentUser.User_AccountNumber ) ){}else{ }

		        if( UpdateTransit .equals( CurrentUser.User_Transit ) ){}else{ }

		        if( UpdateHSTNumber .equals( CurrentUser.HST ) ){}else{ }

		        if( UpdateSinNumber .equals( CurrentUser.SinNumber ) ){}else{ }*/


		 
		 
	
		 
		/* System.out.println("***********************************************************************************************************************");

		 System.out.println( id);
		 System.out.println( UpdateFirstname);	
		 System.out.println( UpdateLastname);
		 System.out.println( UpdateAnniversary);	
		 System.out.println( UpdateCap);	
		 System.out.println( UpdatePaymentMethod);
		 System.out.println( UpdateBank);
		 System.out.println( Institution);	
		 System.out.println( UpdateSplit);
		 System.out.println( UpdateTransit);	
		 System.out.println( UpdateAccountNumber);
		 System.out.println( UpdateStreetname);
		 System.out.println( UpdateStreetnumber);
		 System.out.println( UpdateUnit);
		 System.out.println( UpdateCity);	
		 System.out.println( UpdateProvince );	
		 System.out.println( UpdatePostalCode );
		 System.out.println( UpdateCountry);
		 System.out.println( UpdateFaxOrMobile );	
		 System.out.println( UpdateFaxOrMobileNumber );
		 System.out.println( UpdateEmail	);
		 System.out.println( Updatepassword	);
		 System.out.println( UpdateBank);
		 System.out.println( UpdateSplit2);
		 System.out.println( UpdateSplit3);
		 System.out.println( UpdateCap2);
		 System.out.println( UpdateCap3);
		 System.out.println( UpdateStartdate);	
		 System.out.println( UpdateTitle);
		 System.out.println( UpdateDateOfBirth);		
		 System.out.println( UpdatePREC);		
		 System.out.println( CurrentUser.AlternativeBroker);	
         System.out.println( CurrentUser.StratAlternativeBroker);		
		 System.out.println( CurrentUser.EndAlternativeBroker);
	     System.out.println( HST);
		 System.out.println( UpdateSinNumber);
		 System.out.println( UpdateAccountName);
    
		 System.out.println("New Data");
		 
		 System.out.println("***********************************************************************************************************************");

		 System.out.println(id);
		 System.out.println(Firstname);	
		 System.out.println(Lastname);
		 System.out.println(Anniversary);	
		 System.out.println(Cap);	
		 System.out.println(PaymentMethod);
		 System.out.println(Bank);
		 System.out.println(Institution);	
		 System.out.println(Split);
		 System.out.println(Transit);	
		 System.out.println(AccountNumber);
		 System.out.println(Streetname);
		 System.out.println(Streetnumber);
		 System.out.println(Unit);
		 System.out.println(City);	
		 System.out.println(Province );	
		 System.out.println(PostalCode );
		 System.out.println(Country);
		 System.out.println(FaxOrMobile );	
		 System.out.println(FaxOrMoNumber );
		 System.out.println(Email	);
		 System.out.println(password	);
		 System.out.println(Status);
		 System.out.println(Split2);
		 System.out.println(Split3);
		 System.out.println(Cap2);
		 System.out.println(Cap3);
		 System.out.println(Startdate);	
		 System.out.println(Terminatedate);	
		 System.out.println(Type);
		 System.out.println(FirtsLogin);
		 System.out.println(Title);
		 System.out.println(DateOfBirth);		
		 System.out.println(PREC);		
		 System.out.println(CurrentUser.AlternativeBroker);	
         System.out.println(CurrentUser.StratAlternativeBroker);		
		 System.out.println(CurrentUser.EndAlternativeBroker);
	     System.out.println(HST);
		 System.out.println(SinNumber);
		 System.out.println(AccountName);*/

          RDS. UpdateUser( UpdateUserInformation ,con);

  	     response.sendRedirect("BrokerFiles/PersonalProfile.jsp");  
		
	}

}
