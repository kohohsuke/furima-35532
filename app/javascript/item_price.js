window.addEventListener('load', () => {
  if ( document.getElementById('item-price')){

    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      const profitTotal = document.getElementById("profit");
      const result = inputValue * 0.1;
      profitTotal.innerHTML = Math.floor(inputValue - result);
    })
  }
});