require_relative "player.rb"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14) {Array.new}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups[0..5].each {|cup| 4.times{cup << :stone}}
    cups[7..12].each {|cup| 4.times{cup << :stone}}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos == 6  || start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if self.cups[start_pos].length == 0
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      stones = []
      until self.cups[start_pos].length == 0
        stones << self.cups[start_pos].pop
      end
      i = start_pos + 1
      until stones.length == 0
          pos = i % self.cups.length
          if current_player_name == @player1.name && pos != 13
              self.cups[pos] << stones.pop
          elsif current_player_name == @player2.name && pos != 6
              self.cups[pos] << stones.pop
          end  
          i += 1
      end
      end_pos = (i-1) % cups.length
      self.render
      self.next_turn(end_pos)
      
      if cups[end_pos].length > 1
        return end_pos
      end
      
      if (end_pos == 6 && @player1.name == current_player_name) || (end_pos == 13 && @player2.name == current_player_name)
        return :prompt 
      end
      if self.cups[end_pos].length == 1
        return :switch
      end
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if self.cups[0..5].all? {|cup| cup.empty?}
    return true if self.cups[7..12].all? {|cup| cup.empty?}
    false

  end

  def winner
    if self.cups[6].length == self.cups[13].length
      return :draw
    elsif self.cups[6].length > self.cups[13].length
      return @player1.name
    else
      return @player2.name
    end
  end
end
