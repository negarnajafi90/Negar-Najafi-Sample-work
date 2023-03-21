<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../CSS/Login.css" type="text/css">

<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

<title>Sign up - Masterre</title>

 <script>

var passwordmatched=0; // This variable is to  keep track if the password is confirmed by the user

var emailexist=0; //This variable is to keep track if th email address is new and the user  have not use it previosuly and do not exist in our records

//This function will collect the value from both password and cinfirm password filed and checks ifthey are equal

//So if by mistake the user entered wring format password or have not confirmed the password , a message will be appear to ask she/he correct the data

function CheckPasswords(){
	
 var password = document.forms["ProBrokersignup"]["pass"].value; // Getting the value from the password field 
 
 var confirmpassword = document.forms["ProBrokersignup"]["confirmpass"].value; // Getting the confirm password value 
 
 // Cheking if they are matched or not 
 
 if(password!=confirmpassword){
     
    document.getElementById("passcheck").style.display = "block"; // Display the message that the passwords are not matched and user have to correct the data
    
    passwordmatched=0; //Set this value to 0 means the password are not matched 
   
 }
 
 else
 {
     document.getElementById("passcheck").style.display = "none"; //This function will hide the error message if the passwords are matched 
     
     passwordmatched=1;	// This value for this valiable means that the passwords are matched correctly
 }
 
}
 
 
 //The following function will connect to the database and checks if the Email addres are exist in the recod or not 
 
 function CheckEmail(){
	 

	 
	 var Broker_Email = document.forms["ProBrokersignup"]["Email"].value; //Contains the Email address that the user has entered 

	 <%
	 
	 ArrayList<String> Brokersemails = new ArrayList<String>(); // This array list is to store are the Email addresses from the database 
	 
	 //The following steps are to conncet to the database on AWS 

	 Connection conRDS = null;
	 
	 Statement pst = null;

	 try {
	 	

	 	Class.forName("com.mysql.jdbc.Driver");  
	 	
	 	conRDS=DriverManager.getConnection( 
	 			
	 	"jdbc:mysql://probroker.clgojz1yu9qh.ca-central-1.rds.amazonaws.com:3306/ProBroker","probroker","Brokerpro2020Pollock");
	 	
	 	}

	 catch(Exception e){ 
	 	
	 	System.out.println(e);
	 	
	 	}
    
	    String AdduserStatment="SELECT * FROM Brokers"; //This is the query to collect all the data from database 

	 	
	 		try {
	 			
	 			pst =conRDS.createStatement();//connect to the database
	 			
	 			ResultSet rs;
	 			
	 			rs = pst.executeQuery(AdduserStatment);//Running the query 
	 			
	 			while ( rs.next() ) {
	 				
	 			String email = rs.getString("EMAIL");//Retriving the data
	            
	 			Brokersemails.add(email);//Storing the emails in the array list 
     
	                     
	          }
	 		
	 		} 
	 		
	    //Cosing the connection and result set
	    
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
	 
//storing the Emails from te array list (Brokersemails) to an array list in java script
   
   var ExistEmails = [<% for (int i = 0; i < Brokersemails.size(); i++) { %>"<%= Brokersemails.get(i) %>"<%= i + 1 < Brokersemails.size() ? ",":"" %><% } %>];
   
 //The following for loop will checks all the email address with the one that the broker has enterd 
 
 //if the Email address match to one of the emails from out records it means the broker alreay have an account and will recieve a message to use a different email address 
   
   for(var g = 0; g< ExistEmails.length; g++){

	   if(ExistEmails[g]==Broker_Email){
		 
		   document.getElementById("emailcheck").style.display = "block"; //Showing the message regarding the existing an email address
		   
		   emailexist=0;// Then set the value of this variable to 0 means that the email address is not valid 
		    
		   g=ExistEmails.length;
		   
		 }
		 
		 else
		 {
		     document.getElementById("emailcheck").style.display = "none";//If the Email address is not exist in the records , the system hide te message regarding the unvalid email address 
		     
		     emailexist=1;//Giving this value to this valiable means that the email address is valid and not exist 
		 }

   }

	 
 }
 
 //This function is to check if all the condition has been meet and then let the user to register 
 
 //no field should be empty , all the fields have to have valid data
 
 //The password should be matched and have 8 charactor at least
 
 //The Email address should be a new email address , Brokers can not have various account with same email address
 
 function check(){
	 
//These variables contains the data which user has enter for validation

 var btnSubmit = document.getElementById("signUp"); // The buttom tobe activated
	 
 var Broker_Fullname = document.forms["ProBrokersignup"]["fname"].value; // Full name value user entered 
 
 var Broker_Email = document.forms["ProBrokersignup"]["Email"].value; // The Email address user enterd 
 
 var Broker_pass = document.forms["ProBrokersignup"]["pass"].value; //The password field value 
 
 //The below if condition is to check all the fields have validated value and not empty 
 
 if(Broker_Fullname=="" || Broker_Email=="" || Broker_pass==""){
	 
	   document.getElementById("fieldcheck").style.display = "block"; 
	  
	   
	 }
	 
	 else {
	     document.getElementById("fieldcheck").style.display = "none";
	   
	 } 
 
//This if condition is to check if the email address is valid and not dublicated also checks if user has confirm password

//if all the data are valid then the register button will be active to proceed data

if(Broker_Fullname!="" && passwordmatched==1 && emailexist==1 ){
	
btnSubmit.disabled = false; //Activated the Register button 
	
}

else{

	btnSubmit.disabled =true; //Keep the button diactivate or disable if the data are not valid one 
	}

 }	


