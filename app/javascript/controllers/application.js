import { Application } from "@hotwired/stimulus";
import "./background";
const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
