// app/javascript/controllers/application.js

import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

export default application = {
  // Your other Stimulus controller definitions here

}
 

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application);
