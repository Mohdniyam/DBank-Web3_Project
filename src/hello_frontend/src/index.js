import { hello_backend } from "../../declarations/hello_backend";

window.addEventListener("DOMContentLoaded",  async ()=>{
  // console.log("hello")
  update();
}
)


document.querySelector("form").addEventListener("submit", async (event)=>{
  event.preventDefault()
  console.log("Data Submitted")

  const button = event.target.querySelector("#submit-btn");

  const inputValue = Number(document.getElementById("input-amount").value);
  const outputValue = Number(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  console.log(document.getElementById("input-amount").value.length)
  
  if(document.getElementById("input-amount").value.length != 0 || document.getElementById("withdrawal-amount").value.length != 0){
    await hello_backend.increValue(inputValue);
    await hello_backend.withdrawl(outputValue);
  }


  update()

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled")


})

const update = async () => {
  const currentAmount = await hello_backend.currentBalance()
  document.getElementById("value").innerText = currentAmount
}