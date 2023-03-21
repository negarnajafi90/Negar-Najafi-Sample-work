$(function () {
    $('#PropertyClosingDate').datepicker({
        format: "dd M yyyy",
        startDate: '-10y'
        //endDate: '-1d'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyListingDate').datepicker({
        format: "dd M yyyy",
        startDate: '-10y'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyExpirationDate').datepicker({
        format: "dd M yyyy",
        startDate: '-10y'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#DepositDate1').datepicker({
        format: "dd M yyyy",
        startDate: '-10y'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        // document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#DepositDate2').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        // document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#DepositDate3').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        // document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#DepositDate4').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        // document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyConditionsExpirationDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyConditionsCompleteDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyOfferWithdrawalDate').datepicker({
        format: "dd M yyyy",
        endDate: '0d'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyInspectionDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyOccupancyDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyOffMarketDate').datepicker({
        format: "dd M yyyy",
        endDate: '0d'
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });

    $('#PropertyOfferDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });


    $('#PropertyOfferExpirationDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });


    $('#PropertyOfferAcceptanceDate').datepicker({
        format: "dd M yyyy",
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
        document.getElementById(this.id).nextElementSibling.nextElementSibling.style.borderColor = "lightgrey";
    });


});

const months = ["Jan", "Feb", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
];

var loadFile = function (event) {

    var image = document.getElementById('PropertyPic');
    var file = document.getElementById('PropertyImg');

    if (file.files[0].size < 5240) {
        console.log('File if too small');

    } else if (file.files[0].size > 204800) {
        console.log('File is too big')

    } else {
        image.src = URL.createObjectURL(event.target.files[0]);
    }
};

var deleteFile = function () {

    var elem = document.getElementById('croppedImg');


    // document.getElementById('PropertyPic').classList.remove('newimg');
    if (elem) {
        elem.remove();
    }

    document.getElementsByClassName('insideImg')[0].style.visibility = 'visible';

    var file = document.getElementById('PropertyImg');

    if (file.value) {
        try {
            file.value = ''; //for IE11, latest Chrome/Firefox/Opera...
        } catch (err) {}
        if (file.value) { //for IE5 ~ IE10
            var form = document.createElement('form'),
                parentNode = file.parentNode,
                ref = file.nextSibling;
            form.appendChild(file);
            form.reset();
            parentNode.insertBefore(file, ref);
        }
    }
    document.getElementById('PropertyPic').style.display='none';
    // if (document.getElementById('PropertyType').value == '' || !document.getElementById('PropertyType').value) {
    //     image.src = '../ImagesUsed/Detached.png';
    // } else {
    //     image.src = '../ImagesUsed/' + document.getElementById('PropertyType').value + '.png';
    // }
};

function forBrokerage() {
    if (document.getElementById('changeAgentBox').checked == true) {
        document.getElementById('FirstAgentIDCustom').style.pointerEvents = '';
    } else {
        document.getElementById('FirstAgentIDCustom').style.pointerEvents = 'none';
    }

}

function changeRole(role, agents) {
    if (agents == 1) {
        if (role == 'Broker') {
            document.getElementById('ExteraAgent').style.display = 'none';
            document.getElementById('changeAgent').style.display = 'none';
            document.getElementById('FirstAgentIDCustom').style.display = '';

        } else if (role == 'Admin') {
            document.getElementById('FirstAgentIDCustom').style.display = '';
            document.getElementById('FirstAgentIDCustom').style.pointerEvents = '';

            document.getElementById('ExteraAgent').style.display = 'none';
            document.getElementById('changeAgent').style.display = 'none';
        } else {
            document.getElementById('FirstAgentIDCustom').style.pointerEvents = 'none';
            document.getElementById('FirstAgentIDCustom').style.display = 'none';
            document.getElementById('changeAgent').style.display = 'none';
            document.getElementById('ExteraAgent').style.display = 'none';
        }
    } else {
        if (role == 'Broker') {

            document.getElementById('ExteraAgent').style.display = '';
            document.getElementById('changeAgent').style.display = '';
            document.getElementById('FirstAgentIDCustom').style.display = '';
            document.getElementById('FirstAgentIDCustom').style.pointerEvents = '';
        } else if (role == 'Admin') {
            document.getElementById('FirstAgentIDCustom').style.display = '';
            document.getElementById('FirstAgentIDCustom').style.pointerEvents = '';
            document.getElementById('ExteraAgent').style.display = '';
            document.getElementById('changeAgent').style.display = 'none';
        } else {
            document.getElementById('FirstAgentIDCustom').style.pointerEvents = 'none';
            document.getElementById('FirstAgentIDCustom').style.display = 'none';
            document.getElementById('changeAgent').style.display = 'none';
            document.getElementById('ExteraAgent').style.display = '';
        }
    }

}

var FullListFirm = [
    ["Geoff Pollock & Associates Professional Corporation", '1B', 26, "Lesmill Road", "Toronto", "M3B 2T5", "ON"]
];

var FullListLawyers = [
    ["Geoff Pollock & Associates Professional Corporation", "Geoff Pollock", "geoff@geoffpollock.com", "4167770088", ""],
    ["Geoff Pollock & Associates Professional Corporation", "Nisha Subba", "nisha@geoffpollock.com", "4167770088", ""],
    ["Geoff Pollock & Associates Professional Corporation", "Bogdan Drapac", "stefan@geoffpollock.com", "4167770088", ""],
];


//The Property function will take the property information which has been taken from MLS Database and display on all other sections 

function showButton() {
    document.getElementsByClassName('btnUpload')[0].style.visibility = "visible";
    document.getElementsByClassName('closebtn')[0].style.visibility = "visible";
}

function hideButton() {
    document.getElementsByClassName('btnUpload')[0].style.visibility = "hidden";
    document.getElementsByClassName('closebtn')[0].style.visibility = "hidden";
}

// //function for 
// function Property(Item1, Item2, Item3, Item4, Item5, Item6) {

//     document.getElementById(Item1).innerHTML = document.getElementById("PropertyStreetNumber").value;

//     document.getElementById(Item2).innerHTML = document.getElementById("PropertyStreetName").value.trim();

//     if (document.getElementById("PropertyUnit").value === null) {
//         document.getElementById(Item3).style.display = "none";
//     } else {
//         document.getElementById(Item3).style.display = "";
//         document.getElementById(Item3).innerHTML = document.getElementById("PropertyUnit").value.trim();
//     }

//     document.getElementById(Item4).innerHTML = document.getElementById("PropertyCity").value.trim();

//     document.getElementById(Item5).innerHTML = document.getElementById("PropertyProvince").value.trim();

//     document.getElementById(Item6).innerHTML = document.getElementById("PropertyPostalCode").value.trim();
// }

function PropertyLabel(Item1) {

    if (document.getElementById("PropertyUnit").value === null || !document.getElementById("PropertyUnit").value) {
        document.getElementById(Item1).innerHTML = document.getElementById("PropertyStreetNumber").value.trim() + "&nbsp;" + document.getElementById("PropertyStreetName").value.trim() + ",&nbsp;" + document.getElementById("PropertyCity").value.trim() + ",&nbsp;" + document.getElementById("PropertyProvince").value.trim() + ",&nbsp;" + document.getElementById("PropertyPostalCode").value.trim();
    } else {
        document.getElementById(Item1).innerHTML = document.getElementById("PropertyUnit").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("PropertyStreetNumber").value.trim() + "&nbsp;" + document.getElementById("PropertyStreetName").value.trim() + ",&nbsp;" + document.getElementById("PropertyCity").value.trim() + ",&nbsp;" + document.getElementById("PropertyProvince").value.trim() + ",&nbsp;" + document.getElementById("PropertyPostalCode").value.trim();
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

function setProvinceCopy(id) {

    var mydiv = document.getElementById(id).parentElement;
    var tt = mydiv.getElementsByClassName('select-selected')[0];
    tt.innerHTML = document.getElementById("PropertyProvince").value;

}


function setProvinceFrom(id1, id2) {


    var mydiv = document.getElementById(id1).parentElement;
    var tt = mydiv.getElementsByClassName('select-selected')[0];
    tt.innerHTML = document.getElementById(id2).value;

}


function CopyAddress(Unit, StreetNumber, StreetName, Province, PostalCode, City) {

    document.getElementById(City).value = document.getElementById("PropertyCity").value.trim();

    document.getElementById(Unit).value = document.getElementById("PropertyUnit").value.trim();

    document.getElementById(StreetNumber).value = document.getElementById("PropertyStreetNumber").value.trim();

    document.getElementById(StreetName).value = document.getElementById("PropertyStreetName").value.trim();

    document.getElementById(PostalCode).value = document.getElementById("PropertyPostalCode").value.trim();

    document.getElementById(Province).value = document.getElementById("PropertyProvince").value.trim();

    setProvinceCopy(Province);

}


function CheckMLS() {

    //This finction will check if the user has an mls number or not 

    //if yes then show the related section named MLSnumber and autoMLSNumber 

    //if not then they have to enter the property information manually and then hide these sections MLSnumber and autoMLSNumber 

    if (document.getElementById("HavingMLSNumber").checked == true) {

        document.getElementById("AutoMLSNumber").style.display = "block";

        document.getElementById("MLSNumber").style.display = "block";
    } else {
        document.getElementById("AutoMLSNumber").style.display = "none";

        document.getElementById("MLSNumber").style.display = "none";
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//The following finction is to set the default values for the gross commisions and agents commission based on the listing type and adding or removing second agent

function SetDefaultAgentsCommissions() {

    var sellAmount = 0;

    var ListAmount = 0;

    var Price = parseFloat(document.getElementById('ProPertyListingPrice').value);

    var list = parseFloat(document.getElementById('PropertyListingComission').value);

    var sell = parseFloat(document.getElementById('PropertySellingComission').value);


    if (document.getElementById("ListingComiissionFixedAmount").checked == true) {
        ListAmount = (list * 100) / Price;
    } else {
        ListAmount = list;
    }


    if (document.getElementById("SellingComiissionFixedAmount").checked === true) {

        sellAmount = (sell * 100) / Price;
    } else {
        sellAmount = sell;
    }

    if (document.getElementById("PropertyListingType").value === "Sale-Double-Sided" || document.getElementById("PropertyListingType").value === "Lease-DoubleSided") {

        document.getElementById('FirstAgentGrossCommisionSplit').value = parseFloat(sellAmount + ListAmount).toFixed(2);

        document.getElementById('SecondAgentGrossCommisionSplit').value = 0.00;
    } else {
        document.getElementById('FirstAgentGrossCommisionSplit').value = 100.00;

        document.getElementById('SecondAgentGrossCommisionSplit').value = 0.00;
    }

}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

function AgentRol() {

    var listingType = document.getElementById('PropertyListingType').value;

    if (document.getElementById("AddAgent").checked === true) {

        if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {

            document.getElementById("SecondAgentRole").style.display = "flex";
        } else {
            document.getElementById("SecondAgentRole").style.display = "none";
        }

    } else {
        document.getElementById("SecondAgentRole").style.display = "none";
    }

}

function clearing() {
    if (document.getElementById("ProPertyListingPrice").value > 0) {
        document.getElementById("ProPertyListingPrice").parentElement.style.borderColor = "lightgrey";
    } else {
        document.getElementById("ProPertyListingPrice").parentElement.style.borderColor = "red"
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

//the below function will check which role each agents have in case of double sided and having two agents and if it is office lead or agent own then aligned the commisson amount to each

function AgentsRolsCommission() {


    var sellAmount = 0;

    var ListAmount = 0;

    var Price = parseFloat(document.getElementById('ProPertyListingPrice').value);

    var list = parseFloat(document.getElementById('PropertyListingComission').value);

    var sell = parseFloat(document.getElementById('PropertySellingComission').value);


    if (document.getElementById("ListingComiissionFixedAmount").checked == true) {
        ListAmount = (list * 100) / Price;
    } else {
        ListAmount = list;
    }


    if (document.getElementById("SellingComiissionFixedAmount").checked === true) {

        sellAmount = (sell * 100) / Price;
    } else {
        sellAmount = sell;
    }

    if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {

        document.getElementById('FirstAgentGrossCommisionSplit').value = parseFloat(ListAmount).toFixed(2);

        document.getElementById('SecondAgentGrossCommisionSplit').value = parseFloat(sellAmount).toFixed(2);
    } else {

        document.getElementById('FirstAgentGrossCommisionSplit').value = parseFloat(sellAmount).toFixed(2);

        document.getElementById('SecondAgentGrossCommisionSplit').value = parseFloat(ListAmount).toFixed(2);
    }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function TotalAgentsCommissions(Amount1, Amount2, Amount3, Amount4) {


    var sellAmount = 0;

    var ListAmount = 0;

    var Price = parseFloat(document.getElementById('ProPertyListingPrice').value);

    var list = parseFloat(document.getElementById('PropertyListingComission').value);

    var sell = parseFloat(document.getElementById('PropertySellingComission').value);

    if (document.getElementById("ListingComiissionFixedAmount").checked == true) {
        ListAmount = (list * 100) / Price;
    } else {
        ListAmount = list;
    }


    if (document.getElementById("SellingComiissionFixedAmount").checked === true) {

        sellAmount = (sell * 100) / Price;
    } else {
        sellAmount = sell;
    }
    //Getting the Gross Commission values , which has been enter by user

    var firstAgent = 0;

    var SecondAgent = 0;

    if (document.getElementById("PropertyListingType").value === "Sale-Double-Sided" || document.getElementById("PropertyListingType").value === "Lease-DoubleSided") {

        document.getElementById(Amount1).readOnly = true;

        document.getElementById(Amount2).readOnly = true;

        if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {

            document.getElementById(Amount1).value = ListAmount;

            document.getElementById(Amount2).value = parseFloat(sellAmount).toFixed(2);

            firstAgent = ListAmount;

            SecondAgent = sellAmount;
        } //Closing inner if condition
        else if (document.getElementById('SecondAgentIDRole').value === "Listing Agent") {

            document.getElementById(Amount1).value = sellAmount;

            document.getElementById(Amount2).value = parseFloat(ListAmount).toFixed(2);

            firstAgent = sellAmount;

            SecondAgent = ListAmount;
        } //Closing inner else if
        else {
            document.getElementById(Amount1).value = sellAmount + ListAmount;

            document.getElementById(Amount2).value = parseFloat(0.00).toFixed(2);

            firstAgent = sellAmount + ListAmount;

            SecondAgent = 0;
        } //Closing inner else 

    } //Closing if Condition
    else {
        document.getElementById(Amount1).readOnly = false;

        document.getElementById(Amount2).readOnly = true;

        firstAgent = parseFloat(document.getElementById(Amount1).value);

        SecondAgent = 100 - firstAgent;

        document.getElementById(Amount2).value = parseFloat(SecondAgent).toFixed(2);
    } //Closing else

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

}

function TotalListingSellingCommission(id1, id2) {
    var listing = document.getElementById(id1).value;

    var selling = document.getElementById(id2).value;

    var sum = +listing + +selling;

    if (sum > 100) {
        document.getElementById(id2).value = parseFloat(100 - listing).toFixed(2);
    }
    sum = 0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CheckTransactionSource() {

    SetDefaultAgentsCommissions();

    TotalAgentsCommissions('FirstAgentGrossCommisionSplit', 'SecondAgentGrossCommisionSplit', 'PropertyListingComission', 'PropertySellingComission');

    const Source = document.getElementById('ProPertyListingSource').value;

    const listingType = document.getElementById('PropertyListingType').value;

    if (Source === "Office-lead") {

        document.getElementById("OfficeLeadItem1").style.display = "";

        document.getElementById("OfficeLeadItem11").style.display = "";

        document.getElementById("OfficeLeaditem2").style.display = "block";

        if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {

            document.getElementById("OfficeLeaddoubledouble").style.display = "block";

            document.getElementById("OfficeLeadCommisison").style.display = "none";

            Empty("OfficeLeadCommisison");


        } //Closing inner If Condition
        else {


            document.getElementById("OfficeLeadCommisison").style.display = "block";

            document.getElementById("OfficeLeaddoubledouble").style.display = "none";

            Empty("OfficeLeaddoubledouble");
        } //closing inner else	  

    } //Closing If condition
    else {
        document.getElementById("OfficeLeadItem1").style.display = "none";

        document.getElementById("OfficeLeadItem11").style.display = "none";

        document.getElementById("OfficeLeaditem2").style.display = "none";

        document.getElementById("OfficeLeadCommisison").style.display = "none";

        document.getElementById("OfficeLeaddoubledouble").style.display = "none";

        Empty("OfficeLeaddoubledouble");

        Empty("OfficeLeadCommisison");
    } //Closing else

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    

function SetCommissionAmounts(mainid, id1, id2, Amount, id3, id4) {

    //This function will modify the Gross commission to fixed amount or % based on what users will choose 

    document.getElementById(id1).checked = false;

    document.getElementById(id2).checked = false;

    if (mainid == Amount) {

        document.getElementById(id2).checked = false;

        document.getElementById(id1).checked = true;

        document.getElementById(id3).innerHTML = "%"

        document.getElementById(id3).style.float = 'right';

        if (document.getElementById(id4).value > 100) {

            document.getElementById(id4).value = 99.99;

        }

        //document.getElementById(id4).disabled = false;
    } else {

        document.getElementById(id1).checked = false;

        document.getElementById(id2).checked = true;

        document.getElementById(id3).innerHTML = "$"

        document.getElementById(id3).style.float = 'left';

        document.getElementById(id4).value = parseFloat(document.getElementById(id4).value).toFixed(2);

        //document.getElementById(id4).disabled = false;
    }

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function HideAndShowSection(Checkbox, Section) {

    if (document.getElementById(Checkbox).checked == true) {

        document.getElementById(Section).style.display = "block";
    } else {
        document.getElementById(Checkbox).style.display = "none";

        document.getElementById(Section).style.display = "none";
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function HideAndShowHelps(Item) {

    //This funstion is to show extra information to the users if they nedd and click on more help button 

    if (document.getElementById(Item).style.display === 'none') {

        document.getElementById(Item).style.display = "block";
    } else {
        document.getElementById(Item).style.display = "none";
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  

function SetAgent1() {

    document.getElementById("FirstAgentGross").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("ReferralToAgent1").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("RebateAgentName1").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("2RebateAgentName1").innerHTML = document.getElementById("FirstAgentID").value;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

function SetAgent2() {

    //SetAgent1();

    document.getElementById("SecondAgentGross").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("ReferralToAgent2").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("RebateAgentName2").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("2RebateAgentName2").innerHTML = document.getElementById("SecondAgentID").value;
}

function fillFunctionFirm(id1, id2, unit, streetNumber, streetName, city, postal, province, lawyerName, LawFirmList) {
    
    const firmName = document.getElementById(id1).value;

    const jsonData = JSON.parse(LawFirmList);

    for (const element of jsonData) {
    // console.log(element)
    // console.log(element.LawFirm)
        if(element.LawFirm == firmName){
            // console.log("!!!!!!!!!!!!!!!!!!!!"+element.LawFirm)
            document.getElementById(unit).value = element.Unit;
            document.getElementById(streetNumber).value = element.StreetNumber;
            document.getElementById(streetName).value = element.StreetName;
            document.getElementById(city).value = element.City;
            document.getElementById(postal).value = element.PostalCode;
            document.getElementById(province).value = element.Province;

            const a = document.getElementById(province).parentElement;
            a.getElementsByClassName('select-selected')[0].innerHTML = element.Province;
        }

    }
    fillLawyer(lawyerName, firmName, LawFirmList);
}

var List = 0;

function fillLawyer(id1, lawFirm, json) {
    let option;
    const list = document.getElementById(id1);
    
    const jsonData = JSON.parse(json);
    for (const element of jsonData) {
        if(element.LawFirm == lawFirm){
            if(element.Lawyer!='' && element.Lawyer!=null){
                option = document.createElement('option');
                option.value = element.Lawyer;
                list.appendChild(option);
            }
        }
        
    }
}

function fillLawfirm(id1, json) {

    const list = document.getElementById(id1);
    const jsonData = JSON.parse(json);
    let pass = 1 ;

    for (const element of jsonData) {
        for(const element3 of list.options){
            if(element3.value == element.LawFirm){
                pass = 0;
            }
        }
        if(pass){
            let option = document.createElement('option');
            option.value = element.LawFirm;
            list.appendChild(option);
        }
    }
}

function fillFunctionLawyer(id1, firmId, email, phone1, phone2, json) {

    const lawyerName = document.getElementById(id1).value;
    const firmName = document.getElementById(firmId).value;

    const jsonData = JSON.parse(json);

    for (const element of jsonData) {
    // console.log(element)
    // console.log(element.LawFirm)
        if(element.Lawyer == lawyerName && element.LawFirm == firmName){
            // console.log("!!!!!!!!!!!!!!!!!!!!"+element.LawFirm)
            document.getElementById(email).value = element.Email;
            document.getElementById(phone1).value = element.Phone;
            document.getElementById(phone2).value = element.ExtraContact;
        }

    }


    // for (let i = 0; i < List.length; i++) {


    //     if (List[i][1] === val) {
    //         document.getElementById(email).value = List[i][2];
    //         document.getElementById(phone1).value = List[i][3];
    //         document.getElementById(phone2).value = List[i][4];

    //     }
    // }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

//The following function will checks if the user whants to add second agent or not and then activate related section for second agent information .

function CheckForSecondAgent() {

    if (document.getElementById("AddAgent").checked === true) {

        document.getElementById("AddNewAgent").style.display = "block";

        document.getElementById("checkAgent2").style.display = "block";

        document.getElementById("AgentsRefferalPayments").style.display = "block";

        document.getElementById("RebateAgentsAllocations").style.display = "block";

        TotalPercentageCalculation('ReferralPercentageAmountToAgent1', 'ReferralPercentageAmountToAgent2', 'TotalRefferalPercentageAmount');

        TotalPercentageCalculation('RebateAgent1amount', 'RebateAgent2amount', 'TotalRebate1');

        AgentRol();


    } //Closing if
    else {

        document.getElementById("AddNewAgent").style.display = "none";

        clearSelected("SecondAgentID");

        Empty("checkAgent2");

        document.getElementById("checkAgent2").style.display = "none";

        document.getElementById("AgentsRefferalPayments").style.display = "none";

        document.getElementById("RebateAgentsAllocations").style.display = "none";

        Empty('RebateAgentsAllocations');

        Empty('AgentsRefferalPayments');
    } //Closing else 
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////         

//The following function will check if there are 2 agents , then their gross commission add up to 100 

function TotalPercentageCalculation(Amount1, Amount2) {

    //Getting the Gross Commission values , which has been enter by user

    var firstAgent = parseInt(document.getElementById(Amount1).value);

    document.getElementById(Amount2).value = parseFloat(100 - firstAgent).toFixed(2);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PatiesType(Type, id1, id2) {

    var SelectOption = document.getElementById(Type).selectedIndex;

    console.log(document.getElementById(id1).parentElement.getElementsByClassName('attrn')[0])


    if (SelectOption == 1) {

        document.getElementById(id1).parentElement.getElementsByClassName('attrn')[0].style.display = '';
        // document.getElementById(id1).parentElement.parentElement.parentElement.getElementsByTagName('span')[0].style.display='';

        document.getElementById(id1).style.display = "none";

        document.getElementById(id2).style.display = "";
    } else {
        document.getElementById(id1).parentElement.getElementsByClassName('attrn')[0].style.display = 'none';
        // document.getElementById(id1).parentElement.parentElement.parentElement.getElementsByTagName('span')[0].style.display='none';

        document.getElementById(id1).style.display = "";

        document.getElementById(id2).style.display = "none";
    }

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AddParties(item2, item3, item4, AddButton, Remove) {

    if ((document.getElementById(item2).style.display === "block" && document.getElementById(item3).style.display === "block" && document.getElementById(item4).style.display === "none") || (document.getElementById(item2).style.display === "" && document.getElementById(item3).style.display === "" && document.getElementById(item4).style.display === "none")) {

        document.getElementById(item4).style.display = "block";

        document.getElementById(AddButton).parentElement.style.visibility = "hidden";

        // document.getElementById(Remove).style.display = "inline";
    } else if ((document.getElementById(item3).style.display === "block" && document.getElementById(item4).style.display === "block" && document.getElementById(item2).style.display === "none") || (document.getElementById(item3).style.display === "" && document.getElementById(item4).style.display === "" && document.getElementById(item2).style.display === "none")) {

        document.getElementById(item2).style.display = "block";

        document.getElementById(AddButton).parentElement.style.visibility = "hidden";

        //document.getElementById(Remove).style.display = "inline";
    } else if ((document.getElementById(item2).style.display === "block" && document.getElementById(item4).style.display === "block" && document.getElementById(item3).style.display === "none") || (document.getElementById(item2).style.display === "" && document.getElementById(item4).style.display === "" && document.getElementById(item3).style.display === "none")) {

        document.getElementById(item3).style.display = "block";

        document.getElementById(AddButton).parentElement.style.visibility = "hidden";

        //document.getElementById(Remove).style.display = "inline";
    } else if (document.getElementById(item2).style.display === "none" && document.getElementById(item3).style.display === "none" && document.getElementById(item4).style.display === "none") {

        document.getElementById(item2).style.display = "block";

        //document.getElementById(Remove).style.display = "inline";
    } else if ((document.getElementById(item2).style.display === "block" || document.getElementById(item2).style.display === "") && document.getElementById(item3).style.display === "none" && document.getElementById(item4).style.display === "none") {

        document.getElementById(item3).style.display = "block";
    } else if (document.getElementById(item2).style.display === "none" && (document.getElementById(item3).style.display === "block" || document.getElementById(item3).style.display === "") && document.getElementById(item4).style.display === "none") {

        document.getElementById(item2).style.display = "block";
    } else if (document.getElementById(item2).style.display === "none" && document.getElementById(item3).style.display === "none" && (document.getElementById(item4).style.display === "block" || document.getElementById(item4).style.display === "")) {

        document.getElementById(item2).style.display = "block";
    } else {
        document.getElementById(AddButton).parentElement.style.visibility = "hidden";
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       

function RemoveOneParties(option2, option3, option4, item2, item3, item4, AddButton, RemoveButton) {

    if (document.getElementById(option2).checked == true) {

        document.getElementById(item2).style.display = "none";

        document.getElementById(option2).checked = false;

        EmptyNothing(item2);

        if (document.getElementById(item3).style.display === "block" && document.getElementById(item4).style.display === "block") {

            document.getElementById(AddButton).style.display = "inline";
        } else if (document.getElementById(item3).style.display === "none" && document.getElementById(item4).style.display === "none") {

            document.getElementById(RemoveButton).style.display = "none";
        } else {

            document.getElementById(RemoveButton).style.display = "inline";

            document.getElementById(AddButton).parentElement.style.display = "inline";
        }
    }

    if (document.getElementById(option3).checked == true) {

        document.getElementById(item3).style.display = "none";

        document.getElementById(option3).checked = false;

        EmptyNothing(item3);

        if (document.getElementById(item2).style.display === "block" && document.getElementById(item4).style.display === "block") {

            document.getElementById(AddButton).parentElement.style.display = "inline";
        } else if (document.getElementById(item2).style.display === "none" && document.getElementById(item4).style.display === "none") {

            document.getElementById(RemoveButton).style.display = "none";
        } else {

            document.getElementById(RemoveButton).style.display = "inline";

            document.getElementById(AddButton).parentElement.style.display = "inline";
        }

    } //Close outter if

    if (document.getElementById(option4).checked == true) {

        document.getElementById(item4).style.display = "none";

        document.getElementById(option4).checked = false;


        EmptyNothing(item4);

        if (document.getElementById(item2).style.display === "block" && document.getElementById(item3).style.display === "block") {

            document.getElementById(AddButton).parentElement.style.display = "inline";
        } else if (document.getElementById(item2).style.display === "none" && document.getElementById(item3).style.display === "none") {

            document.getElementById(RemoveButton).style.display = "none";
        } else {

            document.getElementById(RemoveButton).style.display = "inline";

            document.getElementById(AddButton).parentElement.style.display = "inline";
        }

    } //Close outter if

    TotalRebates();
}

function RemoveOneParty(item2, item3, item4, AddButton) {

    document.getElementById(item2).style.display = "none";

    EmptyNothing(item2);

    if ((document.getElementById(item2).style.display === "block" && document.getElementById(item3).style.display === "block" && document.getElementById(item4).style.display === "block") || (document.getElementById(item2).style.display === "" && document.getElementById(item3).style.display === "" && document.getElementById(item4).style.display === "block")) {

        document.getElementById(AddButton).parentElement.style.visibility = "hidden";
    } else {

        //document.getElementById(RemoveButton).style.display = "inline";

        document.getElementById(AddButton).parentElement.style.visibility = "visible";
    }

    TotalRebates();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStep(tabname, myclass, tab, content, link) {
    TabsHandleler(event, tab, content, link);
    document.getElementsByClassName(myclass)[tabname].click();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PropertyNextWarnings() {

    if (document.getElementById("PropertyListingType").value === "Tenant-Side" || document.getElementById("PropertyListingType").value === "Landlord-Side" || document.getElementById("PropertyListingType").value === "Lease-DoubleSided" || document.getElementById("PropertyListingType").value === "TenantSide-Self-Represented-Landlord") {
        document.getElementById('SellingBox').style.display = '';
        document.getElementById('LeasingBox').style.display = 'none';
    } else {
        document.getElementById('SellingBox').style.display = 'none';
        document.getElementById('LeasingBox').style.display = '';
    }

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {

            TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab');

            TabsHandleler(event, 'Vendors', 'tabcontent2', 'tablinks2', 'MyVendor');

            PropertyLabel("Property1");

            PropertyLabel("Property2");

            PropertyLabel("Property3");

            PropertyLabel("Property4");

            PropertyLabel("Property5");

            PropertyLabel("Property6");

            document.getElementById("ClientProcess").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = "none";

            document.getElementById("DepositProcess").style.display = "none";
            
            //TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
            
            return;
        }
    }


    var Error = ChecksEmptyFieldsfirstStep();

    var Warnings = ChecksForWarningsFirstStep();

    if (Error === 1) {

        document.getElementById('Warningbutton').style.display = "none";

        document.getElementById('Nextbutton').style.display = "inline";
    }

    if (Warnings === 0 && Error === 0) {

        document.getElementById('Warningbutton').style.display = "none";

        document.getElementById('Nextbutton').style.display = "inline";
    }

    if (Error === 0 && Warnings === 1) {

        TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab');

        TabsHandleler(event, 'Vendors', 'tabcontent2', 'tablinks2', 'MyVendor');

        PropertyLabel("Property1");

        PropertyLabel("Property2");

        PropertyLabel("Property3");

        PropertyLabel("Property4");

        PropertyLabel("Property5");

        PropertyLabel("Property6");

        document.getElementById('TransactionDetailsTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('TransactionDetailsTabIMG').classList.add('accepted');

        // document.getElementById("ClientProcess").style.display = "";

        // document.getElementById("PurcharerProcess").style.display = "none";

        // document.getElementById("DepositProcess").style.display = "none";
        
    //TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
    } //Closing if

    return Error;
}

function limiting(object) {
    if (object.value) {
        if (isNaN(object.value)) {
            object.value = parseFloat(0).toFixed(2);
        } else {
            object.value = parseFloat(object.value).toFixed(2);
        }
    }
}
// .toLocaleString(undefined, {
//     minimumFractionDigits: 2, maximumFractionDigits: 2
// });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function CheckDates() {
    var Error = 0;

    var variables = [];

    var dates = [];

    var d2, dOffer;

    d2 = new Date(document.getElementById('PropertyListingDate').value);
    dOffer = new Date(document.getElementById('PropertyOfferDate').value);

    variables.push(document.getElementById('PropertyClosingDate'), document.getElementById('PropertyListingDate'), document.getElementById('PropertyExpirationDate'),
        document.getElementById('PropertyOfferDate'), document.getElementById('PropertyOfferExpirationDate'), document.getElementById('PropertyOfferAcceptanceDate'),
        document.getElementById('PropertyOfferWithdrawalDate'), document.getElementById('PropertyConditionsExpirationDate'), document.getElementById('PropertyConditionsCompleteDate'),
        document.getElementById('PropertyInspectionDate'), document.getElementById('PropertyOccupancyDate'), document.getElementById('PropertyOffMarketDate'));


    for (let i = 0; i < variables.length; i++) {
        dates.push(new Date(variables[i].value));
    }

    document.getElementById('ErrorDate4').style.display = 'none';
    for (let j = 0; j < dates.length; j++) {
        if (!(d2 == 'Invalid Date')) {
            if (d2 > dates[j]) {
                variables[j].style.borderColor = 'red';
                variables[j].nextElementSibling.style.borderColor = 'red';
                variables[j].nextElementSibling.nextElementSibling.style.borderColor = 'red';

                Error += 1;
                document.getElementById('ErrorDate4').style.display = '';
            } else {
                variables[j].style.borderColor = '';
                variables[j].nextElementSibling.style.borderColor = '';
                variables[j].nextElementSibling.nextElementSibling.style.borderColor = '';

            }
        }
    }


    document.getElementById('ErrorDate3').style.display = 'none';
    for (let j = 4; j < 7; j++) {
        if (!(dOffer == 'Invalid Date')) {
            if (dOffer > dates[j]) {
                Error += 1;
                document.getElementById('ErrorDate3').style.display = '';
                variables[j].style.borderColor = 'red';
                variables[j].nextElementSibling.style.borderColor = 'red';
            } else {
                variables[j].style.borderColor = '';
                variables[j].nextElementSibling.style.borderColor = '';
            }
        }
    }

    return Error;
}

function PropertyNext() {

    if (document.getElementById('perpanentDeal')) {

        if (document.getElementById('perpanentDeal').value == '1') {

            if (document.getElementById("PropertyListingType").value === "Tenant-Side" || document.getElementById("PropertyListingType").value === "Landlord-Side" || document.getElementById("PropertyListingType").value === "Lease-DoubleSided" || document.getElementById("PropertyListingType").value === "TenantSide-Self-Represented-Landlord") {
                document.getElementById('SellingBox').style.display = '';
                document.getElementById('LeasingBox').style.display = 'none';
            } else {
                document.getElementById('SellingBox').style.display = 'none';
                document.getElementById('LeasingBox').style.display = '';
            }

            TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab');

            TabsHandleler(event, 'Vendors', 'tabcontent2', 'tablinks2', 'MyVendor');

            PropertyLabel("Property1");

            PropertyLabel("Property2");

            PropertyLabel("Property3");

            PropertyLabel("Property4");

            PropertyLabel("Property5");

            PropertyLabel("Property6");

            document.getElementById("ClientProcess").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = "none";

            document.getElementById("DepositProcess").style.display = "none";
            
            //TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance)
            return;
        }
    }
    //CooperatingBrokeragedispaly();

    var Error = 0;
    var Warnings = 0;

    var Error = ChecksEmptyFieldsfirstStep();

    var Warnings = ChecksForWarningsFirstStep();





    if (Warnings === 1 && Error === 0) {
        document.getElementById('Warningbutton').style.display = "inline";
        document.getElementById('Nextbutton').style.display = "none";
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    if (Error === 0 && Warnings === 0) {

        if (document.getElementById("PropertyListingType").value === "Tenant-Side" || document.getElementById("PropertyListingType").value === "Landlord-Side" || document.getElementById("PropertyListingType").value === "Lease-DoubleSided" || document.getElementById("PropertyListingType").value === "TenantSide-Self-Represented-Landlord") {
            document.getElementById('SellingBox').style.display = '';
            document.getElementById('LeasingBox').style.display = 'none';
        } else {
            document.getElementById('SellingBox').style.display = 'none';
            document.getElementById('LeasingBox').style.display = '';
        }

        document.getElementById('TransactionDetailsTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('TransactionDetailsTabIMG').classList.add('accepted');

        TabsHandleler(event, 'PARTIES', 'tabcontent', 'tablinks1', 'PartiesTab');

        TabsHandleler(event, 'Vendors', 'tabcontent2', 'tablinks2', 'MyVendor');
        
       //TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);

        PropertyLabel("Property1");

        PropertyLabel("Property2");

        PropertyLabel("Property3");

        PropertyLabel("Property4");

        PropertyLabel("Property5");

        PropertyLabel("Property6");


        document.getElementById("ClientProcess").style.display = "";

        document.getElementById("PurcharerProcess").style.display = "none";

        document.getElementById("DepositProcess").style.display = "none";

        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });

    } //Closing if 

    //CheckListingType();

    return Error;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function FormatNumber(id) {

    var n = document.getElementById(id).value;

    var x = n.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');

    document.getElementById(id).type = 'text';

    document.getElementById(id).value = x;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Reformatnumber(id) {
    document.getElementById(id).type = 'number';
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  

function Empty(id) {

    var element = document.getElementById(id);

    var inputs = element.getElementsByTagName('input');

    for (var index = 0; index < inputs.length; ++index) {
        inputs[index].value = inputs[index].defaultValue;
        inputs[index].style.borderColor = "lightgrey";
    } //Close For Loop

}

function EmptyNothing(id) {
    var element = document.getElementById(id);

    var inputs = element.getElementsByTagName('input');
    var dropdowns = element.getElementsByClassName('select-selected');
    var select = element.getElementsByTagName('select');

    for (let index = 0; index < inputs.length; index++) {
        inputs[index].value = '';
        inputs[index].style.borderColor = "lightgrey";
    } //Close For Loop

    for (let index = 0; index < select.length; index++) {
        select[index].value = '';
    } //Close For Loop

    for (let index = 0; index < dropdowns.length; index++) {
        dropdowns[index].innerHTML = '--Please select an option--';
        dropdowns[index].style.borderColor = "lightgrey";
    } //Close For Loop
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function clearSelected(id) {
    document.getElementById(id).selectedIndex = 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function eraseDate(elem) {
    elem.parentElement.getElementsByTagName('input')[0].value = '';
    sorting();
}

function CheckListingType() {


    CheckTransactionSource();

    //This function checks teh type of listing that teh user has been choosen for the transaction 

    //if the type is any of the lease options there is no need to have lawyer

    //if its not our listing type there is no need to have deposit

    var ListingType = document.getElementById("PropertyListingType").value;

    if (ListingType === "Tenant-Side") {

        document.getElementById('MyVendorLawyer').style.display = "none";

        document.getElementById('MyPurchaserLawyer').style.display = "none";

        document.getElementById('MyCooperatingBrokerage').style.display = "inline";

        document.getElementById('MyDeposits').style.display = "none";

        Empty('VendorLawyer');

        document.getElementById('ClerkInformation').style.display = "none";

        document.getElementById('AddClerckInformation').checked = false;

        Empty('PurchaserLawyer');

        // Empty('Deposits');

        document.getElementById('Deposit2').style.display = "none";

        document.getElementById('Deposit3').style.display = "none";

        document.getElementById('Deposit4').style.display = "none";

        /* document.getElementById('AddMoreDeposits').style.display = "";

         document.getElementById('RemoveOneDeposit').style.display = "none";

         document.getElementById('SelectDeposit2').checked = false;

         document.getElementById('SelectDeposit3').checked = false;

         document.getElementById('SelectDeposit4').checked = false;*/

        document.getElementById('Cooperating1').style.display = "none";

        document.getElementById('Cooperating2').style.display = "none";

        document.getElementById('Cooperating3').style.display = "inline";

        document.getElementById('Purchaserback1').style.display = "none";

        document.getElementById('Purchaserback2').style.display = "inline";

        document.getElementById('Invoiceveback1').style.display = "inline";

        document.getElementById('Invoiceveback2').style.display = "none";

        document.getElementById('Invoiceveback3').style.display = "none";

        document.getElementById('Invoiceveback4').style.display = "none";

    } //if condition for Tenant-Side
    else if (ListingType === "Landlord-Side") {

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

        document.getElementById('MyVendorLawyer').style.display = "inline";

        document.getElementById('MyPurchaserLawyer').style.display = "inline";

        document.getElementById('MyCooperatingBrokerage').style.display = "none";

        document.getElementById('MyDeposits').style.display = "inline";

        Empty('CooperatingBrokerage');

        document.getElementById('Depositback1').style.display = "inline";

        document.getElementById('Depositback2').style.display = "none";

        //document.getElementById('Invoiceveback1').style.display = "none";

        //document.getElementById('Invoiceveback2').style.display = "inline";

        document.getElementById('Purchaserback1').style.display = "inline";

        document.getElementById('Purchaserback2').style.display = "none";

        document.getElementById('Invoiceveback1').style.display = "none";

        document.getElementById('Invoiceveback2').style.display = "inline";

        document.getElementById('Invoiceveback3').style.display = "none";

        document.getElementById('Invoiceveback4').style.display = "none";
    } //closing if
    else if (ListingType === "Buyer-Side") {

        document.getElementById('MyVendorLawyer').style.display = "inline";

        document.getElementById('MyPurchaserLawyer').style.display = "inline";

        document.getElementById('MyCooperatingBrokerage').style.display = "inline";

        document.getElementById('MyDeposits').style.display = "none";

        Empty('Deposits');

        document.getElementById('Deposit2').style.display = "none";

        document.getElementById('Deposit3').style.display = "none";

        document.getElementById('Deposit4').style.display = "none";

        //document.getElementById('AddMoreDeposits').style.display = "";

        //document.getElementById('RemoveOneDeposit').style.display = "none";

        //document.getElementById('SelectDeposit2').checked = false;

        //document.getElementById('SelectDeposit3').checked = false;

        //document.getElementById('SelectDeposit4').checked = false;

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


        document.getElementById('MyVendorLawyer').style.display = "inline";

        document.getElementById('MyPurchaserLawyer').style.display = "inline";

        document.getElementById('MyCooperatingBrokerage').style.display = "none";

        document.getElementById('MyDeposits').style.display = "none";

        Empty('CooperatingBrokerage');

        Empty('Deposits');

        document.getElementById('Deposit2').style.display = "none";

        document.getElementById('Deposit3').style.display = "none";

        document.getElementById('Deposit4').style.display = "none";

        /*document.getElementById('AddMoreDeposits').style.display = "";

        document.getElementById('RemoveOneDeposit').style.display = "none";

        document.getElementById('SelectDeposit2').checked = false;

        document.getElementById('SelectDeposit3').checked = false;

        document.getElementById('SelectDeposit4').checked = false;*/

        document.getElementById('Invoiceveback1').style.display = "none";

        document.getElementById('Invoiceveback2').style.display = "none";

        document.getElementById('Invoiceveback3').style.display = "inline";

        document.getElementById('Invoiceveback4').style.display = "none";

        document.getElementById('Purchaserback1').style.display = "inline";

        document.getElementById('Purchaserback2').style.display = "none";


    } else if (ListingType === "TenantSide-Self-Represented-Landlord") {

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

        /* document.getElementById('AddMoreDeposits').style.display = "";

         document.getElementById('RemoveOneDeposit').style.display = "none";

         document.getElementById('SelectDeposit2').checked = false;

         document.getElementById('SelectDeposit3').checked = false;

         document.getElementById('SelectDeposit4').checked = false;*/

        document.getElementById('Purchaserback1').style.display = "none";

        document.getElementById('Purchaserback2').style.display = "inline";

        document.getElementById('Invoiceveback1').style.display = "none";

        document.getElementById('Invoiceveback2').style.display = "none";

        document.getElementById('Invoiceveback3').style.display = "none";

        document.getElementById('Invoiceveback4').style.display = "inline";

    } else {

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

    var status = document.getElementById('PropertyListingStatus').value;


    if (ListingType === "Lease-DoubleSided" || ListingType === "Tenant-Side" || ListingType === "Landlord-Side" || ListingType === "TenantSide-Self-Represented-Landlord") {

        document.getElementById("MyVendor").innerHTML = "Landlord";

        document.getElementById("MyPurchaser").innerHTML = "Tenant";

        // document.getElementById("PurchasersLabel").innerHTML ="Tenant(s)"; 

        // document.getElementById("VendorsLabel").innerHTML ="Landlord(s)"; 


        if (status === "Off-Market") {

            document.getElementById("PropertySellingComission").value = parseFloat(0).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(0.00).toFixed(2);

            document.getElementById("PropertySellingComission").readOnly = true;

            document.getElementById("PropertyListingComission").readOnly = true;
        } else {
            document.getElementById("PropertySellingComission").value = parseFloat(50.00).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(50.00).toFixed(2);

            document.getElementById("PropertySellingComission").readOnly = false;

            document.getElementById("PropertyListingComission").readOnly = false;
        }


    } else {
        document.getElementById("MyVendor").innerHTML = "Vendor";

        document.getElementById("MyPurchaser").innerHTML = "Purchaser";

        //document.getElementById("PurchasersLabel").innerHTML ="Purchaser(s)"; 

        //document.getElementById("VendorsLabel").innerHTML ="Vendor(s)"; 

        if (status === "Off-Market") {

            document.getElementById("PropertySellingComission").value = parseFloat(0.00).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(0.00).toFixed(2);

            document.getElementById("PropertySellingComission").readOnly = true;

            document.getElementById("PropertyListingComission").readOnly = true;
        } else {

            document.getElementById("PropertySellingComission").value = parseFloat(2.50).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(2.50).toFixed(2);

            document.getElementById("PropertySellingComission").readOnly = false;

            document.getElementById("PropertyListingComission").readOnly = false;
        }



    }




}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   

function clerk() {

    if (document.getElementById("AddClerckInformation").checked == true) {

        document.getElementById("ClerkInformation").style.display = "block";
    } //Ending the if condition 
    else {
        document.getElementById("ClerkInformation").style.display = "none";

        var inputs = document.getElementById("ClerkInformation").getElementsByTagName('input');

        for (var index = 0; index < inputs.length; ++index) {

            inputs[index].value = "";
        } //Ending the For Loop

    } //Ending the else section

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SetCustomers(CustomerOptions, CustomerName) {



    var Type = document.getElementById("PropertyListingType").value;

    var selectCustomer = document.getElementById(CustomerOptions);

    var lenght = selectCustomer.options.length;

    var Vendors = [];
    var Purchasers = [];
    var Parties = [];

    while (lenght--) {
        selectCustomer.remove(lenght + 1);
    }

    if (document.getElementById("VendorBusinessinquiries1").style.display !== "none") {
        Vendors.push(document.getElementById("VendorAuthorizedSigningOfficer1").value);
    } else {
        Vendors.push(document.getElementById("VendorFirstName1").value + " " + document.getElementById("VendorLastName1").value);
    }


    if (document.getElementById("Vendor2").style.display === "block") {

        if (document.getElementById("VendorBusinessinquiries2").style.display !== "none") {
            Vendors.push(document.getElementById("VendorAuthorizedSigningOfficer2").value);
        } else {
            Vendors.push(document.getElementById("VendorFirstName2").value + " " + document.getElementById("VendorLastName2").value);
        }
    }


    if (document.getElementById("Vendor3").style.display === "block") {

        if (document.getElementById("VendorBusinessinquiries3").style.display !== "none") {
            Vendors.push(document.getElementById("VendorAuthorizedSigningOfficer3").value);
        } else {
            Vendors.push(document.getElementById("VendorFirstName3").value + " " + document.getElementById("VendorLastName3").value);
        }
    }


    if (document.getElementById("Vendor4").style.display === "block") {

        if (document.getElementById("VendorBusinessinquiries4").style.display !== "none") {
            Vendors.push(document.getElementById("VendorAuthorizedSigningOfficer4").value);
        } else {
            Vendors.push(document.getElementById("VendorFirstName4").value + " " + document.getElementById("VendorLastName4").value);
        }
    }

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if (document.getElementById("PurchaserBusinessinquiries1").style.display !== "none") {
        Purchasers.push(document.getElementById("PurchaserAuthorizedSigningOfficer1").value);
    } else {
        Purchasers.push(document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value);
    }


    if (document.getElementById("puchaser2").style.display === "block") {

        if (document.getElementById("PurchaserBusinessinquiries2").style.display !== "none") {
            Purchasers.push(document.getElementById("PurchaserAuthorizedSigningOfficer2").value);
        } else {
            Purchasers.push(document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value);
        }
    }

    if (document.getElementById("puchaser3").style.display === "block") {

        if (document.getElementById("PurchaserBusinessinquiries3").style.display !== "none") {
            Purchasers.push(document.getElementById("PurchaserAuthorizedSigningOfficer3").value);
        } else {
            Purchasers.push(document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value);
        }
    }

    if (document.getElementById("puchaser4").style.display === "block") {

        if (document.getElementById("PurchaserBusinessinquiries4").style.display !== "none") {
            Purchasers.push(document.getElementById("PurchaserAuthorizedSigningOfficer4").value);
        } else {
            Purchasers.push(document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value);
        }
    }

    if (Type === "Buyer-Side" || Type === "Tenant-Side" || Type === "BuyerSide-Self-Represented-Vendor" || Type === "TenantSide-Self-Represented-Landlord") {
        Parties = Purchasers;
    } else if (Type === "Listing-Side" || Type === "Landlord-Side") {
        Parties = Vendors
    } else {
        Parties = Vendors.concat(Purchasers);
    }

    //Parties.unshift("--Please choose an option--"); 


    if (CustomerName != null && CustomerName != "") {

        var check = 1;

        for (var i = 0; i < Parties.length; i++) {
            if (Parties[i] === CustomerName) {
                check = 0;
            } else {}
        } //for

        if (!(check == 0)) {
            Parties.push(CustomerName);
        }
        check = 1;
    }


    for (var i = 0; i < Parties.length; i++) {

        var options = Parties[i];
        var singleElemet = document.createElement("option");
        singleElemet.textContent = options;
        singleElemet.value = options;
        selectCustomer.appendChild(singleElemet);
        selectCustomer.value = Parties[i].trim();

    } //Close for

    var mydiv = selectCustomer.parentElement;
    var elements = mydiv.getElementsByClassName('select-items');
    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }




    if (CustomerName != null && CustomerName != "") {



        for (var i = 1; i < Parties.length + 1; i++) {

            var a = document.createElement('DIV');

            a.innerHTML = selectCustomer.options[i].innerHTML;

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

            tt.innerHTML = CustomerName;
            //console.log(tt);


            divselect.appendChild(a);
        }


    } else {


        for (var i = 0; i < Parties.length + 1; i++) {

            var a = document.createElement('DIV');

            a.innerHTML = selectCustomer.options[i].innerHTML;

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

            divselect.appendChild(a);
        }



    }








}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ReferralRebate(selectedoption, option1, option2, item1, item2, item3, TargetValue) {

    document.getElementById(option1).checked = false;

    document.getElementById(option2).checked = false;

    if (selectedoption == TargetValue) {

        document.getElementById(option2).checked = false;

        document.getElementById(option1).checked = true;

        document.getElementById(item1).style.display = "block";

        document.getElementById(item2).style.display = "none";

        document.getElementById(item3).style.display = "none";
    } //Close if
    else {
        document.getElementById(option2).checked = true;

        document.getElementById(option1).checked = false;

        document.getElementById(item1).style.display = "none";

        document.getElementById(item2).style.display = "block";

        document.getElementById(item3).style.display = "none";
    } //Close else

}








function ReferralRebateAdditional(item1, item2) {
    document.getElementById(item1).checked = false;
    document.getElementById(item2).checked = false;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CheckForReferral(SelectedOption, Items, NextStep, buttons1, buttons2) {

    if (document.getElementById(SelectedOption).checked == true) {

        document.getElementById(Items).style.display = "block";

        document.getElementById(NextStep).style.display = "inline";

        document.getElementById(buttons2).style.display = "inline";

        document.getElementById(buttons1).style.display = "none";
    } //Close if
    else {
        document.getElementById(Items).style.display = "none";

        document.getElementById(NextStep).style.display = "none";

        document.getElementById(buttons1).style.display = "inline";

        document.getElementById(buttons2).style.display = "none";

        document.getElementById(buttons2).style.display = "none";

        document.getElementById('ReferralfeeIsRegistrantNO').checked = false;

        document.getElementById('ReferralfeeIsRegistrantYES').checked = false;

        document.getElementById('ReferralfeeIsDisclosedToAllNO').checked = false;

        document.getElementById('ReferralfeeIsDisclosedToAllYES').checked = false;

        Empty(Items);

        document.getElementById('ReferralDisclosedToALL').style.display = "none";

        document.getElementById('RecipentMessageError').style.display = "none";

        document.getElementById('ReferralDisclosureUpload').style.display = "none";

        document.getElementById('NoCompansionAgrrementError').style.display = "none";

        Empty('ReferralFeeAmountSection');
    } //Close else

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CheckForRebate(SelectedOption, Items, NextStep, buttons1, buttons2) {

    if (document.getElementById(SelectedOption).checked == true) {

        document.getElementById(Items).style.display = "block";

        document.getElementById(NextStep).style.display = "inline";

        document.getElementById(buttons2).style.display = "inline";

        document.getElementById(buttons1).style.display = "none";
    } //Close if
    else {
        document.getElementById(Items).style.display = "none";

        document.getElementById(NextStep).style.display = "none";

        document.getElementById(buttons1).style.display = "inline";

        document.getElementById(buttons2).style.display = "none";

        //Empty(Items);

        document.getElementById('RecipientAPartyNO').checked = false;

        document.getElementById('RecipientAPartyYes').checked = false;

        document.getElementById('ComplyWithEthicYes').checked = false;

        document.getElementById('ComplyWithEthicNO').checked = false;

        document.getElementById('ReebateComplywiththeCodeofEthics').style.display = "none";

        document.getElementById('NotPartyToThisTradeError').style.display = "none";

        document.getElementById('RebateAgreementUpload').style.display = "none";

        document.getElementById('EthicCodeRebateError').style.display = "none";

        Empty('MainRebateAmountSection');

        document.getElementById('SecondRebate').style.display = "none";

        document.getElementById('ThirdRebate').style.display = "none";

        document.getElementById('ForthRebate').style.display = "none";

        document.getElementById('SelectRebate2').checked = false;

        document.getElementById('SelectRebate3').checked = false;

        document.getElementById('SelectRebate4').checked = false;

        document.getElementById('AddMoreRebate').style.display = "";

        document.getElementById('RemoveOneRebate').style.display = "none";


    } //Close else

}

///////////////////////////////////////////////////////////////////////////////////////////////////////



function checkEmpty(id) {

    var element = document.getElementById(id);

    var empty = 0

    var inputs = element.getElementsByTagName('input');

    for (var index = 0; index < inputs.length; ++index) {

        if (!inputs[index].value || inputs[index].value === null || inputs[index].value === "0" || inputs[index].value === " ") {

            empty = 1;
        } //Close inner if  
    } //Close first if

    return empty;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ChecksEmptyFieldsfirstStep() {

    var TotalEmpty = 0;
    var Empty1 = 0;
    var Empty2 = 0;
    var Empty3 = 0;
    var Empty4 = 0;
    var Empty5 = 0;

    var variables = [];

    variables.push(document.getElementById('PropertyStreetNumber'),
        document.getElementById('PropertyStreetName'), document.getElementById('PropertyPostalCode'),
        document.getElementById('PropertyCity'));

    if (document.getElementById("MLSNumber").style.display === "block") {
        variables.push(document.getElementById("MLSNumber"));
    }

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value) {
            Empty1 = 1;
            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "lightgrey";
        }
    }


    if (!ValidatePostalCode("PropertyPostalCode")) {
        document.getElementById("PropertyPostalCode").style.borderColor = "red";
        Empty1 = 1;
    } else {
        document.getElementById("PropertyPostalCode").style.borderColor = "lightgrey";
    }


    variables = [];


    variables.push(document.getElementById('ProPertyListingPrice'), document.getElementById('PropertyType'),
        document.getElementById('ProPertyListingSource'), document.getElementById('PropertyListingType'), document.getElementById('PropertyListingStatus'));



    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value <= 0) {
            Empty2 = 1;
            variables[i].parentElement.style.borderColor = 'red';
        } else {
            variables[i].style.borderColor = "lightgrey";
            variables[i].parentElement.style.borderColor = '';
        }
    }

    variables = [];

    if (document.getElementById('PropertyListingStatus').value == 'Available') {

        variables.push(document.getElementById('PropertyListingDate'), document.getElementById('PropertyExpirationDate'));

    } else if (document.getElementById('PropertyListingStatus').value == 'Expired') {

        variables.push(document.getElementById('PropertyExpirationDate'));

    } else if (document.getElementById('PropertyListingStatus').value == 'Off-Market') {
        variables.push(document.getElementById('PropertyOffMarketDate'));
    } else if (document.getElementById('PropertyListingStatus').value == 'Offer Withdrawn') {
        variables.push(document.getElementById('PropertyOfferWithdrawalDate'));
    } else {
        variables.push(document.getElementById('PropertyClosingDate'));
    }

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === "" || variables[i].value === null || !variables[i].value || variables[i].value <= 0) {

            Empty2 = 1;
            variables[i].style.borderColor = "red";
            variables[i].parentElement.getElementsByTagName('label')[0].style.borderColor = "red";
            variables[i].parentElement.getElementsByTagName('label')[1].style.borderColor = "red";
        } else {

            variables[i].style.borderColor = "lightgrey";
            variables[i].parentElement.getElementsByTagName('label')[0].style.borderColor = "lightgrey";
            variables[i].parentElement.getElementsByTagName('label')[1].style.borderColor = "lightgrey";

        }
    }

    var SecondAgent = "1";
    var SecondAgentCommission = "1";
    var AgentRole2 = "1";


    if (document.getElementById("SecondAgentRole").style.display === "flex") {
        AgentRole2 = document.getElementById("SecondAgentIDRole").value;
    } else {
        AgentRole2 = "1";
    }

    if (document.getElementById("AddAgent").checked === true) {
        SecondAgent = document.getElementById('SecondAgentID').value;
        SecondAgentCommission = document.getElementById('SecondAgentGrossCommisionSplit').value;
    } else {
        SecondAgent = "1";
        SecondAgentCommission = "1";
    }


    if (SecondAgentCommission === " " || !SecondAgentCommission || SecondAgentCommission === null) {
        Empty3 = 1;
    } else {
        Empty3 = 0;
    }

    if (SecondAgent === " " || !SecondAgent || SecondAgent === null) {
        Empty3 = 1;
        Empty4 = 1;
        document.getElementById("SecondAgentID").parentElement.style.borderColor = "red";
    } else {
        Empty3 = 0;
        Empty4 = 0;
        document.getElementById("SecondAgentID").parentElement.style.borderColor = "lightgrey";
    }

    if (AgentRole2 === " " || !AgentRole2 || AgentRole2 === null) {
        Empty3 = 1;
        document.getElementById("SecondAgentIDRole").parentElement.style.borderColor = "red";
    } else {
        Empty3 = 0;
        document.getElementById("SecondAgentIDRole").parentElement.style.borderColor = "lightgrey";
    }

    if (document.getElementById("AddAgent").checked === true) {
        if (document.getElementById("FirstAgentGrossCommisionSplit").value >= 100 || document.getElementById("FirstAgentGrossCommisionSplit").value <= 0) {
            Empty5 = 1;
        } else {
            Empty5 = 0;
        }
    }



    /*if(document.getElementById("PropertyListingType").value==="Sale-Double-Sided" || document.getElementById("PropertyListingType").value==="Lease-DoubleSided"){ Empty4=0;}

    else{  if(Total>100 || Total<100 ){ Empty4=1; } else{ Empty4=0;}  }//Close outer else */

    if (SecondAgentCommission === "0") {
        document.getElementById("GrossCommissionsError").style.display = "block";
        TotalEmpty = 1;
    } else {
        document.getElementById("GrossCommissionsError").style.display = "none";
    }

    if (Empty1 === 1) {
        document.getElementById("ErrorEmpty1").style.display = "block";
        TotalEmpty = 1;
    } else {
        document.getElementById("ErrorEmpty1").style.display = "none";
    }

    if (Empty2 === 1) {
        document.getElementById("ErrorEmpty2").style.display = "block";
        TotalEmpty = 1;
    } else {
        document.getElementById("ErrorEmpty2").style.display = "none";
    }

    if (Empty3 === 1) {
        document.getElementById("ErrorEmpty3").style.display = "block";
        TotalEmpty = 1;
    } else {
        document.getElementById("ErrorEmpty3").style.display = "none";
    }

    if (Empty4 === 1) {
        document.getElementById("AgentTwoError").style.display = "block";
        TotalEmpty = 1;
    } else {
        document.getElementById("AgentTwoError").style.display = "none";
    }

    if (Empty5 === 1) {
        document.getElementById("GrossCommissionsError").style.display = "block";
        document.getElementById("FirstAgentGrossCommisionSplit").parentElement.style.borderColor = 'red';
        TotalEmpty = 1;
    } else {
        document.getElementById("FirstAgentGrossCommisionSplit").parentElement.style.borderColor = 'lightgrey';
        document.getElementById("GrossCommissionsError").style.display = "none";
    }

    if (!((document.getElementById("PropertyListingType").value === 'Landlord-Side') ||
            (document.getElementById("PropertyListingType").value === 'Tenant-Side') ||
            (document.getElementById("PropertyListingType").value === 'Lease-DoubleSided') ||
            (document.getElementById("PropertyListingType").value === 'TenantSide-Self-Represented-Landlord'))) {

        if (document.getElementById('ListingCommissionsign').innerHTML === '%') {
            ListingCom = (document.getElementById('PropertyListingComission').value * document.getElementById('ProPertyListingPrice').value) / 100;
        } else {
            ListingCom = document.getElementById('PropertyListingComission').value;
        }

        if (document.getElementById('SelllingCommissionsign').innerHTML === '%') {
            SellingCom = (document.getElementById('PropertySellingComission').value * document.getElementById('ProPertyListingPrice').value) / 100;
        } else {
            SellingCom = document.getElementById('PropertySellingComission').value;
        }

        if ((+ListingCom + +SellingCom) > document.getElementById('ProPertyListingPrice').value) {
            document.getElementById("ComissionError").style.display = "block";
            // document.getElementById("Warning4").style.display = "none";
            TotalEmpty = 1;
        } else {
            document.getElementById("ComissionError").style.display = "none";
        }

    } else {
        document.getElementById("ComissionError").style.display = "none";
    }


    // if(Empty4===1){document.getElementById("ErrorCommision" ).style.display="block"; TotalEmpty=1;}    else{ document.getElementById("ErrorCommision" ).style.display="none"; }
    TotalEmpty += CheckDates();
    return TotalEmpty;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ChecksForWarningsFirstStep() {

    var warning = 0;

    var Price = parseFloat(document.getElementById("ProPertyListingPrice").value);

    var list = parseFloat(document.getElementById("PropertyListingComission").value);

    var sell = parseFloat(document.getElementById("PropertySellingComission").value);

    var finalList = 0

    var finalSell = 0


    if (document.getElementById("ListingComiissionFixedAmount").checked == true) {
        finalList = (list * 100) / Price;
    } else {
        finalList = list;
    }


    if (document.getElementById("SellingComiissionFixedAmount").checked === true) {

        finalSell = (sell * 100) / Price;
    } else {
        finalSell = sell;
    }


    var Total = finalList + finalSell;

    var ListingType = document.getElementById("PropertyListingType").value;

    if (ListingType === "Buyer-Side" || ListingType === "Listing-Side" || ListingType === "Sale-Double-Sided" || ListingType === "BuyerSide-Self-Represented-Vendor") {

        document.getElementById("LeaseWarning2").style.display = "none";

        document.getElementById("LeaseWarning3").style.display = "none";

        document.getElementById("LeaseWarning4").style.display = "none";

        if (finalList > 2.5) {
            document.getElementById("Warning2").style.display = "block";
            warning = 1;
        } else {
            document.getElementById("Warning2").style.display = "none";
        }

        if (finalSell > 2.5) {
            document.getElementById("Warning3").style.display = "block";
            warning = 1;
        } else {
            document.getElementById("Warning3").style.display = "none";
        }


        if ((document.getElementById('ComissionError').style.display === 'none')) {
            if (Total > 5) {
                document.getElementById("Warning4").style.display = "block";
                warning = 1;
            } else {
                document.getElementById("Warning4").style.display = "none";
            }

        } else {
            document.getElementById("Warning4").style.display = "none";
        }

    } else {

        document.getElementById("Warning2").style.display = "none";

        document.getElementById("Warning3").style.display = "none";

        document.getElementById("Warning4").style.display = "none";

        if (finalList > 50) {
            document.getElementById("LeaseWarning2").style.display = "block";
            warning = 1;
        } else {
            document.getElementById("LeaseWarning2").style.display = "none";
        }

        if (finalSell > 50) {
            document.getElementById("LeaseWarning3").style.display = "block";
            warning = 1;
        } else {
            document.getElementById("LeaseWarning3").style.display = "none";
        }

        if (Total > 100) {
            document.getElementById("LeaseWarning4").style.display = "block";
            warning = 1;
        } else {
            document.getElementById("LeaseWarning4").style.display = "none";
        }

    }
    return warning;
}

//************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

function ChecksVendorsandPurchaserEmptyFields(Type, StreetNumber, StreetName, City, PostalCode, Province, OtherProvince, Businessinqueries, AuthorizedSigningOfficer, BusinessName, Firstname, LastName, Phone, Email) {

    var EmptyFields = 0;

    var variables = [];

    variables.push(document.getElementById(Type),
        document.getElementById(StreetNumber), document.getElementById(StreetName),
        document.getElementById(City), document.getElementById(PostalCode),
        document.getElementById(Phone), document.getElementById(Email));

    if (document.getElementById(Province).value == 'Other') {
        variables.push(document.getElementById(OtherProvince));
    }

    for (let i = 0; i < variables.length; i++) {

        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

            EmptyFields = 1;

            if (i === 0) {
                document.getElementById(Type).parentElement.style.borderColor = "red";
            }

            variables[i].style.borderColor = "red";

        } else {
            variables[i].style.borderColor = "lightgrey";
            if (i === 0) {
                document.getElementById(Type).parentElement.style.borderColor = "lightgrey";
            }
        }
    }

    variables = [];

    if (document.getElementById(Businessinqueries).style.display === "none") {

        variables.push(document.getElementById(Firstname), document.getElementById(LastName));

        for (let i = 0; i < variables.length; i++) {

            if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

                EmptyFields = 1;

                variables[i].style.borderColor = "red";

            } else {
                variables[i].style.borderColor = "lightgrey";
            }
        }

        variables = [];

    } //Close IF   
    else {

        variables.push(document.getElementById(AuthorizedSigningOfficer), document.getElementById(BusinessName));

        for (let i = 0; i < variables.length; i++) {

            if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

                EmptyFields = 1;

                variables[i].style.borderColor = "red";

            } else {
                variables[i].style.borderColor = "lightgrey";
            }
        }

        variables = [];

    } //Close Else

    if (!(document.getElementById(Province).value === "Other")) {
        if (!ValidatePostalCode(PostalCode)) {
            document.getElementById(PostalCode).style.borderColor = "red";
            EmptyFields = 1;
        } else {
            document.getElementById(PostalCode).style.borderColor = "lightgrey";
        }
    }

    if (!ValidateEmail(Email)) {
        document.getElementById(Email).style.borderColor = "red";
        EmptyFields = 1;
    } else {
        document.getElementById(Email).style.borderColor = "lightgrey";
    }

    return EmptyFields;
}

function ChecksEmptyFields() {

    var EmptyFields = 0;

    var variables = [];

    for (var i = 0; i < arguments.length; i++) {
        variables.push(document.getElementById(arguments[i]));
    }


    for (let i = 0; i < variables.length; i++) {

        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

            EmptyFields = 1;

            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "lightgrey";
        }
    }

    variables = [];


    // if (!ValidatePostalCode(PostalCode)) {
    // 	document.getElementById(PostalCode).style.borderColor = "red";
    // 	EmptyFields = 1;
    //   } else {
    // 	document.getElementById(PostalCode).style.borderColor = "lightgrey";
    //   }

    //   if (!ValidateEmail(Email)) {
    // 	document.getElementById(Email).style.borderColor = "red";
    // 	EmptyFields = 1;
    //   } else {
    // 	document.getElementById(Email).style.borderColor = "lightgrey";
    //   }


    return EmptyFields;
}

function phoneNumberFormatter(id) {
    const inputField = document.getElementById(id);
    const formattedInputValue = formatPhoneNumber(inputField.value);
    inputField.value = formattedInputValue;
}

function phoneNumberFormatterAfter(id) {
    const inputField = document.getElementById(id);
    const formattedInputValue = after(inputField.value);
    inputField.value = formattedInputValue;
}

function formatPhoneNumber(value) {
    // if input value is falsy eg if the user deletes the input, then just return
    if (!value) return value;

    // clean the input for any non-digit values.
    const phoneNumber = value.replace(/[^\d]/g, "");

    // phoneNumberLength is used to know when to apply our formatting for the phone number
    const phoneNumberLength = phoneNumber.length;

    // we need to return the value with no formatting if its less then four digits
    // this is to avoid weird behavior that occurs if you  format the area code to early
    if (phoneNumberLength < 4) return phoneNumber;

    // if phoneNumberLength is greater than 4 and less the 7 we start to return
    // the formatted number
    if (phoneNumberLength < 7) {
        return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3)}`;
    }

    // finally, if the phoneNumberLength is greater then seven, we add the last
    // bit of formatting and return it.
    return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(
	3,
	6
  )}-${phoneNumber.slice(6, 10)}`;
}

function after(value) {
    if (!value) return value;

    // clean the input for any non-digit values.
    const phoneNumber = value.replace(/[^\d]/g, "");

    // phoneNumberLength is used to know when to apply our formatting for the phone number
    const phoneNumberLength = phoneNumber.length;

    // we need to return the value with no formatting if its less then four digits
    // this is to avoid weird behavior that occurs if you  format the area code to early
    if (phoneNumberLength < 4) return phoneNumber;

    // if phoneNumberLength is greater than 4 and less the 7 we start to return
    // the formatted number
    if (phoneNumberLength < 7) {
        return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3)}`;
    }

    // finally, if the phoneNumberLength is greater then seven, we add the last
    // bit of formatting and return it.
    return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(
    3,
    6
  )}-${phoneNumber.slice(6, 10)}`;
}

function validatorPE(PostalCode, Email) {

    var EmptyFields = 0;

    if (!ValidatePostalCode(PostalCode)) {
        document.getElementById(PostalCode).style.borderColor = "red";
        EmptyFields = 1;
    } else {
        document.getElementById(PostalCode).style.borderColor = "lightgrey";
    }

    if (!ValidateEmail(Email)) {
        document.getElementById(Email).style.borderColor = "red";
        EmptyFields = 1;
    } else {
        document.getElementById(Email).style.borderColor = "lightgrey";
    }

    return EmptyFields;
}



//*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
function topbuttonsBack(setting) {
    if (setting == 1) {
        document.getElementById("ClientProcess").style.display = '';
        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = 'none';
    } else if (setting == 2) {
        document.getElementById("PurcharerProcess").style.display = '';
        document.getElementById("DepositProcess").style.display = 'none';
        document.getElementById("ClientProcess").style.display = 'none';
    } else if (setting == 3) {
        document.getElementById("DepositProcess").style.display = 'none';
    } else if (setting == 4) {
        document.getElementById("PurcharerProcess").style.display = 'none';
    } else if (setting == 5) {
        if (document.getElementById('MyDeposits').style.display === "inline") {
            document.getElementById("DepositProcess").style.display = '';
        }
    } else if (setting == 6) {
        if (document.getElementById('MyDeposits').style.display === "inline" & document.getElementById('MyCooperatingBrokerage').style.display === "none") {
            document.getElementById("ClientProcess").style.display = 'none';
            document.getElementById("PurcharerProcess").style.display = 'none';
            document.getElementById("DepositProcess").style.display = '';
        } else {
            document.getElementById("ClientProcess").style.display = 'none';
            document.getElementById("PurcharerProcess").style.display = 'none';
            document.getElementById("DepositProcess").style.display = 'none';
        }
    }
    if (document.getElementById('PropertyCity').readOnly) {
        document.getElementById("ClientProcess").style.display = 'none';
        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = 'none';
    }
}

function topbuttons(setting) {
    if (setting == 1) {
        document.getElementById("ClientProcess").style.display = '';
        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = 'none';
    } else if (setting == 2) {
        document.getElementById("ClientProcess").style.display = 'none';
        document.getElementById("PurcharerProcess").style.display = '';
        document.getElementById("DepositProcess").style.display = 'none';
    } else if (setting == 3) {
        document.getElementById("ClientProcess").style.display = 'none';
        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = '';
    } else if (setting == 4) {
        document.getElementById("ClientProcess").style.display = 'none';
        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = 'none';
    }
}


function VendorsStep() {

    var a = CheckStatus();

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            if (document.getElementById('MyVendorLawyer').style.display === "none") {
                if (a) {
                    TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser');
                }
            } //Closing inner if
            else {
                if (a) {
                    TabsHandleler(event, 'VendorLawyer', 'tabcontent2', 'tablinks2', 'MyVendorLawyer');
                }
            } //Closing inner else

            return;
        }
    }

    document.getElementById("MyVendor").disabled = false;

    var EmptyCheck1 = ChecksVendorsandPurchaserEmptyFields('VendorType1', 'VendorStreetNumber1', 'VendorStreetName1', 'VendorCity1', 'VendorPostalCode1', 'VendorProvince1', 'VendorOtherProvince1', 'VendorBusinessinquiries1', 'VendorAuthorizedSigningOfficer1', 'VendorBusinessName1', 'VendorFirstName1', 'VendorLastName1', 'VendorPhone1', 'VendorEmail1');
    var EmptyCheck2 = 0;
    var EmptyCheck3 = 0;
    var EmptyCheck4 = 0;

    if (document.getElementById('Vendor2').style.display === "block") {
        EmptyCheck2 = ChecksVendorsandPurchaserEmptyFields('VendorType2', 'VendorStreetNumber2', 'VendorStreetName2', 'VendorCity2', 'VendorPostalCode2', 'VendorProvince2', 'VendorOtherProvince2', 'VendorBusinessinquiries2', 'VendorAuthorizedSigningOfficer2', 'VendorBusinessName2', 'VendorFirstName2', 'VendorLastName2', 'VendorPhone2', 'VendorEmail2');
    } else {
        EmptyCheck2 = 0;
    }

    if (document.getElementById('Vendor3').style.display === "block") {
        EmptyCheck3 = ChecksVendorsandPurchaserEmptyFields('VendorType3', 'VendorStreetNumber3', 'VendorStreetName3', 'VendorCity3', 'VendorPostalCode3', 'VendorProvince3', 'VendorOtherProvince3', 'VendorBusinessinquiries3', 'VendorAuthorizedSigningOfficer3', 'VendorBusinessName3', 'VendorFirstName3', 'VendorLastName3', 'VendorPhone3', 'VendorEmail3');
    } else {
        EmptyCheck3 = 0;
    }

    if (document.getElementById('Vendor4').style.display === "block") {
        EmptyCheck4 = ChecksVendorsandPurchaserEmptyFields('VendorType4', 'VendorStreetNumber4', 'VendorStreetName4', 'VendorCity4', 'VendorPostalCode4', 'VendorProvince4', 'VendorOtherProvince4', 'VendorBusinessinquiries4', 'VendorAuthorizedSigningOfficer4', 'VendorBusinessName4', 'VendorFirstName4', 'VendorLastName4', 'VendorPhone4', 'VendorEmail4');
    } else {
        EmptyCheck4 = 0;
    }

    if (EmptyCheck1 === 0 && EmptyCheck2 === 0 && EmptyCheck3 === 0 && EmptyCheck4 === 0) {

        if (document.getElementById('MyVendorLawyer').style.display === "none") {

            if (a) {
                TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser');
                document.getElementById("ClientProcess").style.display = "none";
            }



            document.getElementById("VendorEmptyError").style.display = "none";



            document.getElementById("PurcharerProcess").style.display = "";

        } //Closing inner if
        else {
            if (a) {
                TabsHandleler(event, 'VendorLawyer', 'tabcontent2', 'tablinks2', 'MyVendorLawyer');
                document.getElementById("ClientProcess").style.display = "none";
            }

            document.getElementById("VendorEmptyError").style.display = "none";


        } //Closing inner else



    } //first if
    else {
        document.getElementById("VendorEmptyError").style.display = "block";
    }

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

}

//**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


function PurchaserStepUpdate(Customer1, Customer2, Customer3, Customer4) {


    document.getElementById("MyPurchaser").disabled = false;

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            SetCustomers("RebateCustomerReciever1", Customer1);
            SetCustomers("RebateCustomerReciever2", Customer2);
            SetCustomers("RebateCustomerReciever3", Customer3);
            SetCustomers("RebateCustomerReciever4", Customer4);
            Invoice();
            if (document.getElementById('MyPurchaserLawyer').style.display === "inline") {
                TabsHandleler(event, 'PurchaserLawyer', 'tabcontent2', 'tablinks2', 'MyPurchaserLawyer');
            } //Closing inner if
            else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "inline") {
                TabsHandleler(event, 'Deposits', 'tabcontent2', 'tablinks2', 'MyDeposits');
            } //Closing inner else if
            else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "inline") {
                TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');
            } //Closing inner else if
            else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "none") {
                document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
                document.getElementById('InvoiceTabIMG').classList.add('accepted');
                TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
            } //Closing inner else if

            return;
        }
    }

    var EmptyCheck1 = ChecksVendorsandPurchaserEmptyFields('PurchaserType1', 'PurchaserStreetNumber1', 'purchaserStreetName1', 'PurchaserCity1', 'PurchaserPostalCode1', 'PurchaserProvince1', 'PurchaserOtherProvince1', 'PurchaserBusinessinquiries1', 'PurchaserAuthorizedSigningOfficer1', 'PurchaserBusinessName1', 'PurchaserFirstName1', 'PurchaserLastName1', 'PurchaserPhone1', 'PurchaserEmail1');
    // var EmptyCheck1 = 0;
    var EmptyCheck2 = 0;;
    var EmptyCheck3 = 0;;
    var EmptyCheck4 = 0;;

    if (document.getElementById('puchaser2').style.display === "block") {
        EmptyCheck2 = ChecksVendorsandPurchaserEmptyFields('PurchaserType2', 'PurchaserStreetNumber2', 'purchaserStreetName2', 'PurchaserCity2', 'PurchaserPostalCode2', 'PurchaserProvince2', 'PurchaserOtherProvince2', 'PurchaserBusinessinquiries2', 'PurchaserAuthorizedSigningOfficer2', 'PurchaserBusinessName2', 'PurchaserFirstName2', 'PurchaserLastName2', 'PurchaserPhone2', 'PurchaserEmail2');
    } else {
        EmptyCheck2 = 0;
    }

    if (document.getElementById('puchaser3').style.display === "block") {
        EmptyCheck3 = ChecksVendorsandPurchaserEmptyFields('PurchaserType3', 'PurchaserStreetNumber3', 'purchaserStreetName3', 'PurchaserCity3', 'PurchaserPostalCode3', 'PurchaserProvince3', 'PurchaserOtherProvince3', 'PurchaserBusinessinquiries3', 'PurchaserAuthorizedSigningOfficer3', 'PurchaserBusinessName3', 'PurchaserFirstName3', 'PurchaserLastName3', 'PurchaserPhone3', 'PurchaserEmail3');
    } else {
        EmptyCheck3 = 0;
    }

    if (document.getElementById('puchaser4').style.display === "block") {
        EmptyCheck4 = ChecksVendorsandPurchaserEmptyFields('PurchaserType4', 'PurchaserStreetNumber4', 'purchaserStreetName4', 'PurchaserCity4', 'PurchaserPostalCode4', 'PurchaserProvince4', 'PurchaserOtherProvince4', 'PurchaserBusinessinquiries4', 'PurchaserAuthorizedSigningOfficer4', 'PurchaserBusinessName4', 'PurchaserFirstName4', 'PurchaserLastName4', 'PurchaserPhone4', 'PurchaserEmail4')
    } else {
        EmptyCheck4 = 0;
    }

    if (EmptyCheck1 === 0 && EmptyCheck2 === 0 && EmptyCheck3 === 0 && EmptyCheck4 === 0) {

        SetCustomers("RebateCustomerReciever1", Customer1);
        SetCustomers("RebateCustomerReciever2", Customer2);
        SetCustomers("RebateCustomerReciever3", Customer3);
        SetCustomers("RebateCustomerReciever4", Customer4);

        if (document.getElementById('MyPurchaserLawyer').style.display === "inline") {

            TabsHandleler(event, 'PurchaserLawyer', 'tabcontent2', 'tablinks2', 'MyPurchaserLawyer');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';
        } //Closing inner if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "inline") {

            TabsHandleler(event, 'Deposits', 'tabcontent2', 'tablinks2', 'MyDeposits');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';
            document.getElementById("DepositProcess").style.display = '';
        } //Closing inner else if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "inline") {

            TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';

        } //Closing inner else if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "none") {

            TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
            document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('InvoiceTabIMG').classList.add('accepted');
            Invoice();

            document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('PartiesTabIMG').classList.add('accepted');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';

        } //Closing inner else if

    } //first if
    else {
        document.getElementById("PurchaserEmptyError").style.display = "block";
    } //Close else

    //	    SetPayment("RebateCustomerReciever1");
    //	    SetPayment("RebateCustomerReciever2");
    //	    SetPayment("RebateCustomerReciever3");
    //	    SetPayment("RebateCustomerReciever4");

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });



}




///////////////////////////////////////////


function PurchaserStep() {


    document.getElementById("MyPurchaser").disabled = false;

    var EmptyCheck1 = ChecksVendorsandPurchaserEmptyFields('PurchaserType1', 'PurchaserStreetNumber1', 'purchaserStreetName1', 'PurchaserCity1', 'PurchaserPostalCode1', 'PurchaserProvince1', 'PurchaserOtherProvince1', 'PurchaserBusinessinquiries1', 'PurchaserAuthorizedSigningOfficer1', 'PurchaserBusinessName1', 'PurchaserFirstName1', 'PurchaserLastName1', 'PurchaserPhone1', 'PurchaserEmail1');
    //var EmptyCheck1 = 0;
    var EmptyCheck2 = 0;;
    var EmptyCheck3 = 0;;
    var EmptyCheck4 = 0;;

    if (document.getElementById('puchaser2').style.display === "block") {
        EmptyCheck2 = ChecksVendorsandPurchaserEmptyFields('PurchaserType2', 'PurchaserStreetNumber2', 'purchaserStreetName2', 'PurchaserCity2', 'PurchaserPostalCode2', 'PurchaserProvince2', 'PurchaserOtherProvince2', 'PurchaserBusinessinquiries2', 'PurchaserAuthorizedSigningOfficer2', 'PurchaserBusinessName2', 'PurchaserFirstName2', 'PurchaserLastName2', 'PurchaserPhone2', 'PurchaserEmail2');
    } else {
        EmptyCheck2 = 0;
    }

    if (document.getElementById('puchaser3').style.display === "block") {
        EmptyCheck3 = ChecksVendorsandPurchaserEmptyFields('PurchaserType3', 'PurchaserStreetNumber3', 'purchaserStreetName3', 'PurchaserCity3', 'PurchaserPostalCode3', 'PurchaserProvince3', 'PurchaserOtherProvince3', 'PurchaserBusinessinquiries3', 'PurchaserAuthorizedSigningOfficer3', 'PurchaserBusinessName3', 'PurchaserFirstName3', 'PurchaserLastName3', 'PurchaserPhone3', 'PurchaserEmail3');
    } else {
        EmptyCheck3 = 0;
    }

    if (document.getElementById('puchaser4').style.display === "block") {
        EmptyCheck4 = ChecksVendorsandPurchaserEmptyFields('PurchaserType4', 'PurchaserStreetNumber4', 'purchaserStreetName4', 'PurchaserCity4', 'PurchaserPostalCode4', 'PurchaserProvince4', 'PurchaserOtherProvince4', 'PurchaserBusinessinquiries4', 'PurchaserAuthorizedSigningOfficer4', 'PurchaserBusinessName4', 'PurchaserFirstName4', 'PurchaserLastName4', 'PurchaserPhone4', 'PurchaserEmail4')
    } else {
        EmptyCheck4 = 0;
    }

    if (EmptyCheck1 === 0 && EmptyCheck2 === 0 && EmptyCheck3 === 0 && EmptyCheck4 === 0) {



        SetCustomers("RebateCustomerReciever1", "");
        SetCustomers("RebateCustomerReciever2", "");
        SetCustomers("RebateCustomerReciever3", "");
        SetCustomers("RebateCustomerReciever4", "");

        if (document.getElementById('MyPurchaserLawyer').style.display === "inline") {

            TabsHandleler(event, 'PurchaserLawyer', 'tabcontent2', 'tablinks2', 'MyPurchaserLawyer');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';
        } //Closing inner if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "inline") {

            TabsHandleler(event, 'Deposits', 'tabcontent2', 'tablinks2', 'MyDeposits');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';
            document.getElementById("DepositProcess").style.display = '';
        } //Closing inner else if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "inline") {

            TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';

        } //Closing inner else if
        else if (document.getElementById('MyPurchaserLawyer').style.display === "none" && document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "none") {

            TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
            document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('InvoiceTabIMG').classList.add('accepted');
            Invoice();

            document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('PartiesTabIMG').classList.add('accepted');

            document.getElementById("PurchaserEmptyError").style.display = "none";

            document.getElementById("PurcharerProcess").style.display = 'none';

        } //Closing inner else if

    } //first if
    else {
        document.getElementById("PurchaserEmptyError").style.display = "block";
    } //Close else

    //SetPayment("RebateCustomerReciever1");
    //SetPayment("RebateCustomerReciever2");
    //SetPayment("RebateCustomerReciever3");
    // SetPayment("RebateCustomerReciever4");

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}


//************************************************************************************************************************************************************************************************************************************************

function VendorLawyerStep() {

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            Invoice();
            TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser');
            return;
        }
    }
    document.getElementById("MyVendorLawyer").disabled = false;

    document.getElementById("VendorLawerEmptyError").style.display = "none";

    var Error = 0;

    if (ChecksEmptyFields("VendorLawyerFirm", "VendorLawyerName", "VendorLawyerStreetNumber", "VendorLawyerStreetName", "VendorLawyerCity", "VendorLawyerPostalCode", "VendorLawyerPhone", "VendorLawyerEmail")) {
        document.getElementById("VendorLawerEmptyError").style.display = "block";
        Error = 1;
    }

    if (document.getElementById("ClerkInformation").style.display === "block") {
        if (ChecksEmptyFields("ClerkFullName", "ClerkEmail")) {
            document.getElementById("VendorLawerEmptyError").style.display = "block";
            Error = 1;
        }
    }

    Error += validatorPE("VendorLawyerPostalCode", "VendorLawyerEmail", '');

    if (Error === 0) {
        document.getElementById("VendorLawerEmptyError").style.display = "none";
        document.getElementById("VendorLawerEmptyError").style.display = "none";
        document.getElementById("PurcharerProcess").style.display = '';
        TabsHandleler(event, 'Purchasers', 'tabcontent2', 'tablinks2', 'MyPurchaser');

    }

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

}

//**************************************************************************************************************************************************************************************************************************************************************************************************************************

function PuchaserLawyerStep() {

    document.getElementById("MyPurchaserLawyer").disabled = false;

    if (document.getElementById('MyDeposits').style.display === "inline") {

        document.getElementById("PurcharerProcess").style.display = 'none';
        document.getElementById("DepositProcess").style.display = '';

        TabsHandleler(event, 'Deposits', 'tabcontent2', 'tablinks2', 'MyDeposits');
    } else if (document.getElementById('MyDeposits').style.display === "none" && document.getElementById('MyCooperatingBrokerage').style.display === "none") {

        TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
        document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('InvoiceTabIMG').classList.add('accepted');
        Invoice();

        document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('PartiesTabIMG').classList.add('accepted');


    } else {
        TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');
    }

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

//************************************************************************************************************************************************************************************************************************************************************

function DepositStep() {

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            Invoice();
            if (document.getElementById("MyCooperatingBrokerage").style.display === "inline") {
                TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');
            } //Close inner if
            else {
                TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
                document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
                document.getElementById('InvoiceTabIMG').classList.add('accepted');
            } //Close inner if


            return;
        }
    }

    var validate = validateDepositStep();

    if (validate) {

        document.getElementById("MyDeposits").disabled = false;

        if (document.getElementById("MyCooperatingBrokerage").style.display === "inline") {

            topbuttonsBack(3);



            TabsHandleler(event, 'CooperatingBrokerage', 'tabcontent2', 'tablinks2', 'MyCooperatingBrokerage');
        } //Close inner if
        else {

            document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('PartiesTabIMG').classList.add('accepted');


            document.getElementById("PartiesTab").disabled = false;

            TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
            document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('InvoiceTabIMG').classList.add('accepted');

            Invoice();

        } //Close inner if



        document.getElementById("DepositsEmptyError").style.display = "none";
    } // Close if 
    else {
        document.getElementById("DepositsEmptyError").style.display = "block";
    }

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });



}

//*******************************************************************************************************************************************************************************************************************************************************************************************************************

function CooperatingBrokerageStep() {

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            Invoice();
            TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
            document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('InvoiceTabIMG').classList.add('accepted');
            return;
        }
    }


    if (ChecksEmptyFields("CooperatingAgentName", "Brokername", "CooperatingStreetNumber", "COOPERATINGBROKERAGEstreetName", "CooperatingCity", "CooperatingPostalCode", "CO-OPERATINGBROKERAGEEmail", "CO-OPERATINGBROKERAGEPhone") || validatorPE("CooperatingPostalCode", "CO-OPERATINGBROKERAGEEmail")) {
        //  if(0){

        document.getElementById("CooperateBrokerageEmptyError").style.display = "block";

        // document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
    } //close if
    else {
        document.getElementById("CooperateBrokerageEmptyError").style.display = "none";

        //TabsHandleler(event, 'Referral Fee','tabcontent','tablinks1','ReferralFeeTab','ReferralFeeTab');	 TabsHandleler(event,'Agent','tabcontent3','tablinks3','ReferralAgentTab'); 

        TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks1', 'InvoiceTab');
        document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('InvoiceTabIMG').classList.add('accepted');

        document.getElementById("MyCooperatingBrokerage").disabled = false;

        document.getElementById("PartiesTab").disabled = false;

        Invoice();

        document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('PartiesTabIMG').classList.add('accepted');


    } //Close else

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ReferralAgentStep1() {

    // var AgentName = document.getElementById("PayeeFirstName").value;

    // var CooperatingBrokerage = document.getElementById("PayeeRealStateBrokerage").value;

    // var Address = document.getElementById("PayeeStreetNumber").value;

    // var Phone = document.getElementById("PayeePhone").value;

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');

            TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');
            return;
        }
    }


    var variables = [];


    if (document.getElementById('ReferralDisclosureUpload').style.display === "block") {

        variables.push(document.getElementById("PayeeFirstName"), document.getElementById("PayeeLastName"),
            document.getElementById("PayeeRealStateBrokerage"), document.getElementById("PayeeStreetNumber"),
            document.getElementById("PayeeStreetName"), document.getElementById("PayeeCity"),
            document.getElementById("PayeePhone"));

        let Errors = EmptyCheckArray(variables);

        if (!ValidatePostalCode("PayeePostalCode")) {
            document.getElementById("PayeePostalCode").style.borderColor = "red";
            Errors = 1;
        } else {
            document.getElementById("PayeePostalCode").style.borderColor = "lightgrey";
        }

        if (!ValidateEmail("PayeeEmail")) {
            document.getElementById("PayeeEmail").style.borderColor = "red";
            Errors = 1;
        } else {
            document.getElementById("PayeeEmail").style.borderColor = "lightgrey";
        }

        document.getElementById("ReferralErrorcheck").style.display = "none";

        if (Errors) {

            document.getElementById("ReferralStep1Error").style.display = "block";
        } //inner if
        else {

            document.getElementById('ReferralFeeTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('ReferralFeeTabIMG').classList.add('accepted');


            document.getElementById("ReferralStep1Error").style.display = "none";

            TabsHandleler(event, 'Amount', 'tabcontent3', 'tablinks3', 'ReferralPaymentTab');
        }
        variables = [];
    } //Closing  if
    else {

        if (document.getElementById("ReferralfeeIsRegistrantYES").checked == true) {

            if (document.getElementById("ReferralfeeIsDisclosedToAllYES").checked == false && document.getElementById("ReferralfeeIsDisclosedToAllNO").checked == false) {

                document.getElementById("ReferralErrorcheck").style.display = "block";
            }

            if (document.getElementById("ReferralfeeIsDisclosedToAllYES").checked == false && document.getElementById("ReferralfeeIsDisclosedToAllNO").checked == true) {

                document.getElementById("ReferralErrorcheck").style.display = "none";

                document.getElementById("ReferralFeeTab").disabled = false;

                TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');

                TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');

                document.getElementById("ReferralFeeTab").disabled = false;
            }

        } //if

        if (document.getElementById("ReferralfeeIsRegistrantYES").checked == false && document.getElementById("ReferralfeeIsRegistrantNO").checked == true) {

            document.getElementById("ReferralErrorcheck").style.display = "none";

            document.getElementById("ReferralFeeTab").disabled = false;

            document.getElementById('ReferralFeeTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('ReferralFeeTabIMG').classList.add('accepted');


            TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');

            TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');

            document.getElementById("ReferralFeeTab").disabled = false;
        }


        if (document.getElementById("ReferralfeeIsRegistrantYES").checked == false && document.getElementById("ReferralfeeIsRegistrantNO").checked == false) {

            document.getElementById("ReferralErrorcheck").style.display = "block";
        }

        variables = [];

    } //close else

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

}


function EmptyCheckArrayParent(variables) {

    var Empty = 0;

    for (let i = 0; i < variables.length; i++) {

        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

            Empty = 1

            variables[i].parentElement.style.borderColor = "red";

        } else {

            variables[i].parentElement.style.borderColor = "lightgrey";

        }
    }

    return Empty;
}

function EmptyCheckArray(variables) {

    var Empty = 0;

    for (let i = 0; i < variables.length; i++) {

        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

            Empty = 1

            variables[i].style.borderColor = "red";

        } else {

            variables[i].style.borderColor = "lightgrey";

        }
    }

    return Empty;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ReferralAgentStep2(val) {

    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
            if(val==1){
                TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');
                TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');
                return;
            }
        }
    }

    let ErrorChecks1 = 0;
    let ErrorChecks2 = 0;
    let check = CheckRebateRefferalAmounts();

    if (check === 1) {
        document.getElementById("ReferralExceedError").style.display = "block";
    } else {
        document.getElementById("ReferralExceedError").style.display = "none";
    }

    document.getElementById("ReferralEmptyFieldsError").style.display = "none";

    var Hst = document.getElementById("ReferralPayeeHSTNumber").value + 'RT' + document.getElementById("ReferralPayeeHSTNumber2").value;

    var Agent1 = document.getElementById("ReferralPercentageAmountToAgent1").value;

    var Agent2 = document.getElementById("ReferralPercentageAmountToAgent2").value;

    var ReferralAmount = document.getElementById("ReferralFeeAmount").value;

    if (Hst === null || Hst === " " || !Hst || Hst.trim == 'RT') {

        document.getElementById("HSTError").style.display = "block";

        document.getElementById("ReferralPayeeHSTNumber").style.borderColor = "orange";

        ErrorChecks1 = 1;

    } else {
        document.getElementById("ReferralPayeeHSTNumber").style.borderColor = "lightgrey";
        ErrorChecks1 = 0;
        document.getElementById("HSTError").style.display = "none";
    }


    if (ReferralAmount === null || ReferralAmount === " " || !ReferralAmount || ReferralAmount === "0") {

        document.getElementById("ReferralFeeAmount").parentElement.style.borderColor = "red";

        document.getElementById("ReferralEmptyFieldsError").style.display = "block";
        ErrorChecks2 = 1;

    } else {
        document.getElementById("ReferralFeeAmount").parentElement.style.borderColor = "lightgrey";
        ErrorChecks2 = 0;
        document.getElementById("ReferralEmptyFieldsError").style.display = "none";
    }





    /*if (document.getElementById('AgentsRefferalPayments').style.display === "block") {

        if (Agent1 === null || Agent1 === " " || !Agent1 ) {
        	
            document.getElementById("ReferralEmptyFieldsError").style.display = "block";
            
            ErrorChecks =1;
            
        }else{ document.getElementById("ReferralEmptyFieldsError").style.display = "none";   ErrorChecks =0;  }

    } //close outer if    
    
    else{ document.getElementById("ReferralEmptyFieldsError").style.display = "none";   ErrorChecks =0;  }

    /*var Total=document.getElementById("TotalRefferalPercentageAmount").value;

    if( Total>100 || Total<100 ){ if(document.getElementById('AgentsRefferalPayments').style.display==="block"){ ErrorChecks=1;document.getElementById('TotalReferralAllocationError').style.display="block"; }else{  document.getElementById('TotalReferralAllocationError').style.display="none"; }  } 

    else{  document.getElementById('TotalReferralAllocationError').style.display="none"; } 

    */




    if (ErrorChecks1 === 0 && ErrorChecks2 === 0 && check === 0) {

        document.getElementById('ReferralFeeTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('ReferralFeeTabIMG').classList.add('accepted');


        document.getElementById("ReferralEmptyFieldsError").style.display = "none";

        document.getElementById("ReferralExceedError").style.display = "none";

        document.getElementById("HSTError").style.display = "none";

        document.getElementById("ReferralFeeTab").disabled = false;

        if(val==1){
            TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');
            TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');
        }
    }

    /*else if(ErrorChecks1 ===1){  document.getElementById("HSTError").style.display = "block"; } 
    
    else if( ErrorChecks2 ===1){ document.getElementById("ReferralEmptyFieldsError").style.display = "block"; } 
    
    else if( check===1){  document.getElementById("ReferralExceedError").style.display = "block"; } 
    
    else if(ErrorChecks1 ===0){  document.getElementById("HSTError").style.display = "none"; } 
    
    else if( ErrorChecks2 ===0){ document.getElementById("ReferralEmptyFieldsError").style.display = "none"; } 
    
    else if( check===0){  document.getElementById("ReferralExceedError").style.display = "none"; } */

    //else{  }

    //else if( ErrorChecks === 1 ){   document.getElementById("ReferralEmptyFieldsError").style.display = "block"; } 

    //else if( check===1 ){ document.getElementById("ReferralExceedError").style.display = "block"; } 

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

    return ErrorChecks1 + ErrorChecks2 + check;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Step1Rebate(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance ,Final , HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2) {
 
    if (document.getElementById('perpanentDeal')) {
        if (document.getElementById('perpanentDeal').value == '1') {
        	
        	  if(Final=="1"){
        		  
        		  TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal ,theSplit1,theSplit2 , Agent1 , Agent2)  ;
        		  
        	  }
        	  
        	else{
        		  
                 TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
        	  }
        	  
        	  
            TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');
            return;
        }
    }

    if (document.getElementById("RecipientAPartyYes").checked == false && document.getElementById("RecipientAPartyNO").checked == false) {



        document.getElementById("RebateEmptyFieldsError").style.display = "block";
    } else if (document.getElementById("RecipientAPartyYes").checked == false && document.getElementById("RecipientAPartyNO").checked == true) {


        document.getElementById("RebateEmptyFieldsError").style.display = "none";

        document.getElementById("CustomerRebateTab").disabled = false;

        document.getElementById('CustomerRebateTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('CustomerRebateTabIMG').classList.add('accepted');


  	  if(Final=="1"){
		  
  		 TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2, Agent1 , Agent2) 
		  
	  }
	  
	else{
		  
         TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
	  }
	  

        TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');
    } else {

    }




    if (document.getElementById("ReebateComplywiththeCodeofEthics").style.display === "block") {


        if (document.getElementById("ComplyWithEthicYes").checked == false && document.getElementById("ComplyWithEthicNO").checked == false) {


            document.getElementById("RebateEmptyFieldsError").style.display = "block";
        } else if (document.getElementById("ComplyWithEthicYes").checked == false && document.getElementById("ComplyWithEthicNO").checked == true) {

            document.getElementById("RebateEmptyFieldsError").style.display = "none";

            document.getElementById("CustomerRebateTab").disabled = false;

      	  if(Final=="1"){
    		  
      		 TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2)  ;
    		  
    	  }
    	  
    	else{
    		  
             TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
    	  }
    	  

            TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');
        } else if (document.getElementById("ComplyWithEthicYes").checked === true && document.getElementById("ComplyWithEthicNO").checked === false) {

            document.getElementById("RebateEmptyFieldsError").style.display = "none";

            TabsHandleler(event, 'RebateAmount', 'tabcontent4', 'tablinks4', 'RebateAmountSection');

        } else {} //inner else    

    } //close if 
    else {}

    //} //Close if

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function NextTRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance , Final , HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2) {

	  if(Final=="1"){
		  
		  TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2)  ;
		  
	  }
	  
	else{
		  
         TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
	  }
	  

    TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Referralnext() {
    document.getElementById('ReferralFeeTabIMG').src = '../ImagesUsed/Didnotaccept.png';
    TabsHandleler(event, 'Customer Rebate', 'tabcontent', 'tablinks1', 'CustomerRebateTab');
    TabsHandleler(event, 'Client', 'tabcontent4', 'tablinks4', 'RebateClientSection');
    ActivateButton('ReferralFeeTab');

}

