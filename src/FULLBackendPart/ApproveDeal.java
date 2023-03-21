package FULLBackendPart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import RDS.RDSFunctions;
/**
 * Servlet implementation class ApproveDeal
 */
@WebServlet("/ApproveDeal")
public class ApproveDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveDeal() {
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

	      int Brokerid=(int) Existingsession.getAttribute("Brokerid");

	      int UserID= (int) Existingsession.getAttribute("Userid");

	       String  Type=(String) Existingsession.getAttribute("Type");
	      
	       String DealID=request.getParameter("DealID");
	      
	       System.out.println("This is Deal ID"+DealID);
	      
		   RDSFunctions RDS= new RDSFunctions();
		   
	      /*if( Type==1 ) {    //RDS. BrokerSign(1,"Complete", "1");	
	    	  
	      response.sendRedirect("BrokerFiles/Reports.jsp");    return; }
	      
	      else if( Type==2 ) { 
	    	  
	    	 // RDS. AgentSign(1,"Needs Broker Approval", "1"); 
	    	  
	    	  response.sendRedirect("Agent'sFiles/Reports.jsp");    return; }
	      
	      else {  response.sendRedirect("index.jsp");    return;  }*/
		   
		   
		   
	       String Email1=request.getParameter("emailValueAddressee0");

	       String  Email2=request.getParameter("emailValueAddressee1");
	       
	       String Email3=request.getParameter("emailValueoptional0");
	          
	       String Email4=request.getParameter("emailValueoptional1");

	       
			  String  send1=request.getParameter("Addressee0");
			    
			  String  send2=request.getParameter("Addressee1");
			    
			  String  send3=request.getParameter("OptionalAddressee0");
			    
			  String  send4=request.getParameter("OptionalAddressee1");
			  
			    String Subject=request.getParameter("subjectLineEmail");
			    
			    String EmailBody=request.getParameter("messageEmail");
			    
			    System.out.println("Subject"+""+Subject);
			    
			    System.out.println("messageEmail"+""+EmailBody);
			  
	    

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	       
		   
		   String MyEmail=(String) Existingsession.getAttribute("Email");
		   
		   //System.out.println("MyEmail"+" "+MyEmail);

		   String SendmeACopy=request.getParameter("Secondary7");
		   
		   
		   String test="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/47";

	       System.out.println("Email1"+" "+Email1);
	       
	       System.out.println("Email2"+" "+Email2);
	       
	       System.out.println("Email3"+" "+Email3);
	       
	       System.out.println("Email4"+" "+Email4);

		  
	       System.out.println("send1"+" "+send1);
	       
	       System.out.println("send2"+" "+send2);
	       
	       System.out.println("send3"+" "+send3);
	       
	       System.out.println("send4"+" "+send4);
	       
	       System.out.println("SendmeACopy"+" "+SendmeACopy);
		
		      response.sendRedirect("BrokerFiles/Dashboard.jsp");  
		
	}

}
