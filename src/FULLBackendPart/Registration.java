package FULLBackendPart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMasterClasses.User;
import ProMasterClasses.Users;
import RDS.RDSFunctions;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		
	   String Type=request.getParameter("UserType");

       String Firstname=request.getParameter("Firstname");
       
       String Lastname=request.getParameter("Lastname");
       
       Timestamp User_Anniversary=null;//request.getParameter("Anniversary");
	   
	   String User_Cap=request.getParameter("Cap");	
	   
       String User_PaymentMethod=" ";	
       
	   String User_Bank=" ";	
	   
	   String User_Institution=" ";	
	   
	   String User_Split=request.getParameter("Split");	
	   
       String User_Transit=" ";
       
       String User_Split2=request.getParameter("Split3");	
       
       String User_Cap2=request.getParameter("Cap2");	
       
	   String User_Split3=request.getParameter("Split3");	
	   
	   String User_Cap3=request.getParameter("Cap3");	
	   
	   String User_AccountNumber=" ";	
	   
	   String User_AccountName=" ";
	   
	   String User_StreetName=" ";
	   
	   String User_StreetNumber=" ";
	   
	   String User_Unit=" ";	
	   
	   String User_City=" ";
	   
	   String User_Country=" ";
	   
	   String User_Province=" ";	
	   
	   String User_PostalCode=" ";	
	   
	   String User_Phone=request.getParameter("password");	
	   
	   String User_MobileFax=request.getParameter("UserExteraContactInformationLabel");	
	   
	   String User_MobileFaxNumber=request.getParameter("UserExteraContact");
	   
	   String User_Email=request.getParameter("E-mail");	
	   
	   String User_password=request.getParameter("Password");	
	   
	   String User_Status="Active";

	   Timestamp User_StartDate=null;//request.getParameter("Password");	
	   
	   Timestamp User_TerminateDate=null;	
	   
	   HttpSession session=request.getSession(false);
	      
	   int Brokerid=(int) session.getAttribute("Brokerid");
	   
	   Connection con=(Connection) session.getAttribute("Connection");
	   
	   String UserType="";
	   
	   RDSFunctions RDS=new RDSFunctions();
	   
	   if(Type.equals("Agent")) { UserType="2" ; } else { UserType="3";  } 

	   Timestamp DateofBirth=null;
	   
	   Timestamp StratDate=null;
	   
	   Timestamp EndDate=null;
	   
	   Users NewUser=new Users( 0, Brokerid, Firstname, Lastname,  User_Anniversary,  User_Cap, User_PaymentMethod, User_Bank, User_Institution, User_Split, User_Transit,User_AccountNumber, User_StreetName, User_StreetNumber,  User_Unit,  User_City, User_Province,  User_PostalCode,  User_Country,  User_Phone,  User_MobileFax, User_MobileFaxNumber, User_Email, User_password,  User_Status, User_Cap2, User_Cap3, User_Split2, User_Split3,  User_StartDate,  User_TerminateDate,UserType,"FirstLogin" ,"Titile",DateofBirth,"PREC","AlternativeBroker",StratDate,EndDate,"HST","SinNumber",User_AccountName);
	   
	   RDS.AddNewUser(NewUser,con);
	   
	   System.out.println("Type"+" "+ Type);
	   
	   System.out.println("First Name"+" "+Firstname); 
	   
	   System.out.println("Last Name"+" "+Lastname); 
	   
	   System.out.println("Aniversary"+" "+User_Anniversary);
	   
	   System.out.println("Cap1"+" "+User_Cap);
	   
	   System.out.println("Cap2"+" "+User_Cap2);
	   
	   System.out.println("Cap3"+" "+User_Cap3);
	   
	   System.out.println("Split1"+" "+User_Split);
	   
	   System.out.println("Split2"+" "+User_Split2);
	   
	   System.out.println("Split3"+" "+User_Split3 );
	   
	   System.out.println("E_mail"+" "+User_Email);
	   
	   System.out.println("Phone"+" "+User_Phone);
	   
	   System.out.println("FaxorMobile"+" "+User_MobileFax);
	   
	   System.out.println("FaxorMobile Number"+" "+User_MobileFaxNumber);
	   
	   System.out.println("Password"+" "+User_password);
	   
	   System.out.println("Today"+" "+ User_StartDate);
	   
	   System.out.println("Status"+" "+ User_Status);
		
		
	   response.sendRedirect("BrokerFiles/AddNewUser.jsp");
		
	}

}
