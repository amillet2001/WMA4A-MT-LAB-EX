const form = document.getElementById('sign-up-form');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirm-password');
    const errorMessage = document.getElementById('error-message');

    form.addEventListener('submit', function(event) {
        if (password.value !== confirmPassword.value) {
        event.preventDefault(); // stop form from submitting
        errorMessage.textContent = "Passwords do not match!";
        confirmPassword.style.border = "2px solid red";
        } else {
        errorMessage.textContent = "";
        confirmPassword.style.border = "2px solid green";
        alert("Sign-up successful!");
        }
    });