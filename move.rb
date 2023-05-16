# frozen_string_literal: true

# class representing a player move in the tic-tac-toe game
class Move
  def initialize(position, player)
    @marker = player.marker
    @position = position
  end

  def valid_move?(board, position)
    position.between?(1, 9) && board.board[position - 1].instance_of?(Integer)
  end
end