function RebateNext(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance , Final , HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2) {

	  if(Final=="1"){
		  
		  
		  TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2 , Agent1 , Agent2) ; 
	  }
	  
	else{
		  
         TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
	  }
	  

    ActivateButton('CustomerRebateTab');

    document.getElementById('CustomerRebateTabIMG').src = "../ImagesUsed/Didnotaccept.png";

    TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Step2Rebate(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance, Final , HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2  , Agent1 , Agent2) {

    if (document.getElementById('perpanentDeal')) {
    	
        if (document.getElementById('perpanentDeal').value == '1') {
        	
      	  if(Final=="1"){
    		  
      		 TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,theSplit1,theSplit2  , Agent1 , Agent2);  
    		  
    	  }
    	  
    	else{
    		  
             TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
    	  }
    	  
            
            TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');
            return;
        }
    }

    var Error = 0;

    var Error1 = 0;

    var variables = [];

    var check = CheckRebateRefferalAmounts();

    if (check === 1) {
        Error1 = 1;
        document.getElementById("rebateExceedError").style.display = "block";
    } else {
        Error1 = 0;
        document.getElementById("rebateExceedError").style.display = "none";
    }

    document.getElementById("EmptyRebateError").style.display = "none";

    var rebate1 = document.getElementById("FirstRebateAmount");
    var Customer1 = document.getElementById("RebateCustomerReciever1");
    var rebate2 = document.getElementById("SecondRebateAmount");
    var Customer2 = document.getElementById("RebateCustomerReciever2");
    var rebate3 = document.getElementById("ThirdRebateAmount");
    var Customer3 = document.getElementById("RebateCustomerReciever3");
    var rebate4 = document.getElementById("ForthRebateAmount");
    var Customer4 = document.getElementById("RebateCustomerReciever4");

    variables.push(rebate1, Customer1);

    //EmptyCheckArray();
    //    if (rebate1 === " " || rebate1 === null || !rebate1 || rebate1 === "0" || Customer1 === null || !Customer1 || Customer1 === " ") {

    //          }

    if (document.getElementById("SecondRebate").style.display === "block") {
        variables.push(rebate2, Customer2);
    }

    if (document.getElementById("ThirdRebate").style.display === "block") {
        variables.push(rebate3, Customer3);
    }

    if (document.getElementById("ForthRebate").style.display === "block") {
        variables.push(rebate4, Customer4);
    }


    if (EmptyCheckArrayParent(variables)) {
        document.getElementById("EmptyRebateError").style.display = "block";
        Error = 1;
    } else {
        Error = 0;
        document.getElementById("EmptyRebateError").style.display = "none"
    }

    variables = [];



    if (Error === 0 && Error1 === 0) {

        document.getElementById("CustomerRebateTab").disabled = false;

  	  if(Final=="1"){
		  
  		 TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,Split1,Split2 , Agent1 , Agent2);  
		  
	  }
	  
	else{
		  
         TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance);
	  }
	  

        document.getElementById('CustomerRebateTabIMG').src = "../ImagesUsed/Accept.png";
        document.getElementById('CustomerRebateTabIMG').classList.add('accepted');


        TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');

        document.getElementById("EmptyRebateError").style.display = "none";

        document.getElementById("rebateExceedError").style.display = "none";
    }

    //TRS();

    // CheckRebateRefferalAmounts();

    // TabsHandleler(event, 'TRS', 'tabcontent', 'tablinks1', 'TRSTab');

    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });

    return Error+Error1;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function showFile(event, id, label, file) {

    document.getElementById(id).href = URL.createObjectURL(event.target.files[0]);

    document.getElementsByName(label)[0].value = document.getElementById(file).files[0].name;

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function TotalRebates() {

    var rebate1 = parseFloat(document.getElementById("FirstRebateAmount").value);

    var rebate2 = 0;
    var rebate3 = 0;
    var rebate4 = 0;

    if (document.getElementById("SecondRebate").style.display === "block") {
        rebate2 = parseFloat(document.getElementById("SecondRebateAmount").value);
    } else {
        rebate2 = 0
    }

    if (document.getElementById("ThirdRebate").style.display === "block") {
        rebate3 = parseFloat(document.getElementById("ThirdRebateAmount").value);
    } else {
        rebate3 = 0
    }

    if (document.getElementById("ForthRebate").style.display === "block") {
        rebate4 = parseFloat(document.getElementById("ForthRebateAmount").value);
    } else {
        rebate4 = 0
    }

    var Total = rebate1 + rebate2 + rebate3 + rebate4;

    document.getElementById("TotalRebats").value = parseFloat(Total).toFixed(2);
    CalcluationOfAmounts('RebateAgent1amount', 'RebateAgent2amount', 'TotalRebats', 'RebateAmounts1', 'RebateAmounts2');

}

//*********************************************************************************************************************************************************************************************************************************************************************************************************************************************

function TabsHandleler(event, tabName, MytabsContent, tablink, tabID) {

    var i, tabcontent, tablinks;

    //The Following line will get the tabs information by their class name we assigned to them on the HTML code 	  

    tabcontent = document.getElementsByClassName(MytabsContent);

    //The following for loop will deactivate all the tabs 	    

    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    //The following tablink variable contains the tabs been clicked 	    

    tablinks = document.getElementsByClassName(tablink);

    //The following for loop will activate the tab been clicked 	    

    for (i = 0; i < tablinks.length; i++) {

        tablinks[i].className = tablinks[i].className.replace("active", "");
    } //Close for Loop

    document.getElementById(tabName).style.display = "block";

    //document.getElementById(tabName +"-tab").classList.add("active");

    // event.currentTarget.className += " active";

    document.getElementById(tabID).classList.add("active");

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Invoice() {


    const HST = document.getElementById("HSTAMount").value;

    //Getting the current date and assign it to the related label
    const CurrentDate = new Date().toJSON().slice(0, 10).replace(/-/g, '/');
    const curr = CurrentDate.split("/"); // turn the date into a list format (Split by / if needed)
    const year = curr[0];

    document.getElementById("Date").innerHTML = curr[2] + ' '  + months[curr[1] - 1]  + ', ' + year;

    PropertyLabel("Property7");

    document.getElementById("InvoiceClosingDate").innerHTML = document.getElementById("PropertyClosingDate").value;

    document.getElementById("InvoicePrice").innerHTML = parseFloat(document.getElementById("ProPertyListingPrice").value).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    //Getting the Property Listing Type

    const ListingType = document.getElementById("PropertyListingType").value;

    let CommissionPercentage = 0;

    let Commission = 0;

    let officepercentage = 0;

    //Getting the Price of the Transaction 

    let Price = parseFloat(document.getElementById("ProPertyListingPrice").value);

    //In the following if condition we will set the commission percentage amount

    if (ListingType === "Buyer-Side" || ListingType === "Tenant-Side" || ListingType === "BuyerSide-Self-Represented-Vendor" || ListingType === "TenantSide-Self-Represented-Landlord") {

        if (document.getElementById("SellingComiissionFixedAmount").checked === false) {


            CommissionPercentage = parseFloat(document.getElementById("PropertySellingComission").value);

            Commission = (Price * CommissionPercentage) / 100; //inner if

        } //inner if
        else {
            Commission = parseFloat(document.getElementById("PropertySellingComission").value);

            CommissionPercentage = 0;
        } //inner else if

    } //if( ListingType==="Buyer-Side" || ListingType==="Tenant-Side")
    else {

        if (document.getElementById("SellingComiissionFixedAmount").checked === false && document.getElementById("ListingComiissionFixedAmount").checked === true) {

            var sellingCommission = (Price * parseFloat(document.getElementById("PropertySellingComission").value)) / 100;

            Commission = sellingCommission + parseFloat(document.getElementById("PropertyListingComission").value);

            CommissionPercentage = 0;
        } //inner if
        else if (document.getElementById("SellingComiissionFixedAmount").checked === true && document.getElementById("ListingComiissionFixedAmount").checked === false) {

            var ListingCommission = (Price * parseFloat(document.getElementById("PropertyListingComission").value)) / 100;

            Commission = ListingCommission + parseFloat(document.getElementById("PropertySellingComission").value);

            CommissionPercentage = 0;
        } //inner else if
        else if (document.getElementById("SellingComiissionFixedAmount").checked === true && document.getElementById("ListingComiissionFixedAmount").checked === true) {


            Commission = parseFloat(document.getElementById("PropertyListingComission").value) + parseFloat(document.getElementById("PropertySellingComission").value);

            CommissionPercentage = 0;
        } //inner else if	 
        else {
            CommissionPercentage = parseFloat(document.getElementById("PropertyListingComission").value) + parseFloat(document.getElementById("PropertySellingComission").value);

            Commission = (Price * CommissionPercentage) / 100;
        } //inner else

    } //Close Main else


    //Calculating the total commission with the HST amount

    var TotalCommission = Commission + ((Commission * HST) / 100);


    document.getElementById("InvoiceCommission").innerHTML = parseFloat(Commission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("InvoiceTaxAmount").innerHTML = parseFloat((Commission * HST) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("InvoiceTotal").innerHTML = parseFloat(Commission + ((Commission * HST) / 100)).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    var deposit1 = parseFloat(document.getElementById('DepositAmount1').value);

    var deposit2 = parseFloat(document.getElementById('DepositAmount2').value);

    var deposit3 = parseFloat(document.getElementById('DepositAmount3').value);

    var deposit4 = parseFloat(document.getElementById('DepositAmount4').value);

    if (isNaN(deposit1)) {
        deposit1 = 0;
    }
    if (isNaN(deposit2)) {
        deposit2 = 0;
    }
    if (isNaN(deposit3)) {
        deposit3 = 0;
    }
    if (isNaN(deposit4)) {
        deposit4 = 0;
    }

    var TotalDeposits = +deposit1 + +deposit2 + +deposit3 + +deposit4;

    if (TotalDeposits) {
        document.getElementById("InvoiceDeposits").innerHTML = parseFloat(TotalDeposits).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    } else {
        document.getElementById("InvoiceDeposits").innerHTML = parseFloat(0).toFixed(2);
    }


    //If there is no vendor lawyer so the invoice will goto the vendor or landlord 

    if (document.getElementById("MyVendorLawyer").style.display === "none") {

        document.getElementById("Title1").innerHTML = "Landlord(s):";

        document.getElementById("Title2").innerHTML = "Tenant(s):";

        if (TotalDeposits < TotalCommission) {

            document.getElementById("BalanceLabel").innerHTML = "Balance due to Broker";
        } else if (TotalDeposits > TotalCommission) {
            document.getElementById("BalanceLabel").innerHTML = "Balance due to Landlord";
        } else {
            document.getElementById("BalanceLabel").innerHTML = "Balance due to Broker";
        }

        //document.getElementById("BalanceLabel").innerHTML = "Balance Due To Landrold";

        document.getElementById("StatementReturnMessage").innerHTML = "is owning to the Landlord(s) on closing.";
    } else {
        document.getElementById("Title1").innerHTML = "Vendor(s):";

        document.getElementById("Title2").innerHTML = "Purchaser(s):";

        //document.getElementById("BalanceLabel").innerHTML = "Balance Due To Vendor";

        document.getElementById("StatementReturnMessage").innerHTML = "is owning to the Vendor(s) on closing.";

        if (TotalDeposits < TotalCommission) {

            document.getElementById("BalanceLabel").innerHTML = "Balance due to Broker";
        } else if (TotalDeposits > TotalCommission) {
            document.getElementById("BalanceLabel").innerHTML = "Balance due to Vendor";
        } else {
            document.getElementById("BalanceLabel").innerHTML = "Balance due to Broker";
        }
    }


    if (TotalDeposits > TotalCommission) {

        document.getElementById("InvoiceContects").style.display = "none";

        document.getElementById("StatmentContects").style.display = "block";

        document.getElementById("BalanceDueAmountRemain").innerHTML = parseFloat(TotalDeposits - TotalCommission).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        document.getElementById("InvoiceRemaingBalance").innerHTML = parseFloat(TotalDeposits - TotalCommission).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

    } else {

        document.getElementById("InvoiceContects").style.display = "block";

        document.getElementById("StatmentContects").style.display = "none";

        document.getElementById("BalanceDueAmountRemain").innerHTML = 0.00;

        document.getElementById("InvoiceRemaingBalance").innerHTML = parseFloat(TotalCommission - TotalDeposits).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

    }



    if (ListingType === "Buyer-Side" || ListingType === "Tenant-Side") {

        if (document.getElementById("CooperatingUnit").value) {

            document.getElementById("RecieverAddress").innerHTML = document.getElementById("CooperatingUnit").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("CooperatingStreetNumber").value.trim() + "&nbsp;" + document.getElementById("COOPERATINGBROKERAGEstreetName").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("CooperatingCity").value.trim() + ",&nbsp;" + document.getElementById("CooperatingProvince").value.trim() + ",&nbsp;" + document.getElementById("CooperatingPostalCode").value.trim();

        } else {
            document.getElementById("RecieverAddress").innerHTML = document.getElementById("CooperatingStreetNumber").value.trim() + "&nbsp;" + document.getElementById("COOPERATINGBROKERAGEstreetName").value.trim() + ",&nbsp;" + document.getElementById("CooperatingCity").value.trim() + ",&nbsp;" + document.getElementById("CooperatingProvince").value.trim() + ",&nbsp;" + document.getElementById("CooperatingPostalCode").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("CooperatingCity").value.trim() + ",&nbsp;" + document.getElementById("CooperatingProvince").value.trim() + ",&nbsp;" + document.getElementById("CooperatingPostalCode").value.trim();

        }
        document.getElementById("ReceiverExtraspan").style.display = 'none';
        document.getElementById("Reciever Full Name").innerHTML = document.getElementById("Brokername").value + ", " + document.getElementById("CooperatingAgentName").value;

    } else if (ListingType === "Listing-Side" || ListingType === "Sale-Double-Sided" || ListingType === "BuyerSide-Self-Represented-Vendor") {

        if (document.getElementById("VendorLawyerUnit").value) {

            document.getElementById("RecieverAddress").innerHTML = document.getElementById("VendorLawyerUnit").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("VendorLawyerStreetNumber").value.trim() + "&nbsp;" + document.getElementById("VendorLawyerStreetName").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("VendorLawyerCity").value.trim() + ",&nbsp;" + document.getElementById("VendorLawyerProvince").value.trim() + ",&nbsp;" + document.getElementById("VendorLawyerPostalCode").value.trim();

        } else {

            document.getElementById("RecieverAddress").innerHTML = document.getElementById("VendorLawyerStreetNumber").value.trim() + "&nbsp;" + document.getElementById("VendorLawyerStreetName").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("VendorLawyerCity").value.trim() + ",&nbsp;" + document.getElementById("VendorLawyerProvince").value.trim() + ",&nbsp;" + document.getElementById("VendorLawyerPostalCode").value.trim();

        }
        document.getElementById("ReceiverExtraspan").style.display = '';
        document.getElementById("Reciever Full Name").innerHTML = document.getElementById("VendorLawyerName").value.trim();
        document.getElementById("ReceiverExtraLabel").innerHTML = document.getElementById("VendorLawyerFirm").value.trim();
    } else {

        if (document.getElementById("VendorUnit1").value) {

            document.getElementById("RecieverAddress").innerHTML = document.getElementById("VendorUnit1").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("VendorStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("VendorStreetName1").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("VendorCity1").value.trim() + ",&nbsp;" + document.getElementById("VendorProvince1").value.trim() + ",&nbsp;" + document.getElementById("VendorPostalCode1").value.trim();

        } else {

            document.getElementById("RecieverAddress").innerHTML = document.getElementById("VendorStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("VendorStreetName1").value.trim();
            document.getElementById("RecieverAddressTwo").innerHTML = document.getElementById("VendorCity1").value.trim() + ",&nbsp;" + document.getElementById("VendorProvince1").value.trim() + ",&nbsp;" + document.getElementById("VendorPostalCode1").value.trim();

        }

        if (document.getElementById("VendorBusinessinquiries1").style.display === "none") {

            document.getElementById("Reciever Full Name").innerHTML = document.getElementById("VendorFirstName1").value.trim() + " " + document.getElementById("VendorLastName1").value.trim();
            document.getElementById("ReceiverExtraspan").style.display = 'none';
        } //inner if
        else {
            document.getElementById("ReceiverExtraspan").style.display = '';
            document.getElementById("Reciever Full Name").innerHTML = document.getElementById("VendorAuthorizedSigningOfficer1").value.trim();
            document.getElementById("ReceiverExtraLabel").innerHTML = document.getElementById("VendorBusinessName1").value.trim();
        } //inner else

    } //else                    

    let Vendors = "";

    let Puchasers = "";

    Vendors = Vendors + GetVedorsAndPurchaserForInvoice('VendorBusinessinquiries1', 'VendorAuthorizedSigningOfficer1', 'VendorFirstName1', 'VendorLastName1');

    if (document.getElementById("Vendor2").style.display === "block") {

        Vendors = Vendors + "," + " " + GetVedorsAndPurchaserForInvoice('VendorBusinessinquiries2', 'VendorAuthorizedSigningOfficer2', 'VendorFirstName2', 'VendorLastName2');

    } //Close Vendor2 #if


    if (document.getElementById("Vendor3").style.display === "block") {

        Vendors = Vendors + "," + " " + GetVedorsAndPurchaserForInvoice('VendorBusinessinquiries3', 'VendorAuthorizedSigningOfficer3', 'VendorFirstName3', 'VendorLastName3');

    } //Close Vendor3 #if 	

    if (document.getElementById("Vendor4").style.display === "block") {

        Vendors = Vendors + "," + " " + GetVedorsAndPurchaserForInvoice('VendorBusinessinquiries4', 'VendorAuthorizedSigningOfficer4', 'VendorFirstName4', 'VendorLastName4');

    } //Close Vendor4 #if	


    document.getElementById("InvoiceVendors").innerHTML = Vendors;

    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Puchasers = Puchasers + GetVedorsAndPurchaserForInvoice('PurchaserBusinessinquiries1', 'PurchaserAuthorizedSigningOfficer1', 'PurchaserFirstName1', 'PurchaserLastName1');

    if (document.getElementById("puchaser2").style.display === "block") {
        Puchasers = Puchasers + "," + " " + GetVedorsAndPurchaserForInvoice('PurchaserBusinessinquiries2', 'PurchaserAuthorizedSigningOfficer2', 'PurchaserFirstName2', 'PurchaserLastName2');
    } ////Close Purchaser2 #if 

    if (document.getElementById("puchaser3").style.display === "block") {

        Puchasers = Puchasers + "," + " " + GetVedorsAndPurchaserForInvoice('PurchaserBusinessinquiries3', 'PurchaserAuthorizedSigningOfficer3', 'PurchaserFirstName3', 'PurchaserLastName3');
    } ////Close Purchaser3 #if 

    if (document.getElementById("puchaser4").style.display === "block") {

        Puchasers = Puchasers + "," + " " + GetVedorsAndPurchaserForInvoice('PurchaserBusinessinquiries4', 'PurchaserAuthorizedSigningOfficer4', 'PurchaserFirstName4', 'PurchaserLastName4');
    } ////Close Purchaser4 #if 


    document.getElementById("InvoicePuchasers").innerHTML = Puchasers;

    document.getElementById("hiddenInvoiceDate").value = document.getElementById("Date").innerHTML.replace(/,/g, ''); 

    document.getElementById("hiddeninvoiceCommission").value = document.getElementById("InvoiceCommission").innerHTML.replace(/,/g, '');

    document.getElementById("hiddenInvoiceHSTtax").value = document.getElementById("InvoiceTaxAmount").innerHTML.replace(/,/g, '');

    document.getElementById("hiddenInvoiceBalance").value = document.getElementById("InvoiceRemaingBalance").innerHTML.replace(/,/g, '');

    document.getElementById("hiddenInvoiceDeposits").value = document.getElementById("InvoiceDeposits").innerHTML.replace(/,/g, '');
    
    document.getElementById("hiddenVendors").value = document.getElementById("InvoiceVendors").innerHTML;

    document.getElementById("hiddenPurchasers").value = document.getElementById("InvoicePuchasers").innerHTML;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ProvinceCheck() {

    var Province = document.getElementById("PropertyProvince").value;

    var HST = 0;

    if (Province === "AB" || Province === "NWT" || Province === "NU" || Province === "YT") {

        //HST=5; 

        // document.getElementById("HSTLabel").innerHTML = "GST";

        // document.getElementById("CommissionHeader").innerHTML = "GST";

        // document.getElementById("ExpensesHeader").innerHTML = "GST";

        document.getElementById("HSTAMount").value = parseFloat(5).toFixed(2);

    } else if (Province === "BC" || Province === "MB") {

        document.getElementById("HSTAMount").value = parseFloat(12).toFixed(2);

    } else if (Province === "QC") {

        document.getElementById("HSTAMount").value = parseFloat(14.975).toFixed(3);

    } else if (Province === "SK") {

        document.getElementById("HSTAMount").value = parseFloat(11).toFixed(2);

    } else if (Province === "ON") {

        // document.getElementById("CommissionHeader").innerHTML = "HST";

        // document.getElementById("ExpensesHeader").innerHTML = "HST";

        // //HST=13;

        // document.getElementById("HSTLabel").innerHTML = "HST";

        document.getElementById("HSTAMount").value = parseFloat(13).toFixed(2);

    } else if (Province === "PE" || Province === "NS" || Province === "NB" || Province === "NL") {


        //HST=15; 

        // document.getElementById("HSTLabel").innerHTML = "HST (xxxxxRT0001)";

        // document.getElementById("CommissionHeader").innerHTML = "HST";

        // document.getElementById("ExpensesHeader").innerHTML = "HST";

        document.getElementById("HSTAMount").value = parseFloat(15).toFixed(2);
    } else {

        // document.getElementById("CommissionHeader").innerHTML = "HST";

        // document.getElementById("ExpensesHeader").innerHTML = "HST";

        //HST=13;

        // document.getElementById("HSTLabel").innerHTML = "HST (xxxxxRT0001)";

        document.getElementById("HSTAMount").value = parseFloat(13).toFixed(2);
    }


    HST = document.getElementById("HSTAMount").value;

    fillHST();
}

////////////////////////////////////////////////////////////

function GetVedorsAndPurchaserForInvoice(Businessinquesries, AuthorizedSigningOfficer, FirstName, LastName) {

    var Name;

    if (document.getElementById(Businessinquesries).style.display === "none") {

        Name = document.getElementById(FirstName).value.trim() + " " + document.getElementById(LastName).value.trim();

    } //close if
    else {

        Name = document.getElementById(AuthorizedSigningOfficer).value;

    } //Close else

    return Name;

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepInvoice() {

    //TabsHandleler(event, 'TRS','tabcontent','tablinks1','TRSTab'); 

    document.getElementById("InvoiceTab").disabled = false;

    document.getElementById("TRSTab").disabled = false;
    document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
    document.getElementById('InvoiceTabIMG').classList.add('accepted');


    TabsHandleler(event, 'Referral Fee', 'tabcontent', 'tablinks1', 'ReferralFeeTab');

    TabsHandleler(event, 'Agent', 'tabcontent3', 'tablinks3', 'ReferralAgentTab');

    // setExpenses(tableExpenses, "dollar");

}

function addPercent(id) {

    document.getElementById(id).value = parseFloat(document.getElementById(id).value).toFixed(2) + '%';

    // maxlengthCheckHST(obj);
}

function fillHST() {

    HST = parseFloat(document.getElementById("HSTAMount").value).toFixed(3);

    console.log("HST AMOUNT" + HSTAMount);
    console.log("HST AMOUNT" + HSTAMount);
    console.log("HST AMOUNT" + HSTAMount);
    console.log("HST AMOUNT" + HSTAMount);
    document.getElementById('TRSListHTSPercent').value = HST + '%';
    document.getElementById('TRSSellCommissionHTSPercent').value = HST + '%';
    document.getElementById('Co-operatingBrokerageExpensesHSTPercent').value = HST + '%';
    document.getElementById('ExpensesReferralAgentHSTPercent').value = HST + '%';
    document.getElementById('CustomerHST1Percent').value = "0.00" + '%';
    document.getElementById('CustomerHST2Percent').value = "0.00" + '%';
    document.getElementById('CustomerHST3Percent').value = "0.00" + '%';
    document.getElementById('CustomerHST4Percent').value = "0.00" + '%';
    document.getElementById('AgentExpensesHST1Percent').value = HST + '%';
    // document.getElementById('AgentExpensesHST2Percent').value = HST;
    document.getElementById('AgentExpensesHST2Percent').value = HST + '%';
}



function editHST() {

    let tabOne = document.getElementById('CommisionsIncome');
    let borderTabOne = tabOne.getElementsByClassName('withBorder');
    for (let i = 0; i < borderTabOne.length; i++) {
        borderTabOne[i].classList.remove("noBorder");
        borderTabOne[i].readOnly = false;
    }

    document.getElementById('HSTHead1').style.display = '';
    document.getElementById('TRSListHTSPercentTD').style.display = '';
    document.getElementById('TRSSellCommissionHTSPercentTD').style.display = '';
    document.getElementById('EmptyPercent').style.display = '';

    document.getElementById('EditSubmit').style.display = '';
    document.getElementById('EditDiscard').style.display = '';

    document.getElementById('Editbtn').style.display = 'none';


    let tabTwo = document.getElementById('tableExpenses');
    let borderTabTwo = tabTwo.getElementsByClassName('withBorder');
    for (let i = 0; i < borderTabTwo.length; i++) {
        borderTabTwo[i].classList.remove("noBorder");
        borderTabTwo[i].readOnly = false;
    }

    document.getElementById('HSTHead').style.display = '';
    document.getElementById('Co-operatingBrokerageExpensesHSTPercentTD').style.display = '';
    document.getElementById('ExpensesReferralAgentHSTPercentTD').style.display = '';
    document.getElementById('CustomerHST1PercentTD').style.display = '';
    document.getElementById('CustomerHST2PercentTD').style.display = '';
    document.getElementById('CustomerHST3PercentTD').style.display = '';
    document.getElementById('CustomerHST4PercentTD').style.display = '';
    document.getElementById('AgentExpensesHST1PercentTD').style.display = '';
    document.getElementById('AgentExpensesHST2Percent2TD').style.display = '';
    document.getElementById('EmptyPercent2').style.display = '';
    document.getElementById('EmptyPercent3').style.display = '';
    document.getElementById('EmptyPercent4').style.display = '';

    // document.getElementById('EditSubmit2').style.display = '';
    // document.getElementById('EditDiscard2').style.display = '';

    // document.getElementById('Editbtn2').style.display = 'none';

}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextSetepDocument() {

    TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks1', 'AuditTrailTab');

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ActivateButton(id) {


    document.getElementById(id).disabled = false;

}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function TRS1() {

 alert("Hello TRS");}


function TRS(Split1, Split2, UserSplit2, UserSplit3, Cap1, Cap2, Cap3, Balance) {

    alert("Here TRS");
    
    alert("Split1"+Split1);
    
    alert("Split2"+UserSplit2);
    
    alert("Split3"+UserSplit3);

    var HST = parseFloat(document.getElementById("HSTAMount").value.replace(/,/g, ''));

    //console.log();

    var HST9 = parseFloat(document.getElementById('TRSListHTSPercent').value);

    var HST10 = parseFloat(document.getElementById('TRSSellCommissionHTSPercent').value);

    PropertyInformationForTRS();

    GetPartiesForTRS();

    alignDeposits('DepositsName1', 'DepositsName2', 'DepositsName3', 'DepositsName4');

    //Getting the values that user has entered to calculate the TRS values

    var Price = parseFloat(document.getElementById("ProPertyListingPrice").value.replace(/,/g, ''));

    var ListingPercentage = parseFloat(document.getElementById("PropertyListingComission").value.replace(/,/g, ''));

    var SellingPercentage = parseFloat(document.getElementById("PropertySellingComission").value.replace(/,/g, ''));

    var officeLeadPercentage = parseFloat(document.getElementById("OfficeLeadAllocaton").value.replace(/,/g, ''));

    var SellingOfficeLeadPercentage = (parseFloat(document.getElementById("OfficeLeadAllocatonSelling").value.replace(/,/g, '')));

    var ListingOfficeLeadPercentage = parseFloat(document.getElementById("OfficeLeadAllocatonListng").value.replace(/,/g, ''));

    var AgentcommissionPercentage1 = parseFloat(document.getElementById("FirstAgentGrossCommisionSplit").value.replace(/,/g, ''));

    var AgentcommissionPercentage2 = parseFloat(document.getElementById("SecondAgentGrossCommisionSplit").value.replace(/,/g, ''));

    //The following variables contain amounts regarding commission (Selling and Listing  commission and their HST amounts)

    var ListingCommission;

    var HSTListingCommission;

    var TotalListingCommission;

    var SellingCommission;

    var HSTSellingCommission;

    var TotalSellingCommission;

    var TotalCommissions;

    var CooperatingExpenses = 0;

    //Here are the variables to store each agent commission based various condition we have 	

    var AgentCommissionAmount1 = 0;

    var AgentCommissionAmount2 = 0;

    //All of the conditions that Affects the sell and list commissions are the type of property listing and its source which we 

    // are checking here

    var Source = document.getElementById('ProPertyListingSource').value;

    var listingType = document.getElementById('PropertyListingType').value;

    //in this if we check if it its agents own or office lead

    //Also the type of property listing will cause various commission amount which has been check one by one	




    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

        ListingCommission = 0;
        HSTListingCommission = 0;
    } //Close if
    else {

        if (document.getElementById('ListingComiissionFixedAmount').checked === true) {

            ListingCommission = ListingPercentage;
            HSTListingCommission = (ListingCommission * HST9) / 100;
        } else {
            ListingCommission = (Price * ListingPercentage) / 100;
            HSTListingCommission = (ListingCommission * HST9) / 100;
        }

    } //else


    //alert("Calculating Selling commission ");

    if (document.getElementById('SellingComiissionFixedAmount').checked === true) {

        SellingCommission = SellingPercentage;

        HSTSellingCommission = (SellingCommission * HST10) / 100;
    } else {

        SellingCommission = (Price * SellingPercentage) / 100;

        HSTSellingCommission = (SellingCommission * HST10) / 100;
    }


    TotalListingCommission = ListingCommission + HSTListingCommission;

    TotalSellingCommission = SellingCommission + HSTSellingCommission;




    //**********************************************************************************************************************************************************************************


    //Calculations


    if (listingType === "Listing-Side" || listingType === "Landlord-Side") {

        AgentCommissionAmount1 = (ListingCommission * AgentcommissionPercentage1) / 100;

        AgentCommissionAmount2 = (ListingCommission * AgentcommissionPercentage2) / 100;
    } //close  if
    else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

        AgentCommissionAmount1 = (SellingCommission * AgentcommissionPercentage1) / 100;

        AgentCommissionAmount2 = (SellingCommission * AgentcommissionPercentage2) / 100;
    } //Close else if 
    else {
        if (document.getElementById('AddAgent').checked === false) {

            //alert("No second agent. so , the first agent getting both commissions");

            AgentCommissionAmount1 = SellingCommission + ListingCommission;
            AgentCommissionAmount2 = 0;
        } //close inner if
        else {

            //alert("We have second agent, and we have to give them commissions base don their role");

            if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {
                AgentCommissionAmount1 = ListingCommission;
                AgentCommissionAmount2 = SellingCommission;
            } //Closing inner if
            else {
                AgentCommissionAmount1 = SellingCommission;
                AgentCommissionAmount2 = ListingCommission;
            } //close Agent Role else condition

        } //Close inner else

    } //Close else   

    //alert("AgentCommissionAmount1"+" "+AgentCommissionAmount1);



    /* else {
         //alert("Agents");
         AgentSplit1 = parseFloat(Split1);
         AgentSplit2 =parseFloat(Split2);
     }*/


    var Cap = 0.00;

    var Split = 0.00;

    var check = 0;

    var BrokerPortion = 0.00;

    var MyBroker = 0.00;

    var RemainingBalance = 0.00; //Cap1-Balance; //This is to check if the 

    var GrossFee = AgentCommissionAmount1;

    var Agents = 0.00;

    // alert("Balance"+" "+Balance);

    // alert("Cap1"+" "+Cap1);

    // alert("Cap2"+" "+Cap2);

    // alert("Cap3"+" "+Cap3);

    // alert("GrossFee"+" "+GrossFee);

    //Checking if we have reached first cap  


    if (Source === "Office-lead") {

        if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {

            if (document.getElementById('AddAgent').checked === false) {

                var Selling = (100 - SellingOfficeLeadPercentage) / 100;

                var listing = (100 - ListingOfficeLeadPercentage) / 100;

                var Total = ListingPercentage + SellingPercentage;

                var basedAmount = (listing * ListingPercentage) + (Selling * SellingPercentage);

                var d = listing * ListingPercentage;

                AgentSplit1 = (basedAmount / Total) * 100;

                AgentSplit2 = 0;
            } //close inner if document.getElementById('AddAgent').checked===false
            else {


                if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {

                    AgentSplit1 = 100 - (ListingOfficeLeadPercentage);

                    AgentSplit2 = 100 - (SellingOfficeLeadPercentage);
                } //Closing  if
                else {
                    AgentSplit1 = 100 - (SellingOfficeLeadPercentage);

                    AgentSplit2 = 100 - (ListingOfficeLeadPercentage);
                }

            } //else document.getElementById('AddAgent').checked===false"

        } //Close if listingType==="Sale-Double-Sided" || listingType==="Lease-DoubleSided"
        else {

            AgentSplit1 = (100 - officeLeadPercentage);

            AgentSplit2 = (100 - officeLeadPercentage);

        } //Close inner if


        if ( parseFloat( Balance.replace(/\,/g,'') ) <  parseFloat(Cap1.replace(/\,/g,'') )  ) {


            Cap = parseFloat( Cap1.replace(/\,/g,'') );

            check = 1;
        } //Closing if 
        else if ( parseFloat( Balance.replace(/\,/g,'') ) >= parseFloat( Cap1.replace(/\,/g,'') ) && parseFloat( Balance.replace(/\,/g,'') ) <  parseFloat( Cap2.replace(/\,/g,'') )  ) {

            Cap = parseFloat( Cap2.replace(/\,/g,''));

            check = 1;
        } //Close if  ,   Checking if we have reached second cap 
        
        else if ( parseFloat( Balance.replace(/\,/g,'') ) >= parseFloat( Cap2.replace(/\,/g,'') ) && parseFloat( Balance.replace(/\,/g,'') ) < parseFloat( Cap3.replace(/\,/g,'') ) ) {

            Cap = parseFloat( Cap3.replace(/\,/g,'') );

            check = 1;
        } //Closing else if 
        else {

            check = 0;

            Cap = 0;

            Split = 100;
        } // Closing else for when there is no other Cap



        Split = AgentSplit1;

    } //Close if Source === "Office-lead"
    
    else {

        if (parseFloat(Balance.replace(/\,/g,'')) < parseFloat(Cap1.replace(/\,/g,''))) {

            Cap =parseFloat( Cap1.replace(/\,/g,''));

            Split =parseFloat( Split1.replace(/\,/g,'') );

            check = 1;
        } //Closing if 
        else if (parseFloat(Balance.replace(/\,/g,'')) >= parseFloat(Cap1.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,'')) < parseFloat(Cap2.replace(/\,/g,''))) {

            Cap = parseFloat( Cap2.replace(/\,/g,'') ) ;

            Split = parseFloat( UserSplit2.replace(/\,/g,'') );

            check = 1;
        } //Close if  ,   Checking if we have reached second cap
        
        else if (parseFloat(Balance.replace(/\,/g,'').replace(/\,/g,'')) >= parseFloat(Cap2.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,'')) < parseFloat(Cap3.replace(/\,/g,''))) {

            Cap = parseFloat(  Cap3.replace(/\,/g,'') ) ;

            Split = parseFloat(  UserSplit3.replace(/\,/g,''));

            check = 1;
        } //Closing else if 
        else {

            check = 0;

            Cap = 0;

            Split = 100;
        } // Closing else for when there is no other Cap

    } //else for none office lead


    RemainingBalance = Cap -parseFloat( Balance.replace(/\,/g,'') );


    //alert("RemainingBalance"+" "+RemainingBalance);

    // alert("Split" + " " + Split);

    // alert("Cap" + " " + Cap);
    
    // alert("RemainingBalance" + " " + RemainingBalance);

    if (check == 1) {

        var myCommission = GrossFee;

        MyBroker = (myCommission * (100 - Split)) / 100;

        if (MyBroker > RemainingBalance) {

            var mySplit = (100 - Split) / 100;

            var Temp = RemainingBalance / (mySplit);

            var TempCommission = GrossFee - Temp;

            var newTempCap = 0;

            if (Cap ==  parseFloat(  Cap1.replace(/\,/g,''))) {
            	
                if (parseFloat( Cap2.replace(/\,/g,'')) > 0) {
                	
                    newTempCap = (100 - parseFloat(  UserSplit2.replace(/\,/g,'')) ) / 100;
                    
                    Cap =  parseFloat( Cap2.replace(/\,/g,'') ) ;
                    
                    BrokerPortion = (TempCommission * newTempCap) + RemainingBalance;
                    
                } else {
                	
                    BrokerPortion = RemainingBalance;
                }


            } else if (Cap ==  parseFloat( Cap2.replace(/\,/g,'')) ) {

                if ( parseFloat( Cap3.replace(/\,/g,'')) > 0) {
                	
                    newTempCap = (100 -  parseFloat( UserSplit3.replace(/\,/g,'')) ) / 100;
                    
                    Cap = parseFloat(Cap3.replace(/\,/g,''));
                    
                    BrokerPortion = (TempCommission * newTempCap) + RemainingBalance;
                    
                } else {
                	
                    BrokerPortion = RemainingBalance;
                }

            } else {}

        } //Closing if  MyBroker > RemainingBalance   

        if (MyBroker <= RemainingBalance) {

            BrokerPortion = MyBroker;


        }


        // RemainingBalance=Cap-Balance;

    } // Close if check==1
    else {

        MyBroker = 0;

        BrokerPortion = MyBroker;

        Brokers = MyBroker;

        //Balance=Balance+BrokerPortion;

        RemainingBalance = 0;
    }

    Agents = (GrossFee - BrokerPortion);

    var MySplit = (Agents * 100) / GrossFee;


    //Setting up the amounts for the agent table in the TRS	

    var AgentName1 = document.getElementById("FirstAgentID").value;

    var result = AgentName1.split(" ");

    document.getElementById("TRSAgentName1").value = result[1] + " " + result[2];

    document.getElementById("TRSAgentCommision1").value = parseFloat(AgentCommissionAmount1).toLocaleString(undefined, {

        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });;

    var AgentSplit1 = 0;

    var AgentSplit2 = 0;

    if (document.getElementById('AddAgent').checked === false) {

        document.getElementById("Agent2Details").style.display = "none";

        document.getElementById("AgentsAllocationHeader").style.display = "none";

        document.getElementById("AgentAllocationRow1").style.display = "none";

        document.getElementById("AgentAllocationRow2").style.display = "none";

        document.getElementById("AgentAllocationRowTotal").style.display = "none";

        document.getElementById("Allocation1").value = parseFloat(AgentcommissionPercentage1).toFixed(2) + '%';

        document.getElementById("Allocation2").value = parseFloat(AgentcommissionPercentage2).toFixed(2) + '%';


    } else {


        document.getElementById("Agent2Details").style.display = "";

        document.getElementById("AgentsAllocationHeader").style.display = "";

        document.getElementById("AgentAllocationRow1").style.display = "";

        document.getElementById("AgentAllocationRow2").style.display = "";

        document.getElementById("AgentAllocationRowTotal").style.display = "";

        document.getElementById("Allocation1").value = parseFloat(AgentcommissionPercentage1).toFixed(2) + '%';

        document.getElementById("Allocation2").value = parseFloat(AgentcommissionPercentage2).toFixed(2) + '%';


    }





    //alert("Calculation of agent split is done");

    var TRSAgentNet1 = (GrossFee * MySplit) / 100; //Calculating agent net amount based on the split amount

    var TRSAgentNet2 = (AgentCommissionAmount2 * AgentSplit2) / 100; //Calculating agent net amount based on the split amount

    document.getElementById("TRSAgentNet1").value = parseFloat(TRSAgentNet1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentName2").value = document.getElementById("SecondAgentID").value;

    document.getElementById("TRSSplit2").value = parseFloat(AgentSplit2).toFixed(2) + '%';

    document.getElementById("TRSSplit1").value = parseFloat(MySplit).toFixed(2) + '%';

    document.getElementById("TRSAgentCommision2").value = parseFloat(AgentCommissionAmount2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentNet2").value = parseFloat(TRSAgentNet2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentCommision3").value = parseFloat(AgentCommissionAmount2 + AgentCommissionAmount1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentNet3").value = parseFloat(TRSAgentNet2 + TRSAgentNet1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSListCommission").value = parseFloat(ListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSListHTS").value = parseFloat(HSTListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalListCommission").value = parseFloat(TotalListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSSellCommission").value = parseFloat(SellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSSellCommissionHTS").value = parseFloat(HSTSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalSellCommission").value = parseFloat(TotalSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalCommissions").value = parseFloat(ListingCommission + SellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotaHST").value = parseFloat(HSTListingCommission + HSTSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalFinalCommissions").value = parseFloat(TotalSellingCommission + TotalListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // var Agentname1 = document.getElementById("FirstAgentID").value;

    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType ==="BuyerSide-Self-Represented-Vendor" || listingType ==="TenantSide-Self-Represented-Landlord") {
        document.getElementById("TRSSellCommissionName").value = document.getElementById("bnHidden").value;
    }else if(listingType === "Listing-Side" || listingType === "Landlord-Side"){
        document.getElementById("TRSListCommissionName").value = document.getElementById("bnHidden").value;
        document.getElementById("TRSSellCommissionName").value = document.getElementById("Brokername").value;
    }else{
        document.getElementById("TRSListCommissionName").value = document.getElementById("bnHidden").value;
        document.getElementById("TRSSellCommissionName").value = document.getElementById("bnHidden").value;
    }

    //Calculating the total Commission amounts and HST	

    var totalIncomeHST = HSTListingCommission + HSTSellingCommission;

    var TotalPurAmountIncome = ListingCommission + SellingCommission;

    TotalCommissions = TotalSellingCommission + TotalListingCommission;
    
    var Deposits = DepositsForTRS();

    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

        CooperatingExpenses = 0;

        document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(TotalSellingCommission).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
        document.getElementById("ReceivableLabel").innerHTML = "Receivable";

        document.getElementById("List").style.display = "none";

    } else {

        //CooperatingExpenses=SellingCommission;

        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";

        document.getElementById("List").style.display = "";

        if (Deposits > TotalCommissions) {

            //alert("Deposit Exceed Commission");

            var amount = -(TotalCommissions - Deposits);

            document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            document.getElementById("ReceivableLabel").innerHTML = "Refund";
        } //Close if
        else {

            //alert("No exceed"); 

            var amount = TotalCommissions - Deposits;

            document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            document.getElementById("ReceivableLabel").innerHTML = "Receivable";
        } //Close inner else

    } //close else

    //------------------------------------------------------------------------    


    if (listingType === "Lease-DoubleSided" || listingType === "Sale-Double-Sided") {

        //alert("No Brokerage expenses on Lease-DoubleSided or Sale-Double-Sided ");
        // document.getElementById("OtherBrokerageDisplay").style.display ="none"; 

        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";

        CooperatingExpenses = 0;

    } //Closing if
    else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {


        //alert("No Brokerage expenses on Buyer-Side or Tenant-Side ");

        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";

        CooperatingExpenses = 0;

        //document.getElementById("OtherBrokerage").style.display =""; 

    } else {

        //alert("Brokerage Expenses");

        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";

        // document.getElementById("OtherBrokerageDisplay").style.display ="";

        CooperatingExpenses = SellingCommission;
    } //Closing else

    if (document.getElementById('DepositsName1').value == '' || document.getElementById('DepositAmount1').value == 0 || document.getElementById('DepositAmount1').value == "") {
        document.getElementById('DepositsName1').value = 'No Deposit';
        document.getElementById('DepositsDate1').value = '';
    }

    //alert("Expenses");

    TRSExpenses(CooperatingExpenses, TRSAgentNet1, TRSAgentNet2, TotalPurAmountIncome, totalIncomeHST, TotalCommissions);


    colorTable();

    ListingTypeTRS();
    
    //alert("Expenses has been called");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function TRSFinal( HST1, HST2, HST3, HST4, HST5, HST6, HST7, HST8 , HST9, HST10 , Payment1, Payment2 , Payment3 , Payment4 , Payment5 , Payment6, Payment7 , Payment8 ,Payment9 , Payment10, NetPurAmount,NetHST,NetTotal,Split1,Split2 , Agent1 , Agen1Commission   ){

	   //alert("Final Deal");
	
	   var Value9= ( parseFloat(Payment9.replace(/\,/g,'')) * parseFloat(HST9.replace(/\,/g,'')) )/100;
	
	   var Value10= ( parseFloat(Payment10.replace(/\,/g,'')) * parseFloat(HST10.replace(/\,/g,'')) )/100;	
	
	   var TotalCommissions=Value10+Value9+parseFloat(Payment9.replace(/\,/g,''))+parseFloat(Payment10.replace(/\,/g,''));	
	   
	       if (document.getElementById("AddNewAgent").style.display === "block") {

        //alert("section10");

        document.getElementById("ExpensesAgent2").style.display = ""; }else {  document.getElementById("ExpensesAgent2").style.display = "none";}
	  
	    PropertyInformationForTRS();

	    GetPartiesForTRS();

	    alignDeposits('DepositsName1', 'DepositsName2', 'DepositsName3', 'DepositsName4');
	    
	    var Source = document.getElementById('ProPertyListingSource').value;

	    var listingType = document.getElementById('PropertyListingType').value;
	
	
	  if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType ==="BuyerSide-Self-Represented-Vendor" || listingType ==="TenantSide-Self-Represented-Landlord") {
	        document.getElementById("TRSSellCommissionName").value = document.getElementById("bnHidden").value;
	    }else if(listingType === "Listing-Side" || listingType === "Landlord-Side"){
	        document.getElementById("TRSListCommissionName").value = document.getElementById("bnHidden").value;
	        document.getElementById("TRSSellCommissionName").value = document.getElementById("Brokername").value;
	    }else{
	        document.getElementById("TRSListCommissionName").value = document.getElementById("bnHidden").value;
	        document.getElementById("TRSSellCommissionName").value = document.getElementById("bnHidden").value;
	    }

	    //Calculating the total Commission amounts and HST	

	    var Deposits = DepositsForTRS();

	    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

	        CooperatingExpenses = 0;

	        document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(Value10+Payment10).toLocaleString(undefined, {
	            minimumFractionDigits: 2,
	            maximumFractionDigits: 2
	        });
	        document.getElementById("ReceivableLabel").innerHTML = "Receivable";

	        document.getElementById("List").style.display = "none";

	    } else {

	        //CooperatingExpenses=SellingCommission;

	        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";

	        document.getElementById("List").style.display = "";

	        if (Deposits > TotalCommissions) {

	            //alert("Deposit Exceed Commission");

	            var amount = -(TotalCommissions - Deposits);

	            document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
	                minimumFractionDigits: 2,
	                maximumFractionDigits: 2
	            });
	            document.getElementById("ReceivableLabel").innerHTML = "Refund";
	        } //Close if
	        else {

	            var amount = TotalCommissions - Deposits;

	            document.getElementById("ReciveOrRefoundAmount").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
	                minimumFractionDigits: 2,
	                maximumFractionDigits: 2
	            });
	            document.getElementById("ReceivableLabel").innerHTML = "Receivable";
	        } //Close inner else

	    } //close else

	    //------------------------------------------------------------------------    


	    if (listingType === "Lease-DoubleSided" || listingType === "Sale-Double-Sided") {

	        //alert("No Brokerage expenses on Lease-DoubleSided or Sale-Double-Sided ");
	        // document.getElementById("OtherBrokerageDisplay").style.display ="none"; 

	        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";

	        CooperatingExpenses = 0;

	    } //Closing if
	    else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {


	        //alert("No Brokerage expenses on Buyer-Side or Tenant-Side ");

	        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";

	        CooperatingExpenses = 0;

	        //document.getElementById("OtherBrokerage").style.display =""; 

	    } else {

	        //alert("Brokerage Expenses");

	        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";

	       

	        CooperatingExpenses =Payment1;
	    } //Closing else

	    if (document.getElementById('DepositsName1').value == '' || document.getElementById('DepositAmount1').value == 0 || document.getElementById('DepositAmount1').value == "") {
	        document.getElementById('DepositsName1').value = 'No Deposit';
	        document.getElementById('DepositsDate1').value = '';
	    }


	var Value1= ( parseFloat(Payment1.replace(/\,/g,''))  * parseFloat(HST1.replace(/\,/g,'')) )/100;
	
	var Value2= ( parseFloat(Payment2.replace(/\,/g,'')) * parseFloat(HST2.replace(/\,/g,'')) )/100;
	
	var Value3= ( parseFloat(Payment3.replace(/\,/g,'')) * parseFloat(HST3.replace(/\,/g,'')) )/100;
	
	var Value4= ( parseFloat(Payment4.replace(/\,/g,'')) * parseFloat(HST4.replace(/\,/g,'')) )/100;
    	
	var Value5= ( parseFloat(Payment5.replace(/\,/g,'')) * parseFloat(HST5.replace(/\,/g,'')) )/100;
    	
	var Value6= ( parseFloat(Payment6.replace(/\,/g,'')) * parseFloat(HST6.replace(/\,/g,'')) )/100;	
	
	var Value7= ( parseFloat(Payment7.replace(/\,/g,'')) * parseFloat(HST7.replace(/\,/g,'')) )/100;
    	
	var Value8= ( parseFloat(Payment8.replace(/\,/g,'')) * parseFloat(HST8.replace(/\,/g,'')) )/100;	
	

	
	
    document.getElementById('Co-operatingBrokerageExpensesNet').value=Payment1;
		 
    document.getElementById('ExpensesReferralAgentNet').value=Payment2;	 
	
    document.getElementById('CustomerNet1').value=Payment3;	
	
    document.getElementById('CustomerNet2').value=Payment4;	
    
    document.getElementById('CustomerNet3').value=Payment5;	
    
    document.getElementById('CustomerNet4').value=Payment6;	
    
    document.getElementById('AgentExpensesNet1').value=Payment7;	
    
    document.getElementById('AgentExpensesNet2').value=Payment8;	
	
    document.getElementById('TRSListCommission').value=Payment9;	
    
    document.getElementById('TRSSellCommission').value=Payment10;	
    
    
    document.getElementById('Co-operatingBrokerageExpensesHST').value=Value1;
	 
    document.getElementById('ExpensesReferralAgentHST').value=Value2;	 
	
    document.getElementById('CustomerHST1').value=Value3;	
	
    document.getElementById('CustomerHST2').value=Value4;	
    
    document.getElementById('CustomerHST3').value=Value5;	
    
    document.getElementById('CustomerHST4').value=Payment6;	
    
    document.getElementById('AgentExpensesHST1').value=Value7;	
    
    document.getElementById('AgentExpensesHST2').value=Value8;	
	
    document.getElementById('TRSListHTS').value=Value9;	
    
    document.getElementById('TRSSellCommissionHTS').value=Value10;	
    
    
    document.getElementById('TRSTotalCommissions').value=parseFloat(Payment9.replace(/\,/g,''))+parseFloat(Payment10.replace(/\,/g,''));	
	
    document.getElementById('TRSTotaHST').value=Value9+Value10;	
    
    document.getElementById('TRSTotalFinalCommissions').value=TotalCommissions;		
    
    
    
    document.getElementById('Co-operatingBrokerageExpensesTotalAmount').value=Value1+parseFloat(Payment1.replace(/\,/g,''));
	 
    document.getElementById('ExpensesReferralAgentTotalAmount').value=Value2+parseFloat(Payment2.replace(/\,/g,''));	 
	
    document.getElementById('CustomerTotalAmount1').value=Value3+parseFloat(Payment3.replace(/\,/g,''));	
	
    document.getElementById('CustomerTotalAmount2').value=Value4+parseFloat(Payment4.replace(/\,/g,''));	
    
    document.getElementById('CustomerTotalAmount3').value=Value5+parseFloat(Payment5.replace(/\,/g,''));	
    
    document.getElementById('CustomerTotalAmount4').value=Value6+parseFloat(Payment6.replace(/\,/g,''));	
    
    document.getElementById('AgentExpensesTotalAmount1').value=Value7+parseFloat(Payment7.replace(/\,/g,''));	
    
    document.getElementById('AgentExpensesTotalAmount2').value=Value8+parseFloat(Payment8.replace(/\,/g,''));	
	
    document.getElementById('TRSTotalListCommission').value=Value9+parseFloat(Payment9.replace(/\,/g,''));	
    
    document.getElementById('TRSTotalSellCommission').value=Value10+parseFloat(Payment10.replace(/\,/g,''));	
    
    
    
    var AgentName1 = document.getElementById("FirstAgentID").value;

    var result = AgentName1.split(" ");

    document.getElementById("TRSAgentName1").value = result[1] + " " + result[2];
    
    document.getElementById('Allocation1').value="100%";	
    
    document.getElementById('TRSAgentCommision1').value=Agen1Commission;	
	
    document.getElementById('TRSSplit1').value=Split1;	
    
    document.getElementById('TRSAgentNet1').value=(    parseFloat(Agen1Commission.replace(/\,/g,'')) * parseFloat(Split1.replace(/\,/g,'')))/100;	
    
    
    
   /* document.getElementById('TRSAgentName1').value=Value7+parseFloat(Payment7);	
    
    document.getElementById('Allocation1').value=Value7+parseFloat(Payment7);	
    
    document.getElementById('TRSAgentCommision1').value=Value8+parseFloat(Payment8);	
	
    document.getElementById('TRSSplit1').value=Value9+parseFloat(Payment9);	
    
    document.getElementById('TRSAgentNet1').value=Value10+parseFloat(Payment10); */
    
    
    document.getElementById('TotalNetToBrokeragePurAmounts').value=NetPurAmount;	
	
    document.getElementById('HSTNetToBrokerageAmounts').value=NetHST;	
    
    document.getElementById('TotalNetToBrokerageAmount').value=NetTotal;	
    
    
    document.getElementById('TotalExpensesPurAmounts').value=parseFloat(Payment8.replace(/\,/g,''))+parseFloat(Payment7.replace(/\,/g,''))+parseFloat(Payment6.replace(/\,/g,''))+parseFloat(Payment5.replace(/\,/g,''))+parseFloat(Payment4.replace(/\,/g,''))+parseFloat(Payment3.replace(/\,/g,''))+parseFloat(Payment2.replace(/\,/g,''))+parseFloat(Payment1.replace(/\,/g,''));	
	
    document.getElementById('HSTExpensesAmounts').value=Value8+Value7+Value6+Value5+Value4+Value3+Value2+Value1;	
    
    document.getElementById('TotalExpensesAmount').value=Value8+Value7+Value6+Value5+Value4+Value3+Value2+Value1+parseFloat(Payment8.replace(/\,/g,''))+parseFloat(Payment7.replace(/\,/g,''))+parseFloat(Payment6.replace(/\,/g,''))+parseFloat(Payment5.replace(/\,/g,''))+parseFloat(Payment4.replace(/\,/g,''))+parseFloat(Payment3.replace(/\,/g,''))+parseFloat(Payment2.replace(/\,/g,''))+parseFloat(Payment1.replace(/\,/g,''));
    
    colorTable();

    ListingTypeTRS(); 
    
    
    
    let RebateFee1 = parseFloat(document.getElementById("FirstRebateAmount").value);
    let RebateFee2 = 0;
    let RebateFee3 = 0;
    let RebateFee4 = 0;

    if (RebateFee1 === 0 || RebateFee1 === null || !RebateFee1 || RebateFee1 === " ") {
        document.getElementById("Expensescustomer1").style.display = "none";
    } else {
        document.getElementById("Expensescustomer1").style.display = "";
    }

    if (document.getElementById("SecondRebate").style.display === "block") {
        RebateFee2 = parseFloat(document.getElementById("SecondRebateAmount").value);
        document.getElementById("Expensescustomer2").style.display = "";
    } else {
        RebateFee2 = 0;
        document.getElementById("Expensescustomer2").style.display = "none";
    }

    if (document.getElementById("ThirdRebate").style.display === "block") {
        RebateFee3 = parseFloat(document.getElementById("ThirdRebateAmount").value);
        document.getElementById("Expensescustomer3").style.display = "";
    } else {
        RebateFee3 = 0;
        document.getElementById("Expensescustomer3").style.display = "none";
    }

    if (document.getElementById("ForthRebate").style.display === "block") {
        RebateFee4 = parseFloat(document.getElementById("ForthRebateAmount").value);
        document.getElementById("Expensescustomer4").style.display = "";
    } else {
        RebateFee4 = 0;
        document.getElementById("Expensescustomer4").style.display = "none";
    }
    
    
 
 var ReferralFee=parseFloat(document.getElementById("ReferralFeeAmount").value);
 
 
   if (ReferralFee === 0 || ReferralFee === null || ReferralFee === " " || !ReferralFee) {

        document.getElementById("ExpensesReferral").style.display = "none";

      

    } else {   document.getElementById("ExpensesReferral").style.display = "Block"; }
    

    
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ListingTypeTRS() {

    var type = document.getElementById("PropertyListingType").value;
    if (((type === 'Landlord-Side') || (type === 'Tenant-Side') || (type === 'Lease-DoubleSided') || (type === 'TenantSide-Self-Represented-Landlord'))) {
        document.getElementById('VendorLandlord1').value = 'Landlord';
        document.getElementById('VendorLandlord2').value = 'Landlord';
        document.getElementById('VendorLandlord3').value = 'Landlord';
        document.getElementById('VendorLandlord4').value = 'Landlord';
        document.getElementById('PurchaserTenant1').value = 'Tenant';
        document.getElementById('PurchaserTenant2').value = 'Tenant';
        document.getElementById('PurchaserTenant3').value = 'Tenant';
        document.getElementById('PurchaserTenant4').value = 'Tenant';
    } else {
        document.getElementById('VendorLandlord1').value = 'Vendor';
        document.getElementById('VendorLandlord2').value = 'Vendor';
        document.getElementById('VendorLandlord3').value = 'Vendor';
        document.getElementById('VendorLandlord4').value = 'Vendor';
        document.getElementById('PurchaserTenant1').value = 'Purchaser';
        document.getElementById('PurchaserTenant2').value = 'Purchaser';
        document.getElementById('PurchaserTenant3').value = 'Purchaser';
        document.getElementById('PurchaserTenant4').value = 'Purchaser';
    }

}

