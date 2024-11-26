document.addEventListener("mousemove", (event) => {
  const x = event.clientX;
  const y = event.clientY;
  const width = window.innerWidth;
  const height = window.innerHeight;

  const red = Math.round((x / width) * 255);
  const green = Math.round((y / height) * 255);
  const blue = Math.round(((x + y) / (width + height)) * 255);

  const homepageElement = document.querySelector(".homepage");
  if (homepageElement) {
    homepageElement.style.backgroundColor = `rgb(${red}, ${green}, ${blue})`;
  }
});
