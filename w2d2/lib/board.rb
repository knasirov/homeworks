class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times { cup << :stone }
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    cup_num = (start_pos == 6 || start_pos == 13)
    cup_size = (@cups[start_pos].nil? || @cups[start_pos].empty?)
    raise "Invalid starting cup" if cup_num || cup_size
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].count
    @cups[start_pos] = []

    opp_cup = (@name1 == current_player_name ? 13 : 6)
    pos = start_pos
    until stone_count == 0
      pos = (pos + 1) % 14
      unless pos == opp_cup
        @cups[pos] << :stone
        stone_count -= 1
      end
    end

    render

    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
    false
  end

  def winner
    point_p1 = @cups[6].count
    point_p2 = @cups[13].count
    case point_p1 <=> point_p2
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
