

$(document).on('ready page:load',function(){

  $('form input').hide();
  $("form").trigger('submit.rails');

  $( "#transfer_market_id" ).change(function() {
    // The dropdown menu has been changed.
    // trigger submit on the form
    $("form").trigger('submit.rails');
  });
});