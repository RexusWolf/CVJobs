// Get the modal
var biographyModal = document.getElementById("biographyModal");

// Get the button that opens the modal
var editBioButton = document.getElementById("edit-biography");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("closeButton")[0];

// When the user clicks on the button, the modal opens
editBioButton.onclick = function() {
	biographyModal.style.display = "block";
}

// When the user clicks on <span> (x), the modal closes
span.onclick = function() {
	biographyModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == biographyModal) {
    biographyModal.style.display = "none";
  }
} 