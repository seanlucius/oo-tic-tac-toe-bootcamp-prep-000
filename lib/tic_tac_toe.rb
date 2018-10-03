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
  
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, player_token = "X")
  @board[index] = player_token
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
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
  
  def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end 
end 

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end 

def draw?(board)
  !(won?(board)) && full?(board)
end 

def over?(board)
  won?(board) || full?(board) || draw?(board)
end 

def winner(board)
  if won?(board)
    winner_combo = won?(board)
    board[winner_combo[0]]
  else 
    nil 
  end
end
  
end 