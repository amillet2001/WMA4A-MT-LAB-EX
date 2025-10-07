document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("signup");
  const container = document.querySelector(".signup-container");
  const button = document.querySelector(".btn");

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    const password = document.getElementById("password").value.trim();
    const confirmPass = document.getElementById("conPass").value.trim();

    if (password !== confirmPass) {
      alert("Passwords do not match. Please try again.");
      return;
    }

    container.style.transition = "box-shadow 0.8s ease, transform 0.6s ease";
    container.style.boxShadow = "0 0 30px rgba(102, 166, 255, 0.6)";
    container.style.transform = "scale(1.02)";

    button.style.transition = "background-color 0.4s ease";
    button.style.backgroundColor = "#4c8de6";

    setTimeout(() => {
      alert("Account Successfully Created");

   
      container.style.boxShadow = "0 10px 30px rgba(0, 0, 0, 0.1)";
      container.style.transform = "scale(1)";
      button.style.backgroundColor = "#66a6ff";
      form.reset();
    }, 500);
  });
});
