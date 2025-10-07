
document.querySelectorAll(".nav-link").forEach(link => {
link.addEventListener("click", () => {
const target = document.querySelector(link.dataset.target);
document.querySelectorAll(".nav-link").forEach(l => l.classList.remove("active"));
link.classList.add("active");
target.scrollIntoView({ behavior: "smooth" });
});
});


const sections = document.querySelectorAll("section");
window.addEventListener("scroll", () => {
sections.forEach(sec => {
const rect = sec.getBoundingClientRect();
if (rect.top < window.innerHeight - 150) {
sec.style.opacity = 1;
sec.style.transform = "translateY(0)";
}
});
});


sections.forEach(sec => {
sec.style.opacity = 0;
sec.style.transform = "translateY(40px)";
sec.style.transition = "opacity 1s ease, transform 1s ease";
});
