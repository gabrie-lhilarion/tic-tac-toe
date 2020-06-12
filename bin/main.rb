#!/usr/bin/env ruby


$boxes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$taken = []
$array_two = []
$array_one = []
$second_player = nil
$first_player  = nil
$winner = nil

def is_available(number,step)

    if $taken.any?(number.to_i)  
       puts "Soryy the position has been taken" 
    else

       $taken << number.to_i 

       step % 2 == 0 ? $array_two << number.to_i  : $array_one << number.to_i    

       puts "#{$taken} has been taken and #{$boxes - $taken == [] ? 0 : $boxes - $taken} are available.  #{$array_one} : #{$array_two}"

    end       
     return   
end


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

end

 def declay_status
    if $winner == nil
        puts "This is a draw game"
    else
        puts "G A M E  O V E R"
        puts "The winner is #{$winner}"        
    end    
 end


 def player_turns  
    puts 'Enter  your name: '

    player_one = gets.chomp.sub(" ","")

    if !player_one.empty? && player_one.length > 2
       $first_player = player_one
       puts "Hello #{player_one}, welcom and please wait for the other player"
       puts 'Next player, enter your name'
    else
       puts "WRONG MOVE!"
       puts "Start over and enter an name upto 3 characters"
       exit
    end


    player_two = gets.chomp.sub(" ","")
    if !player_two.empty? && player_two.length > 2
       $second_player = player_two
       puts "PERFECT! #{player_one} and #{player_two} you can start the game"
    else
        puts "WRONG MOVE!"
        puts "Start over and enter an name upto 3 characters"
        exit 
    end


    x = 0 
    while  x < $boxes.length
        x += 1
        if $taken.length % 2 == 0
          puts "#{player_two} make your move" 
        else
          puts "#{player_one} make your move"
        end

        play = gets.chomp
        if play.to_i == 0
         puts "Please choose a number from 1 to 9" 
        else  

        is_available(play,x)
        break if win($array_one,$array_two)


        end
    end
    
end



player_turns
declay_status



