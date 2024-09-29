$(function () {
  $(".navbar-toggler").on("click", function (e) {
    $(".tm-header").toggleClass("show");
    e.stopPropagation();
  });

  $("html").click(function (e) {
    var header = document.getElementById("tm-header");

    if (!header.contains(e.target)) {
      $(".tm-header").removeClass("show");
    }
  });

  $("#tm-nav .nav-link").click(function (e) {
    $(".tm-header").removeClass("show");
  });

  $(function () {
    $("#search-form").submit(function (e) {
      e.preventDefault();
      var query = $(".tm-search-input").val().toLowerCase().trim();
      searchBlogs(query);
    });

    function searchBlogs(query) {
      $(".tm-post").each(function () {
        var title = $(this).find(".tm-post-title").text().toLowerCase();
        var topic = $(this)
          .find(".d-flex.justify-content-between.tm-pt-45 .tm-color-primary")
          .first()
          .text()
          .toLowerCase();
        if (title.includes(query) || topic.includes(query)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    }
  });
});
