package RDS;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

//import org.json.JSONArray;
//import org.json.JSONException;
//import org.json.JSONObject;

import com.itextpdf.text.pdf.hyphenation.TernaryTree.Iterator;

import ProMasterClasses.CommissionDetails;
import ProMasterClasses.Companies;
import ProMasterClasses.Contacts;
import ProMasterClasses.Parties;
import ProMasterClasses.PendingDeals;
import ProMasterClasses.Transaction;
import ProMasterClasses.Users;


public class ConnectionToRDB {

	public static void main(String[] args) throws Exception{
		
		
		String Time="3 Aug 2020";

		Date date1=new SimpleDateFormat("dd MMM yyyy", Locale.US ).parse(Time);
		
	    System.out.println("date1"+" "+date1);
	    
	    System.out.println( date1.toString());

	    Timestamp timestamp =new Timestamp( date1.getTime() );
	    
	    System.out.println("timestamp"+" "+timestamp);
	    
	    Date test=new Date(timestamp.getTime());
	    
	    String date =new SimpleDateFormat("dd MMM YYYY",Locale.US).format(test);
	    
	    System.out.println("date"+" "+date);

	

}
	
	
	
}
