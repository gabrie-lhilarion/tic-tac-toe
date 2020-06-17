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
    my_string = "\n"
    while y < board_data.length
      if [2, 5].any?(y)
        my_string << "  #{board_data[y]}  \n------------------\n"
      elsif [1, 4, 7].any?(y)
        my_string << "| #{board_data[y]} | "
      else
        my_string << "  #{board_data[y]}   "
      end
      y += 1
    end
    my_string << "\n\n"
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
