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
 * Servlet implementation class SenBackDeal
 */
@WebServlet("/SenBackDeal")
public class SenBackDeal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SenBackDeal() {
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

	      int Brokerid=1;
	    		  
	      //(int) Existingsession.getAttribute("Brokerid");

	      int UserID= 1;
	    		  
	      //(int) Existingsession.getAttribute("Userid");

	      String  Type="1";  
	    		  
	      //(String) Existingsession.getAttribute("Type");
		      
	      String DealID=request.getParameter("DealID");
	      
	      String DealNotes=request.getParameter("DealNote");

	      System.out.println("This is Deal ID"+DealID);
	      
	      System.out.println("New Note is"+DealNotes);
	      
		  RDSFunctions RDS= new RDSFunctions();
	      
		 response.sendRedirect("BrokerFiles/Dashboard.jsp");  
		   
		  // RDS.SendDealBack(DealID,"Send Back","New Notes");
		
		  // if( Type==1 ) {   response.sendRedirect("BrokerFiles/Reports.jsp");    return; }
		      
		  // else if( Type==2 ) {   response.sendRedirect("Agent'sFiles/Reports.jsp");    return; }
		      
		  // else {  response.sendRedirect("index.jsp");    return;  }
	}

}