function GetVedorsAndPurchaserForTRS(Businessinquesries, AuthorizedSigningOfficer, FirstName, LastName, BusinessName, StreetNumber, StreetName, City, Province, Phone, TRSName, TRSAddress, TRSPhone, TRSCompany, UnitNumber, PostalCode, OtherProvince) {

    if (document.getElementById(Businessinquesries).style.display === "none") {

        //alert("FirstNAme");

        document.getElementById(TRSName).value = document.getElementById(FirstName).value.trim() + " " + document.getElementById(LastName).value.trim();

    } //close if
    else {

        //alert("Business");

        document.getElementById(TRSName).value = document.getElementById(AuthorizedSigningOfficer).value;

    } //Close else

    document.getElementById(TRSCompany).value = document.getElementById(BusinessName).value;
    if (document.getElementById(Province).value == "Other") {
        if (document.getElementById(UnitNumber).value) {
            document.getElementById(TRSAddress).value = document.getElementById(UnitNumber).value.trim() + " - " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(OtherProvince).value.trim() + ', ' + document.getElementById(PostalCode).value.trim();
        } else {
            document.getElementById(TRSAddress).value = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(OtherProvince).value.trim() + ', ' + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
        }
    } else {
        if (document.getElementById(UnitNumber).value) {
            document.getElementById(TRSAddress).value = document.getElementById(UnitNumber).value.trim() + " - " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
        } else {
            document.getElementById(TRSAddress).value = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
        }
    }

    document.getElementById(TRSPhone).value = document.getElementById(Phone).value;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function GetPartiesForTRS() {

    //alert("Hello Parties");

    var listingType = document.getElementById('PropertyListingType').value;

    //alert("This is listing Type:"+" "+listingType);

    GetVedorsAndPurchaserForTRS('VendorBusinessinquiries1', 'VendorAuthorizedSigningOfficer1', 'VendorFirstName1', 'VendorLastName1', 'VendorBusinessName1', 'VendorStreetNumber1', 'VendorStreetName1', 'VendorCity1', 'VendorProvince1', 'VendorPhone1', 'TRSVendorName1', 'TRSVendorAddress1', 'TRSVendorPhone1', 'TRSVendorCompany1', 'VendorUnit1', 'VendorPostalCode1', 'VendorOtherProvince1');

    //alert("Going for Vendor/Landlord2");

    //alert("vendor2"+" "+document.getElementById("Vendor2").style.display);

    //console.log("vendor2"+" "+document.getElementById("Vendor2").style.display);

    if (document.getElementById("Vendor2").style.display === "block") {

        GetVedorsAndPurchaserForTRS('VendorBusinessinquiries2', 'VendorAuthorizedSigningOfficer2', 'VendorFirstName2', 'VendorLastName2', 'VendorBusinessName2', 'VendorStreetNumber2', 'VendorStreetName2', 'VendorCity2', 'VendorProvince2', 'VendorPhone2', 'TRSVendorName2', 'TRSVendorAddress2', 'TRSVendorPhone2', 'TRSVendorCompany2', 'VendorUnit2', 'VendorPostalCode2', 'VendorOtherProvince2');

        //alert("Showing vendor2");

        document.getElementById("displayVendor2").style.display = "";
    } //Close Vendor2 #if
    else {
        document.getElementById("displayVendor2").style.display = "none";
    } //close else	



    //alert("vendor3"+" "+document.getElementById("Vendor3").style.display);

    if (document.getElementById("Vendor3").style.display === "block") {

        //alert("Showing vendor3");

        GetVedorsAndPurchaserForTRS('VendorBusinessinquiries3', 'VendorAuthorizedSigningOfficer3', 'VendorFirstName3', 'VendorLastName3', 'VendorBusinessName3', 'VendorStreetNumber3', 'VendorStreetName3', 'VendorCity3', 'VendorProvince3', 'VendorPhone3', 'TRSVendorName3', 'TRSVendorAddress3', 'TRSVendorPhone3', 'TRSVendorCompany3', 'VendorUnit3', 'VendorPostalCode3', 'VendorOtherProvince3');

        document.getElementById("displayVendor3").style.display = "";
    } //Close Vendor3 #if
    else {
        document.getElementById("displayVendor3").style.display = "none";
    } //Close else 	


    //alert("vendor4"+" "+document.getElementById("Vendor4").style.display);

    if (document.getElementById("Vendor4").style.display === "block") {

        //alert("Showing vendor4");

        GetVedorsAndPurchaserForTRS('VendorBusinessinquiries4', 'VendorAuthorizedSigningOfficer4', 'VendorFirstName4', 'VendorLastName4', 'VendorBusinessName4', 'VendorStreetNumber4', 'VendorStreetName4', 'VendorCity4', 'VendorProvince4', 'VendorPhone4', 'TRSVendorName4', 'TRSVendorAddress4', 'TRSVendorPhone4', 'TRSVendorCompany4', 'VendorUnit4', 'VendorPostalCode4', 'VendorOtherProvince4');

        document.getElementById("displayVendor4").style.display = "";
    } //Close Vendor4 #if
    else {
        document.getElementById("displayVendor4").style.display = "none";
    } //Close else		

    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    GetVedorsAndPurchaserForTRS('PurchaserBusinessinquiries1', 'PurchaserAuthorizedSigningOfficer1', 'PurchaserFirstName1', 'PurchaserLastName1', 'PurchaserBusinessName1', 'PurchaserStreetNumber1', 'purchaserStreetName1', 'PurchaserCity1', 'PurchaserProvince1', 'PurchaserPhone1', 'TRSPurchaserName1', 'TRSPurchaserAddress1', 'TRSPurchaserPhone1', 'TRSPurchaserCompany1', 'PurchaserUnit1', 'PurchaserPostalCode1', 'PurchaserOtherProvince1');


    if (document.getElementById("puchaser2").style.display === "block") {
        GetVedorsAndPurchaserForTRS('PurchaserBusinessinquiries2', 'PurchaserAuthorizedSigningOfficer2', 'PurchaserFirstName2', 'PurchaserLastName2', 'PurchaserBusinessName2', 'PurchaserStreetNumber2', 'purchaserStreetName2', 'PurchaserCity2', 'PurchaserProvince2', 'PurchaserPhone2', 'TRSPurchaserName2', 'TRSPurchaserAddress2', 'TRSPurchaserPhone2', 'TRSPurchaserCompany2', 'PurchaserUnit2', 'PurchaserPostalCode2', 'PurchaserOtherProvince2');
        document.getElementById("DisplayPurchaser2").style.display = "";
    } ////Close Purchaser2 #if 
    else {
        document.getElementById("DisplayPurchaser2").style.display = "none";
    }


    if (document.getElementById("puchaser3").style.display === "block") {
        GetVedorsAndPurchaserForTRS('PurchaserBusinessinquiries3', 'PurchaserAuthorizedSigningOfficer3', 'PurchaserFirstName3', 'PurchaserLastName3', 'PurchaserBusinessName3', 'PurchaserStreetNumber3', 'purchaserStreetName3', 'PurchaserCity3', 'PurchaserProvince1', 'PurchaserPhone3', 'TRSPurchaserName3', 'TRSPurchaserAddress3', 'TRSPurchaserPhone3', 'TRSPurchaserCompany3', 'PurchaserUnit3', 'PurchaserPostalCode3', 'PurchaserOtherProvince3');
        document.getElementById("DisplayPurchaser3").style.display = "";
    } ////Close Purchaser3 #if 
    else {
        document.getElementById("DisplayPurchaser3").style.display = "none";
    }


    if (document.getElementById("puchaser4").style.display === "block") {
        GetVedorsAndPurchaserForTRS('PurchaserBusinessinquiries4', 'PurchaserAuthorizedSigningOfficer4', 'PurchaserFirstName4', 'PurchaserLastName4', 'PurchaserBusinessName4', 'PurchaserStreetNumber4', 'purchaserStreetName4', 'PurchaserCity4', 'PurchaserProvince4', 'PurchaserPhone4', 'TRSPurchaserName4', 'TRSPurchaserAddress4', 'TRSPurchaserPhone4', 'TRSPurchaserCompany4', 'PurchaserUnit4', 'PurchaserPostalCode4', 'PurchaserOtherProvince4');
        document.getElementById("DisplayPurchaser4").style.display = "";
    } ////Close Purchaser4 #if 
    else {
        document.getElementById("DisplayPurchaser4").style.display = "none";
    }


    //alert(" Parties To complete");

    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    document.getElementById("displayPurchaserLawyer").style.display = "none";

    if (document.getElementById('PurchaserLawyerFirm').value) {
        document.getElementById("displayPurchaserLawyer").style.display = "";
    }

    if (listingType === "Tenant-Side" || listingType === "Landlord-Side" || listingType === "Lease-DoubleSided" || listingType === "TenantSide-Self-Represented-Landlord") {

        //console.log("No Lawyer");
        document.getElementById("displayPurchaserLawyer").style.display = "none";
        document.getElementById("displayVendorlawyer").style.display = "none";


    } //Close If
    else {

        //alert("YES");

        //console.log("Showing Lawyers");

        document.getElementById("displayVendorlawyer").style.display = "";

        if (document.getElementById('PurchaserLawyerFirm').value) {
            document.getElementById("displayPurchaserLawyer").style.display = "";
        }



        document.getElementById("TRSVendorLawyerName").value = document.getElementById("VendorLawyerName").value;

        document.getElementById("TRSVendorLawyerCompany").value = document.getElementById("VendorLawyerFirm").value;

        if (document.getElementById('VendorLawyerUnit').value) {

            document.getElementById("TRSVendorLawyerAddress").value = document.getElementById('VendorLawyerUnit').value + ' - ' + document.getElementById("VendorLawyerStreetNumber").value + ' ' + document.getElementById("VendorLawyerStreetName").value + ', ' + document.getElementById("VendorLawyerCity").value + ', ' + document.getElementById("VendorLawyerProvince").value + ', ' + document.getElementById("VendorLawyerPostalCode").value;

        } else {

            document.getElementById("TRSVendorLawyerAddress").value = document.getElementById("VendorLawyerStreetNumber").value + ' ' + document.getElementById("VendorLawyerStreetName").value + ', ' + document.getElementById("VendorLawyerCity").value + ', ' + document.getElementById("VendorLawyerProvince").value + ', ' + document.getElementById("VendorLawyerPostalCode").value;
        }

        document.getElementById("TRSVendorLawyerPhone").value = document.getElementById("VendorLawyerPhone").value;

        document.getElementById("TRSPurchaserLawyerName").value = document.getElementById("PurchaserLawyerName").value;

        document.getElementById("TRSPurchaserLawyerCompany").value = document.getElementById("PurchaserLawyerFirm").value;

        if (document.getElementById('PurchaserLawyerUnit').value) {

            document.getElementById("TRSPurchaserLawyerAddress").value = document.getElementById('PurchaserLawyerUnit').value + ' - ' + document.getElementById("PurchaserLawyerStreetNumber").value + ' ' + document.getElementById("PurchaserLawyerStreetName").value + ', ' + document.getElementById("PurchaserLawyerCity").value + ', ' + document.getElementById("PurchaserLawyerProvince").value + ', ' + document.getElementById("PurchaserLawyerPostalCode").value;

        } else {

            document.getElementById("TRSPurchaserLawyerAddress").value = document.getElementById("PurchaserLawyerStreetNumber").value + ' ' + document.getElementById("PurchaserLawyerStreetName").value + ', ' + document.getElementById("PurchaserLawyerCity").value + ', ' + document.getElementById("PurchaserLawyerProvince").value + ', ' + document.getElementById("PurchaserLawyerPostalCode").value;

        }

        document.getElementById("TRSPurchaserLawyerPhone").value = document.getElementById("PurchaserLawyerPhone").value;
    } //Close else

    //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    if (listingType === "Lease-DoubleSided" || listingType === "Sale-Double-Sided" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord" || listingType === "TenantSide-Self-Represented") {

        //alert("No Other Brokerage");

        document.getElementById("OtherBrokerageDisplay").style.display = "none";

    } //Closing if
    else {

        //alert("getting Other Brokerage");

        document.getElementById("OtherBrokerageDisplay").style.display = "";

        document.getElementById("TRSOtherBrokerageName").value = document.getElementById("CooperatingAgentName").value;

        document.getElementById("TRSOtherBrokerageCompany").value = document.getElementById("Brokername").value;

        if (document.getElementById("CooperatingUnit").value) {

            document.getElementById("TRSOtherBrokerageAddress").value = document.getElementById("CooperatingUnit").value + " - " + document.getElementById("CooperatingStreetNumber").value + " " + document.getElementById("COOPERATINGBROKERAGEstreetName").value + ", " + document.getElementById("CooperatingCity").value + ", " + document.getElementById("CooperatingProvince").value + ", " + document.getElementById("CooperatingPostalCode").value;

        } else {

            document.getElementById("TRSOtherBrokerageAddress").value = document.getElementById("CooperatingStreetNumber").value + " " + document.getElementById("COOPERATINGBROKERAGEstreetName").value + ", " + document.getElementById("CooperatingCity").value + ", " + document.getElementById("CooperatingProvince").value + ", " + document.getElementById("CooperatingPostalCode").value;
        }
        document.getElementById("TRSOtherBrokeragePhone").value = document.getElementById("CO-OPERATINGBROKERAGEPhone").value;

        //alert("finished  Parties "); 

    } //Closing else

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PropertyInformationForTRS() {

    //alert("Property Details For TRS");

    document.getElementById("TRSPrice").innerHTML = '$' + parseFloat(document.getElementById("ProPertyListingPrice").value).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    if (document.getElementById("ListingComiissionPercentage").checked == true) {
        document.getElementById("TRSListCommissionPercent").innerHTML = document.getElementById("PropertyListingComission").value + "%";
    } else {
        document.getElementById("TRSListCommissionPercent").innerHTML = "$" + document.getElementById("PropertyListingComission").value;
    }



    if (document.getElementById("SellingComiissionPercentage").checked == true) {

        document.getElementById("TRSSellCommissionPercent").innerHTML = document.getElementById("PropertySellingComission").value + "%";
    } else {
        document.getElementById("TRSSellCommissionPercent").innerHTML = "$" + document.getElementById("PropertySellingComission").value;
    }


    if (document.getElementById("PropertyListingType").value == 'BuyerSide-Self-Represented-Vendor') {
        document.getElementById("TRSListingSide").innerHTML = 'Tenant Side SRV';
    } else if (document.getElementById("PropertyListingType").value == 'TenantSide-Self-Represented-Landlord') {
        document.getElementById("TRSListingSide").innerHTML = 'Tenant Side SRL';
    } else {
        document.getElementById("TRSListingSide").innerHTML = document.getElementById("PropertyListingType").value;
    }

    document.getElementById("TRSSource").innerHTML = document.getElementById("ProPertyListingSource").value.replace('-', ' ');

    //console.log("Just to check");

    document.getElementById("TRSStatus").innerHTML = document.getElementById("PropertyListingStatus").value;


    document.getElementById("TRSClosingDate").innerHTML = document.getElementById("PropertyClosingDate").value;


    document.getElementById("TRSMLS").innerHTML = document.getElementById("MLSNumber").value;

    //alert("finished setting Property detail information");

    //document.getElementById("TRSListingdate").value=document.getElementById("PropertyListingDate").value;	

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function DepositsForTRS() {

    //alert("Deposit function");

    var listingType = document.getElementById("PropertyListingType").value;

    if (document.getElementById("DepositAmount1").value.replace(/,/g, '')) {
        var Deposit1 = parseFloat(document.getElementById("DepositAmount1").value.replace(/,/g, ''));
    } else {
        var Deposit1 = parseFloat(0);
    }

    if (document.getElementById("DepositAmount2").value.replace(/,/g, '')) {
        var Deposit2 = parseFloat(document.getElementById("DepositAmount2").value.replace(/,/g, ''));
    } else {
        var Deposit2 = parseFloat(0);
    }

    if (document.getElementById("DepositAmount3").value.replace(/,/g, '')) {
        var Deposit3 = parseFloat(document.getElementById("DepositAmount3").value.replace(/,/g, ''));
    } else {
        var Deposit3 = parseFloat(0);
    }

    if (document.getElementById("DepositAmount4").value.replace(/,/g, '')) {
        var Deposit4 = parseFloat(document.getElementById("DepositAmount4").value.replace(/,/g, ''));
    } else {
        var Deposit4 = parseFloat(0);
    }

    var Deposits = 0;

    /* if (listingType === "Buyer-Side" || listingType === "Tenant-Side") {
        // document.getElementById("TRSDeposits").style.display = "none";
         Deposits = 0;
         document.getElementById("AgentLabelTRS").style.display = "block";
         document.getElementById("AgentTable").style.display = "block";
     } else {*/

    document.getElementById("AgentTable").style.display = "";

    document.getElementById("AgentLabelTRS").style.display = "";

    document.getElementById("TRSDeposits").style.display = "";



    if (document.getElementById("DepositSection1").style.display === "none") {

        document.getElementById("DepositsName1").value = document.getElementById("DepositReceivedFrom1").value;
    } else {
        document.getElementById("DepositsName1").value = document.getElementById("DepositRecivedFromFirstName1").value + document.getElementById("DepositRecivedFromLastName1").value;
    }

    document.getElementById("DepositsDate1").value = document.getElementById("DepositDate1").value;

    if (document.getElementById("DepositAmount1").value) {
        document.getElementById("DepositsAmount1").value = parseFloat(document.getElementById("DepositAmount1").value).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    } else {
        document.getElementById("DepositsAmount1").value = parseFloat(0.00).toFixed(2);
    }


    //document.getElementById("DepositsType1").value=document.getElementById("DepositType1").value;

    Deposits = Deposits + Deposit1;

    if (document.getElementById("Deposit2").style.display === "none") {

        document.getElementById("Displaydeposit2").style.display = "none";

    } else {

        if (document.getElementById("DepositSection2").style.display === "none") {

            document.getElementById("DepositsName2").value = document.getElementById("DepositRecivedFrom2").value;
        } else {
            document.getElementById("DepositsName2").value = document.getElementById("DepositRecivedFromFirstName2").value + document.getElementById("DepositRecivedFromLastName2").value;
        }

        document.getElementById("DepositsDate2").value = document.getElementById("DepositDate2").value;

        if (document.getElementById("DepositAmount2").value) {
            document.getElementById("DepositsAmount2").value = parseFloat(document.getElementById("DepositAmount2").value).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        } else {
            document.getElementById("DepositsAmount2").value = parseFloat(0.00).toFixed(2);
        }


        //document.getElementById("DepositsType2").value=document.getElementById("DepositType2").value;

        document.getElementById("Displaydeposit2").style.display = "";

        Deposits = Deposits + Deposit2;
    } //Close  inner else

    if (document.getElementById("Deposit3").style.display === "none") {

        document.getElementById("Displaydeposit3").style.display = "none";

    } else {

        //alert("Here");

        if (document.getElementById("DepositSection3").style.display === "none") {

            //alert("Here1");

            document.getElementById("DepositsName3").value = document.getElementById("DepositRecivedFrom3").value;
        } else {
            document.getElementById("DepositsName3").value = document.getElementById("DepositRecivedFromFirstName3").value + document.getElementById("DepositRecivedFromLastName3").value;
        }

        document.getElementById("DepositsDate3").value = document.getElementById("DepositDate3").value;

        if (document.getElementById("DepositAmount3").value) {
            document.getElementById("DepositsAmount3").value = parseFloat(document.getElementById("DepositAmount3").value).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        } else {
            document.getElementById("DepositsAmount3").value = parseFloat(0.00).toFixed(2);
        }

        //document.getElementById("DepositsType3").value=document.getElementById("DepositType3").value;

        Deposits = Deposits + Deposit3;

        document.getElementById("Displaydeposit3").style.display = "";
    }

    if (document.getElementById("Deposit4").style.display === "none") {

        document.getElementById("Displaydeposit4").style.display = "none";

    } else {

        if (document.getElementById("DepositSection4").style.display === "none") {

            document.getElementById("DepositsName4").value = document.getElementById("DepositReceivedFrom4").value;
        } else {
            document.getElementById("DepositsName4").value = document.getElementById("DepositRecivedFromFirstName4").value + document.getElementById("DepositRecivedFromLastName4").value;
        }

        document.getElementById("DepositsDate4").value = document.getElementById("DepositDate4").value;

        if (document.getElementById("DepositAmount4").value) {
            document.getElementById("DepositsAmount4").value = parseFloat(document.getElementById("DepositAmount4").value).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
        } else {
            document.getElementById("DepositsAmount4").value = parseFloat(0.00).toFixed(2);
        }
        // document.getElementById("DepositsType4").value=document.getElementById("DepositType4").value;

        Deposits = Deposits + Deposit4;

        document.getElementById("Displaydeposit4").style.display = "";
    }

    //} //else

    //alert("Deposits"+" "+Deposits);
    if (Deposits) {
        document.getElementById("TRSTotalDeposits").value = parseFloat(Deposits).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    } else {
        document.getElementById("TRSTotalDeposits").value = parseFloat(0.00).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    }
    return Deposits;

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function TRSExpenses(SellCommission, AgentCommission1, AgentCommission2, TotalPurIncome, IncomeHST, TotalIncome) {



    var HST9 = parseFloat(document.getElementById('TRSListHTSPercent').value);
    var HST10 = parseFloat(document.getElementById('TRSSellCommissionHTSPercent').value);
    var HST1 = parseFloat(document.getElementById('Co-operatingBrokerageExpensesHSTPercent').value);
    var HST2 = parseFloat(document.getElementById('ExpensesReferralAgentHSTPercent').value);
    var HST3 = parseFloat(document.getElementById('CustomerHST1Percent').value);
    var HST4 = parseFloat(document.getElementById('CustomerHST2Percent').value);
    var HST5 = parseFloat(document.getElementById('CustomerHST3Percent').value);
    var HST6 = parseFloat(document.getElementById('CustomerHST4Percent').value);
    var HST7 = parseFloat(document.getElementById('AgentExpensesHST1Percent').value);
    var HST8 = parseFloat(document.getElementById('AgentExpensesHST2Percent').value);

    console.log(HST1);

    console.log(HST2);

    console.log(HST3);

    console.log(HST4);

    console.log(HST5);

    console.log(HST6);

    console.log(HST7);

    console.log(HST8);

    console.log(HST9);

    console.log(HST10);



    if (isNaN(parseFloat(document.getElementById("ReferralFeeAmount").value))) {
        var ReferralFee = 0;
    } else {
        var ReferralFee = parseFloat(document.getElementById("ReferralFeeAmount").value);
    }

    var ReferralFeeHST = (ReferralFee * HST2) / 100;

    var ReferralFeeTotalExpenses = ReferralFee + ReferralFeeHST;

    //Getting the Rebates Amountsf

    if (isNaN(parseFloat(document.getElementById("FirstRebateAmount").value))) {
        var RebateFee1 = 0;
    } else {
        var RebateFee1 = parseFloat(document.getElementById("FirstRebateAmount").value);
    }

    var RebateFee2 = 0;
    var RebateFee3 = 0;
    var RebateFee4 = 0;

    if (RebateFee1 === 0 || RebateFee1 === null || !RebateFee1 || RebateFee1 === " ") {
        document.getElementById("Expensescustomer1").style.display = "none";
    } else {
        document.getElementById("Expensescustomer1").style.display = "";
    }

    if (document.getElementById("SecondRebate").style.display === "block") {
        RebateFee2 = parseFloat(document.getElementById("SecondRebateAmount").value);
        document.getElementById("Expensescustomer2").style.display = "";
    } else {
        RebateFee2 = 0;
        document.getElementById("Expensescustomer2").style.display = "none";
    }

    if (document.getElementById("ThirdRebate").style.display === "block") {
        RebateFee3 = parseFloat(document.getElementById("ThirdRebateAmount").value);
        document.getElementById("Expensescustomer3").style.display = "";
    } else {
        RebateFee3 = 0;
        document.getElementById("Expensescustomer3").style.display = "none";
    }

    if (document.getElementById("ForthRebate").style.display === "block") {
        RebateFee4 = parseFloat(document.getElementById("ForthRebateAmount").value);
        document.getElementById("Expensescustomer4").style.display = "";
    } else {
        RebateFee4 = 0;
        document.getElementById("Expensescustomer4").style.display = "none";
    }

    var TotalRebate = RebateFee1 + RebateFee3 + RebateFee2 + RebateFee4;

    console.log("Rebates" + " " + TotalRebate);


    //-------------------------------------------------------------------------------------------------------------------

    var ReferralAgentPercentage1 = parseFloat(document.getElementById("ReferralPercentageAmountToAgent1").value);

    var ReferralAgentPercentage2 = parseFloat(document.getElementById("ReferralPercentageAmountToAgent2").value);

    //Calculating each agents amount of referral fee

    var AgentReferralamount1 = 0; //(ReferralFee * ReferralAgentPercentage1) / 100;

    var AgentReferralamount2 = 0; // (ReferralFee * ReferralAgentPercentage2) / 100;





    if (ReferralFee === 0 || ReferralFee === null || ReferralFee === " " || !ReferralFee) {

        document.getElementById("ExpensesReferral").style.display = "none";

        AgentReferralamount1 = 0.00;

        AgentReferralamount2 = 0.00;

    } else {

        AgentReferralamount1 = (ReferralFee * ReferralAgentPercentage1) / 100;

        AgentReferralamount2 = (ReferralFee * ReferralAgentPercentage2) / 100;


        document.getElementById("ExpensesReferral").style.display = "";

        document.getElementById("ExpensesReferralAgentName").value = document.getElementById("PayeeFirstName").value + " " + document.getElementById("PayeeLastName").value;

        document.getElementById("ExpensesReferralAgentNet").value = parseFloat(ReferralFee).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        document.getElementById("ExpensesReferralAgentHST").value = parseFloat(ReferralFeeHST).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        document.getElementById("ExpensesReferralAgentTotalAmount").value = parseFloat(ReferralFeeTotalExpenses).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    }



    console.log("ReferralAgentPercentage1" + " " + ReferralAgentPercentage1);

    console.log("ReferralAgentPercentage2" + " " + ReferralAgentPercentage2);

    console.log("AgentReferralamount1" + " " + AgentReferralamount1);

    console.log("AgentReferralamount2" + " " + AgentReferralamount2);



    //-----------------------------------------------------------------------------------------------------------

    var RebateAgentPercentage1 = parseFloat(document.getElementById("RebateAgent1amount").value);

    var RebateAgentPercentage2 = parseFloat(document.getElementById("RebateAgent2amount").value);

    //Calculating each agents amount of rebate fee

    var AgentRebateamount1 = (TotalRebate * RebateAgentPercentage1) / 100;

    var AgentRebateamount2 = (TotalRebate * RebateAgentPercentage2) / 100;


    console.log("RebateAgentPercentage1" + " " + RebateAgentPercentage1);

    console.log("RebateAgentPercentage2" + " " + RebateAgentPercentage2);

    console.log("AgentRebateamount1" + " " + AgentRebateamount1);

    console.log("AgentRebateamount2" + " " + AgentRebateamount2);



    //Here are the calculations of the Cooperating Brokerage expenses 

    var Brokeragecomiision = parseFloat(SellCommission);

    var BrokeragecomiisionHST = (Brokeragecomiision * HST1) / 100;

    var BrokerageTotalExpenses = Brokeragecomiision + BrokeragecomiisionHST;


    console.log("Brokeragecomiision" + " " + Brokeragecomiision);

    console.log("HST1" + " " + HST1);

    console.log("BrokeragecomiisionHST" + " " + BrokeragecomiisionHST);

    console.log("BrokerageTotalExpenses" + " " + BrokerageTotalExpenses);


    //-------------------------------------------------------------------------------------------------------------------

    var AgentExpenses1 = AgentCommission1 - (AgentRebateamount1 + AgentReferralamount1);

    var AgentExpensesHST1 = (AgentExpenses1 * HST7) / 100;

    var AgentExpensesTotal1 = AgentExpenses1 + AgentExpensesHST1;

    console.log("AgentExpenses1" + " " + AgentExpenses1);

    console.log("HST7" + " " + HST7);

    console.log("AgentExpensesHST1" + " " + AgentExpensesHST1);

    console.log("AgentExpensesTotal1" + " " + AgentExpensesTotal1);


    var AgentExpenses2 = AgentCommission2 - (AgentRebateamount2 + AgentReferralamount2);

    var AgentExpensesHST2 = (AgentExpenses2 * HST8) / 100;

    var AgentExpensesTotal2 = AgentExpenses2 + AgentExpensesHST2;

    console.log("AgentExpenses2" + " " + AgentExpenses1);

    console.log("HST8" + " " + HST8);

    console.log("AgentExpensesHST2" + " " + AgentExpensesHST2);

    console.log("AgentExpensesTotal2" + " " + AgentExpensesTotal2);

    //-------------------------------------------------------------------------------------------------------------------

    document.getElementById("Co-operatingBrokerageExpensesName").value = document.getElementById("Brokername").value;

    document.getElementById("Co-operatingBrokerageExpensesNet").value = parseFloat(Brokeragecomiision).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("Co-operatingBrokerageExpensesHST").value = parseFloat(BrokeragecomiisionHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("Co-operatingBrokerageExpensesTotalAmount").value = parseFloat(BrokerageTotalExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    document.getElementById("CustomerName1").value = document.getElementById("RebateCustomerReciever1").value;

    document.getElementById("CustomerNet1").value = parseFloat(RebateFee1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST1").value = ((parseFloat(RebateFee1) * HST3) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });




    var CustomerTotal1 = parseFloat(RebateFee1) + parseFloat(document.getElementById("CustomerHST1").value);

    document.getElementById("CustomerTotalAmount1").value = parseFloat(CustomerTotal1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });



    console.log("CustomerHST1" + " " + document.getElementById("CustomerHST1").value);

    console.log("CustomerTotal1" + " " + CustomerTotal1);

    document.getElementById("CustomerName2").value = document.getElementById("RebateCustomerReciever2").value;

    document.getElementById("CustomerNet2").value = parseFloat(RebateFee2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    var CustomerHST2 = (RebateFee2 * HST4) / 100;


    document.getElementById("CustomerHST2").value = (CustomerHST2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    ;

    var CustomerTotal2 = RebateFee2 + CustomerHST2;


    document.getElementById("CustomerTotalAmount2").value = parseFloat(CustomerTotal2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    console.log("CustomerHST2" + " " + document.getElementById("CustomerHST2").value);

    console.log("CustomerTotal2" + " " + CustomerTotal2);

    document.getElementById("CustomerName3").value = document.getElementById("RebateCustomerReciever3").value;



    document.getElementById("CustomerNet3").value = parseFloat(RebateFee3).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST3").value = (parseFloat(RebateFee3) * HST4) / 100;

    var CustomerTotal3 = parseFloat(RebateFee3) + parseFloat(document.getElementById("CustomerHST3").value);

    document.getElementById("CustomerTotalAmount3").value = parseFloat(CustomerTotal3).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    console.log("CustomerHST3" + " " + document.getElementById("CustomerHST3").value);

    console.log("CustomerTotal3" + " " + CustomerTotal3);

    document.getElementById("CustomerName4").value = document.getElementById("RebateCustomerReciever4").value;

    document.getElementById("CustomerNet4").value = parseFloat(RebateFee4).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST4").value = (parseFloat(RebateFee4) * HST6) / 100;

    var CustomerTotal4 = parseFloat(RebateFee4) + parseFloat(document.getElementById("CustomerHST4").value);

    document.getElementById("CustomerTotalAmount4").value = parseFloat(CustomerTotal4).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    console.log("CustomerHST4" + " " + document.getElementById("CustomerHST4").value);

    console.log("CustomerTotal4" + " " + CustomerTotal4);

    var Agentname1 = document.getElementById("FirstAgentID").value;


    var myArray = Agentname1.split(" ");



    document.getElementById("AgentExpenses1").value = myArray[1] + " " + myArray[2];


    document.getElementById("AgentExpensesNet1").value = parseFloat(AgentExpenses1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("AgentExpensesHST1").value = parseFloat(AgentExpensesHST1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("AgentExpensesTotalAmount1").value = parseFloat(AgentExpensesTotal1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    console.log(document.getElementById("AgentExpensesNet1").value);

    console.log(document.getElementById("AgentExpensesHST1").value);

    console.log(document.getElementById("AgentExpensesTotalAmount1").value)




    if (document.getElementById("AddNewAgent").style.display === "block") {

        //alert("section10");

        document.getElementById("ExpensesAgent2").style.display = "";

        document.getElementById("AgentExpenses2").value = document.getElementById("SecondAgentID").value;

        document.getElementById("AgentExpensesNet2").value = parseFloat(AgentExpenses2).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        document.getElementById("AgentExpensesHST2").value = parseFloat(AgentExpensesHST2).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        document.getElementById("AgentExpensesTotalAmount2").value = parseFloat(AgentExpensesTotal2).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    } else {
        //alert("section11");

        document.getElementById("ExpensesAgent2").style.display = "none";

        AgentExpenses2 = 0;

        AgentExpensesHST2 = 0;

        AgentExpensesTotal2 = 0;
    }

    console.log("section12");

    document.getElementById("TotalExpensesPurAmounts").value = parseFloat(AgentExpenses2 + AgentExpenses1 + RebateFee4 + RebateFee3 + RebateFee2 + RebateFee1 + Brokeragecomiision + ReferralFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    document.getElementById("HSTExpensesAmounts").value = parseFloat(AgentExpensesHST2 + AgentExpensesHST1 + BrokeragecomiisionHST + ReferralFeeHST + parseFloat(document.getElementById("CustomerHST4").value) + parseFloat(document.getElementById("CustomerHST3").value) + parseFloat(document.getElementById("CustomerHST2").value) + parseFloat(document.getElementById("CustomerHST1").value)).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalExpensesAmount").value = parseFloat(AgentExpensesTotal2 + AgentExpensesTotal1 + TotalRebate + ReferralFeeTotalExpenses + BrokerageTotalExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    var TotalPurExpenses = AgentExpenses2 + AgentExpenses1 + RebateFee4 + RebateFee3 + RebateFee2 + RebateFee1 + Brokeragecomiision + ReferralFee;

    var TotalHSTExpenses = AgentExpensesHST2 + AgentExpensesHST1 + BrokeragecomiisionHST + ReferralFeeHST;

    var TotalExpensesAmount = AgentExpensesTotal2 + AgentExpensesTotal1 + CustomerTotal3 + CustomerTotal2 + CustomerTotal1 + CustomerTotal4 + ReferralFeeTotalExpenses + BrokerageTotalExpenses;

    console.log("section13");

    document.getElementById("TotalNetToBrokeragePurAmounts").value = parseFloat(TotalPurIncome - TotalPurExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("HSTNetToBrokerageAmounts").value = parseFloat(IncomeHST - TotalHSTExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalNetToBrokerageAmount").value = parseFloat(TotalIncome - TotalExpensesAmount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    console.log("finish Expenses Calculations");
}




function submitHST() {

    NewCommissionIncome();

    var SellCommission = (document.getElementById('Co-operatingBrokerageExpensesNet').value.replace(/\,/g, ''));

    var AgentCommission1 = (document.getElementById('TRSAgentNet1').value.replace(/\,/g, ''));

    var AgentCommission2 = (document.getElementById('TRSAgentNet2').value.replace(/\,/g, ''));

    var TotalPurIncome = (document.getElementById('TRSTotalCommissions').value.replace(/\,/g, ''));

    var IncomeHST = (document.getElementById('TRSTotaHST').value.replace(/\,/g, ''));


    var TotalIncome = (document.getElementById('TRSTotalFinalCommissions').value.replace(/\,/g, ''));


    TRSExpenses(SellCommission, AgentCommission1, AgentCommission2, TotalPurIncome, IncomeHST, TotalIncome);




    let tabOne = document.getElementById('CommisionsIncome');

    let borderTabOne = tabOne.getElementsByClassName('withBorder');
    for (let i = 0; i < borderTabOne.length; i++) {
        borderTabOne[i].classList.add("noBorder");
        borderTabOne[i].readOnly = true;
    }

    document.getElementById('EditSubmit').style.display = 'none';
    document.getElementById('EditDiscard').style.display = 'none';

    document.getElementById('Editbtn').style.display = '';

    let tabTwo = document.getElementById('tableExpenses');
    let borderTabTwo = tabTwo.getElementsByClassName('withBorder');
    for (let i = 0; i < borderTabTwo.length; i++) {
        borderTabTwo[i].classList.add("noBorder");
        borderTabTwo[i].readOnly = true;
    }


}



function discardHST() {

    fillHST();

    submitHST();

    document.getElementById('HSTHead1').style.display = 'none';
    document.getElementById('TRSListHTSPercentTD').style.display = 'none';
    document.getElementById('TRSSellCommissionHTSPercentTD').style.display = 'none';
    document.getElementById('EmptyPercent').style.display = 'none';

    document.getElementById('EditSubmit').style.display = 'none';
    document.getElementById('EditDiscard').style.display = 'none';

    document.getElementById('Editbtn').style.display = '';


    document.getElementById('HSTHead').style.display = 'none';
    document.getElementById('Co-operatingBrokerageExpensesHSTPercentTD').style.display = 'none';
    document.getElementById('ExpensesReferralAgentHSTPercentTD').style.display = 'none';
    document.getElementById('CustomerHST1PercentTD').style.display = 'none';
    document.getElementById('CustomerHST2PercentTD').style.display = 'none';
    document.getElementById('CustomerHST3PercentTD').style.display = 'none';
    document.getElementById('CustomerHST4PercentTD').style.display = 'none';
    document.getElementById('AgentExpensesHST1PercentTD').style.display = 'none';
    document.getElementById('AgentExpensesHST2Percent2TD').style.display = 'none';
    document.getElementById('EmptyPercent2').style.display = 'none';
    document.getElementById('EmptyPercent3').style.display = 'none';
    document.getElementById('EmptyPercent4').style.display = 'none';

    document.getElementById('EditSubmit').style.display = 'none';
    document.getElementById('EditDiscard').style.display = 'none';

    document.getElementById('Editbtn').style.display = '';

    document.getElementById("myModalHST").style.display = 'none';
}





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function CheckStatus() {
    var res = 1;
    var status = document.getElementById('PropertyListingStatus').value;
    //console.log(document.getElementById('PropertyListingStatus').value)
    if (status === "Available") {
        res = 0;
        document.getElementById("AvailableError").style.display = 'block';
    } else {
        document.getElementById("AvailableError").style.display = 'none';
    }

    if (status === "Off-Market") {
        res = 0;
        document.getElementById("OffMarketError").style.display = 'block';
    } else {
        document.getElementById("OffMarketError").style.display = 'none';
    }

    return res;
}

function displaySendToClosed(condition) {
    var status = document.getElementById('PropertyListingStatus').value;
    if (!condition) {
        if (status === "Off-Market" || status === "Offer Withdrawn" || status === "Expired") {
            document.getElementById('TRSNExt').className = 'buttonFinalize buttonBlue';
            document.getElementById('TRSNExt').style.paddingLeft = '34px';
            document.getElementById('TRSNextExpand').style.display = '';
            // document.getElementById('Deletebtn1_7').style.left = '';
            // document.getElementById('Savebtn7').style.left = '';
        } else {
            document.getElementById('TRSNExt').className = 'buttonBlue';
            document.getElementById('TRSNExt').style.paddingLeft = '';
            document.getElementById('TRSNextExpand').style.display = 'none';
            // document.getElementById('Deletebtn1_7').style.left = '446px';
            // document.getElementById('Savebtn7').style.left = '149px';
        }
    }
}

function PropertyStatus(condition) {

    displaySendToClosed(condition);

    document.getElementById('VendorNextStep').style.cursor = '';

    var status = document.getElementById('PropertyListingStatus').value;

    if (document.getElementById('dealtypeSpan')) {
        document.getElementById('dealtypeSpan').className = status;
    }


    if (status === "Available") {

        document.getElementById("ListingDateMand").className = "MandentorySign";

        document.getElementById("dynamicMandentorysign2").className = "MandentorySign";

        document.getElementById("dunamicMandantoryfiled1").className = "NoMandatory";

        document.getElementById("OfferWithdrawalLabel").className = "NoMandatory";

        document.getElementById("OffMarketLabel").className = "NoMandatory";


        document.getElementById("statusAvailable").style.display = "";

        document.getElementById("statusWidthdrawan").style.display = "none";

        document.getElementById("statusOffMarket").style.display = "none";

        document.getElementById("statusExpired").style.display = "none";

        //   document.getElementById("VendorNextStep").disabled=true;

        document.getElementById('VendorNextStep').style.cursor = 'default';

        document.getElementById('PropertyListingComission').readOnly = false;
        document.getElementById('PropertySellingComission').readOnly = false;

        document.getElementById('PropertyListingComission').parentElement.style.background = '';
        document.getElementById('PropertyListingComission').style.background = '';
        document.getElementById('PropertySellingComission').parentElement.style.background = '';
        document.getElementById('PropertySellingComission').style.background = '';
    } else if (status === "Off-Market") {

        document.getElementById("OffMarketLabel").className = "MandentorySign";

        document.getElementById("ListingDateMand").className = "NoMandatory";

        document.getElementById("dynamicMandentorysign2").className = "NoMandatory";

        document.getElementById("dunamicMandantoryfiled1").className = "NoMandatory";

        document.getElementById("OfferWithdrawalLabel").className = "NoMandatory";


        document.getElementById("statusOffMarket").style.display = "";

        document.getElementById("statusWidthdrawan").style.display = "none";

        document.getElementById("statusExpired").style.display = "none";

        document.getElementById("statusAvailable").style.display = "none";

        document.getElementById('VendorNextStep').style.cursor = 'default';

        document.getElementById('PropertyListingComission').readOnly = false;
        document.getElementById('PropertySellingComission').readOnly = false;

        document.getElementById('PropertyListingComission').parentElement.style.background = '';
        document.getElementById('PropertyListingComission').style.background = '';
        document.getElementById('PropertySellingComission').parentElement.style.background = '';
        document.getElementById('PropertySellingComission').style.background = '';

    } else if (status === "Offer Withdrawn") {

        document.getElementById("OfferWithdrawalLabel").className = "MandentorySign";

        document.getElementById("OffMarketLabel").className = "NoMandatory";

        document.getElementById("ListingDateMand").className = "NoMandatory";

        document.getElementById("dynamicMandentorysign2").className = "NoMandatory";

        document.getElementById("dunamicMandantoryfiled1").className = "NoMandatory";


        document.getElementById("statusWidthdrawan").style.display = "";

        document.getElementById("statusOffMarket").style.display = "none";

        document.getElementById("statusAvailable").style.display = "none";

        document.getElementById("statusExpired").style.display = "none";

        document.getElementById('VendorNextStep').style.cursor = '';

        document.getElementById('PropertyListingComission').value = parseFloat(0.00).toFixed(2);
        document.getElementById('PropertySellingComission').value = parseFloat(0.00).toFixed(2);

        document.getElementById('PropertyListingComission').readOnly = true;
        document.getElementById('PropertySellingComission').readOnly = true;

        document.getElementById('PropertyListingComission').parentElement.style.background = '#f3f3f3';
        document.getElementById('PropertyListingComission').style.background = '#f3f3f3';
        document.getElementById('PropertySellingComission').parentElement.style.background = '#f3f3f3';
        document.getElementById('PropertySellingComission').style.background = '#f3f3f3';

    } else if (status === "Expired") {

        document.getElementById("dynamicMandentorysign2").className = "MandentorySign";

        document.getElementById("OffMarketLabel").className = "NoMandatory";

        document.getElementById("ListingDateMand").className = "NoMandatory";

        document.getElementById("dunamicMandantoryfiled1").className = "NoMandatory";

        document.getElementById("OfferWithdrawalLabel").className = "NoMandatory";


        document.getElementById("statusExpired").style.display = "";

        document.getElementById("statusWidthdrawan").style.display = "none";

        document.getElementById("statusOffMarket").style.display = "none";

        document.getElementById("statusAvailable").style.display = "none";

        document.getElementById('VendorNextStep').style.cursor = '';

        document.getElementById('PropertyListingComission').readOnly = false;
        document.getElementById('PropertySellingComission').readOnly = false;

        document.getElementById('PropertyListingComission').parentElement.style.background = '';
        document.getElementById('PropertyListingComission').style.background = '';
        document.getElementById('PropertySellingComission').parentElement.style.background = '';
        document.getElementById('PropertySellingComission').style.background = '';


    } else {

        document.getElementById("dunamicMandantoryfiled1").className = "MandentorySign";

        document.getElementById("dynamicMandentorysign2").className = "NoMandatory";

        document.getElementById("OffMarketLabel").className = "NoMandatory";

        document.getElementById("ListingDateMand").className = "NoMandatory";

        document.getElementById("OfferWithdrawalLabel").className = "NoMandatory";

        document.getElementById("statusOffMarket").style.display = "none";

        document.getElementById("statusWidthdrawan").style.display = "none";

        document.getElementById("statusExpired").style.display = "none";

        document.getElementById("statusAvailable").style.display = "none";

        document.getElementById('VendorNextStep').style.cursor = 'default';

        document.getElementById('PropertyListingComission').readOnly = false;
        document.getElementById('PropertySellingComission').readOnly = false;

        document.getElementById('PropertyListingComission').parentElement.style.background = '';
        document.getElementById('PropertyListingComission').style.background = '';
        document.getElementById('PropertySellingComission').parentElement.style.background = '';
        document.getElementById('PropertySellingComission').style.background = '';

    }

    var ListingType = document.getElementById("PropertyListingType").value;

    if (ListingType === "Lease-DoubleSided" || ListingType === "Tenant-Side" || ListingType === "Landlord-Side" || ListingType === "TenantSide-Self-Represented-Landlord") {


        if (status === "Offer Withdrawn") {

            document.getElementById("PropertySellingComission").value = parseFloat(0).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(0).toFixed(2);

            // document.getElementById("PropertySellingComission").readOnly = true;

            // document.getElementById("PropertyListingComission").readOnly = true;

        } else {
            // document.getElementById("PropertySellingComission").value = parseFloat(50).toFixed(2);

            //document.getElementById("PropertyListingComission").value = parseFloat(50).toFixed(2);

            // document.getElementById("PropertySellingComission").readOnly =false;

            // document.getElementById("PropertyListingComission").readOnly = false;
        }


    } else {

        if (status === "Offer Withdrawn") {

            document.getElementById("PropertySellingComission").value = parseFloat(0).toFixed(2);

            document.getElementById("PropertyListingComission").value = parseFloat(0).toFixed(2);

            // document.getElementById("PropertySellingComission").readOnly = true;

            // document.getElementById("PropertyListingComission").readOnly = true;
        } else {
            // document.getElementById("PropertySellingComission").value = parseFloat(2.50).toFixed(2);

            // document.getElementById("PropertyListingComission").value = parseFloat(2.50).toFixed(2);

            // document.getElementById("PropertySellingComission").readOnly =false;

            // document.getElementById("PropertyListingComission").readOnly = false;
        }
    }


    if (status === "Firm" || status === "Conditional") {

        document.getElementById("statusWarning").style.display = "";

    } else {
        document.getElementById("statusWarning").style.display = "none";
    }


    document.getElementById('PropertyClosingDate').style.borderColor = '';
    document.getElementById('PropertyClosingDate').nextElementSibling.nextElementSibling.style.borderColor = '';
    document.getElementById('PropertyClosingDate').nextElementSibling.style.borderColor = '';

    document.getElementById('PropertyListingDate').style.borderColor = '';
    document.getElementById('PropertyListingDate').nextElementSibling.nextElementSibling.style.borderColor = '';
    document.getElementById('PropertyListingDate').nextElementSibling.style.borderColor = '';

    document.getElementById('PropertyExpirationDate').style.borderColor = '';
    document.getElementById('PropertyExpirationDate').nextElementSibling.nextElementSibling.style.borderColor = '';
    document.getElementById('PropertyExpirationDate').nextElementSibling.style.borderColor = '';

    document.getElementById('PropertyOfferWithdrawalDate').style.borderColor = '';
    document.getElementById('PropertyOfferWithdrawalDate').nextElementSibling.nextElementSibling.style.borderColor = '';
    document.getElementById('PropertyOfferWithdrawalDate').nextElementSibling.style.borderColor = '';

    document.getElementById('PropertyOffMarketDate').style.borderColor = '';
    document.getElementById('PropertyOffMarketDate').nextElementSibling.nextElementSibling.style.borderColor = '';
    document.getElementById('PropertyOffMarketDate').nextElementSibling.style.borderColor = '';


    // document.getElementById('PropertyListingDate').style.borderColor = '';
    // document.getElementById('PropertyListingDateLabel').style.borderColor = '';
    // document.getElementById('PropertyExpirationDate').style.borderColor = '';
    // document.getElementById('PropertyExpirationDateLabel').style.borderColor = '';

    // document.getElementById('PropertyOfferWithdrawalDate').style.borderColor = '';
    // document.getElementById('PropertyOfferWithdrawalDateLabel').style.borderColor = '';

    // document.getElementById('PropertyOffMarketDate').style.borderColor = '';
    // document.getElementById('PropertyOffMarketDateLabel').style.borderColor = '';


    document.getElementById("AvailableError").style.display = "none";
    document.getElementById("OffMarketError").style.display = "none";
}


////////////////////////////////////////////////////////////

function completeRecord() {
    if (document.getElementById('ConfirmationRecordSheet')) {
        if (document.getElementById('ConfirmationRecordSheet').checked == true) {
            //console.log(1);
            document.getElementById('TRSTabIMG').src = "../ImagesUsed/Accept.png";
            document.getElementById('TRSTabIMG').classList.add('accepted');
            document.getElementById("ConfirmationRecordCheckbox").classList.add("bluecheck");
        } else {
            document.getElementById('TRSTabIMG').src = "../ImagesUsed/Didnotaccept.png";
            document.getElementById('TRSTabIMG').classList.remove('accepted');
            document.getElementById("ConfirmationRecordCheckbox").classList.remove("bluecheck");
            //console.log(2);
        }
    }
}

// function DealType(SelectedOption) {


//     if (SelectedOption === "TradeInrealEstate") {

//         document.getElementById("ReferralFreeReceipt").checked = false;

//         document.getElementById("Appraisal").checked = false;
//     } else if (SelectedOption === "ReferralFreeReceipt") {

//         document.getElementById("TradeInrealEstate").checked = false;

//         document.getElementById("Appraisal").checked = false;
//     } else {
//         document.getElementById("TradeInrealEstate").checked = false;

//         document.getElementById("ReferralFreeReceipt").checked = false;
//     }

//     document.getElementById('NewDealProceed').style.pointerEvents = '';
// }

//////////////////////////////////////////////////////////////

// function GotoNewDeal() {


//     if (document.getElementById("TradeInrealEstate").checked === true) {
//         window.location = "../Forms/TRS.jsp";
//     } else if (document.getElementById("ReferralFreeReceipt").checked === true) {
//         window.location = "../Forms/ReferralFee.jsp";
//     } else {
//         window.location = "../Forms/Appraisal.jsp";
//     }
// }

//////////////////////////////////////////////////////////////

function simplePrint(id) {
    // document.getElementById('invoiceButtonSection').style.display = 'none';
    var prtContent = document.getElementById(id);
    var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');

    if (id == 'MainTRSsection') {
        WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
    }

    WinPrint.document.write(prtContent.innerHTML);
    WinPrint.document.close();
    // WinPrint.focus();
    // WinPrint.print();
    WinPrint.onafterprint = function () {
        WinPrint.close();
    }

    setTimeout(function () {
        WinPrint.print();
    }, 400);

    // WinPrint.close();
    // document.getElementById('invoiceButtonSection').style.display = '';

}

function simplePrintTRS(id) {
    // document.getElementById('invoiceButtonSection').style.display = 'none';
    var prtContent = document.getElementById(id);
    var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/forPrintTRS.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/Fonts.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/forDateField.css" rel="stylesheet" type="text/css" />');
    WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');

    WinPrint.document.write(prtContent.innerHTML);
    WinPrint.document.close();

    WinPrint.onafterprint = function () {
        WinPrint.close();
    }
    setTimeout(function () {
        WinPrint.print();
    }, 400);

}

function PrintPage(id) {

    // var element = document.getElementById(id);

    // element.addEventListener("click", PrintPage);

    html2canvas(document.getElementById('Invoice'), {

        onrendered: function (canvas) {

            var img = canvas.toDataURL("image/png");

            var doc = new jsPDF();
            // doc.style.marginLeft = 0;

            doc.addImage(img, 'JPEG', 0, 0, 50, 100);

            doc.save('ProMasterBroker.pdf');


        }

    });
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CalcluationOfAmounts(Percentage1, Percentage2, Amount, Amount1, Amount2) {

    var Percentage1 = parseFloat(document.getElementById(Percentage1).value);

    var Percentage2 = parseFloat(document.getElementById(Percentage2).value);

    var TotalAmount = parseFloat(document.getElementById(Amount).value);

    var FirstAgent = (TotalAmount * Percentage1) / 100;

    var SecondAgent = (TotalAmount * Percentage2) / 100;

    document.getElementById(Amount1).value = parseFloat(FirstAgent).toFixed(2);

    document.getElementById(Amount2).value = parseFloat(SecondAgent).toFixed(2);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function CheckRebateRefferalAmounts() {

    var HST = document.getElementById("HSTAMount").value;

    //alert("hello");

    var check = 0;

    var Price = parseFloat(document.getElementById("ProPertyListingPrice").value);

    var ListingPercentage = parseFloat(document.getElementById("PropertyListingComission").value);

    var SellingPercentage = parseFloat(document.getElementById("PropertySellingComission").value);

    var officeLeadPercentage = parseFloat(document.getElementById("OfficeLeadAllocaton").value);

    var SellingOfficeLeadPercentage = (parseFloat(document.getElementById("OfficeLeadAllocatonSelling").value));

    var ListingOfficeLeadPercentage = parseFloat(document.getElementById("OfficeLeadAllocatonListng").value);

    var AgentcommissionPercentage1 = parseFloat(document.getElementById("FirstAgentGrossCommisionSplit").value);

    var AgentcommissionPercentage2 = parseFloat(document.getElementById("SecondAgentGrossCommisionSplit").value);

    var Source = document.getElementById('ProPertyListingSource').value;

    var listingType = document.getElementById('PropertyListingType').value;

    var ReferralFee = parseFloat(document.getElementById("ReferralFeeAmount").value);

    //alert("hello222");

    var ListingCommission;

    var SellingCommission;

    var HSTListingCommission;

    var HSTSellingCommission;

    var TotalListingCommission;

    var TotalSellingCommission;

    var AgentCommissionAmount1 = 0;

    var AgentCommissionAmount2 = 0;

    var AgentSplit1 = 0;

    var AgentSplit2 = 0;

    var AgentCommissionsPercentage1 = 0;

    var AgentCommissionsPercentage1 = 0;


    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

        ListingCommission = 0;

        HSTListingCommission = 0;

        if (document.getElementById('SellingComiissionFixedAmount').checked === true) {

            SellingCommission = SellingPercentage;

            HSTSellingCommission = (SellingCommission * HST) / 100;

        } //Close inner if
        else {

            SellingCommission = (Price * SellingPercentage) / 100;

            HSTSellingCommission = (SellingCommission * HST) / 100;
        } //Clsoe inner else 


    } //Close if
    else {


        if (document.getElementById('ListingComiissionFixedAmount').checked === true) {

            ListingCommission = ListingPercentage;

            HSTListingCommission = (ListingCommission * HST) / 100;

        } else {

            ListingCommission = (Price * ListingPercentage) / 100;

            HSTListingCommission = (ListingCommission * HST) / 100;
        }

        if (document.getElementById('SellingComiissionFixedAmount').checked === true) {

            SellingCommission = SellingPercentage;

            HSTSellingCommission = (SellingCommission * HST) / 100;

        } else {

            SellingCommission = (Price * SellingPercentage) / 100;

            HSTSellingCommission = (SellingCommission * HST) / 100;
        }


    } //else


    TotalListingCommission = ListingCommission + HSTListingCommission;

    TotalSellingCommission = SellingCommission + HSTSellingCommission;

    //alert( TotalListingCommission );

    //Here we are calculating each agent's commissions based on the listing and selling amounts we calculated above

    if (listingType === "Listing-Side" || listingType === "Landlord-Side") {

        AgentCommissionAmount1 = (ListingCommission * AgentcommissionPercentage1) / 100;

        AgentCommissionAmount2 = (ListingCommission * AgentcommissionPercentage2) / 100;
    } //close  if
    else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {

        AgentCommissionAmount1 = (SellingCommission * AgentcommissionPercentage1) / 100;

        AgentCommissionAmount2 = (SellingCommission * AgentcommissionPercentage2) / 100;
    } //Close else if 
    else {

        if (document.getElementById('AddAgent').checked === false) {

            AgentCommissionAmount1 = SellingCommission + ListingCommission;

            AgentCommissionAmount2 = 0;

        } //close inner if
        else {

            if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {

                AgentCommissionAmount1 = ListingCommission;

                AgentCommissionAmount2 = SellingCommission;
            } //Closing inner if
            else {
                AgentCommissionAmount1 = SellingCommission;

                AgentCommissionAmount2 = ListingCommission;
            } //close Agent Role else condition

        } //Close inner else

    } //Close else  

    //alert("checkingggg");

    if (Source === "Office-lead") {

        if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {

            if (document.getElementById('AddAgent').checked === false) {

                var Selling = (100 - SellingOfficeLeadPercentage) / 100;

                var listing = (100 - ListingOfficeLeadPercentage) / 100;

                var Total = ListingPercentage + SellingPercentage;

                var basedAmount = (listing * ListingPercentage) + (Selling * SellingPercentage);

                var d = listing * ListingPercentage;

                AgentSplit1 = (basedAmount / Total) * 100;

                AgentSplit2 = 0;

            } //close inner if document.getElementById('AddAgent').checked===false
            else {

                if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {

                    AgentSplit1 = 100 - (ListingOfficeLeadPercentage);

                    AgentSplit2 = 100 - (SellingOfficeLeadPercentage);
                } //Closing  if
                else {
                    AgentSplit1 = 100 - (SellingOfficeLeadPercentage);

                    AgentSplit2 = 100 - (ListingOfficeLeadPercentage);
                }

            } //else document.getElementById('AddAgent').checked===false"

        } //Close if listingType==="Sale-Double-Sided" || listingType==="Lease-DoubleSided"
        else {
            AgentSplit1 = (100 - officeLeadPercentage);

            AgentSplit2 = (100 - officeLeadPercentage);
        } //Close inner if

    } //Close if
    else {
        AgentSplit1 = 80;

        AgentSplit2 = 80;
    }


    //alert("AgentSpli1"+AgentSplit1);



    var AgentNet1 = (AgentCommissionAmount1 * AgentSplit1) / 100; //Calculating agent net amount based on the split amount

    var AgentNet2 = (AgentCommissionAmount2 * AgentSplit2) / 100; //Calculating agent net amount based on the split amount


    var TotalRebate = parseFloat(document.getElementById("TotalRebats").value);

    //alert("Total Rebates"+TotalRebate);
    //-------------------------------------------------------------------------------------------------------------------

    var ReferralAgentPercentage1 = parseFloat(document.getElementById("ReferralPercentageAmountToAgent1").value);

    var ReferralAgentPercentage2 = parseFloat(document.getElementById("ReferralPercentageAmountToAgent2").value);

    //Calculating each agents amount of referral fee

    var AgentReferralamount1 = (ReferralFee * ReferralAgentPercentage1) / 100;

    var AgentReferralamount2 = (ReferralFee * ReferralAgentPercentage2) / 100;

    //-----------------------------------------------------------------------------------------------------------

    var RebateAgentPercentage1 = parseFloat(document.getElementById("RebateAgent1amount").value);

    var RebateAgentPercentage2 = parseFloat(document.getElementById("RebateAgent2amount").value);

    //Calculating each agents amount of rebate fee

    var AgentRebateamount1 = (TotalRebate * RebateAgentPercentage1) / 100;

    var AgentRebateamount2 = (TotalRebate * RebateAgentPercentage2) / 100;

    var FirstAgentExpensesAfterReferral = AgentNet1 - AgentReferralamount1;

    var FirstAgentExpensesAfterRebate = FirstAgentExpensesAfterReferral - AgentRebateamount1;

    var SecondAgentExpensesAfterReferral = AgentNet2 - AgentReferralamount2;

    var SecondAgentExpensesAfterRebate = SecondAgentExpensesAfterReferral - AgentRebateamount2;



    if (FirstAgentExpensesAfterReferral < 0 || SecondAgentExpensesAfterReferral < 0) {

        //alert("Checking if th referral is exceeding the commissions");

        //document.getElementById("ReferralExceedError").style.display ="";

        check = 1;

        //alert("The Referral has exceed");

        //return check; 

    } else {


        //alert("The Refferal is good");

        //document.getElementById("ReferralExceedError").style.display ="none";

        if (FirstAgentExpensesAfterRebate < 0 || SecondAgentExpensesAfterRebate < 0) {


            //alert("Checking the rebate amount");

            //document.getElementById("rebateExceedError").style.display ="";	

            check = 1;

            //alert("The Rebate has exceed");

        } //Closing inner if
        else {

            //alert("The Rebate is perfect");

            //document.getElementById("rebateExceedError").style.display ="none";	

            check = 0;
        } //Closeing inner else 

    }


    //alert("Agent1 rebate: "+AgentRebateamount1);

    //alert("Agent2 rebate: "+AgentRebateamount2);

    //alert("Agent1 referral: "+AgentReferralamount1 );

    //console.log("Agent2 referral: "+AgentReferralamount2 );

    //alert("Agent 1 Net commission: "+AgentNet1 );

    //alert("Agent 2 Net commission: "+AgentNet2 );

    //alert("Agent 1 Expenses: "+FirstAgentExpensesAfterRebate );

    //console.log("Agent 2 Expenses: "+SecondAgentExpensesAfterRebate );

    return check;

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function docNameFill(fileId) {
    if (document.getElementById(fileId).value) {
        var fullPath = document.getElementById(fileId).value;
        if (fullPath) {
            var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
            var filename = fullPath.substring(startIndex);
            if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                filename = filename.substring(1);
            }
            document.getElementById('EXtraDocumentName1').value = filename;
        }
    } else {
        document.getElementById('EXtraDocumentName1').value = '';
    }

}

function SetStatusOptions(status) {

    var mydiv = document.getElementById('PropertyListingStatus').parentElement;

    var elements = mydiv.getElementsByClassName('select-items');

    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }

    var listingType = document.getElementById('PropertyListingType').value;


    var StatusOptions = [];

    if (listingType === "Buyer-Side" || listingType === "BuyerSide-Self-Represented-Vendor") {
        StatusOptions = ['Firm', 'Conditional', 'Closed', 'Offer Withdrawn'];
    } else if (listingType === "Listing-Side") {
        StatusOptions = ['Available', 'Firm', 'Conditional', 'Closed', 'Expired', 'Off-Market', 'Offer Withdrawn'];
    } else if (listingType === "Sale-Double-Sided") {
        StatusOptions = ['Firm', 'Conditional', 'Closed', 'Offer Withdrawn'];
    } else if (listingType === "Landlord-Side") {
        StatusOptions = ['Available', 'Firm', 'Conditional', 'Leased', 'Expired', 'Off-Market', 'Offer Withdrawn'];
    } else if (listingType === "Tenant-Side") {
        StatusOptions = ['Firm', 'Conditional', 'Leased', 'Offer Withdrawn'];
    } else if (listingType === "TenantSide-Self-Represented-Landlord") {
        StatusOptions = ['Firm', 'Conditional', 'Leased', 'Offer Withdrawn'];
    } else if (listingType === "Lease-DoubleSided") {
        StatusOptions = ['Firm', 'Conditional', 'Leased', 'Offer Withdrawn'];
    } else {

        StatusOptions = [];

    }

    var selectCustomer = document.getElementById('PropertyListingStatus');


    var lenght = selectCustomer.options.length;

    while (lenght--) {
        selectCustomer.remove(lenght);
    }

    for (var i = 0; i < StatusOptions.length; i++) {

        //alert(StatusOptions[i]);
        var options = StatusOptions[i];
        var singleElemet = document.createElement("option");
        singleElemet.textContent = options;
        singleElemet.value = options;
        selectCustomer.appendChild(singleElemet);

    }

    selectCustomer.value = '';
    if (status) {
        if (status == 'Reopened') {
            selectCustomer.value = '';
        } else {
            selectCustomer.value = status;
        }
    }

    for (var i = 0; i < StatusOptions.length; i++) {


        var a = document.createElement('DIV');
        a.innerHTML = selectCustomer.options[i].innerHTML;

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

        divselect.appendChild(a);
        //alert("Adding elemet"+" "+i);

    }

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function HSTView() {

    if (document.getElementById("HSTViewcheckmark").checked == true) {
        document.getElementById("HSTSection").style.display = "inline";
    } else {
        document.getElementById("HSTSection").style.display = "none";
    }


}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NewCommissionIncome() {

    //let nume = stringb.replace(/[,]/g, '')

    var TRSListCommission = parseFloat(document.getElementById("TRSListCommission").value.replace(/,/g, ''));

    var TRSSellCommission = parseFloat(document.getElementById("TRSSellCommission").value.replace(/,/g, ''));

    var NewListingHST = parseFloat(document.getElementById("TRSListHTSPercent").value.replace(/,/g, ''));

    var NewSellingHST = parseFloat(document.getElementById("TRSSellCommissionHTSPercent").value.replace(/,/g, ''));

    var NewListingHSTamount = (TRSListCommission * NewListingHST) / 100;

    var NewSellingHSTamount = (TRSSellCommission * NewSellingHST) / 100;



    console.log("NewListingHST" + NewListingHST);

    console.log("NewListingHSTamount" + NewListingHSTamount);



    document.getElementById("TRSListHTS").value = parseFloat(NewListingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSSellCommissionHTS").value = parseFloat(NewSellingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });




    document.getElementById("TRSTotalSellCommission").value = parseFloat(TRSSellCommission + NewSellingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalListCommission").value = parseFloat(TRSListCommission + NewListingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotaHST").value = parseFloat(NewListingHSTamount + NewSellingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalFinalCommissions").value = parseFloat(TRSListCommission + NewListingHSTamount + TRSSellCommission + NewSellingHSTamount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // NewExpenses();

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NewExpenses() {

    var CooperatingCommission = parseFloat(document.getElementById("Co-operatingBrokerageExpensesNet").value.replace(/,/g, ''));

    var ReferralFee = parseFloat(document.getElementById("ExpensesReferralAgentNet").value.replace(/,/g, ''));

    var Agent1 = parseFloat(document.getElementById("AgentExpensesNet1").value.replace(/,/g, ''));

    var Agent2 = parseFloat(document.getElementById("AgentExpensesNet2").value.replace(/,/g, ''));



    var HST1 = parseFloat(document.getElementById("Co-operatingBrokerageExpensesHSTPercent").value.replace(/,/g, ''));

    var HST2 = parseFloat(document.getElementById("ExpensesReferralAgentHSTPercent").value.replace(/,/g, ''));

    var HST3 = parseFloat(document.getElementById("AgentExpensesHST1Percent").value.replace(/,/g, ''));

    var HST4 = parseFloat(document.getElementById("AgentExpensesHST2Percent2").value.replace(/,/g, ''));


    var Rebate1 = parseFloat(document.getElementById("FirstRebateAmount").value.replace(/,/g, ''));

    var Rebate2 = parseFloat(document.getElementById("SecondRebateAmount").value.replace(/,/g, ''));

    var Rebate3 = parseFloat(document.getElementById("ThirdRebateAmount").value.replace(/,/g, ''));

    var Rebate4 = parseFloat(document.getElementById("ForthRebateAmount").value.replace(/,/g, ''));


    var HST5 = parseFloat(document.getElementById("CustomerHST1Percent").value.replace(/,/g, ''));

    var HST6 = parseFloat(document.getElementById("CustomerHST2Percent").value.replace(/,/g, ''));

    var HST7 = parseFloat(document.getElementById("CustomerHST3Percent").value.replace(/,/g, ''));

    var HST8 = parseFloat(document.getElementById("CustomerHST4Percent").value.replace(/,/g, ''));

    document.getElementById("CustomerHST1").value = parseFloat((Rebate1 * HST5) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST2").value = parseFloat((Rebate2 * HST6) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST3").value = parseFloat((Rebate3 * HST7) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerHST4").value = parseFloat((Rebate4 * HST8) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });



    document.getElementById("CustomerTotalAmount1").value = parseFloat(((Rebate1 * HST5) / 100) + Rebate1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerTotalAmount2").value = parseFloat(((Rebate2 * HST6) / 100) + Rebate2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerTotalAmount3").value = parseFloat(((Rebate3 * HST7) / 100) + Rebate3).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerTotalAmount4").value = parseFloat(((Rebate4 * HST8) / 100) + Rebate4).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });



    document.getElementById("Co-operatingBrokerageExpensesHST").value = parseFloat((CooperatingCommission * HST1) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("ExpensesReferralAgentHST").value = parseFloat((ReferralFee * HST2) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("AgentExpensesHST1").value = parseFloat((Agent1 * HST3) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("AgentExpensesHST2").value = parseFloat((Agent2 * HST4) / 100).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("Co-operatingBrokerageExpensesTotalAmount").value = parseFloat(((CooperatingCommission * HST1) / 100) + CooperatingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("ExpensesReferralAgentTotalAmount").value = parseFloat(((ReferralFee * HST2) / 100) + ReferralFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("AgentExpensesTotalAmount1").value = parseFloat(((Agent1 * HST3) / 100) + Agent1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("AgentExpensesTotalAmount2").value = parseFloat(((Agent2 * HST4) / 100) + Agent2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    var Value1 = ((CooperatingCommission * HST1) / 100) + CooperatingCommission;
    var Value2 = ((ReferralFee * HST2) / 100) + ReferralFee;
    var Value3 = ((Agent1 * HST3) / 100) + Agent1;
    var Value4 = ((Agent2 * HST4) / 100) + Agent2;
    var Value5 = ((Rebate1 * HST5) / 100) + Rebate1;
    var Value6 = ((Rebate2 * HST6) / 100) + Rebate2;
    var Value7 = ((Rebate3 * HST7) / 100) + Rebate3;
    var Value8 = ((Rebate4 * HST8) / 100) + Rebate4;

    var HSTAmount1 = (CooperatingCommission * HST1) / 100;
    var HSTAmount2 = (ReferralFee * HST2) / 100;
    var HSTAmount3 = (Agent1 * HST3) / 100;
    var HSTAmount4 = (Agent2 * HST4) / 100;
    var HSTAmount5 = (Rebate1 * HST5) / 100;
    var HSTAmount6 = (Rebate2 * HST6) / 100;
    var HSTAmount7 = (Rebate3 * HST7) / 100;
    var HSTAmount8 = (Rebate4 * HST8) / 100;


    document.getElementById("HSTExpensesAmounts").value = parseFloat(HSTAmount1 + HSTAmount2 + HSTAmount3 + HSTAmount4 + HSTAmount5 + HSTAmount6 + HSTAmount7 + HSTAmount8).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalExpensesAmount").value = parseFloat(Value1 + Value2 + Value3 + Value4 + Value5 + Value6 + Value7 + Value8).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    var a = parseFloat(document.getElementById("TRSTotaHST").value.replace(/,/g, ''));

    var b = parseFloat(document.getElementById("HSTExpensesAmounts").value.replace(/,/g, ''));

    document.getElementById("HSTNetToBrokerageAmounts").value = parseFloat(a - b).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalNetToBrokerageAmount").value = parseFloat(document.getElementById("TRSTotalFinalCommissions").value - document.getElementById("TotalExpensesAmount").value).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function colorTable() {
    $(".visible").removeClass("visible");
    $(".newclass").removeClass("newclass");
    //alert('AAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    var tables = document.getElementsByTagName("table");
    var tri;

    for (let i = 0; i < tables.length; i++) {

        tri = tables[i].getElementsByTagName("tr");

        for (var j = 0, max = tri.length; j < max; j++) {
            if (!isHidden(tri[j])) {
                tri[j].classList.add('visible');
            }
        }

        var resi = tables[i].getElementsByClassName("visible");

        for (var j = resi.length - 1; j > -1; j--) {
            if (j % 2 === 1) {
                resi[j].classList.add('newclass');
            }
        }

    }
}

function isHidden(el) {
    var style = window.getComputedStyle(el);
    return ((style.display === 'none') || (style.visibility === 'hidden'))
}

function postalCorrect(id) {
    var b = document.getElementById(id).value;
    var a = b.replace(/ /g, '').toUpperCase();
    var res = a.slice(0, 3) + " " + a.slice(3);
    document.getElementById(id).value = res;
    if (ValidatePostalCode(id)) {
        document.getElementById(id).style.borderColor = "lightgrey";
    } else {
        document.getElementById(id).style.borderColor = "red";
    }

}

function emailCorrect(id) {
    if (ValidateEmail(id)) {
        document.getElementById(id).style.borderColor = "lightgrey";
    } else {
        document.getElementById(id).style.borderColor = "red";
    }
}

function ValidatePostalCode(id) {
    var b = document.getElementById(id).value;
    var check = 0;
    //regular expression for ca postal code
    var regEx = /[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/;
    var a = b.replace(/ /g, '').toUpperCase();

    if (regEx.test(a)) {
        if (a.length === 6) {

            check = true;
        } else {

            check = false;
        }
    } else {

        check = false;
    }
    return check;
}



function ValidateEmail(id) {
    var a = document.getElementById(id);
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (a.value.match(mailformat)) {
        return true;
    } else {
        return false;
    }
}

function SetAgent1() {

    document.getElementById("FirstAgentGross").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("ReferralToAgent1").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("RebateAgentName1").innerHTML = document.getElementById("FirstAgentID").value;

    document.getElementById("2RebateAgentName1").innerHTML = document.getElementById("FirstAgentID").value;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

function SetAgent2() {

    // SetAgent1();

    document.getElementById("SecondAgentGross").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("ReferralToAgent2").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("RebateAgentName2").innerHTML = document.getElementById("SecondAgentID").value;

    document.getElementById("2RebateAgentName2").innerHTML = document.getElementById("SecondAgentID").value;
}

function SetSecondAgentLists(id) {

    //alert("Here"+" "+document.getElementById("SecondAgentID").value);

    var mydiv = document.getElementById(id).parentElement;
    var elements = mydiv.getElementsByClassName('select-items');
    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }


    var select2 = document.getElementById(id); //This is the First sets of agents  

    var lenght = select2.options.length;

    while (lenght--) {
        select2.remove(lenght);
    }

    for (var i = 0; i < agents.length; i++) {

        //console.log( IDs[i]+" "+agents[i] );

        if (IDs[i] + " " + agents[i] == document.getElementById("FirstAgentID").value) {
            i++;
        }

        //alert("There");

        var opt2 = agents[i]; //Setting the data for an option

        var el2 = document.createElement("option");

        el2.textContent = opt2;

        el2.value = IDs[i] + " " + opt2;

        select2.appendChild(el2);

        //console.log("Adding elemet"+" "+i);

    } //Closing the for loop 

    for (var i = 0; i < agents.length; i++) {

        var a = document.createElement('DIV');
        a.innerHTML = select2.options[i].innerHTML;

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

        divselect.appendChild(a);
        //alert("Adding elemet"+" "+i);

    }

}



function SetDeposits(id, FirstName, LastName, RecivedFrom) {



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

    if (FirstName != null && LastName != null && FirstName != "" && LastName != "") {

        var check = 1;

        for (var i = 0; i < Clients.length; i++) {

            if (Clients[i] === FirstName + " " + LastName) {
                check = 0;
            }

        } //for


        if (check == 0) {} else {
            Clients.push(FirstName + " " + LastName);
        }

        check = 1;

    } else {}





    for (var i = 0; i < Clients.length; i++) {

        var options = Clients[i];
        var singleElemet = document.createElement("option");
        singleElemet.textContent = options;
        singleElemet.value = options;
        selectClient.appendChild(singleElemet);
        selectClient.value = Clients[i].trim();

    } //Close for


    var mydiv = selectClient.parentElement;
    var elements = mydiv.getElementsByClassName('select-items');
    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }



    if (FirstName != null && LastName != null && FirstName != "" && LastName != "") {


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


            if (RecivedFrom == "0") {
                tt.innerHTML = FirstName + " " + LastName;



                document.getElementById(id).value = FirstName + " " + LastName;
            } else {
                tt.innerHTML = "Third Party";
                document.getElementById(id).value = "Third Party";
            }

            divselect.appendChild(a);
        }


    } else {


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
            tt.innerHTML = '-- Option --';
            document.getElementById(id).value == "";

            divselect.appendChild(a);
        }



    }


}






function setProvince(id2, id1) {
    var mydiv = document.getElementById(id1).parentElement;
    var tt = mydiv.getElementsByClassName('select-selected')[0];
    tt.innerHTML = document.getElementById(id2).value;
}

function setProvinceValue(value, id1) {
    var mydiv2 = document.getElementById(id1).parentElement;
    var tt = mydiv2.getElementsByClassName('select-selected')[0];
    tt.innerHTML = value;
}







function ControlDeposit1() {

    var select = document.getElementById("DepositReceivedFrom1");

    if (select.value === "Third Party") {
        //alert("1");
        document.getElementById("DepositSection1").style.display = "block";
        document.getElementById("DepositUnderSection1").style.display = "block";
        document.getElementById("DepositUnderSectionSup1").style.display = "none";
        select.parentElement.style.borderColor = "lightgrey";
        // cleaning

        document.getElementById("DepositRecivedFromRelationship1").value = '';

        document.getElementById("DepositRecivedFromFirstName1").value = '';

        document.getElementById("DepositRecivedFromLastName1").value = '';

        document.getElementById("DepositUnitNumber1").value = '';

        document.getElementById("DepositStreetNumber1").value = '';

        document.getElementById("DepositStreetName1").value = '';

        document.getElementById("DepositCity1").value = '';

        document.getElementById("DepositPostalCode1").value = '';

        document.getElementById("DepositProvince1").value = 'ON';

        setProvinceValue("ON", "DepositProvince1");

        document.getElementById("DepositCountry1").value = "Canada";

        document.getElementById("DepositRecivedEmail1").value = '';

        document.getElementById("DepositRecivedFromPhone1").value = '';

        document.getElementById("DepositRecivedExteraContactNumber1").value = '';

    } else if (((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) || (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value)))) {
        //alert("2");
        document.getElementById("DepositSection1").style.display = "none";
        document.getElementById("DepositUnderSection1").style.display = "none";
        document.getElementById("DepositUnderSectionSup1").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserBusinessName1").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserAuthorizedSigningOfficer1").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value)) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserFirstName1").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserLastName1").value;
        }

        document.getElementById("DepositUnitNumber1").value = document.getElementById("PurchaserUnit1").value;

        document.getElementById("DepositStreetNumber1").value = document.getElementById("PurchaserStreetNumber1").value;

        document.getElementById("DepositStreetName1").value = document.getElementById("purchaserStreetName1").value;

        document.getElementById("DepositCity1").value = document.getElementById("PurchaserCity1").value;

        document.getElementById("DepositPostalCode1").value = document.getElementById("PurchaserPostalCode1").value;

        document.getElementById("DepositProvince1").value = document.getElementById("PurchaserProvince1").value;

        setProvince("PurchaserProvince1", "DepositProvince1");

        document.getElementById("DepositCountry1").value = "Canada";

        document.getElementById("DepositRecivedEmail1").value = document.getElementById("PurchaserEmail1").value;

        document.getElementById("DepositRecivedFromPhone1").value = document.getElementById("PurchaserPhone1").value;

        document.getElementById("DepositRecivedExteraContactNumber1").value = document.getElementById("PurchaserExteraContact1").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) || (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value))) {
        //alert("2");
        document.getElementById("DepositSection1").style.display = "none";
        document.getElementById("DepositUnderSection1").style.display = "none";
        document.getElementById("DepositUnderSectionSup1").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserBusinessName2").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserAuthorizedSigningOfficer2").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value)) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserFirstName2").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserLastName2").value;
        }

        document.getElementById("DepositUnitNumber1").value = document.getElementById("PurchaserUnit2").value;

        document.getElementById("DepositStreetNumber1").value = document.getElementById("PurchaserStreetNumber2").value;

        document.getElementById("DepositStreetName1").value = document.getElementById("purchaserStreetName2").value;

        document.getElementById("DepositCity1").value = document.getElementById("PurchaserCity2").value;

        document.getElementById("DepositPostalCode1").value = document.getElementById("PurchaserPostalCode2").value;

        document.getElementById("DepositProvince1").value = document.getElementById("PurchaserProvince2").value;

        setProvince("PurchaserProvince2", "DepositProvince1");

        document.getElementById("DepositCountry1").value = "Canada";

        document.getElementById("DepositRecivedEmail1").value = document.getElementById("PurchaserEmail2").value;

        document.getElementById("DepositRecivedFromPhone1").value = document.getElementById("PurchaserPhone2").value;

        document.getElementById("DepositRecivedExteraContactNumber1").value = document.getElementById("PurchaserExteraContact2").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) || (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value))) {
        //alert("2");
        document.getElementById("DepositSection1").style.display = "none";
        document.getElementById("DepositUnderSection1").style.display = "none";
        document.getElementById("DepositUnderSectionSup1").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserBusinessName3").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserAuthorizedSigningOfficer3").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value)) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserFirstName3").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserLastName3").value;
        }

        document.getElementById("DepositUnitNumber1").value = document.getElementById("PurchaserUnit3").value;

        document.getElementById("DepositStreetNumber1").value = document.getElementById("PurchaserStreetNumber3").value;

        document.getElementById("DepositStreetName1").value = document.getElementById("purchaserStreetName3").value;

        document.getElementById("DepositCity1").value = document.getElementById("PurchaserCity3").value;

        document.getElementById("DepositPostalCode1").value = document.getElementById("PurchaserPostalCode3").value;

        document.getElementById("DepositProvince1").value = document.getElementById("PurchaserProvince3").value;

        setProvince("PurchaserProvince3", "DepositProvince1");

        document.getElementById("DepositCountry1").value = "Canada";

        document.getElementById("DepositRecivedEmail1").value = document.getElementById("PurchaserEmail3").value;

        document.getElementById("DepositRecivedFromPhone1").value = document.getElementById("PurchaserPhone3").value;

        document.getElementById("DepositRecivedExteraContactNumber1").value = document.getElementById("PurchaserExteraContact3").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) || (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value))) {
        //alert("2");
        document.getElementById("DepositSection1").style.display = "none";
        document.getElementById("DepositUnderSection1").style.display = "none";
        document.getElementById("DepositUnderSectionSup1").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserBusinessName4").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserAuthorizedSigningOfficer4").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value)) {

            document.getElementById("DepositRecivedFromFirstName1").value = document.getElementById("PurchaserFirstName4").value;

            document.getElementById("DepositRecivedFromLastName1").value = document.getElementById("PurchaserLastName4").value;
        }

        document.getElementById("DepositUnitNumber1").value = document.getElementById("PurchaserUnit4").value;

        document.getElementById("DepositStreetNumber1").value = document.getElementById("PurchaserStreetNumber4").value;

        document.getElementById("DepositStreetName1").value = document.getElementById("purchaserStreetName4").value;

        document.getElementById("DepositCity1").value = document.getElementById("PurchaserCity4").value;

        document.getElementById("DepositPostalCode1").value = document.getElementById("PurchaserPostalCode4").value;

        document.getElementById("DepositProvince1").value = document.getElementById("PurchaserProvince4").value;

        setProvince("PurchaserProvince4", "DepositProvince1");

        document.getElementById("DepositCountry1").value = "Canada";

        document.getElementById("DepositRecivedEmail1").value = document.getElementById("PurchaserEmail4").value;

        document.getElementById("DepositRecivedFromPhone1").value = document.getElementById("PurchaserPhone4").value;

        document.getElementById("DepositRecivedExteraContactNumber1").value = document.getElementById("PurchaserExteraContact4").value;
    }
}

