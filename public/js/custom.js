  // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
  $('.dropdown').on('show.bs.dropdown', function(e){
  	if ($(window).width() > 768) {
    	$(this).find('.dropdown-menu').first().stop(true, true).slideDown("fast");
    } else {
      $(this).find('.dropdown-menu').first().stop(true, true).show();
    }
  });

  // ADD SLIDEUP ANIMATION TO DROPDOWN //
  $('.dropdown').on('hide.bs.dropdown', function(e){
    if ($(window).width() > 768) {
      $(this).find('.dropdown-menu').first().stop(true, true).slideUp("fast");
    } else {
      $(this).find('.dropdown-menu').first().stop(true, true).hide();
    }
  });