let contactForm = document.querySelector(".contactCard");

contactForm.addEventListener("submit", function (e) {
  e.preventDefault();
  alert("Your message has been sent successfully! 💜");
  contactForm.reset();
});
