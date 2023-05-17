# frozen_string_literal: true
require 'pry'
# class representing the tic-tac-toe game board
class Board
  attr_reader :board

  def initialize # rubocop:disable Metrics/AbcSize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @win = [[board[0], board[1], board[2]], [board[3], board[4], board[5]],
            [board[6], board[7], board[8]], [board[0], board[3], board[6]],
            [board[1], board[4], board[7]], [board[2], board[5], board[8]],
            [board[0], board[4], board[8]], [board[2], board[4], board[6]]]
  end

  def print_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '---------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '---------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def update_board(marker, position)
    board[position] = marker
    @win = [[board[0], board[1], board[2]], [board[3], board[4], board[5]],
            [board[6], board[7], board[8]], [board[0], board[3], board[6]],
            [board[1], board[4], board[7]], [board[2], board[5], board[8]],
            [board[0], board[4], board[8]], [board[2], board[4], board[6]]]
  end
  
  def winner?
    @win.any? { |combination| combination.uniq.length == 1 }
  end

  def draw?
    board.all? { |position| position.is_a?(String) } && !winner?
  end

end
