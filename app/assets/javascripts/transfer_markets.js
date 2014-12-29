

$(document).on('ready page:load',function(){

  if($('#transfer_market_id').length > 0 ){
    $('form input').hide();

    $( "#transfer_market_id" ).change(function() {
        // The dropdown menu has been changed. Trigger submit on the form
      $("form").trigger('submit.rails');
    });
  }
});