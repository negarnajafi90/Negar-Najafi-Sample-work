package FULLBackendPart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMasterClasses.User;
import ProMasterClasses.Users;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 
	        response.setContentType("text/html;charset=UTF-8");
	        
            HttpSession session  = request.getSession();
	        
	        try (PrintWriter out = response.getWriter()) {
	          
	           String email = request.getParameter("RecoverEmail");
	           
	           if( email.equals(" ") || email==null ) { email =(String) session.getAttribute("email"); }
	           
	           System.out.println("This is Email"+email);
	           
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
	               
	             String RecoverEmail= request.getParameter("RecoverEmail");

	             session.setAttribute("email", RecoverEmail);
	       	
	             response.sendRedirect("Login/VarifyEmail.jsp");
	               
	           }
	           
	           else{
	        	
	      		  out.println("Failed to send verification email" +" "+test);
	      	   }
	           
	        }
	    }
	
	
	
	
	
	
	
	
	
    public ResetPassword() {
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
		
		
	     processRequest(request, response);
	     
	     
	     
	     
	     
	     
	}
	
	

}
