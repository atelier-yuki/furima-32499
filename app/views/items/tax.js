window.addEventListener('load', ()=>{

  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", ()=>{
    const inputValue = itemPrice.value;

    const tax = inputValue * 0.1;
    const addTaxPrice = document.getElementById('add-tax-price');
    addTaxPrice.innerHTML = Math.floor(tax);

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = Math.floor(inputValue - tax);
  });
});