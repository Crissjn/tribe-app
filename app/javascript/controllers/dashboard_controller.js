import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["exp", "bookings", "btnexp", "btnbooking"];

  connect() {
    this.#hide_both();
  }

  change_tab(event) {
    this.#hide_both();
    event.target.className += " active";
    if (event.params.tab == "exp") {
      this.expTarget.style.display = "block";
    }
    if (event.params.tab == "bookings") {
      this.bookingsTarget.style.display = "block";
    }
  }

  #hide_both() {
    this.btnexpTarget.classList.remove("active");
    this.btnbookingTarget.classList.remove("active");

    this.expTarget.style.display = "none";
    this.bookingsTarget.style.display = "none";
  }
}
