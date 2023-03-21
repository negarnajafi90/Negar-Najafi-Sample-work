localStorage.setItem('dealtype', '');

function DateToTimeStamp(val){
    if(val=="" || val==null){
        return "";
    }else{
        const day = val.substring(0, 2);
        const monthStr = val.substring(3, 6);
        const month = getMonth(monthStr);
        const year = val.substring(7, 11);
        const date=year+"-"+month+"-"+day;

        return date;
    }
}



function getMonth(monthStr){
    return new Date(monthStr+'-1-01').getMonth()+1
}

function getSearchParams(completed){
    if(completed==1){
        return "search="+document.querySelector("#CompletedSearch").value+"&sortby="+document.querySelector("#MyDealsSortCompleted").value+"&type="+document.querySelector("#datetypeCompleted").value+"&datefrom="+DateToTimeStamp(document.querySelector("#datefromCompleted").value)+"&dateto="+DateToTimeStamp(document.querySelector("#datetoCompleted").value);
    }else if(completed==0){
        return "search="+document.querySelector("#PendingSearch").value+"&sortby="+document.querySelector("#MyDealsSortPending").value+"&type="+document.querySelector("#datetypePending").value+"&datefrom="+DateToTimeStamp(document.querySelector("#datefromPending").value)+"&dateto="+DateToTimeStamp(document.querySelector("#datetoPending").value);
    }else{
        let fieldsprop="";
        const fields = document.querySelector("#DisplayFields").getElementsByClassName("multichoice");
        for(const element of fields){
            if(element.getElementsByTagName("input")[0].checked){
                fieldsprop+=",";
            }else{
                fieldsprop+="dispNone,";
            }
        }

        return "&type="+document.querySelector("#dateTypeCommission").value+"&datefrom="+DateToTimeStamp(document.querySelector("#datefromCommission").value)+"&dateto="+DateToTimeStamp(document.querySelector("#datetoCommission").value)+"&dealstatus="+document.querySelector("#dealStatusCommissions").value+"&classes="+JSON.stringify(fieldsprop);
    }
}

    function getDataInvoicePreview(id, type){
        $("#Right").addClass('loading');
        $.get('../popupshtml/'+type+'?ID='+id, function(response) {
            // Dynamically insert the data into the page
            $('#invoicePreview').html(response).ready(checkdataPreview());
        }).fail(function() {
            //Error handling
            displayError();
            $("#Right").removeClass("loading");
        });
       
    }
    function checkdataPreview(){
        const myModalTRSPreview = document.getElementById("myModalTRS");
        const spanx = document.getElementById("closeTRS");
        spanx.onclick = function () {
            myModalTRSPreview.style.display = "none";
        }
        myModalTRSPreview.style.display = "block";
        $("#Right").removeClass("loading");
    }


    function getDataEmailPreview(id,brokerid, dealtype, subject,balance){
        $("#Right").addClass('loading');
        console.log(id,brokerid);
        if(dealtype=="TRS"){
            $.get('../popupshtml/SendEmailPopupTRS.jsp?id='+id+'&brokerId='+brokerid+"&subject="+subject+"&dealtype="+dealtype+"&balance="+balance, function(response) {
                $('#myModalEmail').html(response).ready(chechPreview());
            }).fail(function() {
                displayError()
                $("#Right").removeClass("loading");
            });
        }else{
            $.get('../popupshtml/SendEmailPopup.jsp?id='+id+'&brokerId='+brokerid+"&subject="+subject+"&dealtype="+dealtype+"&balance="+balance, function(response) {
                // Dynamically insert the data into the page
                $('#myModalEmail').html(response).ready(chechPreview());
            }).fail(function() {
                //Error handling
                displayError()
                $("#Right").removeClass("loading");
            });
        }
    }

    function chechPreview(){
        const modalEmail = document.getElementById("myModalEmail");
        const spanEmail = modalEmail.getElementsByClassName("close")[0];
        spanEmail.onclick = function () {
            modalEmail.style.display = "";
            $(document).unbind('keyup');
        }
        const emailbtn = document.getElementById("emailBtn");
        emailbtn.onclick = function () {
            $(document).bind('keyup', function (e) {
                if (e.which == 27) { //esc
                    modalEmail.style.display = "none";
                }
            });
            modalEmail.style.display = "block";
        }
        modalEmail.style.display = "block";
        $("#Right").removeClass("loading");
    }

     function getDataPendingSorted(callback){
        $("#Right").addClass('loading');
        $.get('AllPendingMyDeals.jsp?'+getSearchParams(0), function(response) {
            // Dynamically insert the data into the page
            $('#AllPendingMyDealsSpan').html(response).ready(checkdataPending());
        }).fail(function() {
            //Error handling
            displayError()
            $("#Right").removeClass("loading");
        });

    }
     function getDataCompletedSorted(){
       
        $("#Right").addClass('loading');
        $.get('AllCompletedMyDeals.jsp?'+getSearchParams(1), function(response) {
            // Dynamically insert the data into the page
            $('#allCompletedDealsSpan').html(response).ready(checkdataCompleted());
        }).fail(function() {
            //Error handling
            displayError();
            $("#Right").removeClass("loading");
        });
    }

    function checkdataPending(){
        let len = document.getElementById('AllPendingMyDealsSpan').getElementsByClassName('mainDiv').length;
        if(len>0){
            document.getElementById('nofoundPending').style.display = 'none';
        }else{
            document.getElementById('nofoundPending').style.display = '';
        }
        $("#Right").removeClass("loading");
    }

    function checkdataCompleted(){
        let len = document.getElementById('allCompletedDealsSpan').getElementsByClassName('completedSpan').length;
        if(len>0){
            document.getElementById('nofound6').style.display = 'none';
        }else{
            document.getElementById('nofound6').style.display = '';
        }
        $("#Right").removeClass("loading");
    }

    function getDataCommissions(callback){
        $("#Right").addClass('loading');
        console.log("Params"+getSearchParams(2))
        $.get('AllCommissions.jsp?'+getSearchParams(2), function(response) {
            // Dynamically insert the data into the page
            $('#allComissionsSpan').html(response).ready(checkdataCommissions());
        }).fail(function() {
            //Error handling
            displayError()
            $("#Right").removeClass("loading");
        });
    }
    function checkdataCommissions(){
        let a = document.getElementById('allComissionsSpan').getElementsByClassName('completedSpan').length;
        if(a>0){
            document.getElementById('nofoundPending').style.display = 'none';
        }else{
            document.getElementById('nofoundPending').style.display = '';
        }
        $("#Right").removeClass("loading");
        tablegen();
    }


