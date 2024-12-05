import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["chat", "map", "btnmap", "btnchat"];

  connect() {
    this.#hide_both();
    this.active = "";
  }

  change_tab(event) {
    this.#hide_both();
    // event.target.className += " active";
    if (event.params.tab == "chat") {
      if (this.active == "chat") {
        this.active = "";
      } else {
        event.target.className += " active";
        this.chatTarget.style.display = "block";
        this.active = "chat";
      }
    }
    if (event.params.tab == "map") {
      if (this.active == "map") {
        this.active = "";
      } else {
        event.target.className += " active";
        this.mapTarget.style.display = "block";
        this.active = "map";
      }
    }
  }

  #hide_both() {
    this.btnchatTarget.classList.remove("active");
    this.btnmapTarget.classList.remove("active");

    this.mapTarget.style.display = "none";
    this.chatTarget.style.display = "none";
  }
}
