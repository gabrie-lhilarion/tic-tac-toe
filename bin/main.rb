#!/usr/bin/env ruby
require_relative '../lib/players.rb'
require_relative '../lib/board.rb'

puts 'Welcome to TIC TAC TOE'

pl1 = ''
pl2 = ''

loop do
  puts 'Firts player please enter your name'
  player1 = gets.chomp
  if !player1.gsub(/ /, '').length.zero?
    puts "Okey #{player1} you have been assigned letter 'O'"
    pl1 += player1
    break
  else
    puts 'Invalid player name! '
  end
end

loop do
  puts 'Second player please enter your name'
  player2 = gets.chomp
  if !player2.gsub(/ /, '').length.zero?
    puts "Okey #{player2} you have been assigned letter 'X'"
    pl2 += player2
    break
  else
    puts 'Invalid player name! '
  end
end

team = Players.new([pl1, 'X'], [pl2, 'O'])

play_ground = Board.new

old_board = play_ground.old_view

while play_ground.all_moves < 10
  puts "Okey #{play_ground.all_moves.even? ? team.first_player : team.second_player} please pick a number"
  play = gets.chomp

  if play_ground.all_moves.even?
    sign = team.second_player_sign
    list_to_update = team.instance_variable_get(:@p_one)
  else
    sign = team.first_player_sign
    list_to_update = team.instance_variable_get(:@p_two)
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
  puts "#{team.first_player}'s moves:#{team.instance_variable_get(:@p_one)} and #{team.second_player}'s moves: #{team.instance_variable_get(:@p_two)}"

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
