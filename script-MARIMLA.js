document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("form");
  const inputs = form.querySelectorAll("input");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    let Filled = true;
    inputs.forEach(input => {
      if (!input.value.trim()) {
        Filled = false;
      }
    });

    if (Filled) {
      alert("Sign Up Successfully!");
    } else {
      alert("Please fill out all fields.");
    }
  });
});
