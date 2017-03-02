document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const restFormEl = document.getElementsByClassName("list-container")[0];

  restFormEl.addEventListener("submit", e => {
    e.preventDefault();

    const restNameInputEl = document.getElementsByClassName("favorite-input")[0];
    const restName = restNameInputEl.value;
    restNameInputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = restName;

    ul.appendChild(li);
  });



  // adding new photos

  const toggleFormBtn = document.getElementsByClassName("photo-show-button")[0];
  const photoForm = document.getElementsByClassName("photo-form-container")[0];

  toggleFormBtn.addEventListener("click", e => {
    photoForm.classList.toggle("hidden");
  });

  photoForm.addEventListener("submit", e => {
    e.preventDefault();

    const photoUrlInput = document.getElementsByClassName("photo-url-input")[0];
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = photoUrl;

    ul.appendChild(li);
    li.appendChild(img);
  });
});
