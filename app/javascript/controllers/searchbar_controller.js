import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["searchbar"];

  connect() {
    this.searchbarTarget.classList.toggle("d-none");
  }

  toggle() {
    this.searchbarTarget.classList.toggle("d-none");
  }
}
