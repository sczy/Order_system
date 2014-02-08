// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
// require vote_items
// require_tree .


$(document).ready(function(){
  $('.foodajax').on('ajax:beforeSend', function(event, xhr, settings){
    $(this).find('.food-details').attr('id','tar');
  });
});

$(document).ready(function(){
  $('.category.nav-tabs li').on('click', function(){
    $('.category.nav-tabs li').removeClass('active');
    $(this).addClass('active');
  });
});

$(document).ready(function(){
  $('.vendor .link').on('click', function(){
    $('.vendor .link').removeClass('active');
    $(this).addClass('active');
  });
});

$(document).ready(function(){
  $('.setajax').on('ajax:beforeSend', function(event, xhr, settings){
    $(this).attr('id','set');
  });
});
