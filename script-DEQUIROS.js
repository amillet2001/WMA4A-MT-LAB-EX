document.addEventListener("DOMContentLoaded", function () {
  const changeBtn = document.getElementById("changeBtn");
  const body = document.body;
  const colors = ["#1a1a2e", "#1e272e", "#2f3640", "#353b48"];
  let currentColorIndex = 0;

  changeBtn.addEventListener("click", function () {
    currentColorIndex = (currentColorIndex + 1) % colors.length;
    body.style.backgroundColor = colors[currentColorIndex];
  });
});
