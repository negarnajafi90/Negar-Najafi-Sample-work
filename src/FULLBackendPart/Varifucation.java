package FULLBackendPart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import ProMasterClasses.User;
import RDS.RDSFunctions;

/**
 * Servlet implementation class Varifucation
 */
@WebServlet("/Varifucation")

public class Varifucation extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	
        throws ServletException, IOException {
		
        response.setContentType("text/html;charset=UTF-8");

        String ResendEmail=request.getParameter("Resend"); 
        
        HttpSession session = request.getSession(false);
        
        String email ="";
        
        if (session == null) { System.out.println("Creating New Session");  HttpSession session1 = request.getSession();  email=(String) session1.getAttribute("email"); } else {  System.out.println("No New Session"); email=(String) session.getAttribute("email");  }
        
        

        System.out.println("This is Email"+email);
    	
        if(ResendEmail!=null) { 
        	
	               try (PrintWriter out = response.getWriter()) {
		          
		           //String email =(String) session.getAttribute("email");

		         
		           
		      	  //create instance object of the SendEmail Class
		           
		           EmailVarification sm = new EmailVarification();
		           
		      	  //get the 6-digit code
		           
		           String code = sm.getRandom();
		           
		      	   //craete new user using all information
		           
		           User user = new User(email,code);
		           
		          //call the send email method
		           
		           boolean test = sm.ResetPasswordEmail(user);
		           
		      	  //check if the email send successfully
		           
		           if(test){
		        	   
		        	    System.out.println("servlet sent email");

		                session.setAttribute("authcode", user);
		               
		                String RecoverEmail= (String) session.getAttribute("email");

		                session.setAttribute("email", RecoverEmail);
		       	
		                response.sendRedirect("Login/VarifyEmail.jsp");
		             
		                return;
		               
		           }//Closing inner if
		           
		           else{  out.println("Failed to send verification email");  }//Closing inner else
		           
		        }//Closing Try

        	}//Closing IF
        
        else {
        
        try (PrintWriter out = response.getWriter()) {
        	
              User user= (User) session.getAttribute("authcode");
            
                String code = request.getParameter("code");
            
               if(code.equals(user.getCode())){   response.sendRedirect("Login/changePassword.jsp");  return ; }//Closing Inner IF
            
               else{  out.println("<p style='color:red;'>Incorrect verification code</p>");    }//Closing Inner Else
            
         }//Closing Try
        
       }// Close Else
	
	}//Closing Exception
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Varifucation() {
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
		
		 processRequest(request,response);


		
	}

}
