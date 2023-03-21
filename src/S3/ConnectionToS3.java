package S3;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Part;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import ProMasterClasses.ExtraDocuments;

//This function is to connect to S3 

public class ConnectionToS3 {
	
	//private static final String BUCKET = "probroker/Mastere/Companylogo";
	
	public  AmazonS3 ConnectionCreationToS3() {

             AWSCredentials credentials1=new BasicAWSCredentials("AKIAXCI37MGEI6JHZYNT","mBsQNJhwIAwSltUta6G2BPYEUl+V7wmzbuksNmcV");
		
             final AmazonS3 s3client =AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials1))
				
             .withRegion(Regions.CA_CENTRAL_1)  .build();

             System.out.format("Coonection Has been made");
  
             return s3client;
		
	}	
	
//***********************************************************************************************************************************************************//		
	
  public void CreateBucketInS3(String bucketName ,AmazonS3 s3con){
		
	    //final AmazonS3 s3con=ConnectionCreationToS3();
		
		System.out.println(s3con);
		
		Bucket bucket = null;

		if (s3con.doesBucketExistV2(bucketName)) {

		System.out.format("Bucket %s already exists.\n", bucketName);


		} 
		
		else {

		try {
			
			bucket= s3con.createBucket( bucketName);
		} 
		
		catch (AmazonS3Exception e){
			
		    System.err.println(e.getErrorMessage());
		}
		
		}
			
		//s3con.shutdown();
	}
	
  //***********************************************************************************************************************************************************//	
	

 public void DeleteBucketInS3( String ObjectKEy ,AmazonS3 s3con){
	
	  //final AmazonS3 s3con=ConnectionCreationToS3();
	 
	  String bucket_name ="probroker";
	 
      String object_key =ObjectKEy;

      System.out.format("Deleting object %s from S3 bucket: %s\n", object_key,  bucket_name);

      try {   s3con.deleteObject(bucket_name, object_key);  }
      
       catch (AmazonServiceException e) {
        	
           System.err.println(e.getErrorMessage());
         
           System.exit(1);   }

	  // s3con.shutdown();
	   
       System.out.println("Done!");
	 }	


//***********************************************************************************************************************************************************//	
 
public List<Bucket> ListsOfTheBucketInS3( AmazonS3 s3con){
	
	//final AmazonS3 s3con=ConnectionCreationToS3();

    List<Bucket> buckets = s3con.listBuckets();
    
	System.out.println("Your Amazon S3 buckets are:");
	
	for (Bucket d : buckets) {
		
	System.out.println("* " + d.getName()+" "+d.getOwner()+" "+d.getCreationDate());
	
	}
	
	//s3con.shutdown();
	
	return buckets;
		
}


	
//***********************************************************************************************************************************************************//	


//This function is to search for an special object in S3 bucket

public String SearchFilesfroms3( String Key, String Path ,AmazonS3 s3con ) {
	
   System.out.println("Keyy"+" "+Key);
	
	//final AmazonS3 s3con=ConnectionCreationToS3();		
	
	ListObjectsRequest listObjectsRequest = new ListObjectsRequest() .withBucketName("probroker") .withPrefix(Path);
	
	ObjectListing objectListing;
	
	String ReturnString="0";
	
	System.out.println( "\n"); 

		do {
		        
		objectListing = s3con.listObjects(listObjectsRequest);
		
		        for (S3ObjectSummary objectSummary :objectListing.getObjectSummaries()) {
		        	
		     	     System.out.println("Objects"+" "+objectSummary.getKey());
		        	
		        	 if ( Key.equals( objectSummary.getKey() )    ) {  
		        		 
		         	     System.out.println("Object Match");
		
		        		 String A=objectSummary.getKey();
		        		 
		        		 Date B=objectSummary.getLastModified();
		        		 
		        		 ReturnString =A+";"+B;   }else { }
		        	 }
		        	
		        	 
		            //System.out.println(objectSummary.getKey() +" "+ objectSummary.getLastModified() ) ;       }//End of for Loop
		        
		        
		  listObjectsRequest.setMarker(objectListing.getNextMarker());
		  
		} while (objectListing.isTruncated());
		
		
		System.out.println("Value is"+" "+ReturnString);

	return ReturnString;
}


//***********************************************************************************************************************************************************//	

//This function  is to search for the extra documents in the S3 

