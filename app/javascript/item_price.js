window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const priceValue = itemPrice.value;

    const itemFee = document.getElementById("add-tax-price");
    itemFee.innerHTML = Math.floor(priceValue * 0.1);

    const itemProfit = document.getElementById("profit");
    itemProfit.innerHTML = Math.floor(priceValue - itemFee.innerHTML);
  });
});