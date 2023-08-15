// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", function() {
    var checkboxes = document.querySelectorAll(".public-checkbox");
    var form = document.querySelector(".recipe-form");
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener("change", function() {
        form.submit();
      });
    }
  });
  