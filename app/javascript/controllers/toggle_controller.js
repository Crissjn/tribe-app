import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "btnshowmore"];

  render(event) {
    event.preventDefault();
    this.togglableElementTarget.classList.toggle("d-none");
    this.btnshowmoreTarget.classList.toggle("d-none");
  }
}
