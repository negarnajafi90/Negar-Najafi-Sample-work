package FULLBackendPart;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;
import java.util.Date; 
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;


import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.amazonaws.services.s3.AmazonS3;
import com.itextpdf.html2pdf.HtmlConverter;

import RDS.RDSFunctions;
import S3.ConnectionToS3;
import ProMasterClasses.AuditTrail;
import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Transaction;
import ProMasterClasses.Users;
import ProMasterClasses.User;
import ProMasterClasses.Contacts;
import ProMasterClasses.Companies;
import ProMasterClasses.CooperatingBrokerage;
import ProMasterClasses.Deposits;
import ProMasterClasses.ExtraDocuments;
import ProMasterClasses.Lawyers;
import ProMasterClasses.Parties;
import ProMasterClasses.Rebate;
import ProMasterClasses.RecordSheet;
import ProMasterClasses.Referral;

import RDS.RDSFunctions;

/**
 * Servlet implementation class EmailInvoice
 */

@WebServlet("/EmailInvoice")


@MultipartConfig

public class EmailInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailInvoice() {
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
		
		
		
		
		System.out.println("Hello");
		

        HttpSession Existingsession = request.getSession();	
		
        int Brokerid=(int) Existingsession.getAttribute("Brokerid");
	      
        int UserID=(int) Existingsession.getAttribute("Userid");
        
	    Connection con=(Connection) Existingsession.getAttribute("Connection");
	      
        int TransactionID=(int) Existingsession.getAttribute("ThisTransactionID");
        
	    RDSFunctions RDS= new RDSFunctions();

		ProMasterClasses.Invoice myInvoice=RDS.SearchInvoiceByTransactionID( TransactionID , UserID , con);
		
		Transaction NewDeal= RDS.GetTransactionsbyID( TransactionID , Brokerid,con);
		    
		Companies myCompany=RDS.GetaCompanyBuyBrokerID(Brokerid,con);
		
	 	Users MyInformation=new Users();
			 
	 	MyInformation=RDS.GetAnyUserById(Brokerid,con); 
	 	
		NumberFormat CanadaVal = NumberFormat.getInstance(new Locale("en", "US"));
		
		CanadaVal.setMinimumFractionDigits(2);
		
		CanadaVal.setMaximumFractionDigits(2);
		
		
		
		  int ID=myInvoice.ID;
		  int BrokerID=myInvoice.BrokerID;
		  String SendStatus=myInvoice.SendStatus;	
		  String Type=myInvoice.Type;
		  
		  Timestamp Date=myInvoice.Date;
		  
		    Date Invoice_date=new Date(Date.getTime());
		    
		    String InvoiceDate =new SimpleDateFormat("dd MMM YYYY",Locale.US).format(Invoice_date);   
		    
		    
		    
		  String RecieverFirstName=myInvoice.RecieverFirstName;
		  String RecieverLastName=myInvoice.RecieverLastName;
		  String RecieverEmail=myInvoice.RecieverEmail;
		  String Unit=myInvoice.Unit;
		  String StreetName=myInvoice.StreetName;
		  String StreetNumber=myInvoice.StreetNumber;
		  String City=myInvoice.City;
		  String Province=myInvoice.Province;
		  String PostalCode=myInvoice.PostalCode;
		  String Country=myInvoice.Country;
		  String SalesPrice=myInvoice.SalesPrice;
		  String commissionPayable=myInvoice.commissionPayable;
		  String HST=myInvoice.HST;
		  String Deposit=myInvoice.Deposit;
		  String Balance=myInvoice.Balance;
		  Timestamp ClosingDate=myInvoice.ClosingDate;
		  String Parties1=myInvoice.Party1;
		  String Parties2=myInvoice.Party2;
		
          System.out.println("TransactionID"+" "+TransactionID);
          
		   // String Subject=request.getParameter("subjectLineEmail");
		    
		    //String EmailBody=request.getParameter("messageEmail");
		    
		   // System.out.println("Subject"+" "+Subject);
		    
		   // System.out.println("messageEmail"+" "+EmailBody);

	      String Email1=request.getParameter("emailValueAddressee0");

	       String Email2=request.getParameter("emailValueAddressee1");
	       
