# require_relative 'board.rb'

class Players
  attr_reader :one, :two, :step

  @p_one = []
  @p_two = []
  @winner = nil

  def initialize(one, two)
    @one = one
    @two = two
  end

  def first_player
    @one[0]
  end

  def first_player_sign
    @one[1]
  end

  def second_player
    @two[0]
  end

  def second_player_sign
    @two[1]
  end

  def step_array_p1
    @p_one
  end

  def step_array_p2
    @p_two
  end

  def player_steps(step_array, step)
    step_array << step.to_i
  end

  def game_status
    win_possibilities = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]

    if win_possibilities.any?(@p_one)
      @winner = @one[0]      
    elsif win_possibilities.any?(@p_two)
      @winner = @two[0]
    else
      false
    end
  end

  def winner
    @winner
  end
end
