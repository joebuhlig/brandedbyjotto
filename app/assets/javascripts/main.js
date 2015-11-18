$(document).on('page:change', function(event) {

	var topOfContent = $(".navbar").height();

	$(window).scroll(function() {
	    var topOfWindow = $(window).scrollTop() + $('.navbar').height();
	    if (topOfContent < topOfWindow) {
	        $(".navbar").addClass("scrolled", 750);
	        $(".nav-title").addClass("scrolled", 750);
			$(".navbar .glyphicon").addClass("scrolled", 750);
			$(".navbar-toggle").addClass("scrolled", 750);
			$(".navbar-collapse").addClass("scrolled", 750);
			$(".white-logo").addClass("scrolled", 750);
			$(".color-logo").addClass("scrolled", 750);
	    }
	    else {
	        $(".navbar").removeClass("scrolled", 750);
	        $(".nav-title").removeClass("scrolled", 750);
	        $(".navbar .glyphicon").removeClass("scrolled", 750);
	        $(".navbar-toggle").removeClass("scrolled", 750);
	        $(".navbar-collapse").removeClass("scrolled", 750);
			$(".white-logo").removeClass("scrolled", 750);
			$(".color-logo").removeClass("scrolled", 750);
	    }
	});
});