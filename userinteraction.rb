# frozen_string_literal: true

# Defines all messages that are displayed to the user
module UserInteraction
  def req_input
    input = 'x'
    loop do
      puts 'Make a guess! (6 Numbers between 1-6, Format: 123456)'
      input = gets.chomp.split('').to_a
      break if input.length == 6 && validate_numbers?(input)
    end
    input
  end

  def validate_numbers?(arr)
    arr.all? { |num| (1..6) === num.to_i }
  end

  def end_game(start_message)
    puts "#{start_message} Press (y) to play again or any other button to exit."
    Game.new.play if STDIN.getch == 'y'
  end
end
