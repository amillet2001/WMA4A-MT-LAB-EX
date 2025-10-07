const form = document.getElementById('signupForm');
const fullname = document.getElementById('fullname');
const email = document.getElementById('email');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirmPassword');

// Real-time password matching
confirmPassword.addEventListener('input', function() {
    const confirmMessage = document.getElementById('confirmMessage');
    
    if (this.value.length === 0) {
        confirmMessage.textContent = '';
        this.classList.remove('valid', 'invalid');
    } else if (password.value !== this.value) {
        confirmMessage.textContent = 'Passwords do not match';
        confirmMessage.className = 'message error';
        this.classList.add('invalid');
        this.classList.remove('valid');
    } else {
        confirmMessage.textContent = 'Passwords match!';
        confirmMessage.className = 'message success';
        this.classList.add('valid');
        this.classList.remove('invalid');
    }
});

// Form submission
form.addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Validate password match
    if (password.value !== confirmPassword.value) {
        alert('⚠️ Passwords do not match!');
        return;
    }

    // Validate name length
    if (fullname.value.length < 3) {
        alert('⚠️ Please enter a valid full name.');
        return;
    }

    // Validate email format
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email.value)) {
        alert('⚠️ Please enter a valid email address.');
        return;
    }

    // Validate password length
    if (password.value.length < 8) {
        alert('⚠️ Password must be at least 8 characters.');
        return;
    }

    // Show success message
    document.getElementById('formContainer').style.display = 'none';
    document.getElementById('successMessage').style.display = 'block';
    document.getElementById('userGreeting').textContent = `Welcome, ${fullname.value}!`;
    
    // Reset form and styles to default
    document.querySelector('.container').style.background = '';
});
