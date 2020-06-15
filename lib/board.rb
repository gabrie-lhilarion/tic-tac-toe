class Board
   attr_accessor :player, :sign, :position 

   @@board_data = [".",".",".",".",".",".",".",".","."]
   @@taken = []
   @@total_plays = 0 
   @@status  = 0

  def valid_move?(num)
   valid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
   num.is_a?(Numeric) && @@taken.none?(num) && num > 0  && num < 10   ? true : false  
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