// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.slicknav
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require lazy

$(document).on('turbolinks:load', function() {
	
	$(".lazy").lazyload({
		effect : "fadeIn",
		threshold : 400
	});
	
	$('#thumbs').delegate('img','click', function(){
	    $('#largeImage').attr('src',$(this).attr('src').replace('thumb','large'));
	    $('#description').html($(this).attr('alt'));
	});
	
	$('#menu').slicknav();
	
	(function ( window, document, undefined ) {

	  /*
	   * Grab all iframes on the page or return
	   */
	  var iframes = document.getElementsByTagName( 'iframe' );

	  /*
	   * Loop through the iframes array
	   */
	  for ( var i = 0; i < iframes.length; i++ ) {

	    var iframe = iframes[i],

	    /*
	       * RegExp, extend this if you need more players
	       */
	    players = /www.youtube.com|player.vimeo.com/;

	    /*
	     * If the RegExp pattern exists within the current iframe
	     */
	    if ( iframe.src.search( players ) > 0 ) {

	      /*
	       * Calculate the video ratio based on the iframe's w/h dimensions
	       */
	      var videoRatio        = ( iframe.height / iframe.width ) * 100;

	      /*
	       * Replace the iframe's dimensions and position
	       * the iframe absolute, this is the trick to emulate
	       * the video ratio
	       */
	      iframe.style.position = 'absolute';
	      iframe.style.top      = '0';
	      iframe.style.left     = '0';
	      iframe.width          = '100%';
	      iframe.height         = '100%';

	      /*
	       * Wrap the iframe in a new <div> which uses a
	       * dynamically fetched padding-top property based
	       * on the video's w/h dimensions
	       */
	      var wrap              = document.createElement( 'div' );
	      wrap.className        = 'fluid-vids';
	      wrap.style.width      = '100%';
	      wrap.style.position   = 'relative';
	      wrap.style.paddingTop = videoRatio + '%';

	      /*
	       * Add the iframe inside our newly created <div>
	       */
	      var iframeParent      = iframe.parentNode;
	      iframeParent.insertBefore( wrap, iframe );
	      wrap.appendChild( iframe );

	    }

	  }

	})( window, document );
});
