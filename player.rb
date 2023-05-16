# frozen_string_literal: true

# class representing a player of the tic-tac-toe game
class Player
  attr_reader :name, :marker

  @@num_of_players = 0 # rubocop:disable Style/ClassVars

  def initialize
    @@num_of_players += 1 # rubocop:disable Style/ClassVars
    print "Player #{@@num_of_players}, enter your name: "
    @name = gets.chomp
    loop do
      print 'Enter your marker (non-numeric): '
      @marker = gets.chomp
      return @marker unless @marker.match?(/\d/) || @marker.length != 1

      puts 'Invalid input. Your marker must be non-numeric and length of 1.'
    end
  end
end
