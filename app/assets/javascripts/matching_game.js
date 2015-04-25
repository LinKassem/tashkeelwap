function changelabelcolortored(){
	document.getElementById("span").className = "radius alert label";
}

function cloneCards(){
	for(var i=0;i<11;i++){
		$(".card:first-child").clone().appendTo("#cards");
	}
}

function prepareMatchingGame(){
	matchingGame.deck.sort(shuffle);
	backgroundColors.sort(shuffle);

	// clone 12 copies of the card
	cloneCards();
	
	// initialize each card's position
	$("#cards").children().each(function(index) {
		// align the cards to be 4x3 ourselves
		$(this).css({
			"left" : ($(this).width() + 20) * (index % 4),
			"top" : ($(this).height() + 20) * Math.floor(index / 4)
		});
	
		// get a pattern from the shuffled deck
		// .pop() removes the last element in the array
		// note to self: this will return the name of the picture. eg: cardAk
		var pattern = matchingGame.deck[index];

		// Add the pattern name to the card's class name
		// visually apply the pattern on the card's back side.
		$(this).find(".back").addClass(pattern);
	
		// Add id to the DOM ELEMENT
		$(this).find(".back").attr("id",pattern); //Lin added this to be able to change a particular element
	
		// embed the pattern data into the DOM element.
		$(this).attr("data-pattern",pattern);

		// listen the click event on each card DIV element.
		$(this).click(selectCard);			
	});

	setBackgroundImagesOfCards(gon.validation_words_images, ListOfObjectIds, backgroundColors);
	setBackgroundImagesOfCardsD(gon.validation_words_digitizations, ListOfObjectIdsD, gon.validation_words_ids);
}

function revealGameModal(){
	// Prepare matching Game
	prepareMatchingGame();
	// Reveal game modal
	$('#gameModal').foundation('reveal', 'open');
}

function endOfGame(){
	if($("#cards").children().length == 2){
		var cards = $(".card");
		$(cards[0]).click();
		$(cards[1]).click();
	} else{
		if($("#cards").children().length == 0){
			$('#gameOverModal').foundation('reveal', 'open');
			setTimeout(function(){
				$('#gameOverModal').foundation('reveal', 'close');
			}, 6000);
			$.ajax({
        url : "/increment_player_score",
        type : "post"
    	});	
		}		
	}
}

// List of element ids who will have the scanned image as their background 
var ListOfObjectIds = [
	"#cardA",
	"#cardB",
	"#cardC",
	"#cardE",
	"#cardF",
	"#cardG",
];

var backgroundColors = [
"#8DCC81",
"#FFFAB0",
"#B21338",
"#FF96AE",
"#188AB2",
"#8587B2",
];

function setBackgroundImagesOfCards(ListOfImages, ListOfObjectIds, BackgroundColors) {
		for(var i = 0; i < ListOfImages.length; i++){
			var imageUrl = ListOfImages[i];
			var elementId = ListOfObjectIds[i] ;
			var color = backgroundColors[i];
			$(elementId).css("background-image", "url("+ imageUrl + ")");
			//$(elementId).css("background-color", color);
	}
}

// List of element ids who will have the digitized words as their background
var ListOfObjectIdsD= [
	"#cardAD",
	"#cardBD",
	"#cardCD",
	"#cardED",
	"#cardFD",
	"#cardGD",
];

function setBackgroundImagesOfCardsD(ListOfDigitizedWords, ListOfObjectIds, ListOfWordsIds) {
		for(var i = 0; i < 6; i++){
			var elementId = ListOfObjectIds[i];
			var canavas= $('.canavas')[i];
			var ctx = canavas.getContext("2d");
			ctx.font = "20px Arial";
			ctx.fillText(ListOfDigitizedWords[i],60,60);
			dataUrl = canavas.toDataURL();
			//var color = BackgroundColors[i];
			//$(elementId).css("background-color", color);
			$(elementId).attr('data-image-id',ListOfWordsIds[i]);
			$(elementId).css("background-image", "url(" + dataUrl + ")");

	}
}

var matchingGame = {};
matchingGame.deck = [
	'cardA', 'cardAD',
	'cardB', 'cardBD',
	'cardC', 'cardCD', 
	'cardE', 'cardED',
	'cardF', 'cardFD',
	'cardG', 'cardGD', 
];

function shuffle() {
	return 0.5 - Math.random();
}

function selectCard() {
		// we do nothing if there are already two card flipped.
	if ($(".card-flipped").size() > 1) {
		return;
	}
	// If a card is flipped we change it's class name
	$(this).addClass("card-flipped");
	// check the pattern of both flipped card 0.7s later.
	// this is to give time to the user to memorize the games
	if ($(".card-flipped").size() == 2) {
		setTimeout(checkPattern,700);
	}
}

// This checks whether we should remove the cards or flip them back to their origin 
function checkPattern() {
	if (isMatchPattern()) {		
		var cards = $(".card-flipped");
		var firstPattern = $(cards[0]).data("pattern");
		var secondPattern = $(cards[1]).data("pattern");
		
		if(firstPattern.indexOf("D") > -1){
			$("#"+firstPattern).children(":first").css("visibility","visible");
		} else {
			$("#"+secondPattern).children(":first").css("visibility","visible");
		}
		setTimeout(intermediate,700);
	} else {
		$(".card-flipped").removeClass("card-flipped");
	}
}

function isMatchPattern() {
	// put all the flipped cards in an array
	var cards = $(".card-flipped"); 
	var pattern = $(cards[0]).data("pattern");
	var anotherPattern = $(cards[1]).data("pattern");
	return ((pattern == (anotherPattern + "D")) || ((pattern + "D")  == anotherPattern));
}

function intermediate() {	
	$('a#ok').off('click').on('click', function() { 
		$('span.tooltip:visible').hide();
		word_id = $(this).parent().parent().attr('data-image-id');
		$.ajax({
		        url : "/increment_certinity_rate",
		        type : "post",
		        data : { data_value: word_id }
		    });		
		$(".card-flipped").removeClass("card-flipped").addClass
			("card-removed");
		$(".card-removed").bind("webkitTransitionEnd",
			removeTookCards);		
	});

	$('a#remove').off('click').on('click', function() {
		$('span.tooltip:visible').hide();
		word_id = $(this).parent().parent().attr('data-image-id');
		$.ajax({
		        url : "/decrement_certinity_rate",
		        type : "post",
		        data : { data_value: word_id }
		    });
		$(".card-flipped").removeClass("card-flipped").addClass
			("card-removed");
		$(".card-removed").bind("webkitTransitionEnd",
			removeTookCards);
	});
}

function removeTookCards() {
	$(".card-removed").remove();
	endOfGame();
}

function refresh(){
	window.location.reload();
}