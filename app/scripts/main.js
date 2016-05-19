
$(document).ready(function() {
  $(".js-open-instructions-button").click(function() {
    $("." + this.dataset.openInstructions).addClass("is-opened");
  });

  $(".js-on-click-dismissed").each(function() {
    $(this).find("." + this.dataset.dismissButton).click(function() {
      $(this).parents(".js-on-click-dismissed").removeClass("is-opened");
    });
  });
});
