//Set side menu variable (open/close)
function setvar(number) {
	sessionStorage.setItem("var", number);
}

function displayError(){
    const myModalSave = document.getElementById("myModalSave");
    myModalSave.style.display = "block";    
    setTimeout( function () { document.getElementById('myModalSave').style.marginTop = '20px'; }, 200 );  
    setTimeout( function () { document.getElementById('myModalSave').style.marginTop = '-45px'; }, 2000  );  
    setTimeout( function () { myModalSave.style.display = ""; }, 2500 );  

}

//Check if sidemenu is opened
function checkNavBar() {

	if (sessionStorage.getItem("var") == 1) {
		document.getElementsByClassName('navBar')[0].classList.add('notransition');
		document.getElementsByClassName('navBarMovable')[0].classList.add('notransition');
		openNav();
		setTimeout(function () {
			document.getElementsByClassName('navBar')[0].classList.remove('notransition');
			document.getElementsByClassName('navBarMovable')[0].classList.remove('notransition');
		}, 500);
	} else if (sessionStorage.getItem("var") == 2) {
		document.getElementsByClassName('navBar')[0].classList.add('notransition');
		document.getElementsByClassName('navBarMovable')[0].classList.add('notransition');
		closeNav();
		wideContent();
		setTimeout(function () {
			document.getElementsByClassName('navBar')[0].classList.remove('notransition');
			document.getElementsByClassName('navBarMovable')[0].classList.remove('notransition');
		}, 500);
	}

}


function getDashboardTables() {
	$("#Right").addClass('loading');
	$.get('DashboardTables.jsp', function (response) {
		// Dynamically insert the data into the page
		$('#dashboardTablesBody').html(response).ready(checkdataDashboard());
	}).fail(function () {
		//Error handling
		//displayError()

		$("#Right").removeClass("loading");
	});
}

//Get all deals for dashboard
function checkdataDashboard() {

	checkdataPending();
	checkdataCompleted();
	checkdataApproval();
	avatars();
	drawGraph();
	Graphlabel();
	const myModalSettings = document.getElementById("GraphSetup");
	const spanx = myModalSettings.getElementsByClassName("close")[0];
	const setupbtn = document.getElementById("modalSetup");
	const setupbtn2 = document.getElementById("DrawGraphb");
	spanx.onclick = function () {
		myModalSettings.style.display = "none";
	}
	setupbtn.onclick = function () {
		myModalSettings.style.display = "block";
	}
	setupbtn2.onclick = function () {
		myModalSettings.style.display = "none";
		Graphlabel();
		drawGraph();
	}
}
//Get all pending deals

function Graphlabel(){
	if (document.getElementById('CompletedOnly').checked) {
		document.getElementById('typeChartopt').innerHTML = 'Completed';
	} else {
		document.getElementById('typeChartopt').innerHTML = 'All';
	}

	if (document.getElementById('AmountType').value == 'Numberofdeals') {
		document.getElementById('closedOnlyChartopt').innerHTML = 'Number of Deals'
	} else if (document.getElementById('AmountType').value == 'Price') {
		document.getElementById('closedOnlyChartopt').innerHTML = 'Price'
	} else if (document.getElementById('AmountType').value == 'Commissions') {
		document.getElementById('closedOnlyChartopt').innerHTML = 'Commissions'
	}
}
function getDataPending() {
	$("#Right").addClass('loading');
	$.get('AllPendingDashboard.jsp', function (response) {
		// Dynamically insert the data into the page
		$('#AllPendingDashboardSpan').html(response).ready(checkdataPending());
	}).fail(function () {
		displayError();
		$("#Right").removeClass("loading");
	});
}

//Validation to display no deals found
function checkdataPending() {
	let len = document.getElementById('AllPendingDashboardSpan').getElementsByTagName('tr').length;
	if (document.getElementById('DbdDealsTable')) {
		if (len > 1) {
			document.getElementById('tablePendingSpan').style.display = 'none';
			document.getElementById('AllPendingDashboardSpan').style.display = '';
		} else {
			document.getElementById('tablePendingSpan').style.display = '';
			document.getElementById('AllPendingDashboardSpan').style.display = 'none';
		}
	}else{
		//console.log("logoutPend");
		window.location.href = "../Logout.jsp";
	}	
	$("#Right").removeClass("loading");
}

