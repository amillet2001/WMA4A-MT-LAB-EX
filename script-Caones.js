const btndark =document.getElementById("darkmode");

btndark.addEventListener("click", function(){
if (btndark.innerText === "dark mode"){
 document.body.style.backgroundColor="black";
 btndark.innerText = "white mode";
 
}else{
     document.body.style.backgroundColor="white mode";
     document.body.style.backgroundColor="white";
 btndark.innerText = "dark mode";
 }
});