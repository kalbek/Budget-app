import { Application } from "@hotwired/stimulus";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import { application as appInstance } from "controllers/application"; // Renamed to avoid conflict

const application = Application.start();

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

application.debug = false;
window.Stimulus = application;

eagerLoadControllersFrom("controllers", appInstance); // Load controllers using the appInstance

export { application };
