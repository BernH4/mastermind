# frozen_string_literal: true

require_relative 'display.rb'

class Game
  attr_reader :board
  include Display
  def initialize
    @board = gen_game_board
  end

  def play
    show_code_full(board)
  end
end
