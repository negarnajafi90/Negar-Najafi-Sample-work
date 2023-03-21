package FULLBackendPart;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMasterClasses.Users;
import RDS.RDSFunctions;

/**
 * Servlet implementation class PersonalProfileRegistration
 */
@WebServlet("/PersonalProfileRegistration")
public class PersonalProfileRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalProfileRegistration() {
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
		
		
		
		 String Save1=request.getParameter("PersonalDetailsNext");
		
		 String Save2=request.getParameter("Commissions&DisclosureNext");
		
		 String Save3=request.getParameter("Tax&BankingNext");
		
		 String Finalized=request.getParameter("AccessFinalize");

		
		 HttpSession Existingsession = request.getSession();
			
		 int id=(int)Existingsession.getAttribute("Userid");	
			
		 int Brokerid=(int) Existingsession.getAttribute("Brokerid");
			
		 String Type=(String) Existingsession.getAttribute("Type");	
		 
		 String Pass=(String) Existingsession.getAttribute("Password");
		 
		 Connection con=(Connection) Existingsession.getAttribute("Connection");
		 
	  	 RDSFunctions RDS=new RDSFunctions();
	  	 
	 	 Users MyInformation=new Users();

		 MyInformation=RDS.GetAnyUserById(id , con);
	  	 
	  	 
			String Title=MyInformation.Title ;
			
			String PREC=MyInformation.PREC;
			
		    Timestamp DateOfBirth=MyInformation.DateOfBirth;

	        String Firstname=MyInformation.Firstname;
	        
	        String Lastname=MyInformation.Lastname;

	        String Streetname=MyInformation.User_StreetName;
	        
	        String Streetnumber=MyInformation.User_StreetNumber;
	        
	        String Unit=MyInformation.User_Unit;
	        
	        String City=MyInformation.User_City;	
	        
	        String Province=MyInformation.User_Province;
	        
	        String PostalCode=MyInformation.User_PostalCode;
	        
	        String Country=MyInformation.User_Country;
	        
	        String Phone=MyInformation.User_Phone;
	        
	        String FaxOrMobile=MyInformation.User_faxOrMobile;
	        
	        String FaxOrMoNumber=MyInformation.User_faxOrMobileNumber;	
	        
	        String Email=MyInformation.User_Email;	

	        Timestamp Anniversary=MyInformation.User_Anniversary;	
			
	        Timestamp Startdate=MyInformation.User_StartDate;
		        
		    String Cap=MyInformation.User_Cap;

		    String Split=MyInformation.User_Split;

	        String Cap2=MyInformation.User_Cap2;
	        
	        String Cap3=MyInformation.User_Cap3;
	        
	        String Split2=MyInformation.User_Split2;
	        
	        String Split3=MyInformation.User_Split3;

	        String HSTNumber=MyInformation.HST;
	        
	        String SinNumber=MyInformation.SinNumber;	

	        Timestamp Terminatedate=null;
	        
	        String FirtsLogin=MyInformation.FirstLogin;

		    String AlternativeBroker="0";
		    
		    Timestamp StratAlternativeBroker=null;
		    
		    Timestamp EndAlternativeBroker=null;

		    String PaymentMethod="1";
	        
		    String Bank=MyInformation.User_Bank;	
		        
		    String AccountName=MyInformation.AccountName;

		    String AccountNumber=MyInformation.User_AccountNumber;
		    
		    String Transit="";	
	        
		    String Institution="";	
	        
