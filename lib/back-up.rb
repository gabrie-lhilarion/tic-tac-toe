
 

def win(player_1,player_2)

    win_possibilities = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7],
    ]
   
   
   if win_possibilities.any?(player_1)
    $winner = $second_player 
    return true

   elsif win_possibilities.any?(player_2)
    $winner = $first_player 
    return true

   else
   return false 
   
   end



     #  if win_possibilities.any?(@@p_one) 
      #    @@winner = @one[0] 
      #    return true
      #  elsif win_possibilities.any?(@@p_two)  
      #    @@winner = @two[0]
      #    return true 
      #  else 
      #    return false        
      #  end



end
 