	       String Email3=request.getParameter("OptionalemailValueAddressee0");
	          
	       String Email4=request.getParameter("OptionalemailValueAddressee1");
	       
	       String Email5=request.getParameter("OptionalemailValueAddressee2");
	          
	       String Email6=request.getParameter("OptionalemailValueAddressee3");

	  
			  String  send1=request.getParameter("Addressee0");
			    
			  String  send2=request.getParameter("Addressee1");
			    
			  String  send3=request.getParameter("OptionalAddressee0");
			    
			  String  send4=request.getParameter("OptionalAddressee1");
			  
			  String  send5=request.getParameter("OptionalAddressee2");
			    
			  String  send6=request.getParameter("OptionalAddressee3");
			  
	    

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
		    
		    
		    String Subject=request.getParameter("subjectLineEmail");
		    
		    String EmailBody=request.getParameter("messageEmail");
		    
		    System.out.println("Subject"+""+Subject);
		    
		    System.out.println("messageEmail"+""+EmailBody);

	        String fromEmail = "admin@my.masterre.ca";
	        
	        String password = "Pollock@2021";
	        
	        
	        
	        try {
	    		   
            System.out.println("varifying email");

	            Properties pr = new Properties();

            pr.put("mail.smtp.host", "mocha6007.mochahost.com");
            
            pr.put("mail.smtp.port", "2525");
        
            pr.put("mail.smtp.auth", "true");
            
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
	            
				//SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss"); 
				//String CurrDate = formatter.format(new Date( ));
	            
				String PropAddress = "";
				if((!Unit.isEmpty())) {
					PropAddress += Unit + "-";
				}
				PropAddress += StreetNumber + " " + StreetName + ", " +  City + ", " + PostalCode + ", ";

				if(Province.isEmpty()){
					PropAddress += Province;
				}else{
					PropAddress += Province + ", " + Country;
				}

				String clientAddress1 = "";
				String clientAddress2 = "";
				if((!Unit.isEmpty())) {
					clientAddress1 += Unit + "-";
				}
				clientAddress1 += StreetNumber + " " + StreetName ;

				if(Province.isEmpty()){
					clientAddress2 += City + ", " +PostalCode + ", " + Province ;
				}else{
					clientAddress2 += City + ", " +PostalCode+ ", " + Province + ", " + Country;
				}
	              

	           // MimeBodyPart htmlPart = new MimeBodyPart();
				
				String  HTML="";
				
				String DealType=NewDeal.Description;
				
				//if ( DealType.equals("Appraisal Fee") || DealType.equals("Letter of Opinion Fee") ||  DealType.equals("Valuation Fee")   || DealType.equals("Provide service description") ){    }
				
			    if( DealType.equals("Referral Fee") ){  
			    	
			    	
			        HTML ="                              <div style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"                                   <div>\n" + 
							"\n" + 
							"											<div style='position: relative; float: right; right: 1px;'>"+
							"													<img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" alt='' style='    width: 150px; margin-right: 20px;'>"+
							"											</div>"+
							"\n" + 
							"											<div>"+
							"													<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"											</div>"+
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+  InvoiceDate +"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+RecieverFirstName+" "+ RecieverLastName+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress1+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ clientAddress2+ "</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'> \n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Referral</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;' >"+Type+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" +  
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Client(s):</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+Parties1 +"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Referral Date</label>\n" + 
							"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ClosingDate+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div style='padding-right: 25px'>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%;'>" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Referral Fee</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;' >"+SalesPrice+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+myCompany.HSTNumberPart1+" "+"RT"+" "+myCompany.HSTNumberPart2+")</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+ HST+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 7px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>Balance</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+  Balance+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
		    				"                                                 <p style='margin-bottom: 0; padding: 13px 16px 8px 16px; 	'>\n" +  
		    				"                                                        Please mail a cheque payable to \""+ myCompany.BusinessName+"\" or make an electronic payment to our commission trust account: </p>\n" + 
		    				"\n" + 
							"                                                 <div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 
		    				"                                                 <div style='width: 100%;'>\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px; margin: 0;'>Bank:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionBankNumber+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" +  
		    				"                                                 <div style='width: 100%; margin-top: 5px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px; margin: 0;'>Transit:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionTransitNumber+"</label>\n" +
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='width: 100%; margin-top: 5px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='font-weight: bold; display: inline-block; width: 130px;  margin: 0;'>Account:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionAccountNumber+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
							"                                              </div>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 35px 5px 0 0;    height: auto;    color: black;'>Sincerely,</label>\n" + 
		    				"\n" +  
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;padding-left: 0;margin: 5px 5px 0 0;  margin-top: 34px;    height: auto;    color: black;''>"+MyInformation.Firstname+" "+MyInformation.Lastname+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>Broker of Record</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.BusinessName+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Phone+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br><br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'><a target='_blank' href=\"mailto:"+myCompany.Email+"\">"+myCompany.Email+"</a></label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Unit+"-"+myCompany.StreetNumber+", "+myCompany.StreetName+"</label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.City+", "+myCompany.Province+", " +myCompany.PostalCode+"</label>\n" + 
		    				"\n" + 
		    				"                                          </div><!-- Closing SenderInformation -->\n" + 
		    				"\n" + 
		    				"                                   </div>\n" + 
		    				"                            </div>   ";
		            	
			    	
			    }
				
				else if( DealType.equals("TRS") ) {  
					
					
					
		            String commissionDiv = ""; String Balanceside = ""; String PaymentTo = ""; String Vendors = ""; String Purchasers = ""; String PropertyAdd = ""; String recParty = "";
					if(!(Unit.isEmpty())){
						PropertyAdd += Unit+"-";
					}
					PropertyAdd += StreetNumber+", "+ StreetName+", "+City+", "+Province+", "+PostalCode;
					
					Vendors =Parties1;

					/*if(!(VendorBusinessName2.isEmpty())){
						Vendors += ", " + VendorBusinessName2;
					}else if(!(VendorFirstName2.isEmpty())){
						Vendors += ", " + VendorFirstName2+" "+VendorLastName2;
					}
					if(!(VendorBusinessName3.isEmpty())){
						Vendors += ", "+  VendorBusinessName3;
					}else if(!(VendorFirstName3.isEmpty())){
						Vendors += ", "+VendorFirstName3+" "+VendorLastName3;
					}
					if(!(VendorBusinessName4.isEmpty())){
						Vendors += ", "+  VendorBusinessName4;
					}else if(!(VendorFirstName4.isEmpty())){
						Vendors += ", "+ VendorFirstName4+" "+VendorLastName4;
					}*/

					Purchasers =Parties2;
					/*if(!(PurchaserBusinessName2.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName2;
					}else if(!(PurchaserFirstName2.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName2+" "+PurchaserLastName2;
					}
					if(!(PurchaserBusinessName3.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName3;
					}else if(!(PurchaserFirstName3.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName3+" "+PurchaserLastName3;
					}
					if(!(PurchaserBusinessName4.isEmpty())){
						Purchasers += ", "+  PurchaserBusinessName4;
					}else if(!(PurchaserFirstName4.isEmpty())){
						Purchasers += ", "+ PurchaserFirstName4+" "+PurchaserLastName4;
					}*/
					

					if(NewDeal.ListingType.equals("Tenant-Side") || NewDeal.ListingType.equals("Landlord-Side") || NewDeal.ListingType.equals("Lease-DoubleSided") ||NewDeal.ListingType.equals("TenantSide-Self-Represented-Landlord")){
						commissionDiv =  "<p style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-left: 14px; padding-bottom: 10px; line-height: 1.4;text-align: center;'>Commission for our services rendered in accordance with the relevant Rental Agreement.</p>\n";
						if( (   Double.parseDouble(commissionPayable.replaceAll(",", ""))+ Double.parseDouble(HST.replaceAll(",", ""))  ) <=   Double.parseDouble(Deposit.replaceAll(",", "") )  ){
							recParty = "Landlord(s)";
							Balanceside = "Balance due to Landlord:";
						}else{
							Balanceside = "Balance due to Broker:";
						}
					}else{
						commissionDiv =  "<p style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-left: 14px; padding-bottom: 10px; line-height: 1.4;text-align: center;'>Commission for our services rendered in accordance with the relevant Agreement of Purchase and Sale.</p>\n";
						
						if(Double.parseDouble(commissionPayable.replaceAll(",", ""))+ Double.parseDouble(HST.replaceAll(",", ""))   <=   Double.parseDouble(Deposit.replaceAll(",", "") ) ){
							Balanceside = "Balance due to Vendor:";
							recParty = "Vendor(s)";
						}else{
							Balanceside = "Balance due to Broker:";
						}
					}

					if((Double.parseDouble(commissionPayable.replaceAll(",", ""))+ Double.parseDouble(HST.replaceAll(",", "")) -Double.parseDouble(Deposit.replaceAll(",", "") ))<0){
						PaymentTo = "<div style='padding: 16px; padding-top: 12px; background-color: #eef3f6; width: calc(100% + 14px); height: auto; margin: 20px; margin-left: -14px; line-height: 1.4;  text-align: center;'>\n" + 
		    				"          		<div style='text-align: center;'>\n" + 
		    				"            		<label style='display: inline-block; color: black; margin: 5px; width: auto; height: 17px; margin-left: 0px; margin-bottom: 0px;line-height: 1.4; text-align: center; padding:5px; font-weight: bold;'>A sum of $"+String.format("%.2f", Math.abs( Double.parseDouble(commissionPayable.replaceAll(",", ""))+ Double.parseDouble(HST.replaceAll(",", "")) -Double.parseDouble(Deposit.replaceAll(",", "") )) ).trim()+ " is owning to the "+recParty+" on closing.</label></div>"+
		    				"          			<p style='display: block; color: black; margin-top: 5px; margin-bottom: 0; text-align: center;'>Please contact our office, if you have any questions.</p>\n" + 
		    				"        	</div>";
					}else{
						PaymentTo = "<div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
		    				"            	<p style='margin-bottom: 0; padding: 13px 16px 8px 16px; '> Please mail a cheque payable to"+" "+myCompany.BusinessName+" "+" or make an electronic payment to our commission trust account:</p>\n" + 
		    				"\n" + 
		    				"            	<div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 

							"           	 	<div style='width: 100%;'>\n" + 
		    				"           	 	       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Bank:</label>\n" + 
		    				"           	 	       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionBankNumber+"</label>\n" + 
		    				"           	 	</div>\n" + 
							"\n" + 		
							"                   <div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"                          <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Transit:</label>\n" + 	
		    				"                          <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionTransitNumber+"</label>\n" +
		    				"                   </div>\n" + 
		    				"\n" + 
							"                   <div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"                          <label style='font-weight: bold; display: inline-block; width: 100px;  margin: 0;'>Account:</label>\n" + 
		    				"                          <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionAccountNumber+"</label>\n" + 
		    				"                   </div>\n" + 
		    				"          		</div>\n" + 
		    				"        	</div>";
					}
					
		    				
		            //MimeBodyPart htmlPart = new MimeBodyPart();
		            
		    	 HTML = "     "
                            + " <div  style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"        <div>\n" +  
		    				"           <div style='position: relative; float: right; right: 1px;'>\n" + 
		    				"             <img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" style='width: 150px; margin-right: 20px;'>\n" + 
		    				"           </div>\n" + 
		    				"\n" + 
		    				"			<div>"+
							"					<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"			</div>"+
		    				"\n" + 
		    				"           <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                  <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+  InvoiceDate +"</label>\n" + 
		    				"           </div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"        	 	   <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+RecieverFirstName+" "+RecieverLastName+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%;'>\n" + 
		    				"        	  <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ Unit+"-"+StreetNumber+" "+StreetName+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='display: flex; width: 70%;'>\n" + 
		    				"        	  <br><label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+City+", "+Province+", "+PostalCode+"</label>\n" + 
		    				"        	</div>\n" + 
		    				"\n" + 
		    				"        	<div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"           	 	<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Property:</label>\n" + 
		    				"           	 	<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+PropertyAdd +"</label>\n" + 
		    				"         		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"            		<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Vendor(s)&#8282;</label>\n" + 
		    				"         	   		<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ Vendors + "</label>\n" + 
		    				"         	 	</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"            		<label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Puchaser(s):</label>\n" + 
		    				"            		<label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ Purchasers + "</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"          		  <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Closing:</label>\n" + 
		    				"          		  <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ClosingDate+"</label>\n" + 	
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"        	</div>\n" + 
							"\n" + 
		    				"\n" + 		commissionDiv+
							"\n" + 
		    				"        	<div style='padding-right: 25px; margin-top: 30px;'>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; width: 100%;'>\n" + 
		    				"           		<label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Price</label>\n" + 
		    				"           		<label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"           		<label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(SalesPrice.replaceAll(",", "")))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"         		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"         		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Commission Payable</label>\n" + 
		    				"         		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"         		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(commissionPayable.replaceAll(",", "")))+"</label>\n" + 
		    				"         		</div>\n" + 
		    				"\n" + 
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px; border-bottom: 1px solid lightgrey;'>\n" + 	
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+myCompany.HSTNumberPart1+" "+"RT"+" "+myCompany.HSTNumberPart2+")</label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble(HST.replaceAll(",", "")))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 		
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Total Commission</label>\n" + 	
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 	
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>" + CanadaVal.format( Double.parseDouble(commissionPayable.replaceAll(",", ""))+Double.parseDouble(HST.replaceAll(",", "")) )+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 	
							"          		<div style='display: flex; width: 100%; margin-top: 16px; border-bottom: 1px solid lightgrey;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>Deposit held in trust:</label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+CanadaVal.format( Double.parseDouble( Deposit.replaceAll(",", "")))+"</label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 		
		    				"          		<div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"          		  <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>"+Balanceside+"</b></label>\n" + 
		    				"          		  <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'><b>$</b></label>\n" + 
		    				"          		  <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'><b>"+CanadaVal.format(Math.abs(  ( Double.parseDouble( commissionPayable.replaceAll(",", ""))+Double.parseDouble(HST.replaceAll(",", "")) )- Double.parseDouble(Deposit.replaceAll(",", "")) )  )+"</b></label>\n" + 
		    				"          		</div>\n" + 
		    				"\n" + 
		    				"        	</div>\n" + 
		    				"\n" + PaymentTo + 
		    				"\n" + 
		    				"\n" + 
		    				"        	<div>\n" + 
		    				"\n" + 
		    				"          		<label style='display: inline-block;margin: 5px 5px 0 0;    height: auto;    color: black;'>Sincerely,</label>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;padding-left: 0;margin: 5px 5px 0 0;  margin-top: 34px;    height: auto;    color: black;''>"+MyInformation.Firstname+" "+MyInformation.Lastname+"</label>\n" + 
		    				"          		<br>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>Broker of Record</label>\n" + 
		    				"          		<br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.BusinessName+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Phone+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'><a target='_blank' href=\"mailto:"+myCompany.Email+"\">"+myCompany.Email+"</a></label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Unit+"-"+myCompany.StreetNumber+", "+myCompany.StreetName+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.City+", "+myCompany.Province+", " +myCompany.PostalCode+"</label>\n" + 
		    				"               <br>\n" + 
		    				"               <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+"</label>\n" + 
		    				"\n" + 
		    				"      		</div>\n" + 
		    				"         </div>\n" + 
		    				"       </div>\n";	
					
					
				}
				
				else { 

					HTML ="                              <div style='font-family: ProximaNova, sans-serif; font-weight: lighter; display: block; text-align: left; font-size: 13px;     width: 100%;    margin: 10px; padding: 14px; padding-right: 0;  margin-left: 0; background: none'>\n" + 
		    				"\n" + 
		    				"                                   <div>\n" + 
							"\n" + 
							"											<div style='position: relative; float: right; right: 1px;'>"+
							"													<img src=\"https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+ myCompany.ID+"\" alt='' style='    width: 150px; margin-right: 20px;'>"+
							"											</div>"+
							"											<div>"+
							"													<label style=\"color:black;  text-transform: uppercase; height: auto; font-weight: bold; display: inline-block; margin: 5px;    margin-left: 0px;   margin-bottom: 0px;  width: auto;\">COMMISSION STATEMENT</label>"+
							"											</div>"+
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='padding-left: 0; height: auto; color: black;flex: 0.2;  width: 200px;  margin-top: 16px;     display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+ InvoiceDate +"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%; margin-top: 16px;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+RecieverFirstName+" "+ RecieverLastName+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress1+"</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='display: flex; width: 70%;'>\n" + 
		    				"                                                 <label style='color: black; height: auto; display: inline-block; width: auto; margin: 5px 5px 0 0;'>"+clientAddress2+ "</label>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='height: auto; background-color: #eef3f6; width: calc(100% + 14px); margin: 24px 20px 32px -14px; padding-top: 10px; padding-bottom: 10px; line-height: 1.4;'> \n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Property:</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ PropAddress+ "</label>\n" + 
		    				"                                                 </div>\n"  + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; margin-top: 7px; width: 100%;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='margin: 0; width: 130px;  margin-left: 15px; font-weight: bold; color: black; height: auto; display: inline-block; line-height: 1.4;'>Report Date</label>\n" + 
							"\n" + 
		    				"                                                        <label style='color: black; height: 18px; display: inline-block; line-height: 1.4; margin-top: 0; padding: 0px;'>"+ ClosingDate+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div style='padding-right: 25px'>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%;'>" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>" + NewDeal.Description +"</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'>$</label>\n" + 
		    				"\n" + 
		    				"                                                        <label  style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;' >"+SalesPrice+"</label>\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 4px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'>HST ("+myCompany.HSTNumberPart1+" "+"RT"+" "+myCompany.HSTNumberPart2+")</label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'>"+HST+"</label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                                 <div style='display: flex; width: 100%; margin-top: 7px;'>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 6; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block;'><b>Balance</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 0.1; height: 17px; color: black; display: inline-block;'><b>$</b></label>\n" + 
		    				"\n" + 
		    				"                                                        <label style='flex: 1; margin: 0; padding-left: 0px; height: 17px; color: black; display: inline-block; text-align: right; font-variant-numeric: tabular-nums;'><b>"+Balance+"</b></label>\n" + 
		    				"\n" + 
		    				"                                                 </div>\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"                                          <div style='padding: 0; height: auto;line-height: 1.4; margin: 20px;  margin-left: -14px;  background-color: #eef3f6;'>\n" + 
							"\n" +
		    				"                                                 <p style='margin-bottom: 0; padding: 13px 16px 8px 16px; '>\n" +  
		    				"                                                        Please mail a cheque payable to \""+ myCompany.BusinessName+"\" or make an electronic payment to our commission trust account: </p>\n" + 
		    				"\n" + 
							"                                                 <div style='margin-top: 0; padding: 0px 16px 8px 16px;'>\n" + 
							"\n" + 
		    				"                                                 		<div style='width: 100%;'>\n" + 
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Bank:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionBankNumber+"</label>\n" + 
		    				"                                                 		</div>\n" + 
		    				"\n" + 		
		    				"                                                 		<div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px; margin: 0;'>Transit:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionTransitNumber+"</label>\n" +
		    				"                                                 		</div>\n" + 
		    				"\n" + 		
		    				"                                                 		<div style='width: 100%; margin-top: 1px;'>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='font-weight: bold; display: inline-block; width: 100px;  margin: 0;'>Account:</label>\n" + 
		    				"\n" + 		
		    				"                                                 		       <label style='display: inline-block; padding: 0;height: 20px; margin: 0px;'>"+myCompany.CommissionAccountNumber+"</label>\n" + 
		    				"\n" + 		
		    				"                                                 		</div>\n" + 
		    				"\n" + 
							"                                                 </div>\n" + 
		    				"\n" + 
		    				"                                          </div>\n" + 
		    				"\n" + 
		    				"\n" + 
		    				"                                          <div>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 35px 5px 0 0;    height: auto;    color: black;'>Sincerely,</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;padding-left: 0;margin: 5px 5px 0 0;  margin-top: 34px;    height: auto;    color: black;''>"+MyInformation.Firstname+" "+MyInformation.Lastname+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>Broker of Record</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.BusinessName+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Phone+"</label>\n" + 
		    				"\n" + 
		    				"                                                 <br><br>\n" + 
		    				"\n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'><a target='_blank' href=\"mailto:"+myCompany.Email+"\">"+myCompany.Email+"</a></label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.Unit+"-"+myCompany.StreetNumber+", "+myCompany.StreetName+"</label>\n" + 
		    				"                                          \n" + 
		    				"                                                 <br>\n" + 
		    				"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+myCompany.City+", "+myCompany.Province+", " +myCompany.PostalCode+"</label>\n" + 
							"                                          \n" + 
		    				"                                                 <label style='display: inline-block;margin: 4px 5px 0 0;    height: auto;    color: black;'>"+"</label>\n" + 
		    				"\n" + 
		    				"                                          </div><!-- Closing SenderInformation -->\n" + 
		    				"\n" + 
		    				"                                   </div>\n" + 
		    				"                            </div>   ";


					
				}

	            
	            
	            
		
		String absoluteFilesystemPath = getServletContext().getRealPath("/");
		
		System.out.println(absoluteFilesystemPath);

		FileOutputStream  fileOutputStream = new FileOutputStream( new File(absoluteFilesystemPath+"Invoice.pdf") );

			HtmlConverter.convertToPdf(HTML, fileOutputStream );

	    System.out.println( "PDF Created!" );  
	    
			
			if(send1!=null) {

	    System.out.println( "PDF Created!" );   
        
        //set email message details
        
        Message mess = new MimeMessage(session);

		//set from email address
        
        mess.setFrom(new InternetAddress(fromEmail));
        
        
        
        //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
        
        
        mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1)); 

		//set email subject
        
        mess.setSubject(Subject);
        
        BodyPart messageBodyPart1 = new MimeBodyPart(); 
        
        messageBodyPart1.setText(EmailBody);  

	
			//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

         MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
      
         String filename ="Invoice.pdf"; 
        
         FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
        
         messageBodyPart2.setDataHandler(new DataHandler(source));  
        
         messageBodyPart2.setFileName(filename);  

         Multipart multipart = new MimeMultipart();  
        
        multipart.addBodyPart(messageBodyPart1); 
        
        //multipart.addBodyPart(htmlPart); 
           
          multipart.addBodyPart(messageBodyPart2);  
      
        //6) set the multiplart object to the message object 
        
         mess.setContent(multipart );  
         
        //7) send message  
        
        Transport.send(mess);  
        
			}
			
			if(send2!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email2)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}
			
			if(send3!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email3)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}
			
			
			if(send4!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email4)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}
			
			if(send5!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email5)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}
			
			
			if(send6!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email6)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}
			
			
			
			if(SendmeACopy!=null) {

	    	    System.out.println( "PDF Created!" );   
	            
	            //set email message details
	            
	            Message mess = new MimeMessage(session);

	    		//set from email address
	            
	            mess.setFrom(new InternetAddress(fromEmail));
	            
	            
	            
	            //mess.setRecipient(Message.RecipientType.TO, new InternetAddress(Email1));
	            
	            
	            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(MyEmail)); 

	    		//set email subject
	            
	            mess.setSubject(Subject);
	            
	            BodyPart messageBodyPart1 = new MimeBodyPart(); 
	            
	            messageBodyPart1.setText(EmailBody);  

		
				//htmlPart.setContent(jsp, "text/html; charset=UTF-8");

	             MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	          
	             String filename ="Invoice.pdf"; 
	            
	             FileDataSource source = new FileDataSource(absoluteFilesystemPath+filename);  
	            
	             messageBodyPart2.setDataHandler(new DataHandler(source));  
	            
	             messageBodyPart2.setFileName(filename);  

	             Multipart multipart = new MimeMultipart();  
	            
	            multipart.addBodyPart(messageBodyPart1); 
	            
	            //multipart.addBodyPart(htmlPart); 
	               
	              multipart.addBodyPart(messageBodyPart2);  
	          
	            //6) set the multiplart object to the message object 
	            
	             mess.setContent(multipart );  
	             
	            //7) send message  
	            
	            Transport.send(mess);  
	            
				}

        
   } 
	   
	  catch (Exception e) {  e.printStackTrace();    }
   
 
		
	}

}
