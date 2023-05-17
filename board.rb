# frozen_string_literal: true

# class representing the tic-tac-toe game board
class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  private

  def wins # rubocop:disable Metrics/AbcSize
    [
      [board[0], board[1], board[2]],
      [board[3], board[4], board[5]],
      [board[6], board[7], board[8]],
      [board[0], board[3], board[6]],
      [board[1], board[4], board[7]],
      [board[2], board[5], board[8]],
      [board[0], board[4], board[8]],
      [board[2], board[4], board[6]]
    ]
  end

  public

  def to_s # rubocop:disable Metrics/AbcSize
    <<~BOARD
       #{board[0]} | #{board[1]} | #{board[2]}#{' '}
      ---+---+---
       #{board[3]} | #{board[4]} | #{board[5]}#{' '}
      ---+---+---
       #{board[6]} | #{board[7]} | #{board[8]}#{' '}
    BOARD
  end

  def update_board(marker, position)
    board[position] = marker
  end

  def winner?
    wins.any? { |combination| combination.uniq.length == 1 }
  end

  def draw?
    board.all? { |position| position.is_a?(String) } && !winner?
  end
end
