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
end
