#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/board.rb'

puts 'Welcome to TIC TAC TOE'

puts 'Firts player please enter your name'
pl1 = gets.chomp

puts "Okey #{pl1} you have been assigned letter 'O'"
puts 'Second player please enter your name'

pl2 = gets.chomp
puts "Perfect #{pl2} you have been assigned letter 'X'"

team = Players.new([pl1, 'X'], [pl2, 'O'])

play_ground = Board.new

old_board = play_ground.old_view

while play_ground.all_moves < 10
  puts "Okey #{play_ground.all_moves.even? ? team.first_player : team.second_player} please pick a number"
  play = gets.chomp

  if play_ground.all_moves.even?
    sign = team.second_player_sign
    list_to_update = team.step_array_p1
  else
    sign = team.first_player_sign
    list_to_update = team.step_array_p2
  end

  if play_ground.valid_move?(play.to_i)
    updated_board = play_ground.progress(play, sign)
    team.player_steps(list_to_update, play)
    puts play_ground.display(updated_board)
  else
    if play.to_i.zero?
      puts 'Only numbers are allowed (1-9), look at the board and select available spaces'
    elsif play.to_i.positive?
      puts "Number #{play} appears to be taken, please take an available number"
    end
    puts play_ground.display(old_board)
  end
  puts "#{team.first_player}'s moves:#{team.step_array_p1} and #{team.second_player}'s moves: #{team.step_array_p2}"

  if team.game_status

    puts ''
    puts "HEY #{team.winner.upcase} has won the game!"
    puts ''
    puts '***            ***'
    puts '*** GAME OVEER ***'
    puts '***            ***'
    puts ''
    puts ''
    exit
  elsif !team.game_status && play_ground.all_moves == 9
    puts "MY GOODNESS! this is a draw game #{play_ground.all_moves}"
    exit
  end

  puts team.game_status
end
