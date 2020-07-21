# frozen_string_literal: true

class HumanSolver
  include Display
  include Computer
  include UserInteraction
  def initialize
    @game_board = gen_game_board
    @code = gen_code
  end

  def code_broken?
    @code == @last_input
  end

  def play_human_solver
    puts `clear`
    show_code(@game_board)
    p @code
    (1..8).each do |round|
      @last_input = req_input
      # updates just the array with new inputs
      update_game_board(@game_board, round, @last_input)
      # displays the board with new inputs
      puts `clear`
      show_code(@game_board)
      if code_broken?
        end_game('Code broken!')
        break
      end
    end
    end_game('Out of tries!')
  end
end
