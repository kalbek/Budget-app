import { application as stimulusApplication } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

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

stimulusApplication.initialize();

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", stimulusApplication);
