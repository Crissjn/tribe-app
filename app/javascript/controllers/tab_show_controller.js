import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["chat", "map", "btnmap", "btnchat"];

  connect() {
    this.#hide_both();
  }

  change_tab(event) {
    this.#hide_both();
    event.target.className += " active";
    if (event.params.tab == "chat") {
      this.chatTarget.style.display = "block";
    }
    if (event.params.tab == "map") {
      this.mapTarget.style.display = "block";
    }
  }

  #hide_both() {
    this.btnchatTarget.classList.remove("active");
    this.btnmapTarget.classList.remove("active");

    this.mapTarget.style.display = "none";
    this.chatTarget.style.display = "none";
  }
}