	        String Status="1";
	        
	        
	        
	        
	        
		
		 
		 
		 if( Save1!=null ) {
			 
	    System.out.println("Heloo");
		 
		String Title1=request.getParameter("Title");
		
		String PREC1=request.getParameter("PRECNum");
		
		
		Timestamp DateOfBirth1=null;
		
		if( request.getParameter("DateOfBirth").isEmpty()  || request.getParameter("DateOfBirth")==null ||  request.getParameter("DateOfBirth").equals("null") )
			
		{   }else {
		
		Date date_DateOfBirth1 = null;
		try {
			date_DateOfBirth1 = new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("DateOfBirth"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		DateOfBirth1=new Timestamp(date_DateOfBirth1.getTime());
		
		}

        String Firstname1=request.getParameter("Firstname");
        
        String Lastname1=request.getParameter("Lastname");

        String Streetname1=request.getParameter("StreetName");
        
        String Streetnumber1=request.getParameter("StreetNumber");
        
        String Unit1=request.getParameter("Unit");	
        
        String City1=request.getParameter("City");	
        
        String Province1=request.getParameter("Province");	
        
        String PostalCode1=request.getParameter("PostalCode");	
        
        String Country1=request.getParameter("Country");
        
        String Phone1=request.getParameter("Phone");
        
        String FaxOrMobile1="Mobile";
        
        String FaxOrMoNumber1=request.getParameter("MobileNumber");	
        
        String Email1=request.getParameter("Email");	
        
        
	  	 
			 Title=Title1;
			
		     PREC=PREC1;
			
			 DateOfBirth=DateOfBirth1;

	         Firstname=Firstname1;
	        
	         Lastname=Lastname1;

	         Streetname=Streetname1;
	        
	         Streetnumber=Streetnumber1;
	        
	         Unit=Unit1;
	        
	         City=City1;	
	        
	         Province=Province1;
	        
	         PostalCode=PostalCode1;
	        
	         Country=Country1;
	        
	         Phone=Phone1;
	        
	         FaxOrMobile=FaxOrMobile1;
	        
	         FaxOrMoNumber=FaxOrMoNumber1;	
	        
	         Email=Email1;	

        Users UpdateUserInformation= new Users(
        		id,		
        		Brokerid,	
        		Firstname1,
        		Lastname1,
        		Anniversary,	
        		Cap,	
        		PaymentMethod,	
        		Bank,	
        		Institution,
        		Split,	
        		Transit,
          		AccountNumber,
                Streetname1,
                Streetnumber1,
                Unit1,
                City1,	
                Province1,	
                PostalCode1,	
                Country1,
                Phone1,	
                FaxOrMobile1,	
                FaxOrMoNumber1,	
                Email1,	
                Pass,
                Status,
        		Cap2,
        		Cap3,
         		Split2,
        		Split3,
                Startdate,
                Terminatedate,
                Type,
                FirtsLogin,
                Title1,
                DateOfBirth1,
                PREC1,
        	    AlternativeBroker,
        	    StratAlternativeBroker,	
        		EndAlternativeBroker,
        		HSTNumber,
        		SinNumber,
        		AccountName );
        
        RDS.UpdateUser( UpdateUserInformation , con);
        
		 }
        
		 
	
		 
		if( Save2!=null) { 
			
		Date date_Anniversary=null;
			
		Timestamp Anniversary1=null;
		
	    Date date_Startdate1=null; 
		
	   Timestamp Startdate1=null;	 
		 
				
		
   	 try {
				
	     if(request.getParameter("AnniversaryDate")==null || request.getParameter("AnniversaryDate").isEmpty() ||request.getParameter("AnniversaryDate")=="null") {
	    	 
	    	 
	     }
	     else {
	    	 
	    	 

				date_Anniversary=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("AnniversaryDate"));
	
	    	 
	    	 Anniversary1=new Timestamp(date_Anniversary.getTime());
	    	 
	     }	
	     
	     

				
	     if(request.getParameter("StartDate")==null || request.getParameter("StartDate").isEmpty() ||request.getParameter("StartDate")=="null") {
	    	 
	    	 
	     }
	     else {
	    	 
	    	 
	    	 date_Startdate1=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse( request.getParameter("StartDate"));
	    	 
	    	 Startdate1=new Timestamp(date_Startdate1.getTime());
	    	 
	     }			
				
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
   	 
	    String Cap1=request.getParameter("CommissionCap1");

	    String Split1=request.getParameter("CommissionSplit1");

        String Cap21=request.getParameter("CommissionCap2");
        
        String Cap31=request.getParameter("CommissionCap3");
        
        String Split21=request.getParameter("CommissionSplit2");
        
        String Split31=request.getParameter("CommissionSplit3");

        
		  Anniversary=Anniversary1;	
		
		  Startdate=Startdate1;
	        
	      Cap=Cap1;

	      Split=Split1;

          Cap2=Cap21;
        
          Cap3=Cap31;
        
          Split2=Split21;
        
          Split3=Split31;
        
           
        Users UpdateUserInformation= new Users(
        		
        		id,		
        		Brokerid,	
        		Firstname,
        		Lastname,
        		Anniversary1,	
        		Cap1,	
        		PaymentMethod,	
        		Bank,	
        		Institution,
        		Split1,	
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
                FaxOrMobile,	
                FaxOrMoNumber,	
                Email,	
                Pass,
                Status,
            	Cap21,
         		Cap31,
        		Split21,
         		Split31,
                Startdate1,
                Terminatedate,
                Type,
                FirtsLogin,
                Title,
                DateOfBirth,
                PREC,
        	    AlternativeBroker,
        	    StratAlternativeBroker,	
        		EndAlternativeBroker,
        		HSTNumber,
        		SinNumber,
        		AccountName );
        
           RDS.UpdateUser( UpdateUserInformation,con );
        
		}
		
		
		
		if( Save3!= null) {

	        String HSTNumber1=request.getParameter("HSTNumber");
	        
	        String SinNumber1=request.getParameter("SinNumber");	

	        HSTNumber=HSTNumber1;
	        
	        SinNumber=SinNumber1;	
	        
	        
	        Users UpdateUserInformation= new Users(
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
	                FaxOrMobile,	
	                FaxOrMoNumber,	
	                Email,	
	                Pass,
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
	        		HSTNumber1,
	        		SinNumber1,
	        		AccountName );
	        
	         RDS.UpdateUser( UpdateUserInformation ,con);
			
		}
        

		
		if( Finalized != null ) {
			
	  System.out.println( "Hello" );

        String password=request.getParameter("ConfirmNewPassword");
        
        System.out.println(  password );
        
        Pass=password;
        
        FirtsLogin="1";
        
        Users UpdateUserInformation= new Users(
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
                FaxOrMobile,	
                FaxOrMoNumber,	
                Email,	
                Pass,
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
        		HSTNumber,
        		SinNumber,
        		AccountName );
        
        
   	    RDS.UpdateUser( UpdateUserInformation,con );

   	    response.sendRedirect("BrokerFiles/Dashboard.jsp");  

		}
 

		
		
		
		
	}

}
