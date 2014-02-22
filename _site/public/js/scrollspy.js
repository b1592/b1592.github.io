var titles = $("h2");

// Voeg link met 'Inhoud' toe bovenaan affix
$('#page-map').append(
  $('<li>').append(
    $('<a>').attr({href: '#top', id: 'page-map-inhoud-link'}).append(
      'Inhoud'
)));
eerstepaar = $("h2:nth-of-type(2)").nextUntil("h2", "h3");
console.log(eerstepaar);

titles.each( function(index) {
  $('#page-map').append(
    $('<li>').append(
      $('<a>').attr('href', '#' + $(this).attr('id')).append(
        $(this).text()
  )));

  var childheaders = $(this).nextUntil("h2", "h3");
  if ($(childheaders).length > 0) {
    $('#page-map li').filter(':last').append(
      $("<ul>"));
    
    childheaders.each( function(index) {
      console.log("Childheader: " + $(this).text())
      $('#page-map ul').filter(':last').append(
      $('<li>').append(
        $('<a>').attr('href', '#' + $(this).attr('id')).append(
          $(this).text()
      )));
    });     
  }
  // $(this).nextUntil("h2", "h3").each( function(index) {
  //   if ( $(this).prop("tagName") == "H2" ) {
  //     $('#page-map').append(
  //     $('<li>').append(
  //       $('<a>').attr('href', '#' + $(this).attr('id')).append(
  //         $(this).text()
  //     )));
  //   } else {
  //     $('#page-map').append(
  //     $('<li>').append(
  //       $('<a>').attr('href', '#' + $(this).attr('id')).append(
  //         "&nbsp;&nbsp;" + $(this).text()
  //     )));
  //   }
  // });
});

// Maak link naar de bovenste H2 actief in de affix
// $('#page-map > li:nth-child(2)').addClass('active');


$('body').scrollspy({ target: '.page-map-sidebar' });

/* From application.js on bootstrap docs */
!function ($) {

  $(function(){

    var $window = $(window)

    // Disable certain links in docs
    $('section [href^=#]').click(function (e) {
      e.preventDefault()
    })

    // side bar
    $('.page-map-sidebar').affix({
      offset: {
        top: 284
      , bottom: 150
      }
    })          
  })
}(window.jQuery)

$( window ).load(function() {
  var offset = 0;
  var duration = 500;
  // jQuery(window).scroll(function() {
  //   // 992 is @screen-md-min
  //   if ($(window).width() > 992) {
  //     if (jQuery(this).scrollTop() > offset) {
  //         jQuery('.page-map-sidebar').fadeIn(duration);
  //     } else {
  //         jQuery('.page-map-sidebar').fadeOut(duration);
  //     }
  //   } else {
  //     jQuery('.page-map-sidebar').fadeOut(duration);
  //   }
  // });
  if ($(window).width() > 992) {
    // 992 is @screen-md-min
    jQuery('#page-map').delay(600).fadeIn(duration);
  }
});

$( window ).resize(function() {
  var duration = 500;
  if ($(window).width() > 992) {

    // alert("Resize!");
    // 992 is @screen-md-min
    jQuery('#page-map:hidden').delay(600).fadeIn(duration);
  } else {
    jQuery('#page-map').hide();
  }
});

$( window ).scroll(function() {
  if ($('#page-map li ul li.active') != 0) {
    $('#page-map li ul li.active').parent().addClass('active');
    $('#page-map li ul li.active').parent().parent().addClass('active');
  }
  if ($('#page-map li.active') != 0) {
    $('#page-map li.active ul').addClass('active');
  }
});