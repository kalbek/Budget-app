// app/javascript/controllers/application.js

import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

export const application = {
  // Your other Stimulus controller definitions here

  initialize() {
    document.addEventListener("DOMContentLoaded", function() {
      // Your DOMContentLoaded logic here
      var checkboxes = document.querySelectorAll(".public-checkbox");
      var form = document.querySelector(".recipe-form");
      for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("change", function() {
          form.submit();
        });
      }
    });
  }
};

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application);
