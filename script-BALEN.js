alert("Greetings! Welcome to Sanrio website!")

function onSubmit(event) {
  event.preventDefault();
  const passInp = document.getElementById("pass");
  const passVal = passInp.value.trim();

  const cPassInp = document.getElementById("c_pass");
  const cPassVal = cPassInp.value.trim();

  const fullName = document.getElementById("fullname").value.trim();

//   password validation
  if (passVal === cPassVal && passVal !== "") {
    alert(`Signup Successful! Welcome, ${fullName || "User"}!`);

    document.querySelector("form").reset();
  } else {
    alert("Passwords do not match! Please try again.");
    const form = document.querySelector(".form_ctn");
    form.style.animation = "shake 0.2s";
    setTimeout(() => (form.style.animation = ""), 200);
  }
}
