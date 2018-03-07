// *** PRODUCT SHOW PAGE ***
$(document).ready(function() {
    $('#product-price-table').DataTable({
        "scrollX": true
    });
});


// ****INDEX PAGES (Mostly Product)**

//when user selects an option state
function setSelectedState(value) {
	jQuery('[id$=state_search]').val(value);
}

//when user selects an option category
function setSelectedCategory(value) {
	jQuery('[id$=category_search]').val(value);
} 

//when user selects an option a-z value
function selectSelectedAZValue(value) {
	jQuery('[id$=az_search]').val(value);
}

// ****DISPENSARY ALL PRODUCTS ***
function changeProductCategory(value) {
	
	//hide other product displays
	$(".product-section-class").css("display", "none");
	
	//show this product display
	$("." + value).css("display", "block");
    
    //make all others buttons inactive
    $(".header-button").removeClass('active-header-button');
    $(".header-button").addClass('inactive-header-button');
    
    //make this button active
    $("." + value + "-button").addClass('active-header-button');
    $("." + value + "-button").removeClass('inactive-header-button');
    
}

// *** STATE PAGE **

function changeStateView(value) {
	if (value == 'News') {
		$("#state-news-button").addClass('active-header-button');
		$("#state-news-button").removeClass('inactive-header-button');
		$("#state-products-button").addClass('inactive-header-button');
		$("#state-products-button").removeClass('active-header-button');
		$(".state-products-section").css("display", "none");
		$(".state-news-section").css("display", "block");
	}
	else if (value == 'Products') {
		$("#state-products-button").addClass('active-header-button');
		$("#state-products-button").removeClass('inactive-header-button');
		$("#state-news-button").addClass('inactive-header-button');
		$("#state-news-button").removeClass('active-header-button');
		$(".state-products-section").css("display", "block");
		$(".state-news-section").css("display", "none");
	}
}

// Both - Clear Values
function clearFormValues() {
	jQuery('[id$=state_search]').val('');
	jQuery('[id$=category_search]').val('');
	jQuery('[id$=az_search]').val('');
	jQuery('[id$=name_search]').val('');
	jQuery('[id$=location_search]').val('');
	
	var stateLists = document.getElementsByClassName("state-dropdown");
	for (var i = 0; i < stateLists.length; i++) {
		stateLists[i].selectedIndex = 0;
	}
	
	var categoryLists = document.getElementsByClassName("category-dropdown");
	for (var i = 0; i < categoryLists.length; i++) {
		categoryLists[i].selectedIndex = 0;
	}
	
	var azLists = document.getElementsByClassName("az-dropdown");
	for (var i = 0; i < azLists.length; i++) {
		azLists[i].selectedIndex = 0;
	}
}

//collapsible option thing
$('.plus-minus').click(function(){
    $(this).text(function(i,old){
        return old=='(+)' ?  '(-)' : '(+)';
    });
});

//don't collapse on desktop, collapse on mobile
$(window).resize(function() {
	if ($(window).width() < 991) {
	    $('#option-div').removeClass('in');
	    $('.plus-minus').text('(+)');
	} else {
	    $('#option-div').addClass('in');
	    $('.plus-minus').text('(-)');
	}
});

//on load collapse on mobile
$( document ).ready(function() {
	if ($(window).width() < 991) {
	    $('#option-div').removeClass('in');
	    $('.plus-minus').text('(+)');
	} else {
	    $('#option-div').addClass('in');
	    $('.plus-minus').text('(-)');
	}
});

//toggle product table rows
// $('.state-name-row').click(function(){
// 	$(this).nextUntil('tr.state-name-row').slideToggle(200);
// 	$(this).find('.pm').text(function(_, value){return value=='(-)'?'(+)':'(-)'});
// });

//start some rows collapsed
// $( document ).ready(function() {
// 	$('.dont').nextUntil('tr.state-name-row').hide();
// 	$(this).find('.pm').text(function(_, value){return value=='(-)'?'(+)':'(-)'});
// });