//Get all completed deals
function getDataCompleted() {
	$("#Right").addClass('loading');
	$.get('AllCompletedDashboard.jsp', function (response) {
		// Dynamically insert the data into the page
		//console.log(response);
		$('#AllCompletedDashboardSpan').html(response).ready(checkdataCompleted());
	}).fail(function () {
		displayError();
		$("#Right").removeClass("loading");
	});
}

//Validation to display no deals found
function checkdataCompleted() {
	if (document.getElementById('DbdDealsTable2')) {
		let len = document.getElementById('DbdDealsTable2').getElementsByTagName('tr').length;
		if (len > 1) {
			document.getElementById('tableCompletedLabel').style.display = 'none';
			document.getElementById('DbdDealsTable2').style.display = '';
		} else {
			document.getElementById('tableCompletedLabel').style.display = '';
			document.getElementById('DbdDealsTable2').style.display = 'none';
		}
	} else {
		document.getElementById('tableCompletedLabel').style.display = '';
		window.location.href = "../Logout.jsp";
		//console.log("logoutComp");

		//document.getElementById('DbdDealsTable2').style.display = 'none';
	}
	$("#Right").removeClass("loading");
}

//Get all approval deals
function getDataApproval() {
	$("#Right").addClass('loading');
	$.get('AllApprovalDashboard.jsp', function (response) {
		$('#AllApprovalDashboardSpan').html(response).ready(checkdataApproval());
	}).fail(function () {
		displayError();
		$("#Right").removeClass("loading");
	});
}

//Validation to display no deals found
function checkdataApproval() {
	let len = document.getElementById('DbdDealsTableApproval').getElementsByTagName('tr').length;
	if (len > 1) {
		document.getElementById('tableApprovedSpan').style.display = 'none';
		document.getElementById('DbdDealsTableApproval').style.display = '';
		document.querySelector("#dealsToApprove").classList.remove("hide");
		document.querySelector("#MainDashboard > div.ContentDashboard.flexibleContainer > div > div.updateCom.Deals > img").classList.add("rotateimg180");
	} else {
		document.getElementById('tableApprovedSpan').style.display = '';
		console.log("logoutApp");
		//window.location.href = "../Logout.jsp";
		// document.getElementById('DbdDealsTableApproval').style.display = 'none';
	}
	$("#Right").removeClass("loading");
}

//Open nav bar
function openNav() {
	document.getElementById("left-Nav-bar-Menu").style.width = "219px";
	document.getElementById("left-Nav-bar-Menu").style.minWidth = "219px";
	document.getElementById("left-Nav-bar-Menu").style.maxWidth = "219px";
	if (document.getElementsByClassName("rawSpan")[0]) {
		document.getElementsByClassName("rawSpan")[0].style.maxWidth = 'calc(100vw - 290px)';
	}
	const delayInMilliseconds = 400;
	const textfields = document.getElementsByClassName("navText");

	document.getElementById("navOpenBtn").style.display = "none";
	document.getElementById("navCloseBtn").style.display = "block";

	setTimeout(function () {
		for (const element of textfields) {
			element.style.display = "inline";
		}
		document.getElementsByClassName("img2logo")[0].style.display = "";
		document.getElementById("createDrop").style.width = "193px";


	}, delayInMilliseconds);

	setvar(1);
}

function closeNav() {
	document.getElementById("left-Nav-bar-Menu").style.width = "52px";
	document.getElementById("left-Nav-bar-Menu").style.minWidth = "52px";
	document.getElementById("left-Nav-bar-Menu").style.maxWidth = "52px";
	const textfields = document.getElementsByClassName("navText");
	for (const element of textfields) {
		element.style.display = "none";
	}
	document.getElementById("navOpenBtn").style.display = "block";
	document.getElementById("navCloseBtn").style.display = "none";
	document.getElementById("createDrop").style.width = "29px";
	document.getElementsByClassName("img2logo")[0].style.display = "none";

	if (document.getElementsByClassName("rawSpan")[0]) {
		document.getElementsByClassName("rawSpan")[0].style.maxWidth = 'calc(100vw - 122px)';
	}
	setvar(2);
}

function closeNavReport() {
	document.getElementById("left-Nav-bar-Menu").style.width = "52px";
	const textfields = document.getElementsByClassName("navText");
	for (const element of textfields) {
		element.style.display = "none";
	}
	document.getElementById("navOpenBtn").style.display = "block";
	document.getElementById("navCloseBtn").style.display = "none";
	document.getElementById("createDrop").style.width = "29px";
}

