const application = {
  initialize() {
    // Your DOMContentLoaded logic here
    var checkboxes = document.querySelectorAll(".public-checkbox");
    var form = document.querySelector(".recipe-form");
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener("change", function() {
        form.submit();
      });
    }
  }
};

document.addEventListener("DOMContentLoaded", function() {
  application.initialize();
});

// Eager load controllers as they appear in the DOM (remember not to preload controllers in import map!)
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);
