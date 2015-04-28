var common_game_channel;
var channel_name;
var hint_number;

var bool_hint1_requested = false;
var bool_hint2_requested = false;
var bool_hint3_requested = false;

var bool_hint1_received = false;
var bool_hint2_received = false;
var bool_hint3_received = false;

var phase1_started = false;
var phase1_ended = false;
var phase2_started = false;
var phase2_ended = false;

var interval;

var word_id; // this is the word Id during the whole session
var word2_id

var type_of_game_over;

var session1_id;
var session2_id;


$(function(){

	$('#single-player-matching-game').click(function() {
		$('#render-matching-link').click();
		setTimeout(revealGameModal,50);
	});


  var pusher = new Pusher('681835ed500029b026cd');
  var name = 'private-game_channel-' + gon.player_id;
  var current_private_channel = pusher.subscribe(name);

  //---------------------------------------------------------
	current_private_channel.bind('pusher:subscription_succeeded', function() {
		console.log("subscribtion to private_game_channel made");
	});

  //---------------------------------------------------------
  current_private_channel.bind('waiting_event', function(data) {
    console.log(data.message);
    $('#player-container').hide();
    $('#waiting').css('display','block');
  });

  current_private_channel.bind('private-one-to-one-game-request', function(data) {
    word1_id = data.word_id
    word2_id = data.word2_id
    phase1_started = true;
    prepare_game_side_bar(data.initiated_by_name, data.play_with_name);
    session1_id = data.phase1_game_session_id;
    session2_id = data.phase2_game_session_id;

  	if(data.initiated_by == gon.player_id){
      $('#waiting').css('display', 'none');
  	  $('#game-explanation-hinter-side').css('display','block');
      setTimeout(function(){
        $('#game-explanation-hinter-side').css('display','none');
        console.log("You are a hinter"); 
        prepare_hinter_view(data.initiated_by_name, data.word_image_url);        
      }, 10000);  
  	} else if (data.play_with == gon.player_id){
      $('#player-container').css('display','none');
      $('#game-explanation-solver-side').css('display','block');
      setTimeout(function(){
    		console.log("you are a solver");
        $('#game-explanation-solver-side').css('display','none');

        prepare_solver_view(data.play_with_name, data.word_ocr, data.channel_name);

      }, 10000);
  	}
    channel_name = data.channel_name;
  	common_game_channel = pusher.subscribe(data.channel_name);
  	common_game_channel.bind('pusher:subscription_succeeded', function() {
			console.log("subscribtion to common_game_channel succeeded");
		});

    game_logic();
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// THIS IS THE 2nd part of the game
    var check_phase2_start = setInterval(function(){
      if(phase1_started && phase1_ended){
        phase2_started = true;
        reset_game_side_bar();
        // Ajax call to reset the views
        $.ajax({
          url : "/reset_hinter_solver_views",
          type : "get",
          data : {  word2_ocr: data.word2_ocr,
                    word2_image_url: data.word2_image_url,
                  }
        });

        bool_hint1_requested = false;
        bool_hint2_requested = false;
        bool_hint3_requested = false;

        bool_hint1_received = false;
        bool_hint2_received = false;
        bool_hint3_received = false;
        //>>>>>>>>. Need to reset the views in the game_side_bar_view
        //prepare_game_side_bar(data.initiated_by_name, data.play_with_name);        
        if(data.initiated_by == gon.player_id){
          $('#hinter-container').css('display', 'none');
          console.log("You are a solver in PHASE 2");
          console.log("word sent as method input " + data.word2_ocr );
          prepare_solver_view(data.play_with_name, data.word2_ocr, data.channel_name);
        } else if (data.play_with == gon.player_id){
          $('#solver-container').css('display', 'none');
          console.log("you are a HINTER in PHASE 2");
          prepare_hinter_view(data.initiated_by_name, data.word2_image_url);
        }
        clearInterval(check_phase2_start);
      }
    }, 50);
    
    var check_phase2_end = setInterval(function(){
      // asl law howa submitted mosh 7an5'osh lel 7etta di aslun 
      if(phase2_started && phase2_ended){
        if (type_of_game_over == "timeOver"){
          $('#modalTitle').html('إنتهى الوقت!!');  
        }
        $('#gameOverModal').foundation('reveal', 'open');
        setTimeout(function(){
          $('#gameOverModal').foundation('reveal', 'close');
        }, 6000);
        $.ajax({
          url : "/increment_player_score",
          type : "post"
        });
        window.location.href=window.location.href // refresh to redirect to the root page
        clearInterval(check_phase2_end);
      }
    }, 50);


    $(document).on('click', '.solver-word', function(){
      $('.solver-word').last().innerHtml = "MMMMMMMMMMMMMMMMMMMM";
      console.log("entered");
    });



//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  });

  //$('#submit-first-hint-button').click(submit_first_hint);
  //$('#submit-second-hint-button').click(submit_second_hint);
  //$('#submit-third-hint-button').click(submit_third_hint);
  //$('#submit-solver-word-entry-button').click(submit_solver_entry);
  $(document).on('click', '#submit-first-hint-button', submit_first_hint);
  $(document).on('click', '#submit-second-hint-button', submit_second_hint);
  $(document).on('click', '#submit-third-hint-button', submit_third_hint);
  $(document).on('click', '#submit-solver-word-entry-button', submit_solver_entry);



}) //--end of documentReady function


function game_logic(){

    common_game_channel.bind('respond_to_hint_request_event', function(data){
      if(data.hint_number == "1"){
        respond_to_hint_one();
        bool_hint1_requested = true; //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      } else if((data.hint_number == "2") && bool_hint1_requested && bool_hint1_received){
        respond_to_hint_two(); //yet to be implemented
        bool_hint2_requested = true; //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      } else if(data.hint_number == "3" && bool_hint2_requested && bool_hint2_received){
        respond_to_hint_three(); //yet to be implemented
      } else{
        $('#wait_before_requesting_hint_label').css('visibility', 'visible');
        setTimeout(function(){
          $('#wait_before_requesting_hint_label').css('visibility', 'hidden');
        }, 3250);
      }

    });

    common_game_channel.bind('send_first_hint_event', function(data){
      // The solver can now see the hint
      $('#forever-loading-icon').css('display', 'none');
      $('#help-info-div').after($('#hint-1-to-solver'));
      $('#hint-1-value').html(data.hint_value);
      $('#hint-1-to-solver').css('display', 'block');
      // The hinter should not see the first hint field
      $('#hint1-entry-position').css('display', 'none').after($('#hint_sent_alert_container'));
      $('#hint_sent_alert_container').css('display','block');
      setTimeout(function(){
        $('#hint_sent_alert_container').css('display','none');
      }, 3000);
      bool_hint1_received = true;
    });

    common_game_channel.bind('send_second_hint_event', function(data){
      // The solver can now see the hint
      $('#forever-loading-icon').css('display', 'none');
      $('#hint-1-to-solver').after($('#hint-2-to-solver'));
      $('#hint-2-value').html(data.hint_value);
      $('#hint-2-to-solver').css('display', 'block');
      // The hinter should not see the second hint field
      $('#hint2-entry-position').css('display', 'none').after($('#hint_sent_alert_container'));
      $('#hint_sent_alert_container').css('display','block');
      setTimeout(function(){
        $('#hint_sent_alert_container').css('display','none');
      }, 3000);
      bool_hint2_received = true;
    });

    common_game_channel.bind('send_third_hint_event', function(data){
      // The solver can now see the hint
      $('#forever-loading-icon').css('display', 'none');
      $('#hint-2-to-solver').after($('#hint-3-to-solver'));
      $('#hint-3-value').html(data.hint_value);
      $('#hint-3-to-solver').css('display', 'block');
      // The hinter should not see the third hint field
      $('#hint3-entry-position').css('display', 'none').after($('#hint_sent_alert_container'));
      $('#hint_sent_alert_container').css('display','block');
      setTimeout(function(){
          $('#hint_sent_alert_container').css('display','none');
      }, 3000);
    });

    // after the solver submits the word we check which state we are in and change the game accordingly
    common_game_channel.bind('solver_submitted_word', function(){
      if(phase1_started && !phase1_ended){
        phase1_ended = true;
      } else if(phase2_started && !phase2_ended){
        phase2_ended = true;
      } 
    });
}

function submit_first_hint(){
  var hint_value = $('#submit-first-hint-value').val();
  if ( !(hint_value.match(/^[0-9]+$/)) ){
    $('textarea#submit-first-hint-value').css('margin-bottom','0px');
    $('#first_hint_error').css('display','block');
  } else {
    $('#first_hint_error').css('display','none');
    $('textarea#submit-first-hint-value').css('margin-bottom','16px');
    console.log("3adeeeeeeeeeeeet");
    
    if(phase1_started && (!phase1_ended)){
      var session_id = session1_id;
    }else if (phase1_started && phase1_ended){
      var session_id = session2_id;
    }
    
    $.ajax({
    url : "/send_first_hint",
    type : "post",
    data : { channel_name: channel_name,
              hint_value: hint_value,
              session_id: session_id
           }
    });
    console.log(" First HINT SENT YA RAB !!");
    console.log("session id send to controller via ajax =>  " + session_id );
    
  }  
}

function submit_second_hint(){
  var hint_value = $('#submit-second-hint-value').val();
  
  if ( !($.trim(hint_value).length > 0) ){
    $('textarea#submit-second-hint-value').css('margin-bottom','0px');
    $('#empty_hint2_entry_error').css('display','block');
  } else {

    if(phase1_started && (!phase1_ended)){
      var session_id = session1_id;
    }else if (phase1_started && phase1_ended){
      var session_id = session2_id;
    }

    $('#empty_hint2_entry_error').css('display','none');
    $('textarea#submit-second-hint-value').css('margin-bottom','16px');
    console.log("the textfield is not empty!!!");
    $.ajax({
    url : "/send_second_hint",
    type : "post",
    data : { channel_name: channel_name,
              hint_value: hint_value,
              session_id: session_id,
           }
    });
    console.log(" Second SENT YA RAB !!");
    
  }  
}


function submit_third_hint(){
  var hint_value = $('#submit-third-hint-value').val();
  if ( !($.trim(hint_value).length > 0) ){
    $('textarea#submit-third-hint-value').css('margin-bottom','0px');
    $('#empty_hint3_entry_error').css('display','block');
  } else {
    
    if(phase1_started && (!phase1_ended)){
      var session_id = session1_id;
    }else if (phase1_started && phase1_ended){
      var session_id = session2_id;
    }

    $('#empty_hint2_entry_error').css('display','none');
    $('textarea#submit-third-hint-value').css('margin-bottom','16px');
    console.log("the third textfield is not empty!!!");
    $.ajax({
    url : "/send_third_hint",
    type : "post",
    data : { channel_name: channel_name,
              hint_value: hint_value,
              session_id: session_id,
           }
    });
    console.log(" Third SENT YA RAB !!");
  }  
}
//////////////////////



function submit_solver_entry(){
  var solver_entry_value = $('#solver-input-field').val();
  if ( !($.trim(solver_entry_value).length > 0) ){
    $('textarea#solver-input-field').css('margin-bottom','0px');
    $('#empty_solver_entry').css('display','block');
  } else {

    if(phase1_started && (!phase1_ended)){
      var session_id = session1_id;
      var word_id = word1_id;

    }else if (phase1_started && phase1_ended){
      var session_id = session2_id;
      var word_id = word2_id;
    }

    $('#empty_solver_entry').css('display','none'); //remove the error
    $('#solver-input-field').prop('disabled', true); //disable the textfield    
    $('#submit-solver-word-entry-button').addClass('disabled'); // disable submission button 
    $.ajax({
    url : "/record_solver_entry",
    type : "post",
    data : { channel_name: channel_name,
             word_digitization: solver_entry_value,
             word_id: word_id,
             session_id: session_id,
           }
    });
    console.log("Solver submitted his entry!");
  }
}


function prepare_hinter_view(hinter_name, word_image_url) {
  $('#forever-loading-icon').css('display', 'none');
	$('#waiting').css('display', 'none');
  $('#hinter-container').css('display','block');
  $('#hinter-name').html(hinter_name);
  $('#hinter-word-image').attr('src', word_image_url);
}

function prepare_solver_view(solver_name, word_ocr, solver_id){
	$('#forever-loading-icon').css('display', 'none');
  $('#player-container').css('display','none');
  $('#solver-container').css('display','block');
  $('#solver-name').html(solver_name);
  $('.solver-word').html(word_ocr);

}


// This function is triggered when the solver clicks on the magic wand icon 
function request_hint() {  
  if(!bool_hint1_requested){
    hint_number = 1; 
  } else if(!bool_hint2_requested){
    hint_number = 2; 
  } else {
    hint_number = 3;
  }
  $.ajax({
        url : "/trigger_request_hint_event",
        type : "post",
        data : { channel_name: channel_name,
                  hint_number: hint_number
               }
    });
}


function respond_to_hint_one(){
  $('#help-label').html("٢");
  $('#help-info-div').after($('#forever-loading-icon') );
  $('#forever-loading-icon').css('display','block' );
  $('#verb').html(' مُساعدتان');
  $('#small-magic-wand-icon-hinter').css('opacity','1');
  $('#submit-first-hint-value').prop('disabled', false);
  $('#submit-first-hint-button').removeClass("disabled");
  $('#submit-first-hint-button').mouseover(); //this will enable the tooltip to open 
}

function respond_to_hint_two(){
  $('#help-label').html("١");
  $('#hint-1-to-solver').after($('#forever-loading-icon') );
  $('#forever-loading-icon').css('display','block' );
  $('#verb').html(' مُساعدة واحدة');
  $('#small-magic-wand-icon-hinter').css('opacity','1');
  $('#submit-second-hint-value').prop('disabled', false);
  $('#submit-second-hint-button').removeClass("disabled");
  $('#submit-second-hint-button').mouseover(); //this will enable the tooltip to open 
}


function respond_to_hint_three(){
  // Changes in the solver view
  $('#help-label').html("٠");
  $('#hint-2-to-solver').after($('#forever-loading-icon') );
  $('#forever-loading-icon').css('display','block' );
  $('#you-have').html("");
  $('#verb').html(' ليس لديكَ مُسَاعدات أُخرى');
  $('#magicwandicon').css('opacity', '0.5');
  $('#magicwandicon').attr('onclick', "");
  $('#ask-for-hint-icon-container').removeClass('has-tip').removeClass('tip-top');
  $('#ask-for-hint-icon-container').removeAttr("data-tooltip");
  $('#ask-for-hint-icon-container').removeAttr("aria-haspopup");
  $('#ask-for-hint-icon-container').removeAttr("title");
  $('#ask-for-hint-icon-container.tooltip.tip-top').addClass("destroy-Tooltip");
  // Changes in the hinter view
  $('#small-magic-wand-icon-h inter').css('opacity','1');
  $('#submit-third-hint-value').prop('disabled', false);
  $('#submit-third-hint-button').removeClass("disabled");
  $('#submit-third-hint-button').mouseover(); //this will enable the tooltip to open 
}


function add_dama(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ُ');
}

function add_fatha(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'َ');
}

function add_kasra(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ِ');
}

function add_shadda(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ّ');
}

function add_tanweenMadmoum(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ٌ');
}

function add_tanweenMaftouh(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ً');
}

function add_tanweenMaksour(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ٍ');
} 

function add_skoon(){
  var value = $('#solver-input-field').val();
  $('#solver-input-field').val(value + 'ْ');
}


function prepare_game_side_bar(player1_name, player2_name){
  $('#profile-side-bar').css('display', 'none');
  $('#game-side-bar').css('display', 'block');
  //>> Should change the user avatars as well
  $('#player-1-name').html(player1_name);
  $('#player-2-name').html(player2_name);   
  $('#game-points').html(' 120 ');
  setTimeout(function(){
    start_count_down(60); //change the timer and the progress bar
  }, 10000);
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>should be 120
}


function start_count_down(seconds){
  var counter = seconds;
  interval = setInterval(function() {
      counter--;
      $('#timer').html(counter)
      $('#game-meter').css('width', '-=2.2');
      if (counter == 30) {
        $('#game-progress-bar').removeClass("success").addClass("alert");
        $('#timer').css('font-weight', 'bold');
        $('#timer').css('color', 'red');
      }
      if (counter == 0){
        clearInterval(interval); // stop the time 
        if(phase1_started && !phase1_ended){
          phase1_ended = true;
        }else if(phase2_started && !phase2_ended ){
          phase2_ended = true;
          type_of_game_over = "timeOver"
        }
      }
  }, 1000);
}

function stop_count_down(){
  clearInterval(interval);
}


function reset_game_side_bar(){
  $('#game-progress-bar').removeClass("alert").addClass("success");
  $('#game-meter').css('width','100%');
  $('#timer').css('font-weight', 'normal');
  $('#timer').css('color', 'black');
  stop_count_down();
  start_count_down(120);
}
