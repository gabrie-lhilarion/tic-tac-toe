# rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
class Board
  attr_accessor :player, :sign, :position

  def initialize
    @board_data = ['.', '.', '.', '.', '.', '.', '.', '.', '.']
    @taken = []
    @total_plays = 0
    @status = 0
  end

  def display(board_data)
    y = 0
    while y < board_data.length
      if y == 2 || y == 5
        puts "  #{board_data[y]}  "
        puts '----------------'
      elsif y == 4 || y == 1 || y == 7
        print " | #{board_data[y]} | "
      else
        print "  #{board_data[y]}  "
      end
      y += 1
    end
    puts "\n \n"
  end

  def valid_move?(num)
    num.is_a?(Numeric) && @taken.none?(num) && num.positive? && num < 10 ? true : false
  end

  def progress(position, sign)
    @total_plays += 1

    @board_data[(position.to_i - 1)] = sign
    @taken << position.to_i
    @board_data
  end

  def old_view
    @board_data
  end

  def all_moves
    @total_plays
  end
end

# rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
