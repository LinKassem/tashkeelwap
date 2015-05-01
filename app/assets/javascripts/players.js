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
var solver_name;
var hinter_name;
var hinter_label_interval;

var counter_phase1;
var counter_phase2;
var counter;
var score_phase1;
var score_phase2;


$(function(){
	$('#single-player-matching-game').click(function() {
		$('#render-matching-link').click();
		stop_count_down(mg_interval);// Clear the mg interval (if any)
    setTimeout(revealGameModal,500);
    matching_game_start_count_down(91);
    $.ajax({
            url : "/increment_no_times_mg_played",
            type : "post"
          });
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
      solver_name = data.play_with_name; 
      hinter_name = data.initiated_by_name;
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
    // This is the 2nd part of the game
    var check_phase2_start = setInterval(function(){
      if(phase1_started && phase1_ended){
        // record the first counter entry
        counter_phase1 = counter;
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
          solver_name = data.initiated_by_name;
          hinter_name = data.play_with_name;
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
      if(phase2_started && phase2_ended){
        counter_phase2 = counter;
        
        // change the modal content to show the score
        if (type_of_game_over == "timeOver"){
          $('#modalTitle').html('إنتهى الوقت!!');  
          var total_score = 0;
          var total_time = 240;
          $('#2pg-new-time-record').css('display','none');
          counter_phase1 = 120;
          counter_phase2 = 120;
        } else{
          var total_score = counter_phase1 + counter_phase2;
          var total_time = 240 - total_score;         
          $('#score-value').html(total_score);
          $('#2pg-time-record-value').html(total_time);
        }

        $('#gameOverModal').foundation('reveal', 'open');
        setTimeout(function(){
          $('#gameOverModal').foundation('reveal', 'close');
        }, 6000);
        $.ajax({
          url : "/increment_player_score",
          type : "post",
          data : {
                  source : "2pg",
                  score : total_score,
                  session1_id : session1_id,
                  session2_id : session2_id,
                  counter_phase1 : counter_phase1,
                  counter_phase2 : counter_phase2,
                  },
        });
        setTimeout(function(){
          window.location.href = window.location.href // refresh to redirect to the root page
        }, 6000);
        clearInterval(check_phase2_end);
      }
    }, 50);
  });
  $(document).on('click', '#submit-first-hint-button', submit_first_hint);
  $(document).on('click', '#submit-second-hint-button', submit_second_hint);
  $(document).on('click', '#submit-third-hint-button', submit_third_hint);
  $(document).on('click', '#submit-solver-word-entry-button', submit_solver_entry);
}) //--end of documentReady function

function game_logic(){
    common_game_channel.bind('respond_to_hint_request_event', function(data){
      if(data.hint_number == "1"){
        respond_to_hint_one();
        bool_hint1_requested = true; 
      } else if((data.hint_number == "2") && bool_hint1_requested && bool_hint1_received){
        respond_to_hint_two();
        bool_hint2_requested = true; 
      } else if(data.hint_number == "3" && bool_hint2_requested && bool_hint2_received){
        respond_to_hint_three();
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
      $('#hint2-entry-position').css('display', 'none');
      $('#hinter-diacritics-container').css('display','none').after($('#hint_sent_alert_container'));
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
    common_game_channel.bind('solver_submitted_word', function(data){
      $('#other-player-name').html(data.solver_name);
      $('#guessed-word-entry').html(data.solver_entry);
      hinter_label_interval = setInterval(function(){
        $('#hinter-alert-label').css('visibility','visible');
        setTimeout(function(){
          $('#hinter-alert-label').css('visibility','hidden');
        },1000)
      },2000);
      $('#hinter-verify-solver-container').css('visibility', 'visible');
      // Listen to the events and either increment or decrement the certinity rate of a certain word
    });

    common_game_channel.bind('change_phase_event', function(){
      clearInterval(hinter_label_interval);
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
    $('#magicwandicon').css('opacity', '0.5'); // disable the magic wand icon 
    $('#magicwandicon').attr('onclick', ""); 
    $('#ask-for-hint-icon-container').removeClass('has-tip').removeClass('tip-top');
    $('#ask-for-hint-icon-container').removeAttr("data-tooltip");
    $('#ask-for-hint-icon-container').removeAttr("aria-haspopup");
    $('#ask-for-hint-icon-container').removeAttr("title");
    $('#ask-for-hint-icon-container.tooltip.tip-top').addClass("destroy-Tooltip");
    // Display alert to the solver that the hinter is processing his answer
    $('#processing-hinter-name').html(hinter_name);
    $('#hinter-is-processing-solver-entry').css('visibility','visible');
    inform_solver_submission_being_processed_interval = setInterval(function(){
      $('#hinter-is-processing-solver-entry').css('visibility','visible');
      setTimeout(function(){
        $('#hinter-is-processing-solver-entry').css('visibility','hidden');
      },1000)
    },2000);

    $.ajax({
    url : "/record_solver_entry",
    type : "post",
    data : { channel_name: channel_name,
             word_digitization: solver_entry_value,
             word_id: word_id,
             session_id: session_id,
             solver_name: solver_name,
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
  $('#hinter-diacritics-container').css('display','block'); 
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

function hinter_add_dama(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ُ  ');
}

function hinter_add_fatha(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-َ  ');
}

function hinter_add_kasra(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ِ  ');
}

function hinter_add_shadda(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ّ  ');
}

function hinter_add_tanweenMadmoum(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ٌ  ');
}

function hinter_add_tanweenMaftouh(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ً  ');
}

function hinter_add_tanweenMaksour(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ٍ  ');
} 

function hinter_add_skoon(){
  var value = $('#submit-second-hint-value').val();
  $('#submit-second-hint-value').val(value + '-ْ  ');
}

function wrong_solver_entry(){
  //Do nothing in the db. Just end the phase
  $.ajax({
    url : "/change_pahse",
    type : "get",
    data : {  channel_name: channel_name,
            }
  });
}

function correct_solver_entry(){
  //decrease the word's display_repitions 
  if(phase1_started && (!phase1_ended)){
    var word_id = word1_id;
  }else if (phase1_started && phase1_ended){
    var word_id = word2_id;
  }
  $.ajax({
  url : "/decrement_word_repetitions",
  type : "post",
  data : {  word_id: word_id,
            channel_name: channel_name,
          }
  });
}

function prepare_game_side_bar(player1_name, player2_name){
  $('#profile-side-bar').css('display', 'none');
  $('#game-side-bar').css('display', 'block');
  //>> Should change the user avatars as well
  $('#player-1-name').html(player1_name);
  $('#player-2-name').html(player2_name);   
  $('#game-points').html(' ٠ ');
  setTimeout(function(){
    start_count_down(120);
  }, 10000);
}

function start_count_down(seconds){
  counter = seconds;
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

// clears any given interval variable
function stop_count_down(given_interval){
  clearInterval(given_interval);
}

function reset_game_side_bar(){
  $('#game-progress-bar').removeClass("alert").addClass("success");
  $('#game-meter').css('width','100%');
  $('#timer').css('font-weight', 'normal');
  $('#timer').css('color', 'black');
  //add the score of phase 1 & change the phase number
  $('#game-points').html(counter_phase1);
  $('#round-number').html('٢\\٢');
  stop_count_down(interval);
  start_count_down(120);
}
