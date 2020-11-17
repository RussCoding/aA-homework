class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
      @sequence_length = 1
      @game_over = false
      @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if game_over == false
      self.round_success_message
      self.sequence_length += 1
    else
      game_over_message
      reset_game
    end
  end

  def show_sequence
      self.add_random_color
      p seq.last
  end

  def require_sequence
      answer = gets.chomp.split
      game_over = true if answer != seq
  end

  def add_random_color
      seq << COLORS.sample
  end

  def round_success_message
      puts "Correct!"
  end

  def game_over_message
      puts "Game Over!!"
  end

  def reset_game
      self.sequence_length = 1
      self.game_over = false
      self.seq = []
  end
end
