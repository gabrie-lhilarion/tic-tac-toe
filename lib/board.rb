class Board
  attr_accessor :player, :sign, :position

  @@board_data = ['.', '.', '.', '.', '.', '.', '.', '.', '.',]
  @@taken = []
  @@total_plays = 0
  @@status = 0

  def display(board_data)
    y = 0
    puts "----------------"
    while y < board_data.length
      if y == 2 || y == 5
        puts "  #{board_data[y]}  "
        puts "----------------"
      elsif y == 4 || y == 1 || y == 7
        print " | #{board_data[y]} | "
      elsif y == 8
        print "  #{board_data[y]}  \n"
      else
        print "  #{board_data[y]}  "
      end

      y += 1
    end
    puts "----------------"
  end

  def valid_move?(num)
    valid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    num.is_a?(Numeric) && @@taken.none?(num) && num > 0 && num < 10 ? true : false
  end

  def progress(position, sign)
    @@total_plays += 1

    @@board_data[(position.to_i - 1)] = sign
    @@taken << position.to_i
    @@board_data
  end

  def old_view
    @@board_data
  end

  def all_moves
    @@total_plays
  end
end
