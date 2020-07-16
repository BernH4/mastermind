# frozen_string_literal: true

module Display
  def code_colors(number)
    {
      '1' => "\e[101m  1  \e[0m ",
      '2' => "\e[43m  2  \e[0m ",
      '3' => "\e[44m  3  \e[0m ",
      '4' => "\e[45m  4  \e[0m ",
      '5' => "\e[46m  5  \e[0m ",
      '6' => "\e[41m  6  \e[0m ",
      '-' => "\e[100m  -  \e[0m "
    }[number]
  end

  def clue_colors(clue)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[clue]
  end

  def show_code(game_board)
    puts `clear`
    8.downto(1) do |i|
      show_code_line(game_board[:"line#{i}"])
    end
  end

  def show_code_line(code_arr)
    code_arr.each { |num| print code_colors(num) }
    show_clues(get_exact(code_arr), get_same(code_arr)) unless code_arr.include?('-')
    print "\n\n"
  end

  def get_exact(code_arr)
    count = 0
    code_arr.each_with_index do |val, i|
      count += 1 if val == @code[i]
    end
    count
  end

  def get_same(code_arr)
    # This feels like bad code because i have to call get_exact again
    code_arr.intersection(@code).length - get_exact(code_arr)
  end

  def show_clues(exact, same)
    print '  Clues: '
    exact.times { print clue_colors('*') }
    same.times { print clue_colors('?') }
  end

  def gen_game_board
    game_board = {}
    8.downto(1) do |i|
      game_board[:"line#{i}"] = ['-'] * 6
    end
    game_board
  end

  def update_game_board(game_board, line, code_arr)
    game_board[:"line#{line}"] = code_arr
  end
end
