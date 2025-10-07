btn = document.getElementById("btn");

btn.addEventListener("click", function () {
  if (document.body.style.backgroundColor === "rgb(27, 92, 92)") {
    document.body.style.backgroundColor = "rgb(87, 236, 236)";
    document.body.style.color = black;
  } else {
    document.body.style.backgroundColor = "rgb(27, 92, 92)";
    document.body.style.color = white;
  }
});