function openNavReport() {
	document.getElementById("left-Nav-bar-Menu").style.width = "219px";
	const delayInMilliseconds = 300;
	const textfields = document.getElementsByClassName("navText");
	document.getElementById("navOpenBtn").style.display = "none";
	document.getElementById("navCloseBtn").style.display = "block";

	setTimeout(function () {
		for (const element of textfields) {
			element.style.display = "inline";
		}
	}, delayInMilliseconds);

	document.getElementById("createDrop").style.width = "193px";
}

function showOptions() {
	if(document.getElementById("newDealAgentDropdown").classList.contains("dispNone")) {
		document.getElementById("newDealAgentDropdown").classList.remove("dispNone");
	} else {
		document.getElementById("newDealAgentDropdown").classList.add("dispNone");
	}
}

function somevariable(number) {
	sessionStorage.setItem("var", number);
}

function tabBlue(id) {
	document.getElementById('DEALSFORAPPROVALTab').style.backgroundColor = '';
	document.getElementById('MYDEALSTab').style.backgroundColor = '';
	document.getElementById('AGENTDEALTab').style.backgroundColor = '';
	document.getElementById(id).style.backgroundColor = '#29c1e1';
}

function Display(id1, id2) {
	if (document.getElementById(id1).value === 'Other') {
		document.getElementById(id2).style.display = 'flex'
	} else {
		document.getElementById(id2).style.display = 'none'
	}
}

function addClerk() {

	if (document.getElementById("AddClerckInformation").checked == true) {

		document.getElementById("ClerkInformation").style.display = "block";
	}else {
		document.getElementById("ClerkInformation").style.display = "none";
		const inputs = document.getElementById("ClerkInformation").getElementsByTagName('input');
		for (const element of inputs) {
			element.value = "";
		} 
	} //Ending the else section

}

function SetId(id , Type , field){
	
	var d="Appraisal.";

	if ( Type==="Appraisal Fee" || Type==="Letter of Opinion Fee" ||  Type==="Valuation Fee"   || Type==="Provide service description"  ){   d="Appraisal."; }
	
	else if( Type==="Referral Fee"){ d="ReferralFee."; }
	
	else if( Type==="TRS") { d="TRS.";  }
	
	else {   d="Appraisal."; }
	
	// document.getElementById(field).value =id;
	
	var ID=id;

	window.location.href = "../UpdateForms/"+d+"jsp?ID=" + parseInt(ID);
	
}

