# frozen_string_literal: true

require_relative 'display.rb'
require_relative 'computer.rb'
require_relative 'userinteraction.rb'
require_relative 'human_solver.rb'
require_relative 'computer_solver.rb'
require_relative 'instructions.rb'

class Game
  attr_reader :board
  include Display
  include Computer
  include UserInteraction
  include TextInstructions
  def initialize
    @game_board = gen_game_board
  end

  def play
    puts `clear`
    puts instructions
    case STDIN.getch
    when 'm'
      computer_solver
    when 'b'
      human_solver
    # TODO: FIX STRG + C!
    when 'x'
      exit
    else
      play
    end
  end

  def human_solver
    HumanSolver.new.play_human_solver
  end

  def computer_solver
    ComputerSolver.new.play_computer_solver
  end
end
