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
 * Servlet implementation class EditContact
 */
@WebServlet("/EditContact")
public class EditContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditContact() {
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
		
		//HttpSession Existingsession = request.getSession();
		
		
		
		
		String Saveandclose=request.getParameter("SaveClose");
		
		String SaveandNew=request.getParameter("SaveandNew");
		
		
		
		   String Type=request.getParameter("UserType");
		   
		   String businesName=request.getParameter("NewBusinessName");
		   
		   String Officer=request.getParameter("NewOfficerName");
		   
		   String FirstName=request.getParameter("NewFirstName");
		   
		   String LastName=request.getParameter("NewLastName");
		   
		   String PartyType=request.getParameter("ClientType");
		   
		   String Phone=request.getParameter("Phone");
		   
		   String Email=request.getParameter("Email");
		   
		   String ExtraContact=request.getParameter("ExtraContactInformationLabel");
		   
		   String ExtraContactNumber=request.getParameter("ExtraContactInformation");
		   
		   String Unit=request.getParameter("newClientUnit");
		   
		   String StreetNumber=request.getParameter("newClientStreetNumber");
		   
		   String StreetName=request.getParameter("newClientStreetName");
		   
		   String City=request.getParameter("newClientCity");
		   
		   String Province=request.getParameter("newClientProvince");
		   
		   String OtherProvince=request.getParameter("newClientOtherProvince");
		   
		   String Country=request.getParameter("newClientCountry");
		   
		   String PostalCode=request.getParameter("newClientPostalCode");
		   
		   String Lawyer=request.getParameter("NewLawyerORAgent");
		   
		   String LawFirm=request.getParameter("NewLawyerFirmORBrokerage");
		   
		   String ClerkName=request.getParameter("ClerkFullName");
		   
		   String ClerkEmail=request.getParameter("ClerkEmail");
		   
		   HttpSession Existingsession = request.getSession();
		   
		   int  UserID=(int)Existingsession.getAttribute("Userid");
		   
		   Connection con=(Connection) Existingsession.getAttribute("Connection");
		   
		   String  ID=request.getParameter("ID");
		   
		   int ContactID=Integer.parseInt(ID);
		
		
		String MainProvince="";
		
		if( Province.equals("Other") ) { MainProvince=OtherProvince; }else { MainProvince=Province; }
		
		
		   Contacts  mycontact=new Contacts(  Type,  businesName,   Officer,   FirstName,   LastName,   PartyType ,   Phone ,   Email,
					 
					   ExtraContact ,   ExtraContactNumber ,  Unit,   StreetNumber ,   StreetName ,   City,
					 
					   MainProvince ,   Country ,   PostalCode ,   Lawyer ,  LawFirm ,   ClerkName,   ClerkEmail,  UserID ,  ContactID);
		
		
			RDSFunctions RDS= new RDSFunctions();
			
			RDS.UpdateContacts( mycontact , con);
			
			
			
			if(Saveandclose !=null) { 	    	response.sendRedirect("BrokerFiles/Contacts.jsp");	 }
		
	
			
			else if( SaveandNew !=null) { 	    	response.sendRedirect("BrokerFiles/AddNewContact.jsp");	}
		
		
	}

}
