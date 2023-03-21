package FULLBackendPart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amazonaws.services.s3.AmazonS3;

import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Users;
import RDS.RDSFunctions;
import S3.ConnectionToS3;

/**
 * Servlet implementation class ProBrokerLogin
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	

	 int login_attempts = 5;   
	 	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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

		 doGet(request, response);

          //Creating a new session for a user who want to login 
		 
          HttpSession session = request.getSession();
          
          //We require to block a user's access after 5 times unsuccessful attempts
          
          session.setAttribute("counter", login_attempts);
          
          //Getting the Email Address and the Password that user has entered in the log in form
          
          String User_Email= request.getParameter("Email");
		  
		  String User_password= request.getParameter("password");
		  
		  System.out.println(User_Email);
		  
		  System.out.println(User_password);
		  
		  //Creating a new object of our data base class to connect to database
		  	  
		  RDSFunctions RDS=new RDSFunctions();
		  
		  Connection con=RDS.CreateConnection();
		  
		  ConnectionToS3 S3=new ConnectionToS3();

		  AmazonS3 s3client= S3.ConnectionCreationToS3();
		  
		  //We have Brokers and Agents who are login into the system so we need to have 
		  
		  //Separate object for each (Broker or Agent) to proccess their information
		  
		  Users  Login_User=new Users();

		 //Searching in the data base in our brokers and agents to see if user has entered valid credentials
		  
		  Login_User=RDS.SearchUsers(User_Email, User_password,con);

		  System.out.println(Login_User.id);
		  
		 //The following if condition checks if there is a valid broker in our records with the Credentials user has been entered 

		  if(Login_User.id!=0)
			  
		  {

			  session.setAttribute("Userid",  Login_User.id);
				
			  session.setAttribute("Brokerid", Login_User.Broker_id );
			  
			  session.setAttribute("UserFirstname", Login_User.Firstname);
			  
			  session.setAttribute("UserLastname", Login_User.Lastname);
			  
			  session.setAttribute("Email", Login_User.User_Email);
			  
              session.setAttribute("Password", Login_User.User_password);
              
              session.setAttribute("Type", Login_User.Type);
              
              session.setAttribute("Connection", con);
              
              session.setAttribute("S3", s3client);
              
              session.setMaxInactiveInterval(15*60); //This is used for setting the inactive time and logout the inactive users


              login_attempts=5;
			  
              
              System.out.println("Check"+" "+Login_User.FirstLogin );
              
              
			  if( Login_User.Type.equals("1")  ) {
				  
			  System.out.println("Broker's if");

			       if( Login_User.FirstLogin.equals("1")  ) { response.sendRedirect("BrokerFiles/Dashboard.jsp"); }else { response.sendRedirect("BrokerFiles/CompanyProfileRegistration.jsp"); }
			  

    		   
     		   return;  
			  }
			  
			  else if( Login_User.Type.equals("2")  ){

	    		  System.out.println("agent");
	    		  
	              //The following two lines of code will redirect the Brokers to their dash board
	              
	              //RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Agent'sFiles/AgentDeals.jsp");
	             
	    		  //requestDispatcher.forward(request, response);  
	    		  
	    		  response.sendRedirect("Agent'sFiles/Dashboard.jsp");
	    		  
	    		  return; 
				  
			  }

			  
			  else if( Login_User.Type.equals("3") ){

	    		  System.out.println("admin");
	    		  
	              //The following two lines of code will redirect the Brokers to their dash board
	              
	              //RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Agent'sFiles/AgentDeals.jsp");
	             
	    		  //requestDispatcher.forward(request, response);  
	    		  
	    		  response.sendRedirect("Agent'sFiles/Dashboard.jsp");
	    		  
	    		  return; 
				  
			  }
			  

 }  
		  
		  


		   //Here we are checking the value of login_attempts to see if the user has exceed the 5 times limit 
		   
		   if(login_attempts==0) {
  
 		        System.out.println("if 5");
 		        
 		        //We destroy the session if it exceed the 5 times 
 			 
 			    session.invalidate(); 
 			    
 			    login_attempts=5; //After we redirected the user to change password page we set login_attempts for the next time.
 			    
	            //We redirect the user to change their password if they exceed the 5 times attempts
		    	
 			   response.sendRedirect("Login/ForgotPassword.jsp");
   				 
    			//requestDispatcher.forward(request, response); 
    			
    			login_attempts=5;
 			
 			}  
		    

		   else{

			   //if still chance to login into the system we count the attempts and ask the user to enter a valid information
            	          	  
            	  login_attempts--;
            	  
            	  System.out.println(session.getAttribute("counter"));
            	  
            	  response.sendRedirect("Login/Login1.jsp");
  				 
    			 // requestDispatcher.forward(request, response); 
    			  
    			  return;    }   
		    
		
	}

}
