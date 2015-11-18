$(document).on('page:change', function(event) {

	var topOfContent = $(".navbar").height();

	$(window).scroll(function() {
	    var topOfWindow = $(window).scrollTop() + $('.navbar').height();
	    if (topOfContent < topOfWindow) {
	        $(".navbar").addClass("scrolled", 750);
	        $(".navbar-nav > li > a").addClass("scrolled", 750);
			$(".navbar .glyphicon").addClass("scrolled", 750);
			$(".navbar-toggle").addClass("scrolled", 750);
	    }
	    else {
	        $(".navbar").removeClass("scrolled", 750);
	        $(".navbar-nav > li > a").removeClass("scrolled", 750);
	        $(".navbar .glyphicon").removeClass("scrolled", 750);
	        $(".navbar-toggle").removeClass("scrolled", 750);
	    }
	});
});