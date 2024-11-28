import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="multiple-files-form"
export default class extends Controller {
  static targets = ["files", "status"];
  static values = { temp: Number };
  connect() {
    this.temp = 1;
  }
  addFile(event) {
    // Grab some references for later

    const originalInput = event.target;
    const originalParent = originalInput.parentNode;

    // Create an element that contains our input element
    const selectedFile = document.createElement("div");
    selectedFile.className = "selected-file";
    selectedFile.append(originalInput);

    // Create label (the visible part of the new input element) with the name of
    // the selected file.
    var labelNode = document.createElement("label");
    var temp_txt = originalInput.files[0].name;
    if (temp_txt.length > 10) {
      temp_txt = `${temp_txt.slice(0, 8)}...`;
    }
    var textElement = document.createTextNode(temp_txt);

    labelNode.appendChild(textElement);
    selectedFile.appendChild(labelNode);

    // Add the selected file to the list of selected files
    this.filesTarget.append(selectedFile);
    if (this.temp < 3) {
      // Create a new input field to use going forward
      const newInput = originalInput.cloneNode();

      // Clear the filelist - some browsers maintain the filelist when cloning,
      // others don't
      newInput.value = "";

      // Add it to the DOM where the original input was
      originalParent.append(newInput);
    } else {
      var textElement = document.createTextNode(
        " You uploaded 3 pics already!"
      );
      var labelNode = document.createElement("label");

      labelNode.appendChild(textElement);
      selectedFile.appendChild(labelNode);
      this.filesTarget.append(selectedFile);
    }
    this.temp = this.temp + 1;
  }
}
