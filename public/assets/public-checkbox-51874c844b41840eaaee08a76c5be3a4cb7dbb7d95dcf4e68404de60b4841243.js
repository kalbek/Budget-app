document.addEventListener("DOMContentLoaded", function () {
  var checkboxes = document.querySelectorAll(".public-checkbox");
  var form = document.querySelector(".recipe-form");
  console.log("Checkbox changed");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener("change", function () {
      form.submit();
    });
  }
});
