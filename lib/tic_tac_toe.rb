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
          [6,4,2]
        ]
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    number = input.to_i
    number -= 1
    number
    
  end
  
  def move (index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index]=="X" ||@board[index]== "O"
  end
  
  def valid_move?(index)
    index.to_i.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Pick a position 1-9"
    input = gets.strip.to_i
    if valid_move?(input)
      move(input_to_index(input), current_player)
      display_board
    else
      self.turn
    end
  end
  
  
end