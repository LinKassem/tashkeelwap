class PlayersController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  # call-backs
  before_filter :authenticate_player!

  #lists all players
  def index
    @players = Player.all
    @z = params['textField']
    puts @z
    puts ">>>>>>>>>>>>>>>>>>>>"
  end
	
  #gets a single player
	def show
		@player = current_player    
    gon.player_id = current_player.id.to_s

    @validation_words = Validation.limit(6)
    gon.validation_words = @validation_words
    gon.validation_words_images = @validation_words.map(&:word_image_url)
    gon.validation_words_digitizations = @validation_words.map(&:user_digitization)
    gon.validation_words_ids = @validation_words.map(&:word_id)
  end

  def increment_certinity_rate
    @word = Validation.find(params[:data_value])
    @word.certinity_rate += 1
    @word.save
  end

  def decrement_certinity_rate
    @word = Validation.find(params[:data_value])
    @word.certinity_rate -= 1
    @word.save
  end

  # Used to reder the matching game div via ajax 
  def matching_game_div
  end

  # Used to increment player's score
  def increment_player_score
    @player = current_player
    puts @player.score
    @player.score += 60
    @player.save!
  end

  def multiplayer_game
    @player1_channel = 'private-game_channel-' + current_player.id.to_s

    @Waiting_list_size = Waiting.count
    if @Waiting_list_size == 0
      # Redirect to the waiting page & make an entry in the waiting queue
      Pusher[@player1_channel].trigger_async('waiting_event', {
        message: "Waiting...No player has joined yet"
      });
      @waiting_list_entry = Waiting.new()
      @waiting_list_entry.waiting_player_id = current_player.id
      @waiting_list_entry.save!

    else
      @random_number = Random.new
      @index = @random_number.rand(1..(Word.count))
      @word_ocr = Word.find(@index).ocr_digitization
      @word_image_url = Word.find(@index).word_image_url

      @waiting_player = Waiting.last
      @waiting_player_id = @waiting_player.waiting_player_id.to_s
      @waiting_player.destroy

      @waiting_player_name = Player.find(@waiting_player.waiting_player_id).name

      @player2_channel = 'private-game_channel-' + @waiting_player_id

      channels = [ @player1_channel, @player2_channel ];
      new_channel = 'private-game_channel-' + current_player.id.to_s + 
                    '-' + @waiting_player_id

      eventData = {
                  'channel_name': new_channel ,
                  'initiated_by': @waiting_player_id,
                  'initiated_by_name': @waiting_player_name,
                  'play_with': current_player.id,
                  'play_with_name': current_player.name,
                  'word_id': @index,
                  'word_ocr': @word_ocr,
                  'word_image_url': @word_image_url
                }

      Pusher.trigger_async( channels, 'private-one-to-one-game-request', eventData);
    end
  end

  def test
    puts params['textField']
    puts params['hidden-solver-id']
    puts "++++++++++++++++++++++++++++++++++++++++"
    @common_channel_name = params['hidden-solver-id']
    data = {
           # 'url': player_path,
            'message': "Game Ended!! Solver has eneted the word.",
            }
    Pusher[@common_channel_name].trigger('solver_end_game_event', data);
  end

  def trigger_request_hint_event
    @channel = params[:channel_name]
    puts params[:hint_number]
    data = { 
            'hint_number':params[:hint_number], 
            }
    Pusher[@channel].trigger_async('respond_to_hint_request_event', data)
  end


  def send_first_hint
    @channel = params[:channel_name]
    @hint_value = params[:hint_value]
    data = {
            'hint_value': @hint_value,
            }
    Pusher[@channel].trigger_async('send_first_hint_event', data)
  end

  def send_second_hint
    @channel = params[:channel_name]
    @hint_value = params[:hint_value]
    data = {
            'hint_value': @hint_value,
            }
    Pusher[@channel].trigger_async('send_second_hint_event', data)
  end

  def send_third_hint
    @channel = params[:channel_name]
    @hint_value = params[:hint_value]
    data = {
            'hint_value': @hint_value,
            }
    Pusher[@channel].trigger_async('send_third_hint_event', data)    
  end




end