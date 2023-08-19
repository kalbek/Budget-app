document.addEventListener("DOMContentLoaded", function() {
    const sidebarToggle = document.getElementById("sidebarToggle");
    const closeIcon = document.getElementById("closeIcon");
    const sidebar = document.getElementById("sidebar");

    sidebarToggle.addEventListener("click", function() {
      sidebar.classList.toggle("active");
    });

    closeIcon.addEventListener("click", function() {
      sidebar.classList.remove("active");
    });
  });

  document.addEventListener("turbolinks:load", function() {
    const sidebarToggle = document.getElementById("sidebarToggle");
    const closeIcon = document.getElementById("closeIcon");
    const sidebar = document.getElementById("sidebar");

    sidebarToggle.addEventListener("click", function() {
      sidebar.classList.toggle("active");
    });

    closeIcon.addEventListener("click", function() {
      sidebar.classList.remove("active");
    });
  });
