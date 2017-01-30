class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Let's start playing!"
    until game_over
      take_turn
    end
    game_over_message
    reset_game

    puts "Do you want to play again? y/n?"
    response = gets.chomp
    play if response == "y"
  end

  def take_turn
    show_sequence
    sleep (3)
    system('clear')
    if require_sequence == seq
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts seq.join(" ")
  end

  def require_sequence
    puts "Please enter the colors in right order separated by space"
    gets.chomp.split
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! Next sequence is:"
  end

  def game_over_message
    puts "Incorrect sequence entered. GAME OVER!"
    puts "Your score is #{sequence_length - 1}!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