function isAllPresent(id, id2) {
	// Regex to check if a string
	// contains uppercase, lowercase
	// special character & numeric value
	let str = document.getElementById(id).value;
	let str2 = document.getElementById(id2).value;
	let Error = 0;
	let Error1 = 0;
	let Error2 = 0;
	let Error3 = 0;
	let Error4 = 0;
	let Error5 = 0;
	let Error6 = 0;

	let pattern = /^(?=.*[a-z]).+$/;
	let pattern2 = /^(?=.*[A-Z]).+$/;
	let pattern3 = /^(?=.*\d).+$/;
	let pattern4 = /^(?=.*[-+_!@#$%^&*.,?]).+$/;

	// If the string is empty
	// then print No
	if (!str || str.length < 8) {
		document.getElementById('opt5').className = "list notCompleted";
		Error1 = 1;
	} else {
		document.getElementById('opt5').className = "list completed";
	}

	// Print Yes If the string matches
	// with the Regex
	if (pattern.test(str)) {
		document.getElementById('opt2').className = "list completed";
	} else {
		document.getElementById('opt2').className = "list notCompleted";
		Error2 = 1;
	}

	if (pattern2.test(str)) {
		document.getElementById('opt1').className = "list completed";
	} else {
		document.getElementById('opt1').className = "list notCompleted";
		Error3 = 1;

	}

	if (pattern3.test(str)) {
		document.getElementById('opt3').className = "list completed";
	} else {
		document.getElementById('opt3').className = "list notCompleted";
		Error4 = 1;
	}

	if (pattern4.test(str)) {
		document.getElementById('opt4').className = "list completed";
	} else {
		document.getElementById('opt4').className = "list notCompleted";
		Error5 = 1;
	}

	if (str === str2) {
		document.getElementById('opt6').className = "list completed";
	} else {
		document.getElementById('opt6').className = "list notCompleted";
		Error6 = 1;
	}

	if (Error6 === 1 || Error5 === 1 || Error4 == 1 || Error3 === 1 || Error2 === 1 || Error1 === 1) {
		Error = 1;
	} 

	return Error;
}





function TabsHandleler(evt, tabName, MytabsContent, tablink, tabID) {

	let i, tabcontent, tablinks;

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
	} 

	document.getElementById(tabName).style.display = "block";
	document.getElementById(tabID).classList.add("active");
}

document.addEventListener("click", function (e) {
	/* When the select box is clicked, close any other select boxes,
	and open/close the current select box: */

	if (e.target!=document.querySelector("#createDrop")) {
		document.getElementById("newDealAgentDropdown").classList.add("dispNone");
	}
	e.stopPropagation();

});

function HideShowRows(number, tableid) {
	let table = document.getElementById(tableid);
	let forid = +number + 1;
	let rowsToChange = table.getElementsByClassName('row' + forid + 'Comission');


	let cond = table.parentElement.parentElement.parentElement.parentElement.parentElement.getElementsByClassName('check' + number)[0].checked;

	if (!cond) {
		for (const element of rowsToChange) {
			element.classList.add('dispNone');
		}
	} else {
		for (const element of rowsToChange) {
			element.classList.remove('dispNone');
		}
	}
}

function forSelectsMulti() {
	let x, i, j, l, ll, selElmnt, a, b, c, checkElem, counter;
	/* Look for any elements with the class "custom-select": */
	x = document.getElementsByClassName("custom-select2");
	l = x.length;
	let tabs = 1;
	for (i = 0; i < l; i++) {
		let tableact = "'commissions" + tabs + "'";
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

			let smth = counter + ',' + tableact;
			checkElem = '<label class="container multichoice"><input class="inlineInput check' + counter + '" checked = "true" onclick="HideShowRows(' + smth + ')" type="checkbox"> <span class="checkmark"></span></label>';
			counter++;

			c.innerHTML = '<label class="forcheckLabelList">' + selElmnt.options[j].innerHTML + '</label>' + checkElem;
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

function forSelects() {
	let x, i, j, l, ll, selElmnt, a, b, c;
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
				let y, i, k, s, h, sl, yl;
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
}

function closeAllSelect(elmnt) {
	/* A function that will close all select boxes in the document,
	except the current select box: */
	let x, y, i, xl, yl, arrNo = [];
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

document.addEventListener("click", closeAllSelect);


function openExport(id) {
	const page = document.getElementById(id);
	if (page.getElementsByClassName('dt-buttons')[0].classList.contains('showit')) {
		page.getElementsByClassName('dt-buttons')[0].classList.remove('showit');
	} else {
		page.getElementsByClassName('dt-buttons')[0].classList.add('showit');

	}
}

function containsSelected(table) {
	const set = table.getElementsByTagName('tr');
	let count = false;

	for (const element of set) {
		if (element.classList.contains('selected')) {
			count = true;
		}
	}
	return (count)
}

function ifProvinceOther(province, country) {

	if (document.getElementById(province).value === "Other") {
		document.getElementById(country).readOnly = false;
	} else {
		document.getElementById(country).readOnly = true;
		document.getElementById(country).value = "Canada";
	}
}


function showButton() {
	document.getElementsByClassName('btnUpload')[0].style.visibility = "visible";
	document.getElementsByClassName('closebtn')[0].style.visibility = "visible";
}

function hideButton() {
	document.getElementsByClassName('btnUpload')[0].style.visibility = "hidden";
	document.getElementsByClassName('closebtn')[0].style.visibility = "hidden";
}

function showButtonID(id) {
	const dir = document.getElementById(id);
	dir.getElementsByClassName('btnUpload')[0].style.visibility = "visible";
	dir.getElementsByClassName('closebtn')[0].style.visibility = "visible";
}

function hideButtonID(id) {
	const dir = document.getElementById(id);
	dir.getElementsByClassName('btnUpload')[0].style.visibility = "hidden";
	dir.getElementsByClassName('closebtn')[0].style.visibility = "hidden";
}

function openWindow(id1, id2, id3, id4, event) {
	
	if (document.getElementById(id1).style.display === '') {
		document.getElementById(id1).style.display = 'inline';
		if (id2) {
			document.getElementById(id2).style.display = 'inline';
		}
		if (id3) {
			document.getElementById(id3).style.display = 'inline';
		}

		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].style.borderTopLeftRadius = 0;
		document.getElementById(id4).getElementsByClassName('buttonSaveTwo')[0].style.borderTopRightRadius = 0;

		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';
		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';

	} else {

		document.getElementById(id1).style.display = '';
		if (id2) {
			document.getElementById(id2).style.display = '';
		}
		if (id3) {
			document.getElementById(id3).style.display = '';
		}

		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].style.borderTopLeftRadius = '20px';
		document.getElementById(id4).getElementsByClassName('buttonSaveTwo')[0].style.borderTopRightRadius = '20px';

		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';
		document.getElementById(id4).getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';

	}
	event.stopPropagation();
}

function openWindowNewContact(event) {
	if (document.getElementById('Savebtn').style.display === '') {
		document.getElementById('Savebtn').style.display = 'inline';
		
		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].style.borderTopLeftRadius = 0;
		document.getElementById('savespan').getElementsByClassName('buttonSaveTwo')[0].style.borderTopRightRadius = 0;

		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';
		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';

	} else {

		document.getElementById('Savebtn').style.display = '';

		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].style.borderTopLeftRadius = '20px';
		document.getElementById('savespan').getElementsByClassName('buttonSaveTwo')[0].style.borderTopRightRadius = '20px';

		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';
		document.getElementById('savespan').getElementsByClassName('buttonSaveOne')[0].borderTop = '1px solid lightgrey';

	}
	event.stopPropagation();
}

