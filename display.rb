# frozen_string_literal: true

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

def show_code_full(game_board)
  (1..6).each do |i|
    show_code_line(game_board[:"line#{i}"])
  end
end

def show_code_line(code_arr)
  code_arr.each { |num| print code_colors(num) }
  puts ''
  puts ''
end

def show_clues(exact, same)
  print '  Clues: '
  exact.times { print clue_colors('*') }
  same.times { print clue_colors('?') }
  puts ''
end

game_board = {}
(1..8).each do |i|
  game_board[:"line#{i}"] = ['-'] * 6
end

show_code_full(game_board)