function ControlDeposit2() {

    var select = document.getElementById("DepositRecivedFrom2");

    if (select.value === "Third Party") {
        //alert("1");
        document.getElementById("DepositSection2").style.display = "block";
        document.getElementById("DepositUnderSection2").style.display = "block";
        document.getElementById("DepositUnderSectionSup2").style.display = "none";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        // cleaning

        document.getElementById("DepositRecivedFromRelationship2").value = '';

        document.getElementById("DepositRecivedFromFirstName2").value = '';

        document.getElementById("DepositRecivedFromLastName2").value = '';

        document.getElementById("DepositUnitNumber2").value = '';

        document.getElementById("DepositStreetNumber2").value = '';

        document.getElementById("DepositStreetName2").value = '';

        document.getElementById("DepositCity2").value = '';

        document.getElementById("DepositPostalCode2").value = '';

        document.getElementById("DepositProvince2").value = 'ON';

        setProvinceValue("ON", "DepositProvince2");

        document.getElementById("DepositCountry2").value = "Canada";

        document.getElementById("DepositRecivedEmail2").value = '';

        document.getElementById("DepositRecivedFromPhone2").value = '';

        document.getElementById("DepositRecivedExteraContactNumber2").value = '';

    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) || (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value))) {
        //alert("2");
        document.getElementById("DepositSection2").style.display = "none";
        document.getElementById("DepositUnderSection2").style.display = "none";
        document.getElementById("DepositUnderSectionSup2").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserBusinessName1").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserAuthorizedSigningOfficer1").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value)) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserFirstName1").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserLastName1").value;
        }

        document.getElementById("DepositUnitNumber2").value = document.getElementById("PurchaserUnit1").value;

        document.getElementById("DepositStreetNumber2").value = document.getElementById("PurchaserStreetNumber1").value;

        document.getElementById("DepositStreetName2").value = document.getElementById("purchaserStreetName1").value;

        document.getElementById("DepositCity2").value = document.getElementById("PurchaserCity1").value;

        document.getElementById("DepositPostalCode2").value = document.getElementById("PurchaserPostalCode1").value;

        document.getElementById("DepositProvince2").value = document.getElementById("PurchaserProvince1").value;

        setProvince("PurchaserProvince1", "DepositProvince2");

        document.getElementById("DepositCountry2").value = "Canada";

        document.getElementById("DepositRecivedEmail2").value = document.getElementById("PurchaserEmail1").value;

        document.getElementById("DepositRecivedFromPhone2").value = document.getElementById("PurchaserPhone1").value;

        document.getElementById("DepositRecivedExteraContactNumber2").value = document.getElementById("PurchaserExteraContact1").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) || (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value))) {
        //alert("2");
        document.getElementById("DepositSection2").style.display = "none";
        document.getElementById("DepositUnderSection2").style.display = "none";
        document.getElementById("DepositUnderSectionSup2").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserBusinessName2").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserAuthorizedSigningOfficer2").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value)) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserFirstName2").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserLastName2").value;
        }

        document.getElementById("DepositUnitNumber2").value = document.getElementById("PurchaserUnit2").value;

        document.getElementById("DepositStreetNumber2").value = document.getElementById("PurchaserStreetNumber2").value;

        document.getElementById("DepositStreetName2").value = document.getElementById("purchaserStreetName2").value;

        document.getElementById("DepositCity2").value = document.getElementById("PurchaserCity2").value;

        document.getElementById("DepositPostalCode2").value = document.getElementById("PurchaserPostalCode2").value;

        document.getElementById("DepositProvince2").value = document.getElementById("PurchaserProvince2").value;

        setProvince("PurchaserProvince2", "DepositProvince2");

        document.getElementById("DepositCountry2").value = "Canada";

        document.getElementById("DepositRecivedEmail2").value = document.getElementById("PurchaserEmail2").value;

        document.getElementById("DepositRecivedFromPhone2").value = document.getElementById("PurchaserPhone2").value;

        document.getElementById("DepositRecivedExteraContactNumber2").value = document.getElementById("PurchaserExteraContact2").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) || (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value))) {
        //alert("2");
        document.getElementById("DepositSection2").style.display = "none";
        document.getElementById("DepositUnderSection2").style.display = "none";
        document.getElementById("DepositUnderSectionSup2").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserBusinessName3").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserAuthorizedSigningOfficer3").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value)) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserFirstName3").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserLastName3").value;
        }

        document.getElementById("DepositUnitNumber2").value = document.getElementById("PurchaserUnit3").value;

        document.getElementById("DepositStreetNumber2").value = document.getElementById("PurchaserStreetNumber3").value;

        document.getElementById("DepositStreetName2").value = document.getElementById("purchaserStreetName3").value;

        document.getElementById("DepositCity2").value = document.getElementById("PurchaserCity3").value;

        document.getElementById("DepositPostalCode2").value = document.getElementById("PurchaserPostalCode3").value;

        document.getElementById("DepositProvince2").value = document.getElementById("PurchaserProvince3").value;

        setProvince("PurchaserProvince3", "DepositProvince2");

        document.getElementById("DepositCountry2").value = "Canada";

        document.getElementById("DepositRecivedEmail2").value = document.getElementById("PurchaserEmail3").value;

        document.getElementById("DepositRecivedFromPhone2").value = document.getElementById("PurchaserPhone3").value;

        document.getElementById("DepositRecivedExteraContactNumber2").value = document.getElementById("PurchaserExteraContact3").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) || (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value))) {
        //alert("2");
        document.getElementById("DepositSection2").style.display = "none";
        document.getElementById("DepositUnderSection2").style.display = "none";
        document.getElementById("DepositUnderSectionSup2").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserBusinessName4").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserAuthorizedSigningOfficer4").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value)) {

            document.getElementById("DepositRecivedFromFirstName2").value = document.getElementById("PurchaserFirstName4").value;

            document.getElementById("DepositRecivedFromLastName2").value = document.getElementById("PurchaserLastName4").value;
        }

        document.getElementById("DepositUnitNumber2").value = document.getElementById("PurchaserUnit4").value;

        document.getElementById("DepositStreetNumber2").value = document.getElementById("PurchaserStreetNumber4").value;

        document.getElementById("DepositStreetName2").value = document.getElementById("purchaserStreetName4").value;

        document.getElementById("DepositCity2").value = document.getElementById("PurchaserCity4").value;

        document.getElementById("DepositPostalCode2").value = document.getElementById("PurchaserPostalCode4").value;

        document.getElementById("DepositProvince2").value = document.getElementById("PurchaserProvince4").value;

        setProvince("PurchaserProvince4", "DepositProvince2");

        document.getElementById("DepositCountry2").value = "Canada";

        document.getElementById("DepositRecivedEmail2").value = document.getElementById("PurchaserEmail4").value;

        document.getElementById("DepositRecivedFromPhone2").value = document.getElementById("PurchaserPhone4").value;

        document.getElementById("DepositRecivedExteraContactNumber2").value = document.getElementById("PurchaserExteraContact4").value;
    }
}