function AlternateBroker() {
	const value = document.getElementById('AlternateBrokerOfRecord').value;
	if (!value || value === '') {
		document.getElementById('noAltNot').style.display = '';
		document.getElementById('Dates').style.display = 'none';
	} else {
		document.getElementById('noAltNot').style.display = 'none'
		document.getElementById('Dates').style.display = '';
	}
}

function AddTrust() {
	document.getElementById('SecondRealEstateTrust').style.display = '';
	document.getElementById('PurcharerProcess').style.display = 'none';
}

function RemoveTrust() {
	document.getElementById('SecondRealEstateTrust').style.display = 'none';
	document.getElementById('PurcharerProcess').style.display = '';
	document.getElementById('RealEstateTrustCompanyAccountName2').value = '';
	document.getElementById('RealEstateTrustCompanyAccountNickName2').value = '';
	document.getElementById('RealEstateTrustCompanyBankNumber2').value = '';
	document.getElementById('RealEstateTrustCompanyTransitNumber2').value = '';
	document.getElementById('RealEstateTrustCompanyAccountNumber2').value = '';
}

function scrollDown() {
	const elem = document.getElementById("MsgSection");
	const lastChild = elem.children[elem.children.length - 1];
	const lastChildID = lastChild.id;

	const bottomEl = document.getElementById(lastChildID);
	bottomEl.scrollIntoView({
		behavior: 'smooth',
		block: 'end'
	});
}

function HideChat() {

	document.getElementById('chatBox').style.height = 'auto';
	document.getElementById('chatBox').style.marginBottom = '10px';

	if (document.getElementById('chatBox').style.flex == '1 1 0%') {
		document.getElementById('chatBox').style.flex = '0.05';
		document.getElementById('chtHeadtxt').style.display = 'none';
		document.getElementById('chatClosed').style.display = '';
		document.getElementById('MsgSection').style.display = 'none';
		document.getElementById('sendMsg').style.display = 'none';
		document.getElementById('chtOpenbtn').style.transform = "rotate(360deg)";
		document.getElementById('chtOpenbtn').style.display = 'none';

	} else {

		document.getElementById('chatBox').style.height = '100%';
		document.getElementById('chatBox').style.marginBottom = '0px';
		document.getElementById('chatBox').style.flex = '1';
		const delayInMilliseconds = 500; //0.5 sec
		setTimeout(function () {
			document.getElementById('chtHeadtxt').style.display = '';
			document.getElementById('chatClosed').style.display = 'none';
			document.getElementById('chtOpenbtn').style.display = '';
			document.getElementById('MsgSection').style.display = '';
			document.getElementById('sendMsg').style.display = '';
		}, delayInMilliseconds);
		document.getElementById('chtOpenbtn').style.transform = "rotate(180deg)";

	}

}

