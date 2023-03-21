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

import ProMasterClasses.User;
import RDS.RDSFunctions;

/**
 * Servlet implementation class BrokerResetPasswordVarification
 */
@WebServlet("/BrokerResetPasswordVarification")
public class BrokerResetPasswordVarification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	
            throws ServletException, IOException {
		
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            
            User user= (User) session.getAttribute("authcode");
            
            String code = request.getParameter("code");
            
        	System.out.println(code);
            
            if(code.equals(user.getCode())){
            	
            	//String email=(String) session.getAttribute("email");
            	
            
            	
             /* String Broker_fullname= (String) session.getAttribute("fname");
              
              System.out.println(Broker_fullname);
      		  
      		  String Broker_Email= (String) session.getAttribute("email");
      		  
      		  String Broker_password= (String) session.getAttribute("pass");
      		  
      		  String Broker_confirmpassword= request.getParameter("confirmpassword");
      		  
      		  System.out.println(Broker_fullname+" "+Broker_Email+" "+Broker_password+" "+Broker_confirmpassword);
      		  
      		  RDSFunctions RDS=new RDSFunctions();
      		  
      		   UID=RDS.SET_UID();
      		  
      		  RDS.ADDBrokers(UID+1,Broker_fullname,Broker_Email,Broker_password);*/
      		  
      		 // RequestDispatcher requestDispatcher = request.getRequestDispatcher("changePassword.jsp");
      		  
      		 response.sendRedirect("changePassword.jsp");
      			 
      		  //requestDispatcher.forward(request, response);
            	
     
            	
                //out.println("Verification Done");
                
            }
            
            else{
            	
                out.println("Incorrect verification code");
            }
            
        }
    }
	
	
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrokerResetPasswordVarification() {
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
		
		
		processRequest( request, response);
	}

}