function ControlDeposit3() {

    var select = document.getElementById("DepositRecivedFrom3");

    if (select.value === "Third Party") {
        //alert("1");
        document.getElementById("DepositSection3").style.display = "block";
        document.getElementById("DepositUnderSection3").style.display = "block";
        document.getElementById("DepositUnderSectionSup3").style.display = "none";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }
        // cleaning
        document.getElementById("DepositRecivedFromRelationship3").value = '';

        document.getElementById("DepositRecivedFromFirstName3").value = '';

        document.getElementById("DepositRecivedFromLastName3").value = '';

        document.getElementById("DepositUnitNumber3").value = '';

        document.getElementById("DepositStreetNumber3").value = '';

        document.getElementById("DepositStreetName3").value = '';

        document.getElementById("DepositCity3").value = '';

        document.getElementById("DepositPostalCode3").value = '';

        document.getElementById("DepositProvince3").value = 'ON';

        setProvinceValue("ON", "DepositProvince3");

        document.getElementById("DepositCountry3").value = "Canada";

        document.getElementById("DepositRecivedEmail3").value = '';

        document.getElementById("DepositRecivedFromPhone3").value = '';

        document.getElementById("DepositRecivedExteraContactNumber3").value = '';

    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) || (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value))) {
        //alert("2");
        document.getElementById("DepositSection3").style.display = "none";
        document.getElementById("DepositUnderSection3").style.display = "none";
        document.getElementById("DepositUnderSectionSup3").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserBusinessName1").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserAuthorizedSigningOfficer1").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value)) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserFirstName1").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserLastName1").value;
        }

        document.getElementById("DepositUnitNumber3").value = document.getElementById("PurchaserUnit1").value;

        document.getElementById("DepositStreetNumber3").value = document.getElementById("PurchaserStreetNumber1").value;

        document.getElementById("DepositStreetName3").value = document.getElementById("purchaserStreetName1").value;

        document.getElementById("DepositCity3").value = document.getElementById("PurchaserCity1").value;

        document.getElementById("DepositPostalCode3").value = document.getElementById("PurchaserPostalCode1").value;

        document.getElementById("DepositProvince3").value = document.getElementById("PurchaserProvince1").value;

        setProvince("PurchaserProvince1", "DepositProvince3");

        document.getElementById("DepositCountry3").value = "Canada";

        document.getElementById("DepositRecivedEmail3").value = document.getElementById("PurchaserEmail1").value;

        document.getElementById("DepositRecivedFromPhone3").value = document.getElementById("PurchaserPhone1").value;

        document.getElementById("DepositRecivedExteraContactNumber3").value = document.getElementById("PurchaserExteraContact1").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) || (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value))) {
        //alert("2");
        document.getElementById("DepositSection3").style.display = "none";
        document.getElementById("DepositUnderSection3").style.display = "none";
        document.getElementById("DepositUnderSectionSup3").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserBusinessName2").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserAuthorizedSigningOfficer2").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value)) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserFirstName2").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserLastName2").value;
        }

        document.getElementById("DepositUnitNumber3").value = document.getElementById("PurchaserUnit2").value;

        document.getElementById("DepositStreetNumber3").value = document.getElementById("PurchaserStreetNumber2").value;

        document.getElementById("DepositStreetName3").value = document.getElementById("purchaserStreetName2").value;

        document.getElementById("DepositCity3").value = document.getElementById("PurchaserCity2").value;

        document.getElementById("DepositPostalCode3").value = document.getElementById("PurchaserPostalCode2").value;

        document.getElementById("DepositProvince3").value = document.getElementById("PurchaserProvince2").value;

        setProvince("PurchaserProvince2", "DepositProvince3");

        document.getElementById("DepositCountry3").value = "Canada";

        document.getElementById("DepositRecivedEmail3").value = document.getElementById("PurchaserEmail2").value;

        document.getElementById("DepositRecivedFromPhone3").value = document.getElementById("PurchaserPhone2").value;

        document.getElementById("DepositRecivedExteraContactNumber3").value = document.getElementById("PurchaserExteraContact2").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) || (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value))) {
        //alert("2");
        document.getElementById("DepositSection3").style.display = "none";
        document.getElementById("DepositUnderSection3").style.display = "none";
        document.getElementById("DepositUnderSectionSup3").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserBusinessName3").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserAuthorizedSigningOfficer3").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value)) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserFirstName3").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserLastName3").value;
        }

        document.getElementById("DepositUnitNumber3").value = document.getElementById("PurchaserUnit3").value;

        document.getElementById("DepositStreetNumber3").value = document.getElementById("PurchaserStreetNumber3").value;

        document.getElementById("DepositStreetName3").value = document.getElementById("purchaserStreetName3").value;

        document.getElementById("DepositCity3").value = document.getElementById("PurchaserCity3").value;

        document.getElementById("DepositPostalCode3").value = document.getElementById("PurchaserPostalCode3").value;

        document.getElementById("DepositProvince3").value = document.getElementById("PurchaserProvince3").value;

        setProvince("PurchaserProvince3", "DepositProvince3");

        document.getElementById("DepositCountry3").value = "Canada";

        document.getElementById("DepositRecivedEmail3").value = document.getElementById("PurchaserEmail3").value;

        document.getElementById("DepositRecivedFromPhone3").value = document.getElementById("PurchaserPhone3").value;

        document.getElementById("DepositRecivedExteraContactNumber3").value = document.getElementById("PurchaserExteraContact3").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) || (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value))) {
        //alert("2");
        document.getElementById("DepositSection3").style.display = "none";
        document.getElementById("DepositUnderSection3").style.display = "none";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserBusinessName4").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserAuthorizedSigningOfficer4").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value)) {

            document.getElementById("DepositRecivedFromFirstName3").value = document.getElementById("PurchaserFirstName4").value;

            document.getElementById("DepositRecivedFromLastName3").value = document.getElementById("PurchaserLastName4").value;
        }

        document.getElementById("DepositUnitNumber3").value = document.getElementById("PurchaserUnit4").value;

        document.getElementById("DepositStreetNumber3").value = document.getElementById("PurchaserStreetNumber4").value;

        document.getElementById("DepositStreetName3").value = document.getElementById("purchaserStreetName4").value;

        document.getElementById("DepositCity3").value = document.getElementById("PurchaserCity4").value;

        document.getElementById("DepositPostalCode3").value = document.getElementById("PurchaserPostalCode4").value;

        document.getElementById("DepositProvince3").value = document.getElementById("PurchaserProvince4").value;

        setProvince("PurchaserProvince4", "DepositProvince3");

        document.getElementById("DepositCountry3").value = "Canada";

        document.getElementById("DepositRecivedEmail3").value = document.getElementById("PurchaserEmail4").value;

        document.getElementById("DepositRecivedFromPhone3").value = document.getElementById("PurchaserPhone4").value;

        document.getElementById("DepositRecivedExteraContactNumber3").value = document.getElementById("PurchaserExteraContact4").value;
    }


}

