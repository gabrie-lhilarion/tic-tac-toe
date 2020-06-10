#!/usr/bin/env ruby

def is_available(number)
    # compare taken with boxes
    # true or false == boolean
    if $taken.any? { |x| x == number}
       puts "Soryy the position has been taken" 
    else
       $taken << number.to_i
       puts "#{$taken} has been taken and #{$boxes - $taken == [] ? 0 : $boxes - $taken} are available"

      # if $boxes - $taken == 0

         # game over!
         # check the winner
         # if no winner return draw
       # end 
     
    end       
    # add to taken, display the board 
    # indicating current status
        
end

 

    $boxes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    $taken = []
    $play  = {}
    

 
        
    puts 'Enter  your name: '

    player_one = gets.chomp

    puts "Hello #{player_one}, welcom and please wait for the other player"

    puts 'Next player, enter your name'

    player_two = gets.chomp

    puts "Perfect #{player_one} and #{player_two} you can start the game"
    
    #puts "#{player_one} please take your first step"

    #play = gets.chomp
    #is_available(play)
    
    x = 0 
    while  x < $boxes.length
        x += 1
        if $taken.length % 2 == 0
             puts "#{player_two} make your move" 
        else
             puts "#{player_one} make your move"
        end

        play = gets.chomp
        is_available(play)
    end
   


    

     




