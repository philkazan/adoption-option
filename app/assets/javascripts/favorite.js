$(document).ready(function() {
  $(".favorite").on("click",(function(event) {
    selectFavorite();
  }));
});

$(document).ready(function() {
  $(".deleteFavorite").on("click",(function(event) {
    debugger
    deleteFavorite();
  }));
});

function selectFavorite() {
  event.preventDefault();
  petId = this.document.activeElement.id;

  var request = $.ajax({
    method: "POST",
    url: '../api/v1/pets/' + petId + '/favorites'
  });
}

function deleteFavorite() {
  event.preventDefault();
  favId = this.document.activeElement.id;
  var request = $.ajax({
    method: "DELETE",
    url: '../api/v1/pets/' + petId + '/favorites/'
  });
}
