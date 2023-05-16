require './player'
require './board'
require './move'
require 'pry'

board = Board.new
player1 = Player.new
player2 = Player.new
board.print_board
winner = false
turn = 1

def play_turn(player, board)
  position = nil
  loop do
    print "#{player.name}, enter the position of your play (1-9): "
    position = gets.chomp.to_i
    break if Move.new(position, player).valid_move?(board, position)

    puts "\nInvalid move. Your position must be a single digit between 1-9."
    puts "And you cannot place your marker where the opponent placed it.\n\n"
  end
  board.update_board(player.marker, position - 1)
  board.print_board
  # binding.pry
end

until winner == true
  if turn.odd?
    play_turn(player1, board)
    if board.winner?
      puts "Congratulations #{player1.name}, you won!"
      winner = true
    end
    turn += 1
  else
    play_turn(player2, board)
    if board.winner?
      puts "Congratulations #{player2.name}, you won!"
      winner = true
    end
    turn += 1
  end
end