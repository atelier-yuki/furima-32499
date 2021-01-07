const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);