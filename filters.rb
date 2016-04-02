require 'colorize'

class Player
  def initialize(name, lives=3, score=0)
    @name = name
    @lives = lives
    @score = score
  end
  
  def gain_point
    @score += 1
  end

  def lose_life
    @lives -= 1
  end

  attr_reader :name, :lives, :score

end



def get_player_names

  puts "Welcome to Math Game. Player 1, please enter name.".light_black
  name = gets.chomp.capitalize
  @player_1 = Player.new(name)

  puts "Player 2, please enter name.".light_black
  name = gets.chomp.capitalize
  @player_2 = Player.new(name)
end

def start_game
  puts "Welcome, #{@player_1.name} and #{@player_2.name}.".light_black
  puts "-------------------------\nThe object of the game is to correctly answer each math question. \nAfter 3 incorrect answers, the game ends and a winner is declared.\n#{@player_1.name} or #{@player_2.name}, enter 'OK' to start playing.".light_black
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
  puts "#{@player_1.name}, please answer.".light_black
  @player_1_answer = gets.chomp.to_i
  puts "#{@player_2.name}, please answer.".light_black
  @player_2_answer = gets.chomp.to_i
end

def answer
  if (@player_1_answer == @answer) && (@player_2_answer == @answer)
    @player_1.gain_point
    @player_2.gain_point
    "#{@player_1.name} and #{@player_2.name} both answered correctly!".green
  
  elsif @player_1_answer == @answer
    @player_1.gain_point
    @player_2.lose_life
   
    puts "#{@player_1.name} answered correctly!".green 
    "#{@player_2.name} answered incorrectly!".red
  
  elsif @player_2_answer == @answer
    @player_1.lose_life
    @player_2.gain_point

    puts "#{@player_1.name} answered incorrectly!".red
        "#{@player_2.name} answered correctly.".green
  else
    @player_1.lose_life
    @player_2.lose_life
    "#{@player_1.name} and #{@player_2.name} both answered incorrectly!".red
  end
end

def get_winning_player
  if (@player_1.lives == 0) && (@player_2.lives == 0)
      puts "Nobody won this round.".red

  else
    if
      @player_1.lives > @player_2.lives
      player_won = @player_1
      player_won_lives = @player_1.lives
      puts "\n#{player_won.name} has won the game with an Ending Score of #{player_won.score} points!".green
    else
      player_won = @player_2
      player_won_lives = @player_2.lives
      puts "\n#{player_won.name} has won the game with an Ending Score of #{player_won.score} points!".green
    end
  
  end
end


def player_remaining_lives
  puts "\n#{@player_1.name} Remaining Tries: #{@player_1.lives}".light_black
  puts "#{@player_2.name} Remaining Tries: #{@player_2.lives}".light_black
end

