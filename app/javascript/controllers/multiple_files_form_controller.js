import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="multiple-files-form"
export default class extends Controller {
  static targets = ["files"];
  static values = { temp: Number };
  connect() {
    console.log("hello from multiple files form");
    this.temp = 1;
  }
  addFile(event) {
    // Grab some references for later
    console.log(event.target);
    if (this.temp === 3) {
      console.log("limit reached");
    } else {
      const originalInput = event.target;
      const originalParent = originalInput.parentNode;

      // Create an element that contains our input element
      const selectedFile = document.createElement("div");
      selectedFile.className = "selected-file";
      selectedFile.append(originalInput);

      // Create label (the visible part of the new input element) with the name of
      // the selected file.
      var labelNode = document.createElement("label");
      var textElement = document.createTextNode(originalInput.files[0].name);
      labelNode.appendChild(textElement);
      selectedFile.appendChild(labelNode);

      // Add the selected file to the list of selected files
      this.filesTarget.append(selectedFile);

      // Create a new input field to use going forward
      const newInput = originalInput.cloneNode();

      // Clear the filelist - some browsers maintain the filelist when cloning,
      // others don't
      newInput.value = "";

      // Add it to the DOM where the original input was
      originalParent.append(newInput);
      this.temp = this.temp + 1;
    }
  }
}
