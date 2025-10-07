document.getElementById("signupForm")?.addEventListener("submit", function(e){
    e.preventDefault();
    const fullname = document.getElementById("fullname").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if(password !== confirmPassword){
        alert("Passwords do not match!");
    } else {
        alert(`Signup successful!\nName: ${fullname}\nEmail: ${email}`);
    }
});
