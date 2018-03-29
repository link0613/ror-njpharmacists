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
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require twitter/bootstrap
//= require jquery_nested_form
//= require ckeditor/init
//= require bootstrap-datepicker
//= require_tree .


/* Windows Phone 8 Fixes */

if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
  var msViewportStyle = document.createElement('style')
  msViewportStyle.appendChild(
    document.createTextNode(
      '@-ms-viewport{width:auto!important}'
    )
  )
  document.querySelector('head').appendChild(msViewportStyle)
}


function get_query_string_param(param_name)
{
    var page_url = window.location.search.substring(1);
    var url_vars = page_url.split('&');
    for (var i = 0; i < url_vars.length; i++) 
    {
        var curr_param = url_vars[i].split('=');
        if (curr_param[0] == param_name) 
        {
            return curr_param[1];
        }
    }
}

function create_dynamic_membee_script(membeeURL){
	var fileTag = "<script src='" + membeeURL + "?pg_id=" + get_query_string_param('pg_id') +"' type='text/javascript' ></script>";
	document.write(fileTag);
}

function toggleSlidingDiv(elem){
    alert($(elem).attr('id'));
}

/* Screen size change detection */
$(document).ready(function(){

    $('.tooltip-toggle').tooltip();
    $('.popover-toggle').popover();

    $('.dropdown-toggle').dropdown();


    $('.sliding-div .expand-link').click(function(){
        $(this).siblings('.hidden-div').toggle('slide');
    });

    $('.sliding-div .hidden-div-setup').hide().addClass('hidden-div').removeClass('hidden-div-setup');
    
    //ALLOWS HOVER TO CONTROL SUBNAVS ALSO
    
    $('.dropdown').hover(function() {
        $(this).addClass('open');
    }, function() {
        $(this).removeClass('open');
    });

    var bodyContainerMarginTop; 
    Harvey.attach('screen and (min-width:0px) and (max-width:1024px)', {
      setup: function(){
        bodyContainerMarginTop = $('.body-area.container').css('margin-top');
      }, // called when the query becomes valid for the first time
      on: function(){
        /* Disable fixed nav header for mobile, including iPad */
        $('.navbar-header-wrapper > .navbar > .navbar-inner').css('padding',0);
        $('.navbar-header-wrapper > .navbar').removeClass('navbar-fixed-top');
        $('.body-area.container').css('margin-top','0px');
        console.log("Changing header to normal position for mobile");
      }, // called each time the query is activated
      off: function(){
        /* Re-enable fixed nav header for devices larger than the iPad in resolution */
        $('.navbar-header-wrapper > .navbar').addClass('navbar-fixed-top');
        $('.body-area.container').css('margin-top', bodyContainerMarginTop);
        console.log("Changing header to fixed position for desktop");
      } // called each time the query is deactivated
    });
});