function ControlDeposit4() {

    var select = document.getElementById("DepositReceivedFrom4");

    if (select.value === "Third Party") {
        //alert("1");
        document.getElementById("DepositSection4").style.display = "block";
        document.getElementById("DepositUnderSection4").style.display = "block";
        document.getElementById("DepositUnderSectionSup4").style.display = "none";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }
        // cleaning

        document.getElementById("DepositRecivedFromRelationship4").value = '';

        document.getElementById("DepositRecivedFromFirstName4").value = '';

        document.getElementById("DepositRecivedFromLastName4").value = '';

        document.getElementById("DepositUnitNumber4").value = '';

        document.getElementById("DepositStreetNumber4").value = '';

        document.getElementById("DepositStreetName4").value = '';

        document.getElementById("DepositCity4").value = '';

        document.getElementById("DepositPostalCode4").value = '';

        document.getElementById("DepositProvince4").value = 'ON';

        setProvinceValue("ON", "DepositProvince4");

        document.getElementById("DepositCountry4").value = "Canada";

        document.getElementById("DepositRecivedEmail4").value = '';

        document.getElementById("DepositRecivedFromPhone4").value = '';

        document.getElementById("DepositRecivedExteraContactNumber4").value = '';

    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) || (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value))) {
        //alert("2");
        document.getElementById("DepositSection4").style.display = "none";
        document.getElementById("DepositUnderSection4").style.display = "none";
        document.getElementById("DepositUnderSectionSup4").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer1").value) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserBusinessName1").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserAuthorizedSigningOfficer1").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName1").value + " " + document.getElementById("PurchaserLastName1").value)) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserFirstName1").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserLastName1").value;
        }

        document.getElementById("DepositUnitNumber4").value = document.getElementById("PurchaserUnit1").value;

        document.getElementById("DepositStreetNumber4").value = document.getElementById("PurchaserStreetNumber1").value;

        document.getElementById("DepositStreetName4").value = document.getElementById("purchaserStreetName1").value;

        document.getElementById("DepositCity4").value = document.getElementById("PurchaserCity1").value;

        document.getElementById("DepositPostalCode4").value = document.getElementById("PurchaserPostalCode1").value;

        document.getElementById("DepositProvince4").value = document.getElementById("PurchaserProvince1").value;

        setProvince("PurchaserProvince1", "DepositProvince4");

        document.getElementById("DepositCountry4").value = "Canada";

        document.getElementById("DepositRecivedEmail4").value = document.getElementById("PurchaserEmail1").value;

        document.getElementById("DepositRecivedFromPhone4").value = document.getElementById("PurchaserPhone1").value;

        document.getElementById("DepositRecivedExteraContactNumber4").value = document.getElementById("PurchaserExteraContact1").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) || (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value))) {
        //alert("2");
        document.getElementById("DepositSection4").style.display = "none";
        document.getElementById("DepositUnderSection4").style.display = "none";
        document.getElementById("DepositUnderSectionSup4").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }
        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer2").value) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserBusinessName2").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserAuthorizedSigningOfficer2").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName2").value + " " + document.getElementById("PurchaserLastName2").value)) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserFirstName2").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserLastName2").value;
        }

        document.getElementById("DepositUnitNumber4").value = document.getElementById("PurchaserUnit2").value;

        document.getElementById("DepositStreetNumber4").value = document.getElementById("PurchaserStreetNumber2").value;

        document.getElementById("DepositStreetName4").value = document.getElementById("purchaserStreetName2").value;

        document.getElementById("DepositCity4").value = document.getElementById("PurchaserCity2").value;

        document.getElementById("DepositPostalCode4").value = document.getElementById("PurchaserPostalCode2").value;

        document.getElementById("DepositProvince4").value = document.getElementById("PurchaserProvince2").value;

        setProvince("PurchaserProvince2", "DepositProvince4");

        document.getElementById("DepositCountry4").value = "Canada";

        document.getElementById("DepositRecivedEmail4").value = document.getElementById("PurchaserEmail2").value;

        document.getElementById("DepositRecivedFromPhone4").value = document.getElementById("PurchaserPhone2").value;

        document.getElementById("DepositRecivedExteraContactNumber4").value = document.getElementById("PurchaserExteraContact2").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) || (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value))) {
        //alert("2");
        document.getElementById("DepositSection4").style.display = "none";
        document.getElementById("DepositUnderSection4").style.display = "none";
        document.getElementById("DepositUnderSectionSup4").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer3").value) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserBusinessName3").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserAuthorizedSigningOfficer3").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName3").value + " " + document.getElementById("PurchaserLastName3").value)) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserFirstName3").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserLastName3").value;
        }

        document.getElementById("DepositUnitNumber4").value = document.getElementById("PurchaserUnit3").value;

        document.getElementById("DepositStreetNumber4").value = document.getElementById("PurchaserStreetNumber3").value;

        document.getElementById("DepositStreetName4").value = document.getElementById("purchaserStreetName3").value;

        document.getElementById("DepositCity4").value = document.getElementById("PurchaserCity3").value;

        document.getElementById("DepositPostalCode4").value = document.getElementById("PurchaserPostalCode3").value;

        document.getElementById("DepositProvince4").value = document.getElementById("PurchaserProvince3").value;

        setProvince("PurchaserProvince3", "DepositProvince4");

        document.getElementById("DepositCountry4").value = "Canada";

        document.getElementById("DepositRecivedEmail4").value = document.getElementById("PurchaserEmail3").value;

        document.getElementById("DepositRecivedFromPhone4").value = document.getElementById("PurchaserPhone3").value;

        document.getElementById("DepositRecivedExteraContactNumber4").value = document.getElementById("PurchaserExteraContact3").value;
    } else if ((select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) || (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value))) {
        //alert("2");
        document.getElementById("DepositSection4").style.display = "none";
        document.getElementById("DepositUnderSection4").style.display = "block";
        document.getElementById("DepositUnderSectionSup4").style.display = "block";
        if (!(select.value === "" || select.value === " " || !select.value)) {
            select.parentElement.style.borderColor = "lightgrey";
        }

        if (select.value === document.getElementById("PurchaserAuthorizedSigningOfficer4").value) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserBusinessName4").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserAuthorizedSigningOfficer4").value;

        } else if (select.value === (document.getElementById("PurchaserFirstName4").value + " " + document.getElementById("PurchaserLastName4").value)) {

            document.getElementById("DepositRecivedFromFirstName4").value = document.getElementById("PurchaserFirstName4").value;

            document.getElementById("DepositRecivedFromLastName4").value = document.getElementById("PurchaserLastName4").value;
        }

        document.getElementById("DepositUnitNumber4").value = document.getElementById("PurchaserUnit4").value;

        document.getElementById("DepositStreetNumber4").value = document.getElementById("PurchaserStreetNumber4").value;

        document.getElementById("DepositStreetName4").value = document.getElementById("purchaserStreetName4").value;

        document.getElementById("DepositCity4").value = document.getElementById("PurchaserCity4").value;

        document.getElementById("DepositPostalCode4").value = document.getElementById("PurchaserPostalCode4").value;

        document.getElementById("DepositProvince4").value = document.getElementById("PurchaserProvince4").value;

        setProvince("PurchaserProvince4", "DepositProvince4");

        document.getElementById("DepositCountry4").value = "Canada";

        document.getElementById("DepositRecivedEmail4").value = document.getElementById("PurchaserEmail4").value;

        document.getElementById("DepositRecivedFromPhone4").value = document.getElementById("PurchaserPhone4").value;

        document.getElementById("DepositRecivedExteraContactNumber4").value = document.getElementById("PurchaserExteraContact4").value;
    }
}

