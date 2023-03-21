

function  SetPartiesDetails( Type1, Province1, ExtraContact1 , Indivisual1 , NotIndividual, 
		
	Type, Province , OtherProvince , ExtraContact, OtherProvinceElement , Element ){


document.getElementById(Type).value=Type1;



if ( Type1==="Individual" ){

	  document.getElementById(Indivisual1).style.display = "";
	
	  document.getElementById(NotIndividual).style.display = "none";  
	  
      document.getElementById(Element).style.display=''; }

else if ( Type1==="Corporation" || Type1==="Partnership"  ||  Type1==="Trust"  ){
	
	  document.getElementById(Indivisual1).style.display = "none";
	 
	  document.getElementById(NotIndividual).style.display = "";  	        
	  
	  document.getElementById(Element).style.display='none';  }

 else{
	
	  document.getElementById(Indivisual1).style.display = "";
	
	  document.getElementById(NotIndividual).style.display = "none"; 
	  
	  document.getElementById(Element).style.display='none';  }





 if( Province1==="ON" ||  Province1==="AB" || Province1==="BC" || Province1==="MB" || Province1==="NB" || Province1==="NL" || Province1==="NWT" ||
		
	Province1==="NS" ||  Province1==="NU" || Province1==="PE" || Province1==="QC" || Province1==="SK" || Province1==="YT"   ){

			
			 document.getElementById(OtherProvinceElement).style.display = "none";
			
			 document.getElementById(OtherProvince).value="";
			
			 document.getElementById(Province).value=Province1;	 }

 else{

	 document.getElementById(OtherProvinceElement).style.display = "";
	
	 document.getElementById(OtherProvince).value=Province1;

	 document.getElementById(Province).value="Other"; }


}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Empty(id) {

var element = document.getElementById(id);

var inputs = element.getElementsByTagName('input');

for (var index = 0; index < inputs.length; ++index) {
	
	   inputs[index].value = inputs[index].defaultValue;
	
	   inputs[index].style.borderColor = "lightgrey"; } //Close For Loop
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PartiesSetUp(
	
	   Size,

	   TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1 ,
	
	   TypeData2, ProvinceData2, ExtraContactData2 , Indivisual2 , NotIndividual2, Type2  ,Province2, OtherProvince2 , ExtraContact2 ,OtherProvinceElement2 ,
	
	   TypeData3, ProvinceData3, ExtraContactData3 , Indivisual3 , NotIndividual3, Type3  ,Province3, OtherProvince3 , ExtraContact3 ,OtherProvinceElement3, 
	
	   TypeData4, ProvinceData4, ExtraContactData4 , Indivisual4 , NotIndividual4, Type4  ,Province4, OtherProvince4 , ExtraContact4 ,OtherProvinceElement4 ,
	
	   Item1, Item2 , Item3 ,Element1,Element2,Element3,Element4 ){

       if( Size==0){

                SetPartiesDetails( TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1 ,Element1 );
 
                document.getElementById(Item1).style.display = "none";
 
                document.getElementById(Item2).style.display = "none";
 
                document.getElementById(Item3).style.display = "none";  }

       else if( Size==1 ){

                SetPartiesDetails( TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1 ,Element1 );

                document.getElementById(Item1).style.display = "none";

                document.getElementById(Item2).style.display = "none";

                document.getElementById(Item3).style.display = "none";  }

        else if( Size==2 ){

 
                SetPartiesDetails( TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1,Element1  );
 
                SetPartiesDetails( TypeData2, ProvinceData2, ExtraContactData2 , Indivisual2 , NotIndividual2, Type2  ,Province2, OtherProvince2 , ExtraContact2 ,OtherProvinceElement2 , Element2 );
 
                document.getElementById(Item1).style.display = "block";
 
                document.getElementById(Item2).style.display = "none";
 
                document.getElementById(Item3).style.display = "none";   }
  
       else if( Size==3 ){

 
                SetPartiesDetails( TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1 ,Element1 );
 
                SetPartiesDetails( TypeData2, ProvinceData2, ExtraContactData2 , Indivisual2 , NotIndividual2, Type2  ,Province2, OtherProvince2 , ExtraContact2 ,OtherProvinceElement2 , Element2 );

                SetPartiesDetails( TypeData3, ProvinceData3, ExtraContactData3 , Indivisual3 , NotIndividual3, Type3  ,Province3, OtherProvince3 , ExtraContact3 ,OtherProvinceElement3 , Element3 );
 
                document.getElementById(Item1).style.display = "block";
 
                document.getElementById(Item2).style.display = "block";
 
                document.getElementById(Item3).style.display = "none";  }	  
  
        else if( Size==4 ){

                 document.getElementById(Item1).style.display = "block";
 
                 document.getElementById(Item2).style.display = "block";
 
                 document.getElementById(Item3).style.display = "block";

                 SetPartiesDetails( TypeData1, ProvinceData1, ExtraContactData1 , Indivisual1 , NotIndividual1, Type1  ,Province1, OtherProvince1 , ExtraContact1 ,OtherProvinceElement1 , Element1 );
 
                 SetPartiesDetails( TypeData2, ProvinceData2, ExtraContactData2 , Indivisual2 , NotIndividual2, Type2  ,Province2, OtherProvince2 , ExtraContact2 ,OtherProvinceElement2 , Element2 );

                 SetPartiesDetails( TypeData3, ProvinceData3, ExtraContactData3 , Indivisual3 , NotIndividual3, Type3  ,Province3, OtherProvince3 , ExtraContact3 ,OtherProvinceElement3 , Element3 );

                 SetPartiesDetails( TypeData4, ProvinceData4, ExtraContactData4 , Indivisual4 , NotIndividual4, Type4  ,Province4, OtherProvince4 , ExtraContact4 ,OtherProvinceElement4 , Element4 );  }	  	  

    }



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SetMYTRSData(  Data1 , Data2 , Data3 , Data4 , Data5, Data6 , Data7 , Data8 ,Dat9, Data10 ){


         document.getElementById("PropertyProvince").value=Data5;

         document.getElementById("PropertyType").value=Data1;
	
         document.getElementById("PropertyListingType").value=Data4;
	
         document.getElementById("ProPertyListingSource").value=Data3;
		 
		 if(Data2=='Reopened') {
			document.getElementById("PropertyListingStatus").value='';
		 }else{
			document.getElementById("PropertyListingStatus").value=Data2;
		 }


         var Source =Data3;

         var listingType =Data4;

         var ListingType =Data4;


        if (Source === "Office-lead") {

	          document.getElementById("OfficeLeadItem1").style.display = "";

	          document.getElementById("OfficeLeadItem11").style.display = "";

	          document.getElementById("OfficeLeaditem2").style.display = "block";

	          if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {

		              document.getElementById("OfficeLeaddoubledouble").style.display = "block";

		              document.getElementById("OfficeLeadCommisison").style.display = "none";  } //Closing inner If Condition
	   
             	else {

		               document.getElementById("OfficeLeadCommisison").style.display = "block";

		               document.getElementById("OfficeLeaddoubledouble").style.display = "none";  } //closing inner else	  

          } //Closing If condition
        
       else {
	
	         document.getElementById("OfficeLeadItem1").style.display = "none";

	         document.getElementById("OfficeLeadItem11").style.display = "none";
 
	         document.getElementById("OfficeLeaditem2").style.display = "none";

	         document.getElementById("OfficeLeadCommisison").style.display = "none";

	         document.getElementById("OfficeLeaddoubledouble").style.display = "none";  } //Closing else


	  if (ListingType === "Tenant-Side") {

		      document.getElementById("MyVendor").innerHTML = "Landlord";

		      document.getElementById("MyPurchaser").innerHTML = "Tenant";

		      document.getElementById('MyVendorLawyer').style.display = "none";

		      document.getElementById('MyPurchaserLawyer').style.display = "none";

		      document.getElementById('MyCooperatingBrokerage').style.display = "inline";

		      document.getElementById('MyDeposits').style.display = "none";

		      document.getElementById('ClerkInformation').style.display = "none";

		      document.getElementById('AddClerckInformation').checked = false;

		      document.getElementById('Deposit2').style.display = "none";

		      document.getElementById('Deposit3').style.display = "none";

		      document.getElementById('Deposit4').style.display = "none";

		      document.getElementById('Cooperating1').style.display = "none";

		      document.getElementById('Cooperating2').style.display = "none";

		      document.getElementById('Cooperating3').style.display = "inline";

		      document.getElementById('Purchaserback1').style.display = "none";

		      document.getElementById('Purchaserback2').style.display = "inline";

		      document.getElementById('Invoiceveback1').style.display = "inline";

		      document.getElementById('Invoiceveback2').style.display = "none";

		      document.getElementById('Invoiceveback3').style.display = "none";

		      document.getElementById('Invoiceveback4').style.display = "none";   } //if condition for Tenant-Side
	  
	  else if (ListingType === "Landlord-Side") {
		
		     document.getElementById("MyVendor").innerHTML = "Landlord";

		     document.getElementById("MyPurchaser").innerHTML = "Tenant";

		     document.getElementById('MyVendorLawyer').style.display = "none";

		     document.getElementById('MyPurchaserLawyer').style.display = "none";

		     document.getElementById('MyCooperatingBrokerage').style.display = "inline";

		     document.getElementById('MyDeposits').style.display = "inline";

		     Empty('VendorLawyer');

		     Empty('PurchaserLawyer');

		     document.getElementById('ClerkInformation').style.display = "none";
 
		     document.getElementById('AddClerckInformation').checked = false;

		     document.getElementById('Depositback1').style.display = "none";

		     document.getElementById('Depositback2').style.display = "inline";

		     document.getElementById('Cooperating1').style.display = "inline";

		     document.getElementById('Cooperating2').style.display = "none";

		     document.getElementById('Cooperating3').style.display = "none";

		     document.getElementById('Purchaserback1').style.display = "none";

		     document.getElementById('Purchaserback2').style.display = "inline";

		     document.getElementById('Invoiceveback1').style.display = "inline";

		     document.getElementById('Invoiceveback2').style.display = "none";

		     document.getElementById('Invoiceveback3').style.display = "none";

		     document.getElementById('Invoiceveback4').style.display = "none";
		     
	} //Closing if 
	  
	else if (ListingType === "Lease-DoubleSided") {
		
		   document.getElementById("MyVendor").innerHTML = "Landlord";

		   document.getElementById("MyPurchaser").innerHTML = "Tenant";

		   document.getElementById('MyVendorLawyer').style.display = "none";

		   document.getElementById('MyPurchaserLawyer').style.display = "none";

		   Empty('VendorLawyer');

		   document.getElementById('ClerkInformation').style.display = "none";

		   document.getElementById('AddClerckInformation').checked = false;

		   Empty('PurchaserLawyer');

		   document.getElementById('MyCooperatingBrokerage').style.display = "none";

		   Empty('CooperatingBrokerage');

		   document.getElementById('MyDeposits').style.display = "inline";

		   document.getElementById('Depositback1').style.display = "none";

		   document.getElementById('Depositback2').style.display = "inline";

		   document.getElementById('Invoiceveback1').style.display = "none";

		   document.getElementById('Invoiceveback2').style.display = "inline";

		   document.getElementById('Purchaserback1').style.display = "none";

		   document.getElementById('Purchaserback2').style.display = "inline";

		   document.getElementById('Invoiceveback1').style.display = "none";

		   document.getElementById('Invoiceveback2').style.display = "inline";

		   document.getElementById('Invoiceveback3').style.display = "none";

		   document.getElementById('Invoiceveback4').style.display = "none";

	} //Closing if
	  
	else if (ListingType === "Sale-Double-Sided") {
		
		   document.getElementById("MyVendor").innerHTML = "Vendor";

		   document.getElementById("MyPurchaser").innerHTML = "Purchaser";

		   document.getElementById('MyVendorLawyer').style.display = "inline";

		   document.getElementById('MyPurchaserLawyer').style.display = "inline";

		   document.getElementById('MyCooperatingBrokerage').style.display = "none";

		   document.getElementById('MyDeposits').style.display = "inline";

		   Empty('CooperatingBrokerage');

		   document.getElementById('Depositback1').style.display = "inline";

		   document.getElementById('Depositback2').style.display = "none";
  
		   document.getElementById('Purchaserback1').style.display = "inline";

		   document.getElementById('Purchaserback2').style.display = "none";

		   document.getElementById('Invoiceveback1').style.display = "none";

		   document.getElementById('Invoiceveback2').style.display = "inline";

		   document.getElementById('Invoiceveback3').style.display = "none";

		   document.getElementById('Invoiceveback4').style.display = "none";
		   
	} //closing if
	  
	else if (ListingType === "Buyer-Side") {
		
		document.getElementById("MyVendor").innerHTML = "Vendor";

		document.getElementById("MyPurchaser").innerHTML = "Purchaser";

		document.getElementById('MyVendorLawyer').style.display = "inline";

		document.getElementById('MyPurchaserLawyer').style.display = "inline";

		document.getElementById('MyCooperatingBrokerage').style.display = "inline";

		document.getElementById('MyDeposits').style.display = "none";

		Empty('Deposits');

		document.getElementById('Deposit2').style.display = "none";

		document.getElementById('Deposit3').style.display = "none";

		document.getElementById('Deposit4').style.display = "none";

		document.getElementById('Depositback1').style.display = "inline";

		document.getElementById('Depositback2').style.display = "none";

		document.getElementById('Invoiceveback1').style.display = "inline";

		document.getElementById('Invoiceveback2').style.display = "none";

		document.getElementById('Invoiceveback3').style.display = "none";

		document.getElementById('Invoiceveback4').style.display = "none";

		document.getElementById('Purchaserback1').style.display = "inline";

		document.getElementById('Purchaserback2').style.display = "none";

		document.getElementById('Cooperating1').style.display = "none";

		document.getElementById('Cooperating2').style.display = "inline";

		document.getElementById('Cooperating3').style.display = "none";
		
	} //closing if
	  
	else if (ListingType === "BuyerSide-Self-Represented-Vendor") {
		
		document.getElementById("MyVendor").innerHTML = "Vendor";

		document.getElementById("MyPurchaser").innerHTML = "Purchaser";

		document.getElementById('MyVendorLawyer').style.display = "inline";

		document.getElementById('MyPurchaserLawyer').style.display = "inline";

		document.getElementById('MyCooperatingBrokerage').style.display = "none";

		document.getElementById('MyDeposits').style.display = "none";

		Empty('CooperatingBrokerage');

		Empty('Deposits');

		document.getElementById('Deposit2').style.display = "none";

		document.getElementById('Deposit3').style.display = "none";

		document.getElementById('Deposit4').style.display = "none";

		document.getElementById('Invoiceveback1').style.display = "none";

		document.getElementById('Invoiceveback2').style.display = "none";

		document.getElementById('Invoiceveback3').style.display = "inline";

		document.getElementById('Invoiceveback4').style.display = "none";

		document.getElementById('Purchaserback1').style.display = "inline";

		document.getElementById('Purchaserback2').style.display = "none";


	} else if (ListingType === "TenantSide-Self-Represented-Landlord") {

		document.getElementById("MyVendor").innerHTML = "Landlord";

		document.getElementById("MyPurchaser").innerHTML = "Tenant";
		
		document.getElementById('MyVendorLawyer').style.display = "none";

		document.getElementById('MyPurchaserLawyer').style.display = "none";

		document.getElementById('MyCooperatingBrokerage').style.display = "none";

		document.getElementById('MyDeposits').style.display = "none";

		Empty('CooperatingBrokerage');

		Empty('VendorLawyer');

		document.getElementById('ClerkInformation').style.display = "none";

		document.getElementById('AddClerckInformation').checked = false;

		Empty('PurchaserLawyer');

		Empty('Deposits');

		document.getElementById('Deposit2').style.display = "none";

		document.getElementById('Deposit3').style.display = "none";

		document.getElementById('Deposit4').style.display = "none";

		document.getElementById('Purchaserback1').style.display = "none";

		document.getElementById('Purchaserback2').style.display = "inline";

		document.getElementById('Invoiceveback1').style.display = "none";

		document.getElementById('Invoiceveback2').style.display = "none";

		document.getElementById('Invoiceveback3').style.display = "none";

		document.getElementById('Invoiceveback4').style.display = "inline";

	} else {
		
		document.getElementById("MyVendor").innerHTML = "Vendor";

		document.getElementById("MyPurchaser").innerHTML = "Purchaser";

		document.getElementById('MyVendorLawyer').style.display = "inline";

		document.getElementById('MyPurchaserLawyer').style.display = "inline";

		document.getElementById('MyCooperatingBrokerage').style.display = "inline";

		document.getElementById('MyDeposits').style.display = "inline";

		document.getElementById('Depositback1').style.display = "inline";

		document.getElementById('Depositback2').style.display = "none";

		document.getElementById('Invoiceveback1').style.display = "inline";

		document.getElementById('Invoiceveback2').style.display = "none";

		document.getElementById('Invoiceveback3').style.display = "none";

		document.getElementById('Invoiceveback4').style.display = "none";

		document.getElementById('Purchaserback1').style.display = "inline";

		document.getElementById('Purchaserback2').style.display = "none";

		document.getElementById('Cooperating1').style.display = "inline";

		document.getElementById('Cooperating2').style.display = "none";

		document.getElementById('Cooperating3').style.display = "none";
	} //closing else   

	if(Data6 > 0){  document.getElementById("OfficeLeadAgainstCap").checked =true; }

	else{   document.getElementById("OfficeLeadAgainstCap").selected =false;}

	
	if(Data7 > 0){  document.getElementById("OfficeLeadAgainstCapListing").checked =true; }

	else{   document.getElementById("OfficeLeadAgainstCapListing").selected =false;}
	
	
	
	if(Data8 > 0){  document.getElementById("OfficeLeadAgainstSelling").checked =true; }

	else{   document.getElementById("OfficeLeadAgainstSelling").selected =false;}

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function LawyersSetup( Type, ProvinceValue, Province, OtherProvince , OtherProvinceElement , ClerckFullname, Clerckemail ,Clerck, ExtraContactInformation , ExtraContact ){



document.getElementById(ExtraContactInformation).value =ExtraContact;  

if(Type==="1"){

	if( ClerckFullname!=null || !ClerckFullname || ClerckFullname===""  || Clerckemail!=null || !Clerckemail || Clerckemail===""  ){
		
		
		document.getElementById(Clerck).style.display = "";  }
	
	else{    document.getElementById(Clerck).style.display = "none";  }

}//if


else{  document.getElementById(Clerck).style.display = "none";    }

 document.getElementById(Province).value=ProvinceValue;	


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function SetDepositsOptions(id, FirstName , LastName ,RecivedFrom){
	


    var selectClient = document.getElementById(id);

    var lenght = selectClient.options.length;
    

    while (lenght--) {
    	
        selectClient.remove(lenght + 1);
    }


	
    var FirstClient = "";

    var SecondClient = "";

    var ThirdClient = "";

    var FourthClient = "";

    var Clients = [];


    
    if (document.getElementById("PurchaserFisrtNameLastName1").style.display === "none") {
        FirstClient = document.getElementById("PurchaserAuthorizedSigningOfficer1").value
    } else {
        FirstClient = document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value;
    }


	
    Clients.push(FirstClient);

    if (document.getElementById("puchaser2").style.display === "none") {} else {

        if (document.getElementById("PurchaserFisrtNameLastName2").style.display === "none") {

            SecondClient = document.getElementById("PurchaserAuthorizedSigningOfficer2").value;
            Clients.push(SecondClient);
        } else {
            SecondClient = document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value;
            Clients.push(SecondClient);
        }

    }
    


    if (document.getElementById("puchaser3").style.display === "none") {} else {

        if (document.getElementById("PurchaserFisrtNameLastName3").style.display === "none") {

            ThirdClient = document.getElementById("PurchaserAuthorizedSigningOfficer3").value;
            Clients.push(ThirdClient);
        } else {
            ThirdClient = document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value;
            Clients.push(ThirdClient);
        }

    }


	
    if (document.getElementById("puchaser4").style.display === "none") {} else {

        if (document.getElementById("PurchaserFisrtNameLastName4").style.display === "none") {

            FourthClient = document.getElementById("PurchaserAuthorizedSigningOfficer4").value;
            Clients.push(FourthClient);
        } else {
            FourthClient = document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value;
            Clients.push(FourthClient);
        }

    }


	
    Clients.push("Third Party");
    
    if(FirstName!=null && LastName!=null && FirstName!="" &&  LastName!="" ){
    	
    	var check=1;
    	
    	  for (var i = 0; i < Clients.length; i++) {

    		  if( Clients[i]===FirstName+" "+LastName  ){ check=0; } 
	  
    	  }//for
    	  
    	  
    	  if(check==0){}
    	
    	  else{
    	  Clients.push(FirstName+" "+LastName); }
    	  
    	  check=1;
    
    }else{ }
    
    
    
    

    for (var i = 0; i < Clients.length; i++) {
    	  
               var options = Clients[i];
               var singleElemet = document.createElement("option");
               singleElemet.textContent = options;
               singleElemet.value = options;
               selectClient.appendChild(singleElemet);
		       selectClient.value =  Clients[i].trim(); 
 
    } //Close for

    
    var mydiv = selectClient.parentElement;
    var elements = mydiv.getElementsByClassName('select-items');
    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }

    
    
    if(FirstName!=null && LastName!=null && FirstName!="" &&  LastName!="" ){
    	
    	
        for (var i = 1; i < Clients.length + 1; i++) {

            var a = document.createElement('DIV');
            
            a.innerHTML = selectClient.options[i].innerHTML;

            // Adding event listener every time for new div element

            a.addEventListener("click", function (e) {
                /* When an item is clicked, update the original select box,
                and the selected item: */
                var y, i, k, s, h, sl, yl;
                s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                sl = s.length;
                h = this.parentNode.previousSibling;
                for (i = 0; i < sl; i++) {
                    if (s.options[i].innerHTML == this.innerHTML) {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        y = this.parentNode.getElementsByClassName(
                            "same-as-selected");
                        yl = y.length;
                        for (k = 0; k < yl; k++) {
                            y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");

                        break;
                    }
                }
                h.click();
            });
        	
            var tt = mydiv.getElementsByClassName('select-selected')[0];
            
            
            if ( RecivedFrom=="0"){ tt.innerHTML =FirstName+" "+LastName;  } else{ tt.innerHTML ="Third Party";   }

            divselect.appendChild(a);  }
	

    }
    
    else{
    	
    	
        for (var i = 0; i < Clients.length + 1; i++) {

            var a = document.createElement('DIV');
            
            a.innerHTML = selectClient.options[i].innerHTML;

            // Adding event listener every time for new div element

            a.addEventListener("click", function (e) {
                /* When an item is clicked, update the original select box,
                and the selected item: */
                var y, i, k, s, h, sl, yl;
                s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                sl = s.length;
                h = this.parentNode.previousSibling;
                for (i = 0; i < sl; i++) {
                    if (s.options[i].innerHTML == this.innerHTML) {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        y = this.parentNode.getElementsByClassName(
                            "same-as-selected");
                        yl = y.length;
                        for (k = 0; k < yl; k++) {
                            y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");

                        break;
                    }
                }
                h.click();
            });


        	
            var tt = mydiv.getElementsByClassName('select-selected')[0];
            tt.innerHTML = '-- Please select an option --';

            divselect.appendChild(a);  }
    	
    	
    	
    }

    
  
	
	
	

}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function SetDepositsDetails( TypeValue , DepositeType , RecivedFrom, RecivedFromDetail ,RecivedfromThirdParty , OtherProvince ,  OtherProvinceElement , Province, Provincevalue ,
	
	  ExtraContactnumber, ExtraContact , FirstName , LastName , Section){

        if( Provincevalue==="ON" ||  Provincevalue==="AB" || Provincevalue==="BC" || Provincevalue==="MB" || Provincevalue==="NB" || Provincevalue==="NL" || Provincevalue==="NWT" ||
		
	         Provincevalue==="NS" ||  Provincevalue==="NU" || Provincevalue==="PE" || Provincevalue==="QC" || Provincevalue==="SK" || Provincevalue==="YT"   ){

			           document.getElementById(OtherProvinceElement).style.display = "none";
			
			           document.getElementById(OtherProvince).value="";
			
			           document.getElementById(Province).value=Provincevalue;	}

        else{

	               document.getElementById(OtherProvinceElement).style.display = "";

	                document.getElementById(OtherProvince).value=Provincevalue;

	                document.getElementById(Province).value="Other"; }

        



            if( RecivedFromDetail=="1"){  
	
	             //document.getElementById(RecivedFrom).value="Third Party"; 
	
            	document.getElementById(Section).style.display = ""; 
	             document.getElementById(RecivedfromThirdParty).style.display = ""; }

           else{  
	
	             //document.getElementById(RecivedFrom).value=FirstName+" "+LastName; 
	
        	   
               	 document.getElementById(Section).style.display = "none"; 
	             document.getElementById(RecivedfromThirdParty).style.display = "none";    }


                 document.getElementById(DepositeType).value=TypeValue;

                 document.getElementById(ExtraContact).value=ExtraContactnumber;



}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function DepositsDisplay(
	
Size,

TypeValue1 , DepositeType1 , RecivedFrom1, RecivedFromDetail1 ,RecivedfromThirdParty1 , OtherProvince1 ,  OtherProvinceElement1 ,

Province1, Provincevalue1 , ExtraContactnumber1, ExtraContact1 , FirstName1 , LastName1,Section1,


TypeValue2 , DepositeType2 , RecivedFrom2, RecivedFromDetail2 ,RecivedfromThirdParty2 , OtherProvince2 ,  OtherProvinceElement2 ,

Province2, Provincevalue2 , ExtraContactnumber2, ExtraContact2 , FirstName2 , LastName2,Section2,


TypeValue3 , DepositeType3 , RecivedFrom3, RecivedFromDetail3 ,RecivedfromThirdParty3 , OtherProvince3 ,  OtherProvinceElement3 ,

Province3, Provincevalue3 , ExtraContactnumber3, ExtraContact3 , FirstName3 , LastName3,Section3,


TypeValue4 , DepositeType4 , RecivedFrom4, RecivedFromDetail4 ,RecivedfromThirdParty4 , OtherProvince4 ,  OtherProvinceElement4 ,

Province4, Provincevalue4 , ExtraContactnumber4, ExtraContact4 , FirstName4 , LastName4,Section4,

Deposit2,Deposit3, Deposit4

){


if (Size==1){


SetDepositsDetails( TypeValue1 , DepositeType1 , RecivedFrom1, RecivedFromDetail1 ,RecivedfromThirdParty1 , OtherProvince1 ,  OtherProvinceElement1 ,
		
		Province1, Provincevalue1 , ExtraContactnumber1, ExtraContact1 , FirstName1 , LastName1,Section1 );

document.getElementById(Deposit2).style.display = "none";

document.getElementById(Deposit3).style.display = "none";

document.getElementById(Deposit4).style.display = "none";


}

else if( Size==2){

SetDepositsDetails( TypeValue1 , DepositeType1 , RecivedFrom1, RecivedFromDetail1 ,RecivedfromThirdParty1 , OtherProvince1 ,  OtherProvinceElement1 ,
		
		Province1, Provincevalue1 , ExtraContactnumber1, ExtraContact1 , FirstName1 , LastName1 ,Section1);


document.getElementById(Deposit2).style.display = "";


SetDepositsDetails( TypeValue2 , DepositeType2 , RecivedFrom2, RecivedFromDetail2 ,RecivedfromThirdParty2 , OtherProvince2 ,  OtherProvinceElement2 ,
		
		Province2, Provincevalue2 , ExtraContactnumber2, ExtraContact2 , FirstName2 , LastName2 ,Section2);




document.getElementById(Deposit3).style.display = "none";

document.getElementById(Deposit4).style.display = "none";

}


else if( Size==3 ){


SetDepositsDetails( TypeValue1 , DepositeType1 , RecivedFrom1, RecivedFromDetail1 ,RecivedfromThirdParty1 , OtherProvince1 ,  OtherProvinceElement1 ,
		
		Province1, Provincevalue1 , ExtraContactnumber1, ExtraContact1 , FirstName1 , LastName1 ,Section1);

SetDepositsDetails( TypeValue2 , DepositeType2 , RecivedFrom2, RecivedFromDetail2 ,RecivedfromThirdParty2 , OtherProvince2 ,  OtherProvinceElement2 ,
		
		Province2, Provincevalue2 , ExtraContactnumber2, ExtraContact2 , FirstName2 , LastName2 ,Section2);


SetDepositsDetails( TypeValue3 , DepositeType3 , RecivedFrom3, RecivedFromDetail3 ,RecivedfromThirdParty3 , OtherProvince3 ,  OtherProvinceElement3 ,
		
		Province3, Provincevalue3 , ExtraContactnumber3, ExtraContact3 , FirstName3 , LastName3,Section3 );

document.getElementById(Deposit2).style.display = "";

document.getElementById(Deposit3).style.display = "";

document.getElementById(Deposit4).style.display = "none";

}	

else if( Size==4 ){

SetDepositsDetails( TypeValue1 , DepositeType1 , RecivedFrom1, RecivedFromDetail1 ,RecivedfromThirdParty1 , OtherProvince1 ,  OtherProvinceElement1 ,
		
		Province1, Provincevalue1 , ExtraContactnumber1, ExtraContact1 , FirstName1 , LastName1 ,Section1);

SetDepositsDetails( TypeValue2 , DepositeType2 , RecivedFrom2, RecivedFromDetail2 ,RecivedfromThirdParty2 , OtherProvince2 ,  OtherProvinceElement2 ,
		
		Province2, Provincevalue2 , ExtraContactnumber2, ExtraContact2 , FirstName2 , LastName2,Section2 );


SetDepositsDetails( TypeValue3 , DepositeType3 , RecivedFrom3, RecivedFromDetail3 ,RecivedfromThirdParty3 , OtherProvince3 ,  OtherProvinceElement3 ,
		
		Province3, Provincevalue3 , ExtraContactnumber3, ExtraContact3 , FirstName3 , LastName3,Section3 );


SetDepositsDetails( TypeValue4 , DepositeType4 , RecivedFrom4, RecivedFromDetail4 ,RecivedfromThirdParty4 , OtherProvince4 ,  OtherProvinceElement4 ,
		
		Province4, Provincevalue4 , ExtraContactnumber4, ExtraContact4 , FirstName4 , LastName4,Section4 );

document.getElementById(Deposit2).style.display = "";

document.getElementById(Deposit3).style.display = "";

document.getElementById(Deposit4).style.display = "";



}

else{ /* Do nothing */}
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SetCooperatingBrokerageDetails( Province , ProvinceValue , ExtraContact, ExtraContactvalue){


	
document.getElementById(ExtraContact).value =ExtraContactvalue;
	
document.getElementById(Province).value = ProvinceValue;



}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SetReferral(checkRef, Ref1 , Ref2 , Province , Provincevalue , ExteraContactvalue , ExtraContact ){
	
	
	if(  checkRef > 0 ){

		
	      document.getElementById('AddRefferalFree').checked=true;
	
	      document.getElementById('RefferalSection').style.display="";
	    
	      document.getElementById('ReferralSteps2').style.display="inline";

	      document.getElementById('ReferralSteps1').style.display="none";

	      if( Ref1>0 ){ 
	    	  
		           document.getElementById('ReferralDisclosedToALL').style.display="";  

		           document.getElementById('ReferralfeeIsRegistrantYES').checked=true;
		
		           document.getElementById('ReferralfeeIsRegistrantNO').checked=false; 
		        
	               if( Ref2>0){
	            	
	        	          document.getElementById('ReferralDisclosureUpload').style.display="block";
	            	
			              document.getElementById('ReferralfeeIsDisclosedToAllYES').checked=true;
					
			              document.getElementById('ReferralfeeIsDisclosedToAllNO').checked=false; 
			        
			              document.getElementById('ReferralPaymentTab').style.display="";  }
	               
	               else{
	            	
	            	
	        	         document.getElementById('ReferralDisclosureUpload').style.display="none";
	            	
			             document.getElementById('ReferralfeeIsDisclosedToAllNO').checked=true;
					
			             document.getElementById('ReferralfeeIsDisclosedToAllYES').checked=false; 
			        
			             document.getElementById('ReferralPaymentTab').style.display="none";  }

	    }//if Ref1>0

	   else{ 
	            document.getElementById('ReferralDisclosedToALL').style.display="none"; 
	
	            document.getElementById('ReferralfeeIsRegistrantYES').checked=false;
	
	            document.getElementById('ReferralfeeIsRegistrantNO').checked=true;
 
	            
       }//else Ref1>0
	
}
	
	
else{  
	
	
document.getElementById('ReferralPaymentTab').style.display="none"; 


document.getElementById('RefferalSection').style.display="none";  


document.getElementById('AddRefferalFree').checked=false;


document.getElementById('ReferralSteps2').style.display="none";


document.getElementById('ReferralSteps1').style.display="inline"; }


}//else Checkref>0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function SetRebates( checkReb , Condition1 , Condition2, RebateAmount2 ,RebateAmount3 ,RebateAmount4 , Rebate2 ,Rebate3 ,Rebate4 ){

	
	  if(  checkReb > 0 ){
		
	           document.getElementById('AddRebate').checked=true;

	           document.getElementById('RebateDisclosureDetailInformation').style.display="block";

	           document.getElementById('Rebaeps1').style.display="none";
	           
	           document.getElementById('Rebaeps2').style.display="inline";

	           if( Condition1>0){ 

		                  document.getElementById('ReebateComplywiththeCodeofEthics').style.display="Block";  

		                  document.getElementById('RecipientAPartyYes').checked=true;
		
		                  document.getElementById('RecipientAPartyNO').checked=false; 
		        
	                      if( Condition2>0){
	            	
	        	                    document.getElementById('RebateAgreementUpload').style.display="block";
	            	
			                        document.getElementById('ComplyWithEthicYes').checked=true;
					 
			                        document.getElementById('ComplyWithEthicNO').checked=false; 
			                        
			                        document.getElementById('RebateAmountSection').style.display="inline";} // End of if Condition2>0
	                      
	                      else{
	        	                    document.getElementById('RebateAgreementUpload').style.display="none";
	            	
			                        document.getElementById('ComplyWithEthicNO').checked=true;
					
			                        document.getElementById('ComplyWithEthicYes').checked=false; 
			                        
			                        document.getElementById('RebateAmountSection').style.display="none";} //else of Condition2>0

	            }//End of Condition1>0

	            else{ 
	                        document.getElementById('ReebateComplywiththeCodeofEthics').style.display="none"; 
	
	                        document.getElementById('RecipientAPartyYes').checked=false;
	
	                        document.getElementById('RecipientAPartyNO').checked=true;  }//End of else Condition1>0

        }//End of if checkRef> 0 
	
	
	else{  document.getElementById('RebateAmountSection').style.display="none"; 

           document.getElementById('RebateDisclosureDetailInformation').style.display="none";  

           document.getElementById('AddRebate').checked=false; 

           document.getElementById('Rebaeps1').style.display="inline";
           
           document.getElementById('Rebaeps2').style.display="none";
	
	
	
	
	}

	  

	 if( RebateAmount2>0){ document.getElementById(Rebate2).style.display="block"; }else{ document.getElementById(Rebate2).style.display="none"; } 
	 
	 if( RebateAmount3>0){ document.getElementById(Rebate3).style.display="block"; }else{ document.getElementById(Rebate3).style.display="none"; } 
	 
	 if(RebateAmount4>0){ document.getElementById(Rebate4).style.display="block"; }else{ document.getElementById(Rebate4).style.display="none"; }
	  
	  
	  
	  
	
	

}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function documents( FileName ,ID ){

	
	if(FileName==="0"){ document.getElementById(ID).style.display="none";  } else{   document.getElementById(ID).style.display="";}
	
	
	
}








function fillHSTUpdate(HST1 ,HST2 ,HST3){
	

	  document.getElementById('BreakdownGrossFeeAmountHSTPercent').value =HST1;
	  
	  document.getElementById('BreakdownAgent1HSTPercent').value =HST2;

	  document.getElementById('BreakdownAgent2HSTPercent').value =HST3;

	}




 function fillHSTUpdateTRS(HST1, HST2, HST3 , HST4, HST5 , HST6, HST7 ,HST8, HST9, HST10){
	 
	 
	  //  HST = parseFloat(document.getElementById("HSTAMount").value).toFixed(0);
	    document.getElementById('TRSListHTSPercent').value = HST9 ;
	    document.getElementById('TRSSellCommissionHTSPercent').value = HST10;
	    document.getElementById('Co-operatingBrokerageExpensesHSTPercent').value = HST1 ;
	    document.getElementById('ExpensesReferralAgentHSTPercent').value = HST2;
	    document.getElementById('CustomerHST1Percent').value = HST3;
	    document.getElementById('CustomerHST2Percent').value = HST4;
	    document.getElementById('CustomerHST3Percent').value = HST5;
	    document.getElementById('CustomerHST4Percent').value = HST6;
	    document.getElementById('AgentExpensesHST1Percent').value = HST7 ;
	    document.getElementById('AgentExpensesHST2Percent').value = HST8 ; 

	 
 }


 function SetCommissionAmount(mainid, id1, id2, Amount, id3, id4) {

	if (id4 < 100) {

		document.getElementById(id1).checked = true;

		document.getElementById(id2).checked = false;

		document.getElementById(id3).innerHTML = "%"

		document.getElementById(id3).style.float = 'left';

		// document.getElementById(id4).value = parseFloat(document.getElementById(id4).value).toFixed(2);

	} else {

		document.getElementById(id1).checked = false;

		document.getElementById(id2).checked = true;

		document.getElementById(id3).innerHTML = "$"

		document.getElementById(id3).style.float = 'left';

	}	




}