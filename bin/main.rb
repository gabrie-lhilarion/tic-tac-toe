#!/usr/bin/env ruby


$boxes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$taken = []
$array_two = []
$array_one = []

def is_available(number,step)

    if $taken.any?(number.to_i) #{ |x| x == number}
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

    win_possibilities.each do |win|
        if player_1 - win == []
            puts "player1 wins"
        elsif player_2 - win = []
            puts "player two wins"
        else
            puts "draw"
        end
    end
   
    
end

 def player_turns  
    puts 'Enter  your name: '

    player_one = gets.chomp

    puts "Hello #{player_one}, welcom and please wait for the other player"

    puts 'Next player, enter your name'

    player_two = gets.chomp

    puts "Perfect #{player_one} and #{player_two} you can start the game"


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
    return
end



player_turns