function wideContent() {
	if (sessionStorage.getItem("var") == 1) {
		document.getElementsByClassName('Rightcolumn')[0].style.width = '';
	} else {
		document.getElementsByClassName('Rightcolumn')[0].style.width = 'calc(100% - 115px)';
	}
}

function DisplayScroll() {
	const e = document.getElementById('MsgSection');
	if (e.classList.contains("on-scrollbar") === false) {
		e.classList.add("on-scrollbar");
	}

	const delayInMilliseconds = 1500; 
	setTimeout(function () {
		e.classList.remove("on-scrollbar");
	}, delayInMilliseconds);

}


function openDirect() {
	if (document.getElementById('void').style.display === 'none') {
		document.getElementById('void').style.display = '';
	} else {
		document.getElementById('void').style.display = 'none'
		document.getElementById('Bank').style.borderColor = '';
		document.getElementById('Transit').style.borderColor = '';
		document.getElementById('AccountNumber').style.borderColor = '';
		document.getElementById('AccountName').style.borderColor = '';
	}
}

// Functions for Reports(deals)


function More(obj) {
	obj.parentElement.getElementsByClassName("showMoreDeal")[1].style.display = "";
	obj.style.display = "none";
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.getElementsByClassName("contentBody")[0].style.display = "";
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('active');
}

function Less(obj) {
	obj.parentElement.getElementsByClassName("showMoreDeal")[0].style.display = "";
	obj.style.display = "none";
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.getElementsByClassName("contentBody")[0].style.display = "none";
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('active');
}

// function SearchTable(id, tabId) {

// 	var input, filter, table, tr, td, i, txtValue;
// 	input = document.getElementById(id);
// 	filter = input.value.toUpperCase();
// 	table = document.getElementById(tabId);
// 	tr = table.getElementsByTagName("tr");
// 	for (i = 0; i < tr.length; i++) {
// 		td = tr[i].getElementsByTagName("td")[1];
// 		if (td) {
// 			txtValue = td.getElementsByTagName('input')[0].value
// 			if (txtValue.toUpperCase().indexOf(filter) > -1) {
// 				tr[i].style.display = "";
// 			} else {
// 				tr[i].style.display = "none";
// 			}
// 		}
// 	}
// }

function BORhideShow(BOR) {
	const borsbuttons = document.getElementsByClassName('forBOR');
	for (const element of borsbuttons) {
		if (BOR) {
			element.style.display = '';
		} else {
			element.style.display = 'none';
		}
	}
}



function dealForAgent(id, agent) {
	if (agent) {
		document.getElementById(id).getElementsByClassName('spanInvoiceTRS').style.display = 'none';
	} else {
		document.getElementById(id).getElementsByClassName('spanInvoiceTRS').style.display = '';
	}
}


