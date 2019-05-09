// Main JavaScript == The Nine Lands Website
/*  It controls the behaviour of the interactive objects common in most of the pages.
*/

// REMEMBER TO FIX ALL THE MODAL FORMULAS!!! You know how now.
/*  (A good idea, instead of changing the properties with [activeModal.style.display = "none"],
		is assigning every tag that shouldn't be displayed a .hidden class, in order to preserve
		the original [display: value] property in the CSS.)

		DONE!
*/



// ========================================================================== //
// Generic Functions																													//
// ========================================================================== //
/*  */

/* 	This function calls another function whose name and parameters are stored
		respectively in two variables.
		It has been thought to execute functions stored in the Database.
*/
function callFunction(myFunction, myParameter) {
	var thisFunction = window[myFunction]; 					// Find myFunction.
	if (typeof thisFunction === "function") { 				// If myFunction is a function...
		if (typeof myParameter === "undefined") { 		// ...and there are no parameters...
			thisFunction();																		// ...execute it!
		} else if (typeof myParameter === "object") { // ...and there are more parameters...
			thisFunction.apply(myParameter);									// ...execute it!
		} else {																			// ...and there is one parameter...
			thisFunction(myParameter); 												// ...execute it!
		}
	}
}

/*	This function finds a tag among others with the same class and shows it exclusively.
 		It has been thought to better structure the HTML and CSS codes by giving every class
		and id the same prefix, to avoid mistakes and mark better the HTML tags.
*/
function showIdAmongClasses(idValue, classValue, prefixValue) { // For example: (1, 'sheet', 'char')
	var yDivs = document.getElementsByClassName(prefixValue + classValue); // Example: ('char' + 'sheet') => ('charsheet')
	for (var yDivsRow = 0; yDivsRow < yDivs.length; yDivsRow++) {
		var yDiv = yDivs[yDivsRow];
		if (!yDiv.classList.contains('hidden')) {
			yDiv.classList.add('hidden');
		}
	}
	var xDiv = document.getElementById(prefixValue + idValue); // Example: ('char' + 1) => ('char1')
	xDiv.classList.remove('hidden');
}

/*

*/
function highlightListItem(itemId, listClass) {
	var allItems = document.getElementsByClassName(listClass);
	for (var itemsRow = 0; itemsRow < allItems.length; itemsRow++) {
		var actualItem = allItems[itemsRow];
		if (actualItem.classList.contains('selected')) {
			actualItem.classList.remove('selected');
		}
	}
	var thisItem = document.getElementById(itemId);
	thisItem.classList.add('selected');
}

/*

*/
function setInputValue(name, value) {
	var myInputs = document.getElementsByName(name);
	for (var i = 0; i < myInputs.length; i++) {
		var actualInput = myInputs[i];
		actualInput.setAttribute('value', value);
	}
}

/*

*/
function rolld(dieValue) {
	return Math.floor(Math.random() * dieValue) + 1;
}



// This function controls the behaviour of the tabs button in the charachter sheet

/* When the user clicks on the tab,
highlights it and shows its content, hiding the others */
function showTab(tabnumber) {

	var tabbtns = document.getElementsByClassName('stattab');
	var tb;
	for (tb = 0; tb < tabbtns.length; tb++) {
		var selectTab = tabbtns[tb];
		if (selectTab.classList.contains('selectedtab')) {
			selectTab.classList.remove('selectedtab');
		}
	}
	var highlightTab = document.getElementsByClassName('tab' + tabnumber);
	var htb;
	for (htb = 0; htb < highlightTab.length; htb++) {
		var hlTab = highlightTab[htb];
		hlTab.classList.add('selectedtab');
	}



	var tabs = document.getElementsByClassName('tabcontent');
	var tbc;
	for (tbc = 0; tbc < tabs.length; tbc++) {
		var openTab = tabs[tbc];
		if (openTab.classList.contains('visible')) {
			openTab.classList.remove('visible');
		}
	}

	var viewLeftTab = document.getElementsByClassName('lefttabstats' + tabnumber);
	var vlt;
	for (vlt = 0; vlt < viewLeftTab.length; vlt++) {
		var vwTab = viewLeftTab[vlt];
		vwTab.classList.add('visible');
	}

	var viewRightTab = document.getElementsByClassName('righttabstats' + tabnumber);
	var vrt;
	for (vrt = 0; vrt < viewRightTab.length; vrt++) {
		var vwTab = viewRightTab[vrt];
		vwTab.classList.add('visible');
	}

} // End of showTab() function



// ========================================================================== //
// Modal Functions																														//
// ========================================================================== //
/* These functions control the behaviour of the modal boxes */

// Set the "activeModal" variable to contain the active modal's id.
var activeModal = null;

// Get the modal, set it as active and show it
function showModal(myModal, myTab, allTabs, myPrefix) {
	showIdAmongClasses(myTab, allTabs, myPrefix); // Presets the view on a specific section
	activeModal = document.getElementById(myModal);
	activeModal.classList.remove('hidden');
}

// Get the modal and close it
function closeModal() {
	activeModal.classList.add('hidden');
	activeModal = null;
}



// ========================================================================== //
// Event Functions																														//
// ========================================================================== //
/* These functions control the events happening when clicking on the screen */

window.onclick = function(event) {

	/*	When the user clicks anywhere on the dark background outside of the modal,
			close it. */
	if (event.target == activeModal) {
		closeModal();
	}

}
