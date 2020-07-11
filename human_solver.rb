# frozen_string_literal: true

class HumanSolver
  include Display
  include Computer
  include UserInteraction
  def initialize
    @game_board = gen_game_board
    @code = gen_code
  end

  def play_human_solver
    (1..8).each do |round|
      update_game_board(@game_board, round, req_input)
      show_code(@game_board)
    end
  end
end
