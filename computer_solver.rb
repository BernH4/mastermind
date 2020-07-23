# frozen_string_literal: true

class ComputerSolver
  include Display
  include Computer
  include UserInteraction
  def initialize
    puts `clear`
    @game_board = gen_game_board
    @code = req_input("Choose a code the computer should break!")
  end

  def code_broken?
    @code == @last_input
  end

  def play_computer_solver
    puts `clear`
    show_code(@game_board)
    (1..8).each do |round|
      @last_input = gen_code
      # updates just the array with new inputs
      update_game_board(@game_board, round, @last_input)
      # displays the board with new inputs
      puts `clear`
      show_code(@game_board)
      if code_broken?
        end_game("Computer broke the code after #{round} tries!")
        break
      end
      sleep(0.5)
    end
    end_game('Computer didnt succeed :(')
  end
end