</script>

<style>
	.WarningLogin{margin-top: 0;}	
</style>

</head>


<header>

</header>

<body>

<div style="margin-top: 50px;">


    <form name="ProBrokersignup" method="post" action="RegisterBroker" enctype="multipart">

		<div class="masterDiv">
            <div class="MasterDivOne">
                <img class="LoginMarterRe" src="../ImagesUsed/MasterRe.png" alt="">
            </div>
            <div class="MasterDivTwo">
                <img class="img2logo" src="../ImagesUsed/MasterRe3.png" alt="">
            </div>
        </div>

		<div>
			<div class="ColumnFlex" style="margin-top: 70px;">

				<div style="flex: 1; ">
					<input class="LoginInput" type="text" id="fname" name="fullname"  onkeyup="check();" placeholder="Brokerage Full Name">
					<p style="visibility: hidden;" class="WarningLogin">Warning message</p>
				</div>

				<div style="flex: 1; ">
					<input  oninput="CheckEmail();"  class="LoginInput" type="text" id="Email" name="Email" placeholder="E-mail" onkeyup="check();">
					<p style="visibility: hidden;" class="WarningLogin" id="emailcheck">Please use Password Reset, if you forgot your login details!</p>
				</div>
	
				<div style="flex: 1;">
					<input type="password" class="LoginInput" id="pass" name="password" oninput="CheckPasswords();" placeholder="Password" onkeyup="check();">
					<p class="WarningLogin" style="visibility: hidden; line-height:1.2;  margin-bottom: 0">Password should be at least 8 characters long and contain at least one number, one letter, and one special character.</p>
				</div>

				<div style="flex: 1;  ">
					<input  type="password" class="LoginInput" id="confirmpass" name="confirmpassword" placeholder="Confirm Password" oninput="CheckPasswords();" onkeyup="check();">
					<p class="WarningLogin" style="visibility: hidden;" id="passcheck">Your Passwords are not matched </p>
				</div>

				<div style="flex: 1;  ">
					
					<input disabled="disabled" class="LoginInput LoginRegister" style="margin-bottom: 5px;" id="signUp" type="submit" value="Sign up">

					<div style="text-align: center; margin-top: 10px; margin-bottom: 10px">Already a member? Log in <a class="LoginHere" href="../index.jsp">here</a></div>
					<div style="text-align: center;"><a class="forgotPassword"href="ForgotPassword.jsp">Forgot Password? </a></div>
				</div>
				
			</div>
		</div>
        
	</form>
	
	
  </div>


</body>

</html>