public 	ArrayList<ExtraDocuments> SearchExtraFilesfroms3( String Path , int TheBrokerID , int TransactionID ,AmazonS3 s3con) {
	
	ArrayList<ExtraDocuments> Documents=new ArrayList<ExtraDocuments>();
	
	//final AmazonS3 s3con=ConnectionCreationToS3();	
	
	ListObjectsRequest listObjectsRequest = new ListObjectsRequest() .withBucketName("probroker") .withPrefix(Path);
	
	ObjectListing objectListing;
	
	String thereturn="0";
	
	int counter=0;
	
	System.out.println( "\n"); 

		do {
		        
		        objectListing = s3con.listObjects(listObjectsRequest);
		
		        for (S3ObjectSummary objectSummary :objectListing.getObjectSummaries()) {
		        	
		        	// System.out.println(counter+" "+"This is our object key"+" "+ objectSummary.getKey() ) ;	
		        	
		            System.out.println(counter+" "+"This is our object key"+" "+ objectSummary.getKey() ) ;	
		            

		        	
		        	if ( Path.equals( objectSummary.getKey() )    ) {
		        		
		        		
		        	  System.out.println( "There is no such file");  
		        		
		        	}else {
		        		
		           	
		            
		            String KeyMatch=objectSummary.getKey();
            		
		    		String[] parts=KeyMatch.split("/");
		    		
		    		String Detailinfo=parts[3];
		    	
		    		System.out.println( "FileName"+" "+Detailinfo );

		    		String[] Detailsparts=Detailinfo.split("%");
		    		
		    		
		    		int BrokerID=0;
		    		
		    		int DealID=0;
		    		
		    		String Filename="";
		    		
		    		
		    	   int lenght= Detailsparts.length;
		    		
		    		
		    		if(lenght<3) { 
		    			
		    			
			    	      BrokerID=Integer.parseInt( Detailsparts[1] );
			    		
			    		  DealID=Integer.parseInt( Detailsparts[0] );
			    		
			    	       Filename="";
		    		
		    		
		    		}else {	
		    			
		    			BrokerID=Integer.parseInt( Detailsparts[2] );
		    		
		    	        DealID=Integer.parseInt( Detailsparts[1] );
		    		
		    		     Filename=Detailsparts[0];}

		    		


		    		
		    		if( BrokerID==TheBrokerID &&  TransactionID==DealID ) {
		    	

		    	      
		    		//String URL =s3Client.getResourceUrl("probroker", objectSummary.getKey());
		    				
		    		
		    			
		    			
		    			 ExtraDocuments ExtraDoc=new ExtraDocuments( TheBrokerID , DealID ,Filename,objectSummary.getLastModified().toString(),objectSummary.getKey()); 
		    			 
		    			 Documents.add(ExtraDoc);
		         
		         
		        } else {  }
		            
		        }  //End of else
		        	
		  listObjectsRequest.setMarker(objectListing.getNextMarker());
		  
		  
		  //System.out.println( "Return value is"+" "+thereturn );
		  
		  
		  counter++;
		        }//Endof for loop
		        
				
					
				 
		} while (objectListing.isTruncated());
		
		
		return Documents;

	
}

//***********************************************************************************************************************************************************//	


//This function  is to search for the extra documents modified date in the S3 

public 	ArrayList<ExtraDocuments> SearchExtraFilesModificationsfroms3( String Path , int TheBrokerID , int TransactionID , String FileName, AmazonS3 s3con) {
	
	ArrayList<ExtraDocuments> Documents=new ArrayList<ExtraDocuments>();
	
	//final AmazonS3 s3con=ConnectionCreationToS3();	
	
	ListObjectsRequest listObjectsRequest = new ListObjectsRequest() .withBucketName("probroker") .withPrefix(Path);
	
	ObjectListing objectListing;
	
	String thereturn="";
	
	int counter=0;
	
	System.out.println( "\n"); 

		do {
		        
		objectListing = s3con.listObjects(listObjectsRequest);
		
		        for (S3ObjectSummary objectSummary :objectListing.getObjectSummaries()) {
		        	
		            System.out.println(counter+" "+"This is our object key"+" "+ objectSummary.getKey() ) ;	
		
		        	if ( Path.equals( objectSummary.getKey() )    ) {
		        		
		        		
		        	  System.out.println( "There is no such file");  thereturn="0";
		        		
		        	}else {
		            
		            String KeyMatch=objectSummary.getKey();
            		
		    		String[] parts=KeyMatch.split("/");
		    		
		    		String FileNAme=parts[3];
		    	
		    		System.out.println( "FileName"+" "+FileNAme );

		    		if( FileName.equals(FileNAme)) {
		            
		            thereturn  = objectSummary.getLastModified().toString() ;  } else { }
		            
		        }  
		        	
		  listObjectsRequest.setMarker(objectListing.getNextMarker());

		  System.out.println( "Return value is"+" "+thereturn );

		  counter++;
		        }
					
				 
		} while (objectListing.isTruncated());
		
		
		return Documents;

}

 
//***********************************************************************************************************************************************************//	

//Here we are getting the file or picture that user has uploaded and save to the S3

public  void UploadToS3( int id , String URL , InputStream stream , Part filePart , String FILENAME  ,AmazonS3 s3con) throws IOException {
	
        ObjectMetadata md = new ObjectMetadata();
    
        md.setContentLength(filePart.getSize());
    
        md.setContentType(filePart.getContentType());
  
        System.out.println("size"+"   "+ stream.available() );
    
        System.out.println("size1"+"   "+ (filePart.getSize() ));
     
        try {
    	  
	            //final AmazonS3 s3con=ConnectionCreationToS3();	
	  
                 String versionId = s3con.putObject(new PutObjectRequest(URL, FILENAME, stream,md).withCannedAcl(CannedAccessControlList.PublicRead)).getVersionId();

	  
                } catch (final AmazonServiceException ase) {
    	  
                    System.out.println("Caught an AmazonServiceException, which"
                    + " means your request made it "
                    + "to Amazon S3, but was rejected with an error response" + " for some reason.");
                    System.out.println("Error Message:    " + ase.getMessage());
                    System.out.println("HTTP Status Code: " + ase.getStatusCode());
                    System.out.println("AWS Error Code:   " + ase.getErrorCode());
                    System.out.println("Error Type:       " + ase.getErrorType());
                    System.out.println("Request ID:       " + ase.getRequestId());
                 } 
      
                 catch (final AmazonClientException ace) {
        	 
                   System.out.println("Caught an AmazonClientException, which means"
                   + " the client encountered " + "an internal error while trying to "
                   + "communicate with S3, " + "such as not being able to access the network.");
                   System.out.println("Error Message: " + ace.getMessage());
                 }
}


//***********************************************************************************************************************************************************//	






}
