class Players
  attr_reader :one, :two, :step, :tt_m
  attr_reader :winner
  def initialize(one, two)
    @one = one
    @two = two
    @p_one = []
    @p_two = []
    @winner = nil
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

  def player_steps(step_array, step)
    step_array << step.to_i
  end

  def game_status
    win_possibilities = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    x = 0
    while x < win_possibilities.length
      currently_checking = win_possibilities[x]
      a = b = 0
      3.times { |i| a += 1 if @p_one.any?(currently_checking[i]) }
      if a > 2
        @winner = first_player
        return true
      end

      3.times { |j| b += 1 if @p_two.any?(currently_checking[j]) }
      if b > 2
        @winner = second_player
        return true
      end
      x += 1
    end
  end
end
