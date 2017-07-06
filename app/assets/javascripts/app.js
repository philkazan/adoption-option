$(document).ready(function() {
  $(".adopt").on("click",(function(event) {
    submitApp();
  }));
});

function submitApp() {
  event.preventDefault();
  petId = this.document.activeElement.id;

  var request = $.ajax({
    method: "POST",
    url: '../api/v1/pets/' + petId + '/apps'
  });
}
