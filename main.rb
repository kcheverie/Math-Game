require 'pry'
require 'colorize'
require_relative 'filters'






  get_player_names
  
  system 'clear'
  start_game

    while @input == "ok" do
      generate_question
      prompt_player_for_answer
      verify_answer
      system 'clear'
      puts answer
      player_remaining_lives

      if (@player_1.lives == 0) || (@player_2.lives == 0)
        break
      end
   
    end

    get_winning_player