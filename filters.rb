require 'colorize'

def player_lives
  @player_1_lives = 3
  @player_2_lives = 3
end

def get_player_names
  puts "Welcome to Math Game. Player 1, please enter name.".light_black
  @player_1 = gets.chomp.capitalize
  puts "Player 2, please enter name.".light_black
  @player_2 = gets.chomp.capitalize
end

def start_game
  puts "Welcome, #{@player_1} and #{@player_2}.".light_black
  puts "-------------------------\nThe object of the game is to correctly answer each math question. \nAfter 3 incorrect answers, the game ends and a winner is declared.\n#{@player_1} or #{@player_2}, enter 'OK' to start playing.".light_black
  @input = gets.chomp.downcase
end

def generate_question
  @num_1  = rand(1..10)
  @num_2 = rand(1..10)
end

def verify_answer
   @answer = @num_1 + @num_2
end

def prompt_player_for_answer
  puts "*\nWhat is the sum of #{@num_1} + #{@num_2}?\n*".blue
  puts "#{@player_1}, please answer.".light_black
  @player_1_answer = gets.chomp.to_i
  puts "#{@player_2}, please answer.".light_black
  @player_2_answer = gets.chomp.to_i
end

def answer
  if (@player_1_answer == @answer) && (@player_2_answer == @answer)
    "#{@player_1} and #{@player_2} both answered correctly!".green
  elsif @player_1_answer == @answer
    @player_2_lives -= 1

    puts "#{@player_1} answered correctly!".green 
    "#{@player_2} answered incorrectly!".red
  
  elsif @player_2_answer == @answer
    @player_1_lives -= 1
    puts "#{@player_1} answered incorrectly!".red
        "#{@player_2} answered correctly.".green
  else
    @player_1_lives -= 1
    @player_2_lives -= 1

    "#{@player_1} and #{@player_2} both answered incorrectly!".red
  end
end

def get_winning_player
if (@player_1_lives == 0) && (@player_2_lives == 0)
      puts "Nobody won this round.".red

    else
      if
        @player_1_lives > @player_2_lives
        player_won = @player_1
        player_won_lives = @player_1_lives
        puts "\n#{player_won} has won the game with an Ending Score of #{player_won_lives}!".green
      else
        player_won = @player_2
        player_won_lives = @player_2_lives
        puts "\n#{player_won} has won the game with an Ending Score of #{player_won_lives}!".green
      end
    end
end


def player_remaining_lives
  puts "\n#{@player_1} Remaining Tries: #{@player_1_lives}".light_black
  puts "#{@player_2} Remaining Tries: #{@player_2_lives}".light_black
end

