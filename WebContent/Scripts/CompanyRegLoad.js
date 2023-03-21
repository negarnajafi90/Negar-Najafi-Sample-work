forSelects();

TabsHandleler(event, 'CorporateDetails', 'tabcontent2', 'tablinks', 'CorporateDetailsTab');

checkNavBar();

var myModalonLoad = document.getElementById("myModalonLoad");
var go = myModalonLoad.getElementsByClassName("finalButtons")[0];
go.onclick = function (event) {
    myModalonLoad.style.display = "none";
    event.stopPropagation();
}

var myModalAgreement = document.getElementById("myModalAgreement");
var closeAgreement = myModalAgreement.getElementsByClassName("finalButtons")[0];
closeAgreement.onclick = function (event) {
        myModalAgreement.style.display = "none";
        previewHello();
        event.stopPropagation();
}

		// Get the modal
		var modal2 = document.getElementById("myModal2");
		var btn = document.getElementById("Savebtn4");
		var setofBtn = document.getElementsByClassName('dropBtn3');

		// Get the <span> element that closes the modal

		// When the user clicks the button, open the modal 

		for (let i = 0; i < setofBtn.length; i++) {
			setofBtn[i].onclick = function (event) {
				modal2.style.display = "block";
				event.stopPropagation();
			}
		}

		btn.onclick = function (event) {
			modal2.style.display = "block";
			event.stopPropagation();
		}

		// When the user clicks anywhere outside of the modal, close it

		function previewHello() {
			myModalonLoad.style.display = "block";
		}
		document.onloadstart = function (event) {

		}
		document.onclick = function (event) {
			if (event.target == modal2) {
				modal2.style.display = "none";
			}
			event.stopPropagation();
		}

		myModalAgreement.style.display = "block";

		function changeFormTarget(el) {
			el.form.setAttribute('target', '_self')
		}

		function checkifSigned(id){
			if(document.getElementById('finalagree1').checked && document.getElementById('finalagree2').checked){
				document.getElementById('acceptAgreement').disabled = false;
			}else{
				document.getElementById('acceptAgreement').disabled = true;
			}
		}

		function checkifSignedNoMand(id1, id2){
			document.getElementById(id1).classList.add('buttonBlueCompanyChecked');
			document.getElementById(id2).classList.remove('buttonBlueCompanyChecked');
			document.getElementById(id1).classList.remove('ErrorNotChosen');
			document.getElementById(id2).classList.remove('ErrorNotChosen');
		}