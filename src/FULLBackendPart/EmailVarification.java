package FULLBackendPart;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import ProMasterClasses.User;


public class EmailVarification {
	
	
	    
	    public String getRandom() {
	    	
	        Random rnd = new Random();
	        
	        int number = rnd.nextInt(999999);
	        
	        return String.format("%06d", number);
	    }

	    
	    public boolean sendEmail(User user) {
	    	
	        boolean test = false;

	        String toEmail =user.getEmail();
	        
	        String fromEmail = "hapokomar90@gmail.com";
	        
	        String password = "Hapokomar@693";

	        try {
                System.out.println("varifying email");
                
	            // your host email smtp server details
	            Properties pr = new Properties();
	            
	            pr.setProperty("mail.smtp.host","smtp.gmail.com");
	            
	            pr.setProperty("mail.smtp.port","26");
	            
	            pr.setProperty("mail.smtp.auth","true");
	            
	            pr.setProperty("mail.smtp.starttls.enable","true");
	       

	    
	            //get session to authenticate the host email address and password
	            
	            Session session = Session.getInstance(pr, new Authenticator() {
	            	
	                @Override
	                
	              public PasswordAuthentication getPasswordAuthentication() {
	                	
	                	 System.out.println("done");
	                	 
	                    return new PasswordAuthentication(fromEmail, password);
	                    
	             
	                }
	               
	            });

	            System.out.println("start");
	            
	            //set email message details
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            mess.setFrom(new InternetAddress(fromEmail));
	    		//set to email address or destination email address
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	    		
	    		//set email subject
	            mess.setSubject("User Email Verification");
	            
	    		//set message text
	            mess.setText("Registered successfully.Please verify your account using this code: " + user.getCode());
	            
	            //send the message
	            Transport.send(mess);
	            
	            test=true;
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        System.out.println("finished");
	        
	        return test;
	    }	
	
	    
	    
  public boolean ResetPasswordEmail(User user) {
	  
	
	    	
	        boolean test = false;

	        String toEmail =user.getEmail();
	        
	        String fromEmail = "admin@my.masterre.ca";
	        
	        String password = "Pollock@2021";

	        try{
                System.out.println("varifying email");
                
	            // your host email smtp server details
                
                Properties pr = new Properties();

                pr.put("mail.smtp.host", "mocha6007.mochahost.com");
                
                pr.put("mail.smtp.port", "2525");
            
                pr.put("mail.smtp.auth", "true");
                
                pr.setProperty("mail.smtp.starttls.enable","true");
                
	            //pr.put("mail.smtp.socketFactory.port", "465");
	           // pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	           // pr.put("mail.smtp.socketFactory.fallback", "false");
	    
	            //get session to authenticate the host email address and password
	            
	            Session session = Session.getInstance(pr, new Authenticator() {
	            	
	                @Override
	                
	              public PasswordAuthentication getPasswordAuthentication() {
	                	
	                	 System.out.println("done");
	                	 
	                     return new PasswordAuthentication(fromEmail,password);
	                    
	             
	                }
	               
	            });

	            System.out.println("start");
	            
	            //set email message details
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            mess.setFrom(new InternetAddress(fromEmail));
	    		//set to email address or destination email address
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	    		
	    		//set email subject
	            mess.setSubject("Reset your Password at ProBroker");
	            
	    		//set message text
	            mess.setText("Please enter this code to reset your password" +" "+user.getCode());
	            
	            //send the message
	            Transport.send(mess);
	            
	            test=true;
	            
	        } catch (Exception e) {
	            e.printStackTrace();
 }

	        System.out.println("finished");
	        
	        return test;
	    }		    
	    

  
  
  
  public boolean SendEmailtoNewAgent(String email, String yourPassword, String name, String sender) {
  	
      boolean test = false;

      String toEmail =email;
      
      String fromEmail = "hapokomar90@gmail.com";
      
      String password = "Hapokomar@693";

      try {
          System.out.println("varifying email");
          
          // your host email smtp server details
          Properties pr = new Properties();
          
          pr.setProperty("mail.smtp.host","smtp.gmail.com");
          
          pr.setProperty("mail.smtp.port","26");
          
          pr.setProperty("mail.smtp.auth","true");
          
          pr.setProperty("mail.smtp.starttls.enable","true");
  
          //get session to authenticate the host email address and password
          
          Session session = Session.getInstance(pr, new Authenticator() {
          	
              @Override
              
            public PasswordAuthentication getPasswordAuthentication() {
              	
              	 System.out.println("done");
              	 
                  return new PasswordAuthentication(fromEmail, password);
                  
           
              }
             
          });

          System.out.println("start");
          
          //set email message details
          Message mess = new MimeMessage(session);

  		//set from email address
          mess.setFrom(new InternetAddress(fromEmail));
  		//set to email address or destination email address
          mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
  		
  		//set email subject
          mess.setSubject(name + "Welcome to Broker Pro Team" );
         
  		//set message text
          mess.setText("Hello"+" "+name+" "+"from"+" "+sender+" "+"your password is to login with your email address"
  		+" "+yourPassword);
          
          //send the message
          Transport.send(mess);
          
          test=true;
          
      } catch (Exception e) {
          e.printStackTrace();
      }

      System.out.println("finished");
      
      return test;
  }		    
    
  	

}
