$(document).on('page:change', function(event) {

	var topOfContent = $(".navbar").height();
	$(".spinner-wrapper").hide();
	$("a:not(.exclude-spinner, .exclude-spinner a)").click(function(){
		$(".spinner-wrapper").fadeIn();
	})
	$(window).scroll(function() {
	    var topOfWindow = $(window).scrollTop() + $('.navbar').height() - 25;
	    if (topOfContent < topOfWindow) {
	        scrolled();
	    }
	    else {
	    	unscrolled();
	    }
	});
	setTimeout(function(){
		$(".alert").fadeOut();
	}, 3500);
	$(".thumbnail").click(function(){
		$("#main-image img.product_image").attr('src', $(this).attr('src'));
	});
	$("#main-image img.product_image").click(function(){
		var big_image_src = $(this).attr('src').toString();
		console.log(big_image_src);
		big_image_src = big_image_src.replace("large", "original");
		console.log(big_image_src);
		$(".image-zoom img").attr('src', big_image_src);
		$(".image-zoom-original a").attr('href', big_image_src);
		$(".image-zoom-background").fadeIn();
		$(".image-zoom-wrapper").fadeIn();
	});
	$(".image-zoom, .image-zoom-close").click(function(){
		$(".image-zoom-background").fadeOut();
		$(".image-zoom-wrapper").fadeOut();
	})
});

function scrolled() {
	$(".navbar").addClass("scrolled", 750);
	$(".nav-title").removeClass("unscrolled");
	$(".navbar-toggle").removeClass("unscrolled");
    $( ".nav-title" ).animate({
		color: "#777777"
	}, 750 );
    $( ".navbar-default .navbar-toggle .icon-bar" ).animate({
		backgroundColor: "#777777"
	}, 750 );
	$(".navbar .glyphicon").addClass("scrolled", 750);
	$(".navbar-collapse").addClass("scrolled", 750);
	$(".navbar-brand").addClass("scrolled");
	if ($(".white-logo").is(":visible")) {
		$(".white-logo").hide(750);
		$(".color-logo img").hide();
		$(".color-logo").show(200, function(){
			$(".color-logo img").fadeIn(550);
		});
	};
}

function unscrolled(){
    $(".navbar").removeClass("scrolled", 750);
	$(".nav-title").addClass("unscrolled");
	$(".navbar-toggle").addClass("unscrolled");
    $( ".nav-title" ).animate({
		color: "#FFFFFF"
	}, 750 );
    $( ".navbar-default .navbar-toggle .icon-bar" ).animate({
		backgroundColor: "#FFFFFF"
	}, 750 );
    $(".navbar .glyphicon").removeClass("scrolled", 750);
    $(".navbar-collapse").removeClass("scrolled", 750);
	$(".navbar-brand").removeClass("scrolled");
    if ($(".color-logo").is(":visible")) {
		$(".color-logo").hide(750);
		$(".white-logo img").hide();
		$(".white-logo").show(200,function(){
			$(".white-logo img").fadeIn(550);
		});
	};
}

// .navbar-default.scrolled{
// 	background-color: #FFFFFF;
// 	border-color:#e7e7e7;
// 	color:#777777;
// 	height: 50px;
// }

// .navbar .glyphicon.scrolled {
// 	margin: 0px;
// }

// navbar-brand.scrolled>img{
// 	height: 100%;
// 	width:auto;
// }
// .color-logo.scrolled{
// 	display:none;
// }
// .color-logo{
// 	display:none;
// }
// .color-logo.scrolled{
// 	display:inherit;
// }

// .nav-title.scrolled {
// 	color:#777777 !important;
//     margin: 0px;
// }
// .navbar-collapse.scrolled{
// 	border:0px;
// }
// .navbar-toggle.scrolled{
// 	margin:9px;
// }
// .navbar-default .navbar-toggle.scrolled .icon-bar{
// 	background-color: #777777;
// }