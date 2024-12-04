import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["searchbar"];
  connect() {}
  toggle() {
    console.log("click");
    this.searchbarTarget.classList.toggle("searchbar-active");
  }
}
