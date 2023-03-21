package FULLBackendPart;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMasterClasses.Contacts;
import RDS.RDSFunctions;

/**
 * Servlet implementation class AddNewContact
 */
@WebServlet("/AddNewContact")
public class AddNewContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewContact() {
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
		
		
		
		 //System.out.println("Hello");
		 
		  HttpSession Existingsession = request.getSession();
		  
		  int UserID =(int) Existingsession.getAttribute("Userid");
		  
		  Connection con=(Connection) Existingsession.getAttribute("Connection");
		 
		  String Saveandclose= request.getParameter("SaveandClose");
		  
		  String SaveandNew= request.getParameter("SaveandNew");

		  String Type= request.getParameter("UserType");
		  		  
		  String BusinessName= request.getParameter("NewBusinessName");
		  
		  String Officer= request.getParameter("NewOfficerName");
		  
		  String Firtsname= request.getParameter("NewFirstName"); 
		  
		  String LastName= request.getParameter("NewLastName");
		  
		  String PratyType = request.getParameter("ClientType");
		  
		  String Phone = request.getParameter("Phone");
		  
		  String Email= request.getParameter("Email");
			 
		  String ExtraContact = request.getParameter("ExtraContactInformationLabel");
			 
		  String ExttaContactNumber = request.getParameter("ExtraContactInformation");
			 
		  String Unit= request.getParameter("newClientUnit");
			 
		  String StreetNumber = request.getParameter("newClientStreetNumber");
		  
		  String StreetName = request.getParameter("newClientStreetName");
		  
		  String City= request.getParameter("newClientCity");
			 
		  String Province = request.getParameter("newClientProvince");
		  
		  String OtherProvince = request.getParameter("newClientOtherProvince");
		  
		  String MainProvince="";
		  
		  System.out.println("This is Province"+MainProvince);
		  
		  if ( OtherProvince==null || OtherProvince.isEmpty() || OtherProvince=="" ) {    MainProvince=Province;      }
		  
		  else {   MainProvince= OtherProvince;    }
		  
		  
		  System.out.println("This is Province"+MainProvince);

		  String Country = request.getParameter("newClientCountry");
		  
		  String PostalCode = request.getParameter("newClientPostalCode");
		  
		  String Lawyer = request.getParameter("NewLawyerORAgent");
		  
		  String LawFirm = request.getParameter("NewLawyerFirmORBrokerage");
		  
		  String ClerkName= request.getParameter("ClerkFullName");
		  
		  String ClerckEmail= request.getParameter("ClerkEmail");
		  
 
		 
		 Contacts Contact=new Contacts(
				 
				    Type,
		  		  
				    BusinessName,
				  
				    Officer,
				  
				    Firtsname,
				  
				    LastName,
				  
				    PratyType,
				  
				    Phone,
				  
				    Email,
					 
				    ExtraContact ,
					 
				    ExttaContactNumber,
					 
				    Unit,
					 
				    StreetNumber,
				  
				    StreetName ,
				  
				    City, 
					 
				    MainProvince,
				    
				    Country ,
				  
				    PostalCode ,
				  
				    Lawyer ,
				  
				    LawFirm ,
				  
				    ClerkName,
				  
				    ClerckEmail ,
				    
				    UserID,
				    
				    0
				    
				 );
		 
			RDSFunctions RDS= new RDSFunctions();
		 
			RDS.NewContacts( Contact ,con);

		
		  if( Saveandclose!=null ) { response.sendRedirect("BrokerFiles/Dashboard.jsp"); }
			  
		  else if( SaveandNew!=null )	{ response.sendRedirect("BrokerFiles/AddNewContact.jsp"); }
		  
		  else {}
		
		
		
		
		
		
	}

}
