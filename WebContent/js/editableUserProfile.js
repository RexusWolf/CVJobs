// Get the modal
var biographyModal = document.getElementById("biographyModal");
var profileInfoModal = document.getElementById("profileInfoModal");

// Get the button that opens the modal
var editBioButton = document.getElementById("edit-biography");
var editProfileInfoButton = document.getElementById("edit-profileInfo");

// When the user clicks on the button, the modal opens
editBioButton.onclick = function() {
	biographyModal.style.display = "block";
}

editProfileInfoButton.onclick = function() {
	profileInfoModal.style.display = "block";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == biographyModal) {
    biographyModal.style.display = "none";
  }
  if (event.target == profileInfoModal) {
	  profileInfoModal.style.display = "none";
  }
}

function AddInfo(){
	var newField = '<div><label for="role"><b>Role</b></label><input class="loginInput" name="role" type="text"><label for="period"><b>Period of time</b></label><input class="loginInput" name="period" type="text"><textarea class="profileBiographyInput"></textarea></div>\r\n';
	document.getElementById('edit-profile-inputs').innerHTML += newField;
	document.getElementById("add-info-button").disabled = true;
}