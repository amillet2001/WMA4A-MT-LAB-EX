function alertSignupSuccessful() {
    alert('Signup successful!');
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementsByClassName('btn').addEventListener('click', function(event) {
        event.preventDefault(); // Prevents form from submitting if needed
        alertSignupSuccessful('Signup successful!');
    });
});
