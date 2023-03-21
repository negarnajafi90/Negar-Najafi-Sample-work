checkNavBar();

var myModalonLoad = document.getElementById("myModalonLoad");
var go = myModalonLoad.getElementsByClassName("finalButtons")[0];
go.onclick = function (event) {
	myModalonLoad.style.display = "none";
	event.stopPropagation();
}
function previewHello() {
	myModalonLoad.style.display = "block";
}
document.onclick = function (event) {
	if (event.target == myModalonLoad) {
		myModalonLoad.style.display = "none";
	}
	event.stopPropagation();
}
previewHello();

forSelects();
checkPercent('CommissionSplit1', 100); 
FormatNumber('CommissionCap1');
checkPercent('CommissionSplit2', 100); 
FormatNumber('CommissionCap2');
checkPercent('CommissionSplit3', 100); 
FormatNumber('CommissionCap3');

lockComissions();
TabsHandleler(event, 'PersonalDetails', 'tabcontent', 'tablinks2', 'PersonalDetailsDetailsTab');