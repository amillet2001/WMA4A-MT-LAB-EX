document.getElementById('signupForm').addEventListener('submit', function(event) {
    event.preventDefault();

    let username = document.getElementById('fullname').value;
    let email = document.getElementById('email').value;
    let password = document.getElementById('password').value;
    let confirmPassword = document.getElementById('confirmPass').value;

    let isValid = true;

    document.getElementById('fullError').textContent = '';
    document.getElementById('emailError').textContent = '';
    document.getElementById('passError').textContent = '';
    document.getElementById('confirmPassError').textContent = '';

    if (fullname.length < 3) {
        document.getElementById('fullError').textContent = 'Fullname must be at least 3 characters long.';
        isValid = false;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById('emailError').textContent = 'Please enter a valid email address.';
        isValid = false;
    }

    if (password.length < 6) {
        document.getElementById('passwordError').textContent = 'Password must be at least 6 characters long.';
        isValid = false;
    }

    if (password !== confirmPass) {
        document.getElementById('confirmPassError').textContent = 'Passwords do not match.';
        isValid = false;
    }

    if (isValid) {
        alert('Registration successful!');
        this.reset();
    }
});
