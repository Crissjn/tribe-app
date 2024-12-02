import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["pics"];
  static values = { pic_num: Number };
  connect() {
    this.pic_num = 1;
    this.showSlide(this.pic_num);
  }
  changeSlide(event) {
    console.log(event.params);

    this.showSlide((this.pic_num += event.params.move));
  }
  showSlide(n) {
    let i;
    let length = this.picsTargets.length;

    if (n > length) {
      this.pic_num = 1;
    }
    if (n < 1) {
      this.pic_num = length;
    }
    for (i = 0; i < length; i++) {
      this.picsTargets[i].style.display = "none";
    }

    this.picsTargets[this.pic_num - 1].style.display = "block";
  }
}
