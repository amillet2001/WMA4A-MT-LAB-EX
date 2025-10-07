document.getElementById("signupForm")?.addEventListener("submit", function(e){
    e.preventDefault();
    
    const fullname = document.getElementById("fullname").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if(password !== confirmPassword){
        alert("Passwords do not match!");
        return;
    }

    alert(`Signup successful!\nName: ${fullname}\nEmail: ${email}`);
});

// Preview uploaded image
document.getElementById("profileImage")?.addEventListener("change", function(){
    const preview = document.getElementById("previewImage");
    const file = this.files[0];
    if(file){
        const reader = new FileReader();
        reader.onload = function(e){
            preview.src = e.target.result;
            preview.style.display = "block";
        }
        reader.readAsDataURL(file);
    }
});
