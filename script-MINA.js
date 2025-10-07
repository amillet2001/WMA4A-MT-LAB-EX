document.getElementById("signup").addEventListener("submit", function(e) {
  e.preventDefault();

  let fullname = document.getElementById("fullname").value.trim();
  let email = document.getElementById("email").value.trim();
  let pass = document.getElementById("password").value;
  let confirmPass = document.getElementById("confirmPass").value;
  let messageBox = document.getElementById("messageBox");

  messageBox.textContent = "";
  messageBox.className = "";

  if (fullname === "" || user === "" || pass === "" || confirmPass === "") {
    showMessage("Please fill out all fields.", "error");
    return;
  }
   if (pass !== confirmPass) {
    showMessage("Passwords do not match. Please try again.", "error");
    return;
  }
  showMessage("Sign-Up Successful! Welcome, " + fullname + "!", "success");
   function showMessage(msg, type){
});