function SetId(id , Type){
    let d="";
    const ID=id;

    if ( Type==="Appraisal Fee" || Type==="Letter of Opinion Fee" ||  Type==="Valuation Fee"   || Type==="Provide service description"  ){   d="Appraisal."; }
    else if( Type==="Referral Fee"){ d="ReferralFee."; }
    else if( Type==="TRS") { d="TRS.";  }
    else {   d="Appraisal."; }
    window.location.href = "../UpdateForms/"+d+"jsp?ID=" + parseInt(ID);
}


function loadPreviewFile(dealtype) {
    $("#PreviewTRS").load("../popupshtml/" + dealtype);
    return true;
}

function forSelectsMultiDeals(){
	let x, i, j, l, ll, selElmnt, a, b, c, checkElem,counter;
	/* Look for any elements with the class "custom-select": */
	x = document.getElementsByClassName("custom-select2");
	l = x.length;
	let tabs = 1;
	for (i = 0; i < l; i++) {
		let tableact = "'commissions" + tabs+"'";
		tabs++;
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
	  counter = 0
	  for (j = 1; j < ll; j++) {
		  
		/* For each option in the original select element,
		create a new DIV that will act as an option item: */
		c = document.createElement("DIV");
		let smth = counter+','+ tableact;
        
        if(counter==0){
            checkElem =  '<label class="container multichoice"><input class="inlineInput check' + counter + '" checked = "true" onclick="HideShowRows('+ smth + ')" type="checkbox"> <span style="pointer-events: none; background: lightgrey;" class="checkmark"></span></label>';
        }else if (counter>=9 && counter<=13){
            checkElem =  '<label class="container multichoice"><input class="inlineInput check' + counter + '" onclick="HideShowRows('+ smth + ')" type="checkbox"> <span class="checkmark"></span></label>';
        }else{
            checkElem =  '<label class="container multichoice"><input class="inlineInput check' + counter + '" checked = "true" onclick="HideShowRows('+ smth + ')" type="checkbox"> <span class="checkmark"></span></label>';
        }
		counter++;
		c.innerHTML = '<label class="forcheckLabelList">'+selElmnt.options[j].innerHTML+'</label>'+ checkElem;
		c.addEventListener("click", function (e) {
		  /* When an item is clicked, update the original select box,
		  and the selected item: */
		  let y, i, k, s, h, sl, yl;
		  s = this.parentNode.parentNode.getElementsByTagName("select")[
			0];
		  sl = s.length;
		  h = this.parentNode.previousSibling;
		  for (i = 0; i < sl; i++) {
			if (s.options[i].innerHTML == this.innerHTML) {
			  s.selectedIndex = i;
			  h.innerHTML = this.innerHTML ;
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
		b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function (e) {
		/* When the select box is clicked, close any other select boxes,
		and open/close the current select box: */

		this.nextSibling.classList.toggle("select-hide");
		this.classList.toggle("select-arrow-active");
		e.stopPropagation();

	  });

	  b.addEventListener("click", function (e) {
		this.classList.toggle("select-hide");
		e.stopPropagation();
	  });
	}
}

let PrintTRSBtn = document.getElementById('TRSPrint');

// document.onclick = function (event) {
//     if (event.target == myModalTRSPreview) {
//         myModalTRSPreview.style.display = "none";
//     }
//     event.stopPropagation();
// }

function checkEmptyDeals(){

    if(document.getElementsByClassName('PendingWrap')[0].getElementsByClassName('MainSpan').length == 0){
        document.getElementById('nofoundPending').style.display = '';
    }else{
        document.getElementById('nofoundPending').style.display = 'none';
    }
    if(document.getElementById('allCompletedDeals').getElementsByClassName('MainSpan2').length == 0){
        document.getElementById('nofound6').style.display = '';
    }else{
        document.getElementById('nofound6').style.display = 'none';
    }

}

let loaded = 0;

function showAddParties() {
    const div = document.getElementById('optionalDIV')
    if (div.classList.contains('remove')) {
        document.getElementById('optionalDIV').style.maxHeight = '2400px';
        div.classList.remove('remove');
        document.getElementById('iconEmailPreview').classList.add('rotate');
    } else {
        document.getElementById('optionalDIV').style.maxHeight = '0px';
        div.classList.add('remove');
        document.getElementById('iconEmailPreview').classList.remove('rotate');
    }
}

function tablegen(){


        const tableCom = $('#commissions1').DataTable({
            dom: 'Bfrtip',
            select: true,
            "scrollXInner": true,
            "scrollYInner": "400px",
            "pageLength": 50,
            select: 'single',
            buttons: [{
                    extend: 'excelHtml5',
                    exportOptions: {
                        modifier: {
                            selected: null
                        }
                    }
                },
                {
                    extend: 'pdfHtml5',
                    text: 'PDF',
                    exportOptions: {
                        modifier: {
                            selected: null
                        }
                    }
                },
                {
                    extend: 'csvHtml5',
                    exportOptions: {
                        modifier: {
                            selected: null
                        }
                    }
                }

            ],
            "columnDefs": [
                {
                    targets: [14],
                    render: function (data, type) {
                        // console.log('data'+ data)
                        if (data !== null && data !== "") {
                            var wrapper = moment(new Date(data));
                            return wrapper.format("D MMM YYYY");
                        }else{
                            return "";
                        }
                    },
                    targets:[1],
                    render: function (data, type) {
                        return data.replace(/[A-Z]/g, ' $&').trim().replace("-","").replace("/ ","/");
                    },
                    targets:[2],
                    render: function (data, type) {
                        if(data.replace(" ","").includes(",,"))
                            return "";
                        return data.trim();
                    }
                }
            ],
            footerCallback: function (row, data, start, end, display) {
            let api = this.api(); 
 
            // Remove the formatting to get integer data for summation
            let intVal = function (i) {
                return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
            };
 
            // Total over all pages
            // total = api.column(3).data().reduce(function (a, b) { if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total6 = api.column(6).data().reduce(function (a, b) { return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total7 = api.column(7).data().reduce(function (a, b) { return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total8 = api.column(8).data().reduce(function (a, b) { return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total9 = api.column(9).data().reduce(function (a, b) {  if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total10 = api.column(10).data().reduce(function (a, b) {  if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            // total11 = api.column(11).data().reduce(function (a, b) { return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
 
            // Total over this page
            let pageTotal = api.column(3, { page: 'current' }).data().reduce(function (a, b) { if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });  }, 0);
            let pageTotal6 = api.column(6, { page: 'current' }).data().reduce(function (a, b) {  return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });}, 0);
            let pageTotal7 = api.column(7, { page: 'current' }).data().reduce(function (a, b) {  return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });}, 0);
            let pageTotal8 = api.column(8, { page: 'current' }).data().reduce(function (a, b) {  return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });}, 0);
            let pageTotal9 = api.column(9, { page: 'current' }).data().reduce(function (a, b) {   if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            let pageTotal10 = api.column(10, { page: 'current' }).data().reduce(function (a, b) { if(isNaN(intVal(a))){a=0;} if(isNaN(intVal(b))){b=0;} return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }); }, 0);
            let pageTotal11 = api.column(11, { page: 'current' }).data().reduce(function (a, b) {  return (intVal(a) + intVal(b)).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });}, 0);
 
            // Update footer
            $(api.column(3).footer()).html(pageTotal);
            $(api.column(6).footer()).html(pageTotal6);
            $(api.column(7).footer()).html(pageTotal7);
            $(api.column(8).footer()).html(pageTotal8);
            $(api.column(9).footer()).html(pageTotal9);
            $(api.column(10).footer()).html(pageTotal10);
            $(api.column(11).footer()).html(pageTotal11);
        },
        });

        $('#datefromCommission').datepicker({
            format: "dd M yyyy",
            startDate: '-10y'
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
            getDataCommissions();
        });

        $('#datetoCommission').datepicker({
            format: "dd M yyyy",
            startDate: '-10y'
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
            getDataCommissions();
        });

        
}

function eraseDateCommissions(elem){
    elem.parentElement.getElementsByTagName('input')[0].value = '';
    getDataCommissions();
}
function eraseDatePending(elem){
    elem.parentElement.getElementsByTagName('input')[0].value = '';
    getDataPendingSorted();
}

function eraseDateCompleted(elem){
   elem.parentElement.getElementsByTagName('input')[0].value = '';
   getDataCompletedSorted();
}

