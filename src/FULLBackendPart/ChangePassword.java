package FULLBackendPart;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		 
         HttpSession session = request.getSession();
         
         String Password=request.getParameter("password");
		
	     User user= (User) session.getAttribute("authcode");
	     
	     Connection con=(Connection) session.getAttribute("Connection");
	       
	     String Email=user.getEmail();
		
		 System.out.println(user.getEmail());

		 RDSFunctions RDS=new RDSFunctions();
		 
		 Users User=new Users();
		 
		 User=RDS.GetAnyUserByEmail( Email,con );
		 
		 System.out.println ( User.id );
		 
		 System.out.println ( Password );
		 
		 User.User_password=Password;
		 
		 RDS.UpdateUser(User,con);
		 
		 response.sendRedirect("index.jsp");
		
		 //RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
			 
 		 //requestDispatcher.forward(request, response);
		
		
		
	}

}