function Display(id1, id2) {
    if (document.getElementById(id1).value === 'Other') {
        document.getElementById(id2).style.display = 'flex'
    } else {
        document.getElementById(id2).style.display = 'none'
    }
}

function SetPayment(id) {

    //alert("Here"+" "+document.getElementById("SecondAgentID").value);

    var mydiv = document.getElementById(id).parentElement;
    var elements = mydiv.getElementsByClassName('select-items');
    var divselect = elements[0];

    while (divselect.firstChild) {
        //The list is LIVE so it will re-index each call
        divselect.removeChild(divselect.firstChild);
    }


    var select2 = document.getElementById(id); //This is the First sets of agents  

    var lenghtpayment = select2.options.length;


    for (var i = 0; i < lenghtpayment; i++) {

        var a = document.createElement('DIV');
        a.innerHTML = select2.options[i].innerHTML;

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

        divselect.appendChild(a);
        //alert("Adding elemet"+" "+i);

    }

}

function customsel() {

    try {
        var x, i, j, l, ll, selElmnt, a, b, c;
        /* Look for any elements with the class "custom-select": */
        x = document.getElementsByClassName("custom-select");
        l = x.length;
        for (i = 0; i < l; i++) {
            selElmnt = x[i].getElementsByTagName("select")[0];
            ll = selElmnt.length;
            /* For each element, create a new DIV that will act as the selected item: */
            a = document.createElement("DIV");
            a.setAttribute("class", "select-selected");
            a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
            x[i].appendChild(a);
            /* For each element, create a new DIV that will contain the option list: */
            b = document.createElement("DIV");
            b.setAttribute("class", "select-items select-hide");
            for (j = 1; j < ll; j++) {
                /* For each option in the original select element,
                create a new DIV that will act as an option item: */
                c = document.createElement("DIV");
                c.innerHTML = selElmnt.options[j].innerHTML;
                c.addEventListener("click", function (e) {
                    /* When an item is clicked, update the original select box,
                    and the selected item: */
                    var y, i, k, s, h, sl, yl;
                    s = this.parentNode.parentNode.getElementsByTagName("select")[
                        0];
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

                        }
                        this.parentNode.parentNode.style.borderColor = "lightgrey";
                    }
                    h.click();
                });
                b.appendChild(c);
            }
            x[i].appendChild(b);
            a.addEventListener("click", function (e) {
                /* When the select box is clicked, close any other select boxes,
                and open/close the current select box: */
                e.stopPropagation();
                closeAllSelect(this);
                this.nextSibling.classList.toggle("select-hide");
                this.classList.toggle("select-arrow-active");

            });
        }

        function closeAllSelect(elmnt) {
            /* A function that will close all select boxes in the document,
            except the current select box: */
            var x, y, i, xl, yl, arrNo = [];
            x = document.getElementsByClassName("select-items");
            y = document.getElementsByClassName("select-selected");
            xl = x.length;
            yl = y.length;
            for (i = 0; i < yl; i++) {
                if (elmnt == y[i]) {
                    arrNo.push(i)
                } else {
                    y[i].classList.remove("select-arrow-active");
                }
            }
            for (i = 0; i < xl; i++) {
                if (arrNo.indexOf(i)) {
                    x[i].classList.add("select-hide");
                }
            }
        }

        /* If the user clicks anywhere outside the select box,
        then close all select boxes: */
        document.addEventListener("click", closeAllSelect);
        
    } catch (err) {
        // let sels = document.getElementsByClassName("custom-select");
        // let div1 = document.getElementsByClassName("select-items");
        // let div2 = document.getElementsByClassName("select-selected");
        // for (const a in sels){
        //     sels[a].classList.remove("custom-select");
        // }
        // for (const b in div1){
        //     div1[b].parentNode.removeChild(div1[b].parentNode.getElementsByClassName("select-items")[0]);
        // }
        // for (const c in div2){
        //     div2[c].parentNode.removeChild(div2[c].parentNode.getElementsByClassName("select-selected")[0]);
        // }
    }

}

