$(document).on('ready page:load',function(){

  if($('#player_team_driver1_id').length > 0 ){

    //$('form input').hide();
    //$("form").trigger('submit.rails');

    $( "#player_team_driver1_id" ).change(function() {
      // The dropdown menu has been changed.
      // trigger submit on the form
      //$("form").trigger('submit.rails');
      var new_selected_id = $('#player_team_driver1_id option:selected').val()
      //alert("You Selected driver id: " + new_selected_id);
      // get drivers image_url from this id
      $.ajax({
        type: 'GET',
        url: '/drivers/' + new_selected_id, 
        data: { id: new_selected_id },
        dataType: 'json'
      }).success(function(data){
        new_image_url = '/assets/' + data.image_url
        $('#primary_driver_image').attr('src',new_image_url)
        })
    });

    $( "#player_team_driver2_id" ).change(function() {
      // The dropdown menu has been changed.
      // trigger submit on the form
      //$("form").trigger('submit.rails');
      var new_selected_id = $('#player_team_driver2_id option:selected').val()
      //alert("You Selected driver id: " + new_selected_id);
      // get drivers image_url from this id
      $.ajax({
        type: 'GET',
        url: '/drivers/' + new_selected_id, 
        data: { id: new_selected_id },
        dataType: 'json'
      }).success(function(data){
        new_image_url = '/assets/' + data.image_url
        $('#secondary_driver_image').attr('src',new_image_url)
        })
    });
    
    $( "#player_team_chassis_manufacturer_id" ).change(function() {
      // The dropdown menu has been changed.
      // trigger submit on the form
      //$("form").trigger('submit.rails');
      var new_selected_id = $('#player_team_chassis_manufacturer_id option:selected').val()
      //alert("You Selected driver id: " + new_selected_id);
      // get drivers image_url from this id
      $.ajax({
        type: 'GET',
        url: '/constructors/' + new_selected_id, 
        data: { id: new_selected_id },
        dataType: 'json'
      }).success(function(data){
        new_image_url = '/assets/' + data.image_url
        $('#constructor_image').attr('src',new_image_url)
        })
    });

     $( "#player_team_engine_id" ).change(function() {
      // The dropdown menu has been changed.
      // trigger submit on the form
      //$("form").trigger('submit.rails');
      var new_selected_id = $('#player_team_engine_id option:selected').val()
      //alert("You Selected driver id: " + new_selected_id);
      // get drivers image_url from this id
      $.ajax({
        type: 'GET',
        url: '/engines/' + new_selected_id, 
        data: { id: new_selected_id },
        dataType: 'json'
      }).success(function(data){
        new_image_url = '/assets/' + data.image_url
        $('#engine_image').attr('src',new_image_url)
        })
    });   

  }
});