 const btn = document.getElementById("btn");

        btn.addEventListener("click", function(){
            

            if (btn.innerText === "Light"){
                document.body.style.backgroundColor ="white";
            document.body.style.color ="black";
            btn.innerText ="Dark"
            }else{
 document.body.style.backgroundColor ="black";
            document.body.style.color ="white";
            btn.innerText ="Light"
            }
        })
