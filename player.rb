# frozen_string_literal: true

# class representing a player of the tic-tac-toe game
class Player
  attr_reader :name, :marker

  def initialize(name)
    @name = name
    loop do
      print 'Enter your marker (non-numeric): '
      @marker = gets.chomp
      return @marker unless @marker.match?(/\d/)

      puts 'Invalid input. Your marker must be non-numeric.'
    end
  end
end