function alignDeposits(id1, id2, id3, id4) {
    alignDeposit(id1);
    alignDeposit(id2);
    alignDeposit(id3);
    alignDeposit(id4);
}

function alignDeposit(id) {
    let value = document.getElementById(id).value;
    if (value.length > 16) {
        document.getElementById(id).style.height = '30px';
        document.getElementById(id).style.paddingTop = '';
    } else {
        document.getElementById(id).style.height = '';
        document.getElementById(id).style.paddingTop = '5px';
    }
}


//   -----------VALIDATION !!!!!!--------------

function validateDepositStep() {

    var CheckDeposit1 = 0;
    var CheckDeposit2 = 0;
    var CheckDeposit3 = 0;
    var CheckDeposit4 = 0;
    var variables = [];



    var amount = document.getElementById("DepositAmount1").value;


    if (!(amount <= 0 || amount === null || amount === "" || !amount)) {
        variables.push(document.getElementById("DepositType1"), document.getElementById("DepositAmount1"),
            document.getElementById("DepositDate1"), document.getElementById("DepositReceivedFrom1"));

        if (document.getElementById("DepositReceivedFrom1").value === "Third Party") {
            variables.push(document.getElementById("DepositRecivedFromRelationship1"), document.getElementById("DepositRecivedFromFirstName1"),
                document.getElementById("DepositRecivedFromLastName1"), document.getElementById("DepositStreetNumber1"),
                document.getElementById("DepositStreetName1"), document.getElementById("DepositCity1"),
                document.getElementById("DepositCountry1"), document.getElementById("DepositRecivedFromPhone1"));

            if (!(document.getElementById('DepositProvince1').value === "Other")) {}
            if (!ValidatePostalCode("DepositPostalCode1")) {
                document.getElementById("DepositPostalCode1").style.borderColor = "red";
                CheckDeposit1 = 1;
            } else {
                document.getElementById("DepositPostalCode1").style.borderColor = "lightgrey";
            }

            if (!ValidateEmail("DepositRecivedEmail1")) {
                document.getElementById("DepositRecivedEmail1").style.borderColor = "red";
                CheckDeposit1 = 1;
            } else {
                document.getElementById("DepositRecivedEmail1").style.borderColor = "lightgrey";
            }
        }


        for (let i = 0; i < variables.length; i++) {
            if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
                CheckDeposit1 = 1;
                variables[i].style.borderColor = "red";
                if (i === 0) {
                    document.getElementById("DepositType1").parentElement.style.borderColor = "red";
                }
                if (i === 1) {
                    document.getElementById("DepositAmount1").parentElement.style.borderColor = "red";
                }
                if (i === 2) {
                    document.getElementById("DepositDateLabel1").style.borderColor = "red";
                }
                if (i === 4) {
                    console.log(4444444444444444444444)
                    document.getElementById("DepositReceivedFrom1").parentElement.style.borderColor = "red";
                }

            } else {
                variables[i].style.borderColor = "lightgrey";
                if (i === 0) {
                    document.getElementById("DepositType1").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 1) {
                    document.getElementById("DepositAmount1").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 2) {
                    document.getElementById("DepositDateLabel1").style.borderColor = "lightgrey";
                }
                if (i === 4) {
                    document.getElementById("DepositReceivedFrom1").parentElement.style.borderColor = "lightgrey";
                }
            }
        }

        variables = [];

    } else {
        CheckDeposit1 = 0;

        variables.push(document.getElementById("DepositType1"), document.getElementById("DepositAmount1"),
            document.getElementById("DepositDate1"),
            document.getElementById("DepositRecivedFromRelationship1"), document.getElementById("DepositRecivedFromFirstName1"),
            document.getElementById("DepositRecivedFromLastName1"), document.getElementById("DepositStreetNumber1"),
            document.getElementById("DepositStreetName1"), document.getElementById("DepositCity1"),
            document.getElementById("DepositCountry1"), document.getElementById("DepositRecivedFromPhone1"));

        for (let i = 0; i < variables.length; i++) {
            variables[i].style.borderColor = "lightgrey";
            if (i === 0) {
                document.getElementById("DepositType1").parentElement.style.borderColor = "lightgrey";
            }
            if (i === 1) {
                document.getElementById("DepositAmount1").parentElement.style.borderColor = "lightgrey";
            }
            if (i === 2) {
                document.getElementById("DepositDateLabel1").style.borderColor = "lightgrey";
            }
            if (i === 4) {
                document.getElementById("DepositReceivedFrom1").parentElement.style.borderColor = "green";
            }
        }

        if (amount < 0) {
            document.getElementById("DepositAmount1").parentElement.style.borderColor = "red";
            CheckDeposit1 = 1;
        } else {
            document.getElementById("DepositAmount1").parentElement.style.borderColor = "lightgrey";
        }

        variables = [];
    }

    if (document.getElementById("Deposit2").style.display === "block" || !(document.getElementById("Deposit2").style.display == 'none')) {

        variables = [];

        var value = document.getElementById("DepositAmount2").value;

        if (!(value <= 0 || value === null || value === " " || !value)) {

            variables.push(document.getElementById("DepositType2"), document.getElementById("DepositAmount2"),
                document.getElementById("DepositDate2"), document.getElementById("DepositRecivedFrom2"));

            if (document.getElementById("DepositRecivedFrom2").value === "Third Party") {
                variables.push(document.getElementById("DepositRecivedFromRelationship2"), document.getElementById("DepositRecivedFromFirstName2"),
                    document.getElementById("DepositRecivedFromLastName2"), document.getElementById("DepositStreetNumber2"),
                    document.getElementById("DepositStreetName2"), document.getElementById("DepositCity2"),
                    document.getElementById("DepositCountry2"), document.getElementById("DepositRecivedFromPhone2"));

                if (!(document.getElementById('DepositProvince2').value === "Other")) {}
                if (!ValidatePostalCode("DepositPostalCode2")) {
                    document.getElementById("DepositPostalCode2").style.borderColor = "red";
                    CheckDeposit2 = 1;
                } else {
                    document.getElementById("DepositPostalCode2").style.borderColor = "lightgrey";
                }

                if (!ValidateEmail("DepositRecivedEmail2")) {
                    document.getElementById("DepositRecivedEmail2").style.borderColor = "red";
                    CheckDeposit2 = 1;
                } else {
                    document.getElementById("DepositRecivedEmail2").style.borderColor = "lightgrey";
                }
            }

            for (let i = 0; i < variables.length; i++) {
                if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
                    CheckDeposit2 = 1;

                    if (i === 0) {
                        document.getElementById("DepositType2").parentElement.style.borderColor = "red";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount2").parentElement.style.borderColor = "red";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel2").style.borderColor = "red";
                    }
                    if (i === 4) {
                        document.getElementById("DepositRecivedFrom2").parentElement.style.borderColor = "red";
                    }

                    variables[i].style.borderColor = "red";

                } else {
                    variables[i].style.borderColor = "lightgrey";
                    if (i === 0) {
                        document.getElementById("DepositType2").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount2").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel2").style.borderColor = "lightgrey";
                    }
                    if (i === 4) {
                        document.getElementById("DepositRecivedFrom2").parentElement.style.borderColor = "lightgrey";
                    }
                }
            }

            variables = [];

        } else {
            CheckDeposit2 = 0;
            variables.push(document.getElementById("DepositType2"), document.getElementById("DepositAmount2"),
                document.getElementById("DepositDate2"),
                document.getElementById("DepositRecivedFromRelationship2"), document.getElementById("DepositRecivedFromFirstName2"),
                document.getElementById("DepositRecivedFromLastName2"), document.getElementById("DepositStreetNumber2"),
                document.getElementById("DepositStreetName2"), document.getElementById("DepositCity2"),
                document.getElementById("DepositCountry2"), document.getElementById("DepositRecivedFromPhone2")
            );
            //alert(variables.length);
            for (let i = 0; i < variables.length; i++) {
                //alert(variables[i].value);
                variables[i].style.borderColor = "lightgrey";
                if (i === 0) {
                    document.getElementById("DepositType2").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 1) {
                    document.getElementById("DepositAmount2").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 2) {
                    document.getElementById("DepositDateLabel2").style.borderColor = "lightgrey";
                }
                if (i === 4) {
                    document.getElementById("DepositRecivedFrom2").parentElement.style.borderColor = "lightgrey";
                }
            }
            if (value < 0) {
                document.getElementById("DepositAmount2").parentElement.style.borderColor = "red";
                CheckDeposit2 = 1;
            } else {
                document.getElementById("DepositAmount2").parentElement.style.borderColor = "lightgrey";
            }
            variables = [];
        }

    } //close if
    else {
        CheckDeposit2 = 0;
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if (document.getElementById("Deposit3").style.display === "block" || !(document.getElementById("Deposit3").style.display == 'none')) {

        variables = [];

        var value = document.getElementById("DepositAmount3").value;

        if (!(value <= 0 || value === null || value === " " || !value)) {

            variables.push(document.getElementById("DepositType3"), document.getElementById("DepositAmount3"),
                document.getElementById("DepositDate3"), document.getElementById("DepositRecivedFrom3"));

            if (document.getElementById("DepositRecivedFrom3").value === "Third Party") {
                variables.push(document.getElementById("DepositRecivedFromRelationship3"), document.getElementById("DepositRecivedFromFirstName3"),
                    document.getElementById("DepositRecivedFromLastName3"), document.getElementById("DepositStreetNumber3"),
                    document.getElementById("DepositStreetName3"), document.getElementById("DepositCity3"),
                    document.getElementById("DepositCountry3"), document.getElementById("DepositRecivedFromPhone3"));

                if (!(document.getElementById('DepositProvince3').value === "Other")) {}
                if (!ValidatePostalCode("DepositPostalCode3")) {
                    document.getElementById("DepositPostalCode3").style.borderColor = "red";
                    CheckDeposit3 = 1;
                } else {
                    document.getElementById("DepositPostalCode3").style.borderColor = "lightgrey";
                }

                if (!ValidateEmail("DepositRecivedEmail3")) {
                    document.getElementById("DepositRecivedEmail3").style.borderColor = "red";
                    CheckDeposit3 = 1;
                } else {
                    document.getElementById("DepositRecivedEmail3").style.borderColor = "lightgrey";
                }

            }

            for (let i = 0; i < variables.length; i++) {
                if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
                    CheckDeposit3 = 1;

                    if (i === 0) {
                        document.getElementById("DepositType3").parentElement.style.borderColor = "red";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount3").parentElement.style.borderColor = "red";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel3").style.borderColor = "red";
                    }
                    if (i === 4) {
                        document.getElementById("DepositRecivedFrom3").parentElement.style.borderColor = "red";
                    }

                    variables[i].style.borderColor = "red";

                } else {
                    variables[i].style.borderColor = "lightgrey";
                    if (i === 0) {
                        document.getElementById("DepositType3").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount3").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel3").style.borderColor = "lightgrey";
                    }
                    if (i === 4) {
                        document.getElementById("DepositRecivedFrom3").parentElement.style.borderColor = "lightgrey";
                    }
                }
            }
            variables = [];
        } else {
            CheckDeposit3 = 0;
            variables.push(document.getElementById("DepositType3"), document.getElementById("DepositAmount3"),
                document.getElementById("DepositDate3"),
                document.getElementById("DepositRecivedFromRelationship3"), document.getElementById("DepositRecivedFromFirstName3"),
                document.getElementById("DepositRecivedFromLastName3"), document.getElementById("DepositStreetNumber3"),
                document.getElementById("DepositStreetName3"), document.getElementById("DepositCity3"),
                document.getElementById("DepositCountry3"), document.getElementById("DepositRecivedFromPhone3"));
            for (let i = 0; i < variables.length; i++) {
                //alert(variables[i].value);
                variables[i].style.borderColor = "lightgrey";
                if (i === 0) {
                    document.getElementById("DepositType3").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 1) {
                    document.getElementById("DepositAmount3").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 2) {
                    document.getElementById("DepositDateLabel3").style.borderColor = "lightgrey";
                }
                if (i === 4) {
                    document.getElementById("DepositRecivedFrom3").parentElement.style.borderColor = "lightgrey";
                }
            }
            if (value < 0) {
                document.getElementById("DepositAmount3").parentElement.style.borderColor = "red";
                CheckDeposit3 = 1;
            } else {
                document.getElementById("DepositAmount3").parentElement.style.borderColor = "";
            }

            variables = [];
        }


    } else {
        CheckDeposit3 = 0;
    }

    //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if (document.getElementById("Deposit4").style.display === "block" || !(document.getElementById("Deposit4").style.display == 'none')) {

        variables = [];

        var value = document.getElementById("DepositAmount4").value;

        if (!(value <= 0 || value === null || value === " " || !value)) {

            variables.push(document.getElementById("DepositType4"), document.getElementById("DepositAmount4"),
                document.getElementById("DepositDate4"), document.getElementById("DepositReceivedFrom4"));
            if (document.getElementById("DepositReceivedFrom4").value === "Third Party") {
                variables.push(document.getElementById("DepositRecivedFromRelationship4"), document.getElementById("DepositRecivedFromFirstName4"),
                    document.getElementById("DepositRecivedFromLastName4"), document.getElementById("DepositStreetNumber4"),
                    document.getElementById("DepositStreetName4"), document.getElementById("DepositCity4"),
                    document.getElementById("DepositCountry4"), document.getElementById("DepositRecivedFromPhone4"));

                if (!(document.getElementById('DepositProvince4').value === "Other")) {}
                if (!ValidatePostalCode("DepositPostalCode4")) {
                    document.getElementById("DepositPostalCode4").style.borderColor = "red";
                    CheckDeposit4 = 1;
                } else {
                    document.getElementById("DepositPostalCode4").style.borderColor = "lightgrey";
                }

                if (!ValidateEmail("DepositRecivedEmail4")) {
                    document.getElementById("DepositRecivedEmail4").style.borderColor = "red";
                    CheckDeposit4 = 1;
                } else {
                    document.getElementById("DepositRecivedEmail4").style.borderColor = "lightgrey";
                }
            }

            for (let i = 0; i < variables.length; i++) {
                if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
                    CheckDeposit4 = 1;

                    if (i === 0) {
                        document.getElementById("DepositType4").parentElement.style.borderColor = "red";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount4").parentElement.style.borderColor = "red";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel4").style.borderColor = "red";
                    }
                    if (i === 4) {
                        document.getElementById("DepositReceivedFrom4").parentElement.style.borderColor = "red";
                    }

                    variables[i].style.borderColor = "red";

                } else {
                    variables[i].style.borderColor = "lightgrey";
                    if (i === 0) {
                        document.getElementById("DepositType4").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 1) {
                        document.getElementById("DepositAmount4").parentElement.style.borderColor = "lightgrey";
                    }
                    if (i === 2) {
                        document.getElementById("DepositDateLabel4").style.borderColor = "lightgrey";
                    }
                    if (i === 4) {
                        document.getElementById("DepositReceivedFrom4").parentElement.style.borderColor = "lightgrey";
                    }
                }
            }

            variables = [];
        } else {
            CheckDeposit4 = 0;
            variables.push(document.getElementById("DepositType4"), document.getElementById("DepositAmount4"),
                document.getElementById("DepositDate4"),
                document.getElementById("DepositRecivedFromRelationship4"), document.getElementById("DepositRecivedFromFirstName4"),
                document.getElementById("DepositRecivedFromLastName4"), document.getElementById("DepositStreetNumber4"),
                document.getElementById("DepositStreetName4"), document.getElementById("DepositCity4"),
                document.getElementById("DepositCountry4"), document.getElementById("DepositRecivedFromPhone4")
            );
            for (let i = 0; i < variables.length; i++) {
                //alert(variables[i].value);
                variables[i].style.borderColor = "lightgrey";
                if (i === 0) {
                    document.getElementById("DepositType4").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 1) {
                    document.getElementById("DepositAmount4").parentElement.style.borderColor = "lightgrey";
                }
                if (i === 2) {
                    document.getElementById("DepositDateLabel4").style.borderColor = "lightgrey";
                }
                if (i === 4) {
                    document.getElementById("DepositReceivedFrom4").parentElement.style.borderColor = "lightgrey";
                }
            }
            if (value < 0) {
                document.getElementById("DepositAmount4").parentElement.style.borderColor = "red";
                CheckDeposit4 = 1;
            } else {
                document.getElementById("DepositAmount4").parentElement.style.borderColor = "";
            }

            variables = [];
        }

    } //close if
    else {
        CheckDeposit4 = 0;
    }
    console.log("dep1 " + CheckDeposit1 + "dep2 " + CheckDeposit2 + "dep3 " + CheckDeposit3 + "dep4 " + CheckDeposit4);
    if (CheckDeposit4 === 0 && CheckDeposit3 === 0 && CheckDeposit2 === 0 && CheckDeposit1 === 0) {
        return true;
    } // Close if 
    else {
        return false;
    }
};

function closefinalize(event) {
    if (document.getElementById('SendtoClsed').style.display == 'inline') {
        openFinlizeWindow(event);
    }
}

function openFinlizeWindow(id, event) {
    if (!document.getElementById('SendtoClsed').classList.contains('inlineButton')) {

        document.getElementById('SendtoClsed').classList.add('inlineButton');

        document.getElementById(id).classList.add('openSaveButton')

        // document.getElementById('TRSNExt').style.borderTopLeftRadius = 0;
        // document.getElementById('TRSNextExpand').style.borderTopRightRadius = 0;

    } else {
        document.getElementById('SendtoClsed').classList.remove('inlineButton');

        document.getElementById(id).classList.remove('openSaveButton')

        // document.getElementById('TRSNExt').style.borderTopLeftRadius = '';
        // document.getElementById('TRSNextExpand').style.borderTopRightRadius = '';

    }
    if (document.getElementById('ExitWithoutSaving7').style.display === 'inline') {
        openWindow('ExitWithoutSaving7', 'Deletebtn7', 'Savebtn7', 'savespan7', 'Deletebtn1_7', 0, event)
    }

    event.stopPropagation();
}

function closeAllWindows() {

    $(".inlineButton").removeClass("inlineButton");

    $(".openSaveButton").removeClass("openSaveButton");

}

function openWindow(id1, id2, id3, id4, idDiscard, condition, event) {
    //console.log(1);
    if (!document.getElementById(id1).classList.contains('inlineButton')) {

        document.getElementById(id1).classList.add('inlineButton');
        document.getElementById(id3).classList.add('inlineButton');

        if (condition) {
            document.getElementById(idDiscard).classList.add('inlineButton');
        } else {
            document.getElementById(id2).classList.add('inlineButton');
        }

        document.getElementById(id4).classList.add('openSaveButton');

    } else {

        document.getElementById(id1).classList.remove('inlineButton');
        document.getElementById(id3).classList.remove('inlineButton');

        if (condition) {
            document.getElementById(idDiscard).classList.remove('inlineButton');
        } else {
            document.getElementById(id2).classList.remove('inlineButton');
        }

        document.getElementById(id4).classList.remove('openSaveButton');

    }
    event.stopPropagation();
}


function openWindowFinalized(id1, id2, event) {
    //console.log(1);
    if (!document.getElementById(id1).classList.contains('inlineButton')) {

        document.getElementById(id1).classList.add('inlineButton');
        document.getElementById(id2).classList.add('openSaveButton');

    } else {

        document.getElementById(id1).classList.remove('inlineButton');
        document.getElementById(id2).classList.remove('openSaveButton');
    }
    event.stopPropagation();
}

function maxLengthCheck(object) {
    if (object.value >= 100) {
        object.value = parseFloat(99.991).toFixed(2);
    } else if (object.value <= 0) {
        object.value = parseFloat(0.01).toFixed(2);
    }
}

function maxLengthCheck100(object) {
    if (object.value >= 100) {
        object.value = 100;
    } else if (object.value < 0) {
        object.value = 0;
    }
}

function maxLengthCheckSign(object, condition) {
    let sign = document.getElementById(condition);
    if (sign.innerHTML === '%') {
        if (object.value >= 100) {
            object.value = 100;
        } else if (object.value <= 0) {
            object.value = 0;
        }
    }
}

function ifProvinceOther(province, country) {

    if (document.getElementById(province).value === "Other") {
        document.getElementById(country).readOnly = false;
    } else {
        document.getElementById(country).readOnly = true;
        document.getElementById(country).value = "Canada";
    }
}

function maxlengthCheckHST(object) {

    var NoPercentobjValue = parseFloat(object.value).toFixed(2);
    if (NoPercentobjValue > 15) {
        object.value = parseFloat(15.00).toFixed(2) + '%';
    } else if (NoPercentobjValue <= 0) {
        object.value = parseFloat(0.00).toFixed(2) + '%';
    }

}

function validateSendInvoice() {
    var Error = 0;
    var recepient = 0;

    var arr = document.getElementById('Addressee').getElementsByTagName('input');

    document.getElementById('emptyEmailFields').style.display = 'none';
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].checked) {
            recepient++
        }
    }
    if (recepient == 0) {
        document.getElementById('emptyAdresseeError').style.display = '';
        Error = 1;
    } else {
        document.getElementById('emptyAdresseeError').style.display = 'none';
    }

    if (document.getElementById('subjectLineEmail').value.trim()) {
        document.getElementById('subjectLineEmail').style.borderColor = '';
    } else {
        document.getElementById('subjectLineEmail').style.borderColor = 'red';
        document.getElementById('emptyEmailFields').style.display = '';
        Error = 1;
    }
    if (document.getElementById('messageEmail').value.trim()) {
        document.getElementById('messageEmail').style.borderColor = '';
    } else {
        document.getElementById('messageEmail').style.borderColor = 'red';
        document.getElementById('emptyEmailFields').style.display = '';
        Error = 1;
    }

    if (Error == 0) {
        document.getElementById('comissionEmailed').style.display = '';
        document.getElementById('SendEmailInvoice').type = 'submit';
        document.getElementById('myModalEmail').style.display = '';

        let myModalEmailSent = document.getElementById('myModalEmailSent');
        myModalEmailSent.style.display = "block";
        setTimeout(
            function () {
                myModalEmailSent.style.marginTop = '20px';
            }, 200 /// milliseconds
        );

        setTimeout(
            function () {
                myModalEmailSent.style.marginTop = '-45px';
            }, 2000 /// milliseconds
        );

        setTimeout(
            function () {
                myModalEmailSent.style.display = "";
            }, 2500 /// milliseconds
        );
        fileEmailed("agentNameHidden");

    } else {
        document.getElementById('SendEmailInvoice').type = 'button';
    }

    return Error;
}


function fileOpened(agentName) {

    var datenow = new Date().toLocaleTimeString([], {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
    // var agentName = 'James Bond';
    // var id = 'AuditTrail'+countTrail;

    var forAuditNote = document.createElement("DIV");
    // forAuditNote.setAttribute("id", id);
    forAuditNote.setAttribute("class", 'fileOpened flexibleContainer');

    document.getElementById('AuditNotes').appendChild(forAuditNote);

    var forIconDiv = document.createElement("DIV");
    forIconDiv.setAttribute("class", 'flexible auditIcon');

    var forAuditBody = document.createElement("DIV");
    forAuditBody.setAttribute("class", 'flexible auditBody');

    forAuditNote.appendChild(forIconDiv);
    forAuditNote.appendChild(forAuditBody);

    var iconSpan = document.createElement("span");
    iconSpan.setAttribute("class", 'logoaudit');
    forIconDiv.appendChild(iconSpan);

    var BodyHeaderLabel = document.createElement("LABEL");
    BodyHeaderLabel.setAttribute("class", 'headline');
    BodyHeaderLabel.innerHTML = 'File created by ' + agentName;

    var BodyDateLabel = document.createElement("LABEL");
    BodyDateLabel.setAttribute("class", 'description');
    BodyDateLabel.innerHTML = datenow;

    var breakelem = document.createElement("br");

    forAuditBody.appendChild(BodyHeaderLabel);
    forAuditBody.appendChild(breakelem);

    forAuditBody.appendChild(BodyDateLabel);
    // forAuditBody.appendChild(breakelem);

    // countTrail++;
    document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;

}

function fileEmailed(id) {

    var datenow = new Date().toLocaleTimeString([], {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
    var agentName = document.getElementById(id).value;

    var elem = document.getElementById('optionalDIV').getElementsByClassName('flexibleContainer')[0].getElementsByClassName('flexibleContainer');
    var elem2 = document.getElementsByClassName('Addressee')[0].getElementsByClassName('flexibleContainer')[0].getElementsByClassName('flexibleContainer');
    // console.log(elem);
    if (elem2.length > 0) {
        for (let i = 0; i < elem2.length; i++) {
            if (elem2[i].getElementsByClassName('inlineInput')[0].checked) {
                recepientName += elem2[i].getElementsByClassName('names')[0].getElementsByTagName('label')[1].innerHTML.trim();
                if (i == elem2.length - 1) {
                    recepientName += ' ';
                } else {
                    recepientName += ', ';
                }
            }
        }
    }

    if (elem.length > 0) {
        for (let i = 0; i < elem.length; i++) {
            if (elem2.length > 0) {
                recepientName = recepientName.trim() + ', ';
            }
            if (elem[i].getElementsByClassName('inlineInput')[0].checked) {
                recepientName += elem[i].getElementsByClassName('names')[0].getElementsByTagName('label')[1].innerHTML.trim();
                if (i == elem.length - 1) {
                    recepientName += ' ';
                } else {
                    recepientName += ', ';
                }
            }
            // console.log(elem[i]);
        }
    }

    var recepientName = '';

    var forAuditNote = document.createElement("DIV");
    forAuditNote.setAttribute("class", 'Emailed flexibleContainer');

    document.getElementById('AuditNotes').appendChild(forAuditNote);

    var forIconDiv = document.createElement("DIV");
    forIconDiv.setAttribute("class", 'flexible auditIcon');

    var forAuditBody = document.createElement("DIV");
    forAuditBody.setAttribute("class", 'flexible auditBody');

    forAuditNote.appendChild(forIconDiv);
    forAuditNote.appendChild(forAuditBody);

    var iconSpan = document.createElement("span");
    iconSpan.setAttribute("class", 'logoaudit');
    forIconDiv.appendChild(iconSpan);

    var BodyHeaderLabel = document.createElement("LABEL");
    BodyHeaderLabel.setAttribute("class", 'headline');
    BodyHeaderLabel.innerHTML = 'Commission statement was emailed by ' + agentName + 'to ' + recepientName;

    var BodyDateLabel = document.createElement("LABEL");
    BodyDateLabel.setAttribute("class", 'description');
    BodyDateLabel.innerHTML = datenow;

    var breakelem = document.createElement("br");

    forAuditBody.appendChild(BodyHeaderLabel);
    forAuditBody.appendChild(breakelem);

    forAuditBody.appendChild(BodyDateLabel);
    document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;

}

function fileUdated(id) {
    var datenow = new Date().toLocaleTimeString([], {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
    var agentName = document.getElementById(id).value;

    var forAuditNote = document.createElement("DIV");
    forAuditNote.setAttribute("class", 'FileUpdated flexibleContainer');

    document.getElementById('AuditNotes').appendChild(forAuditNote);

    var forIconDiv = document.createElement("DIV");
    forIconDiv.setAttribute("class", 'flexible auditIcon');

    var forAuditBody = document.createElement("DIV");
    forAuditBody.setAttribute("class", 'flexible auditBody');

    forAuditNote.appendChild(forIconDiv);
    forAuditNote.appendChild(forAuditBody);

    var iconSpan = document.createElement("span");
    iconSpan.setAttribute("class", 'logoaudit');
    forIconDiv.appendChild(iconSpan);

    var BodyHeaderLabel = document.createElement("LABEL");
    BodyHeaderLabel.setAttribute("class", 'headline');
    BodyHeaderLabel.innerHTML = 'File was updated by ' + agentName;

    var BodyDateLabel = document.createElement("LABEL");
    BodyDateLabel.setAttribute("class", 'description');
    BodyDateLabel.innerHTML = datenow;

    var breakelem = document.createElement("br");

    forAuditBody.appendChild(BodyHeaderLabel);
    forAuditBody.appendChild(breakelem);

    forAuditBody.appendChild(BodyDateLabel);
    document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;

}

function changeFormTarget(el) {

    el.form.setAttribute('target', '_self')

}

function ChangePropertyImage() {
    // if (document.getElementById('PropertyPic').src.includes('ImagesUsed')) {
    //     document.getElementById('PropertyPic').src = '../ImagesUsed/' + document.getElementById('PropertyType').value + '.png';
    // } else {
        
    // }
    document.querySelector("#PropertyDetails > div.doubleFlexTRS.frontImage > div.flexible.frontImageFlex > div").className = "insideImg divforImg Prop"+document.querySelector("#PropertyType").value;
}