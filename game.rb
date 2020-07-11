# frozen_string_literal: true

require_relative 'display.rb'
require_relative 'computer.rb'
require_relative 'userinteraction.rb'
require_relative 'human_solver.rb'

class Game
  attr_reader :board
  include Display
  include Computer
  include UserInteraction
  def initialize
    @game_board = gen_game_board
  end

  def play
    show_code(@game_board)
    human_solver
    #    @code = gen_code
    #    # TODO: addcode!
    #    update_game_board(@game_board, 1, req_input)
    #    show_code(@game_board)
  end

  def human_solver
    HumanSolver.new.play_human_solver
  end
end
