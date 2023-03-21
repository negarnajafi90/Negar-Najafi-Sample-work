<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../CSS/Login.css" type="text/css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<title>Forgot Password - Masterre</title>

 <script>
 
 //The following finction is to validate th emeail addres user entered to makes sure the recovery email will be send to a valid and recorded email addres . 

var emailexist=0;

 function CheckEmail(){
	 
	 var Broker_Email = document.forms["ProBrokerResetPassword"]["RecoverEmail"].value;//Getting the email address the user has been enterd 
	 
	 var btnSubmit = document.getElementById("reset");//This is the value regarding the reset button to be activated when the user enter an correct email address 
	 
	 <%
	 
	 ArrayList<String> Brokersemails = new ArrayList<String>();//This array list is to store the email addres from the daabase

	 Connection conRDS = null;
	 
	 Statement pst = null;

	 try {
	 	
		//Making the connections and retriving the data from the database 

	 	Class.forName("com.mysql.jdbc.Driver");  
	 	
	 	conRDS=DriverManager.getConnection( 
	 			
	 	"jdbc:mysql://probroker.clgojz1yu9qh.ca-central-1.rds.amazonaws.com:3306/ProBroker","probroker","Brokerpro2020Pollock");
	 	
	 	}

	 catch(Exception e){ 
	 	
	 	// System.out.println(e);
	 	}

	    String AdduserStatment="SELECT * FROM Users";//This is the query to run and get the emails 

	 	
	 	
	 		try {
	 			
	 			//Creating the connection to DB 
	 			
	 			pst =conRDS.createStatement();
	 			
	 			ResultSet rs;
	 			
	 			//Running the Query
	 			
	 			rs = pst.executeQuery(AdduserStatment);
	 			
	 			//Getting back the result 
	 			
	 			while ( rs.next() ) {
	 				
	 			String email = rs.getString("EMAIL");
	            
	 			Brokersemails.add(email); // Storing the emails from our recods into Brokersemails array
     
	                     
	          }
	 		
	 		} 
	    
	    //Closing the resylt set and connection
	 		
	 		catch (SQLException e) {
	 			
	 	
	 			e.printStackTrace();
	 		}
	 		
	 		 finally {
	 			
	 		    
	 		    if (pst != null) {
	 		    	
	 		        try {
	 		        	
	 		            pst.close();
	 		            
	 		        } 
	 		        
	 		        catch (SQLException e) { /* ignored */}
	 		    }
	 		    
	 		    if (conRDS != null) {
	 		    	
	 		        try {
	 		        	conRDS.close();
	 		        	
	 		        } 
	 		        
	 		        catch (SQLException e) { /* ignored */}
	 		    }
	 		}	
	 		 

	 		
	 %>
	
  //Storing the emails from  Brokersemails to the ExistEmails array for checking 
   
   var ExistEmails = [<% for (int i = 0; i < Brokersemails.size(); i++) { %>"<%= Brokersemails.get(i) %>"<%= i + 1 < Brokersemails.size() ? ",":"" %><% } %>];
   
  //Checking all the email addresses with the one that user entered to see if the email address has been registerd previously
   
   for(var g = 0; g< ExistEmails.length; g++){

	   if(ExistEmails[g]==Broker_Email){
		 
		   document.getElementById("emailcheck").style.visibility = "hidden"; //Hide the message from th ep tag with emailcheck id if th email address exist and registered 
		   
		   emailexist=0;//This varible keep track of existance an email address , So, when this variable has a value of 0 means the email has been registered 
		   
		   btnSubmit.disabled = false; //Activate the button to able the user to recieve the code via th email address 
		    
		   g=ExistEmails.length;

		 }
		 
		 else
			 
		 {
		     document.getElementById("emailcheck").style.visibility = "visible"; //Show a message to user in case if his/email address is not registered 
		     
		     btnSubmit.disabled =true; //The Button will remain deactive till the user enter a valid email address 
		     
		     emailexist=1;//Then the value will be set to 1 to inform system that the user's email address is invalid and not registred 
		     
		 }

   }

	 
 }
 

</script>



</head>


<header>


</header>

<body>

<div style="margin-top: 100px">

<!-- The following form contains one input and one button which able users to enter their email address and get a code via that email address to recover their password -->

<!-- The email address will be validated to see if the user is a valid user and have an account then they can get the code to recover their password -->

<!-- The validation will be done through the script that has been explained previously and emailcheck() function does the job  -->

<!-- After validation the page will be directed to ResetPassword.java to send the email to the user's email address -->

    <form name="ProBrokerResetPassword" method="post" action="../ResetPassword" enctype="multipart">
    
		<a href="../index.jsp"><button  type="button" class="backButton"> Cancel</button></a>

		<div class="masterDiv">
            <div class="MasterDivOne">
                <img class="LoginMarterRe" src="../ImagesUsed/MasterRe.png" alt="">
            </div>
            <div class="MasterDivTwo">
                <img class="img2logo" src="../ImagesUsed/MasterRe3.png" alt="">
            </div>
        </div>
	
		
		<!-- The following label and input are to collect from users their email address  -->

		
			<div class="ColumnFlex" style="margin-top: 70px;">

				<div>
					<p style="color: grey; margin-left: 31px; margin-top: 0; margin-bottom: 0">Enter your email address to receive a verification code.</p>
					<input  oninput="CheckEmail();" class="inlineInput" type="text" id="RecoverEmail" name="RecoverEmail" placeholder="Email" style="margin-top: 10px;" autocomplete="email">
					<p style="color: red; margin-bottom: 10px; visibility:hidden";" class="WarningLogin" id="emailcheck">The email address does not match our records</p>
					
				</div>

				<div style="margin-bottom: 20px;">

					<input disabled="disabled"  class="LoginInput LoginRegister" style="margin-bottom: 5px;" id="reset" type="submit" value="Request verification code">
						
				</div>
				
			</div>
		

       
       <!-- The following paragraph contains the message to inform user that their email address is not a valid one  -->
    

    
		
		
		<!-- This is the input to get the email from user and then call CheckEmail(); to validate email address  -->
		
		
	    

		
		<!-- The following input is the button which will be activated when the email address is a valid one  -->
			
		
	    
	</form>
	

  </div>



</body>

</html>