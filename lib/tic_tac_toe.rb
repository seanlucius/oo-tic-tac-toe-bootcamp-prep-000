class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
 [0,1,2], 
 [3,4,5], 
 [6,7,8], 
 [0,3,6], 
 [1,4,7], 
 [2,5,8], 
 [0,4,8], 
 [2,4,6]
  ]
 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index
    @input.to_i - 1
  end

  def move
    @board[input_to_index] = current_player
  end

  def position_taken?
    @board[input_to_index] != " " && @board[input_to_index] != ""
  end

  def valid_move?
    input_to_index.between?(0,8) && !position_taken?
  end

  def turn
    puts "Please enter 1-9:"
    def input=(user_input)
      @input = gets.strip
    end 
    
    def input
      @input
    end 
  
    if valid_move?
      move
      display_board
    else
    turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end  
  
end 