function postalCorrect(id) {
	const b = document.getElementById(id).value;
	const a = b.replace(/ /g, '').toUpperCase();
	const res = a.slice(0, 3) + " " + a.slice(3);
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

function ValidateEmail(id) {
	const a = document.getElementById(id);
	const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	return !!(a.value.match(mailformat));
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

function displayPassword(id, idClose, idOpen) {
	document.getElementById(id).type = 'text';
	document.getElementById(idOpen).style.display = 'none';
	document.getElementById(idClose).style.display = '';
}

function hidePassword(id, idClose, idOpen) {
	document.getElementById(id).type = 'password';
	document.getElementById(idOpen).style.display = 'none';
	document.getElementById(idClose).style.display = '';
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
	return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3,6)}-${phoneNumber.slice(6, 10)}`;
}

function eraseDate(elem) {
	elem.parentElement.getElementsByTagName('input')[0].value = '';
}

function chackEmptyNumbers(arr, option) {
	let isEmpty = 0;
	for (const element of arr) {
		let num = element.value.replace(/,/g, '').replace(/\s+/g, '');
		if (!num || num == '' || isNaN(num) || num < 0) {
			isEmpty = 1;
			element.parentElement.style.border = '1px solid red';
		} else {
			element.parentElement.style.border = '';
		}
		if (option) {
			if (num > 100) {
				isEmpty = 1;
				element.parentElement.style.border = '1px solid red';
			}
		}
	}
	return isEmpty;
}

function trimString(id) {
	let string = document.getElementById(id).value;
	document.getElementById(id).value = string.trim()
}

function CheckEmpty(arr) {
	let isEmpty = 0;
	for (const element of arr) {
		let str = element.value.replace(/\s+/g, '')
		if (!str || str == '') {
			element.parentElement.style.border = "1px solid red";
			element.parentElement.style.borderRadius = "4px";
			isEmpty = 1;
		} else {
			element.parentElement.style.border = "";
			element.parentElement.style.borderRadius = "";
		}
	}
	return isEmpty;
}

function CheckEmptyNoColor(arr) {
	let isEmpty = 0;
	for (const element of arr) {
		str = element.value.replace(/\s+/g, '')
		if (!str || str == '') {
			isEmpty = 1;
		}
	}
	return isEmpty;
}

function simplePrintTRS(id) {

	let prtContent = document.getElementById(id);
	let WinPrint = window.open('', '', 'left=200,top=0,width=1000,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Deals.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');


	if (document.getElementById(id).classList.contains('trsPrintSpecial')) {
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
	}

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();

	WinPrint.onafterprint = function () {
		WinPrint.close();
	}

	setTimeout(function () {
		WinPrint.print();
	}, 400);

}

function simplePrintOther(id) {
	let prtContent = document.getElementById(id);
	let WinPrint = window.open('', '', 'left=200,top=0,width=1000,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Deals.css" rel="stylesheet" type="text/css" />');

	if (document.getElementById(id).classList.contains('trsPrintSpecial')) {
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/Dashboard.css" rel="stylesheet" type="text/css" />');

	}

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();

	WinPrint.onafterprint = function () {
		WinPrint.close();
	}

	setTimeout(function () {
		WinPrint.print();
	}, 400);

}

function simplePrintReferral(id) {
	let prtContent = document.getElementById(id);
	let WinPrint = window.open('', '', 'left=200,top=0,width=1000,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Deals.css" rel="stylesheet" type="text/css" />');

	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');


	if (document.getElementById(id).classList.contains('trsPrintSpecial')) {
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/Dashboard.css" rel="stylesheet" type="text/css" />');

	}

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();

	WinPrint.onafterprint = function () {
		WinPrint.close();
	}

	setTimeout(function () {
		WinPrint.print();
	}, 400);


}

function hideChat() {
	document.getElementsByClassName('chatDashboard ')[0].style.display = 'none';
	document.getElementsByClassName('MainConent')[0].style.marginRight = '-4px';
}

function showChat() {
	document.getElementsByClassName('chatDashboard ')[0].style.display = '';
	document.getElementsByClassName('MainConent')[0].style.marginRight = '';
}

function openTool(obj){
	closeOptions();
	obj.parentElement.getElementsByTagName('span')[0].classList.toggle("visible");
}
							
function closeOptions(){
	let arr = document.getElementsByClassName('visible');
	for(const element of arr){
		element.classList.remove('visible');
	}
}

function checkGraph(){
	if(document.getElementById('DbdDealsTable').getElementsByTagName('tr').length < 2 && document.getElementById('DbdDealsTable2').getElementsByTagName('tr').length < 2){
		document.getElementById('myChart').classList.add('hiddenImportant');
		document.getElementById('chartPendingLabel').style.display = '';
	}else{
		document.getElementById('chartPendingLabel').style.display = 'none';
		document.getElementById('myChart').classList.remove('hiddenImportant');
	}
}

function ReopenPopup(id){
	let myModalReopen = document.getElementById('myModalReopen');
	myModalReopen.style.display = 'block';
	let span1 = myModalReopen.getElementsByClassName("close")[0];
	span1.onclick = function () {
		myModalReopen.style.display = "none";
	}
}

function DeletePopup(id){
	let myModalDelete = document.getElementById('myModalDelete');
	myModalDelete.style.display = 'block';
	let span2 = myModalDelete.getElementsByClassName("close")[0];
	span2.onclick = function () {
		myModalDelete.style.display = "none";
	}
}

function avatars(){
	const avatars = document.querySelectorAll(".avatar");
	const charCodeRed = avatars[0].dataset.label.charCodeAt(0);
	const charCodeGreen = avatars[0].dataset.label.charCodeAt(1) || charCodeRed;

	const red = Math.pow(charCodeRed, 7) % 200;
	const green = Math.pow(charCodeGreen, 7) % 200;
	const blue = (red + green) % 200;
	avatars[0].style.background = 'rgb(' + red + ', ' + green +', ' + blue + ')';
}

function drawGraph() {
	dataX=[];
	if(document.getElementById('CompletedOnly').checked){
		document.getElementById('myChart').style.display = '';
		document.getElementById('chartDevelopingLabel').style.display = 'none';
		if(document.getElementById('AmountType').value == 'Numberofdeals'){
			dataX.push(CompletedValues.SaleNum, CompletedValues.LeaseNum , CompletedValues.OtherNum, CompletedValues.RefNum)
		}else if(document.getElementById('AmountType').value == 'Price'){
			dataX.push(CompletedValues.SalePrice, CompletedValues.LeasePrice , CompletedValues.OtherPrice, CompletedValues.RefPrice)
		}else{
			dataX.push(CompletedValues.SaleCom, CompletedValues.LeaseCom , CompletedValues.OtherCom, CompletedValues.RefCom)
		}
	}else{
		if(document.getElementById('AmountType').value == 'Numberofdeals'){
			dataX.push(allValues.SaleNum, allValues.LeaseNum , allValues.OtherNum, allValues.RefNum);
		}else if(document.getElementById('AmountType').value == 'Price'){
			dataX.push(allValues.SalePrice, allValues.LeasePrice , allValues.OtherPrice, allValues.RefPrice);
		}else{
			dataX.push(allValues.SaleCom, allValues.LeaseCom , allValues.OtherCom, allValues.RefCom)
		}
	}

	console.log(dataX)

	let oldcanv = document.getElementById('myChart');
	oldcanv.remove();

	const canv = document.createElement('canvas');
	canv.id = 'myChart';
	canv.width = '';
	canv.className = 'doughnutChart';

	document.getElementById('CanvasWrap').appendChild(canv);

	Chart.register(ChartDataLabels);
	const ctx = document.getElementById('myChart');
	const a = ctx.parentElement.offsetHeight;
	let b = 0;
	let percentage = '';

	if (a < 250) {
		b = 5;
	} else {
		b = 15
	}

	const options = {
		pointLabelFontSize: 20,
		tooltips: {
			enabled: false
		},
		plugins: {
			datalabels: {
				formatter: (value, ctx) => {
					percentage='';
					let datasets = ctx.chart.data.datasets;
					if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
						let sum = datasets[0].data.reduce((a, b) => +a + +b, 0);
						if (value != 0) {
							percentage = Math.round((value / sum) * 100) + '%';
						}
						return percentage;
					} else {
						return percentage;
					}
				},
				color: 'black',
				anchor: 'center',
				align: 'center',
			},
			legend: {
				position: 'left',
				labels: {
					boxWidth: 1,
					boxHeight: 30,
					padding: b
				},
			},

		}
	};

	const data = [{

		data: [dataX[0], dataX[1], dataX[2], dataX[3]],
		backgroundColor: [
			'rgba(255, 165, 0, 0.3)',
			'rgba(54, 162, 235, 0.3)',
			'rgba(85, 229, 255, 0.3)',
			'rgba(75, 192, 192, 0.3)'
		],

		hoverBackgroundColor: [
			'rgba(255, 165, 0, 1)',
			'rgba(54, 162, 235, 1)',
			'rgba(85, 229, 255, 1)',
			'rgba(75, 192, 192, 1)'
		],
		borderColor: [
			'rgba(255, 165, 0, 1)',
			'rgba(54, 162, 235, 1)',
			'rgba(85, 229, 255, 1)',
			'rgba(75, 192, 192, 1)'
		],
		borderWidth: 2,

	}];

	let myChart;

	if(document.getElementById('AmountType').value == 'Numberofdeals'){
		myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['Sale (' + dataX[0]+ ')', 'Lease (' + dataX[1] + ')', 'Other (' +
					dataX[2] + ')', 'Referral (' + dataX[3] + ')'],
				datasets: data
			},
			options: options
		});
	}else{
		myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['Sale (' + dataX[0].toLocaleString(undefined,{minimumFractionDigits: 2, maximumFractionDigits: 2}) + ')', 'Lease (' + dataX[1].toLocaleString(undefined,{minimumFractionDigits: 2, maximumFractionDigits: 2}) + ')', 'Other (' +
					dataX[2].toLocaleString(undefined,{minimumFractionDigits: 2, maximumFractionDigits: 2}) + ')', 'Referral (' + dataX[3].toLocaleString(undefined,{minimumFractionDigits: 2, maximumFractionDigits: 2}) + ')'],
				datasets: data
			},
			options: options
		});
	}

}