#!/usr/bin/env ruby
require_relative 'players.rb'
require_relative 'board.rb'

 $a = 0; $b = 0

def display(board_view)

    y = 0
    while y < board_view.length
        if y == 2  || y == 5
            puts "  #{board_view[y]}  "
            puts "----------------"
        elsif y == 4 || y == 1  || y == 7
            print " | #{board_view[y]} | "    
        elsif y == 8
            print "  #{board_view[y]}  \n \n"
        else        
            print "  #{board_view[y]}  "
        end

    y += 1   
    end
end 

puts 'Welcome to TIC TAC TOE'

puts  'Firts player please enter your name'
pl_1 = gets.chomp

puts "Okey #{pl_1} you have been assigned letter 'O'"
puts 'Second player please enter your name'

pl_2 = gets.chomp
puts "Perfect #{pl_2} you have been assigned letter 'X'"

team = Players.new([pl_1,'X'], [pl_2,'O'])

play_ground = Board.new

old_board  = play_ground.old_view

while play_ground.all_moves < 10 
    puts "Okey #{play_ground.all_moves.even? ? team.first_player : team.second_player  } please pick a number"
    play = gets.chomp

    if play_ground.all_moves.even? 
        sign = team.second_player_sign
        list_to_update = team.step_array_p1 
    else 
        sign = team.first_player_sign 
        list_to_update = team.step_array_p2
    end 

    if play_ground.valid_move(play.to_i)
        updated_board = play_ground.progress(play, sign)
        team.player_steps(list_to_update, play)
        display(updated_board)
    else
       if play.to_i == 0 
        puts "Only numbers are allowed (1-9), look at the board and select available spaces"
       elsif play.to_i > 0 
        puts "Number #{play} appears to be taken, please take an available number"
       end
        display(old_board)
    end
    puts "#{team.first_player}'s moves: #{team.step_array_p1}  and  #{team.second_player}'s moves:  #{team.step_array_p2} | Total plays #{play_ground.all_moves} Status #{team.winner}"
    
 
  if team.game_status
    
    puts ""
    puts "HEY #{team.winner.upcase} has won the game!"
    puts ""
    puts "***            ***"
    puts "*** GAME OVEER ***"
    puts "***            ***"
    puts ""
    puts ""
    exit
  elsif !team.game_status && play_ground.all_moves == 9 
    puts "MY GOODNESS! this is a draw game #{play_ground.all_moves}" 
    exit
  end   
   
  puts team.game_status
end


 
 



