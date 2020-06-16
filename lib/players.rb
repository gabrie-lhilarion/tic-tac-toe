#!/usr/bin/env ruby

class Players
    attr_accessor :one, :two, :step, :tt_m
    
    

    def initialize(one,two)
     @one = one
     @two = two
     @p_one = []
     @p_two = []
     @winner = nil
    end

    public 

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

    
    def player_steps(step_array,step)
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
    
    
       
    x = 0
    while x < win_possibilities.length
     currently_checking =  win_possibilities[x]
     a = 0 
     b = 0 # for the first & second players

     3.times do |i|
      #[1, 2, 3],
       a += 1 if step_array_p1.any?(currently_checking[i])
     end  # end of 3 times do

     if a > 2
       @winner = first_player 
       return true
     end  # end of up to 3 for first player

     3.times do |j|5
       b += 1 if step_array_p2.any?(currently_checking[j])
     end  # end of 3 times do
     
     if b > 2
       @winner = second_player 
       return true
     end  # end of up to 3 for second player


    x += 1       
    end  

    end

    
    def winner
      @winner
    end

end   
   