window.onload = function () {
  alert("Welcome to Signup Page!");
};

document
  .getElementById("signupForm")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const fullname = document.getElementById("fullname").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
      alert("Passwords do not match!");
      return;
    }

    alert(`Hello fullname! Your signup is successful!`);
    console.log(`User Info: Name: fullname, Email: email`);
  });

const colors = ["#f0f4f8", "#ffebcd", "#ffe4e1", "#e6e6fa", "#d0f0c0"];
let colorIndex = 0;

document
  .getElementById("changeColorBtn")
  .addEventListener("click", function () {
    document.body.style.backgroundColor = colors[colorIndex];
    colorIndex = (colorIndex + 1) % colors.length;
  });