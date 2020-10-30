WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 4, 8],
   [2, 4, 6],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8]
   ]
   
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "   
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} " 
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} " 
  
end

def input_to_index(user_input)
  user_input.to_i-1
end

def character
  character = "X" || "O"
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  num_turns = 0 
  board.each do |i|
  if i == "X" || i == "O" 
    num_turns += 1
  end
end
num_turns
end


def current_player(board)
  if turn_count(board) % 2 == 0 
    puts "X"
      return "X"
  else puts "O"
       return "O"
end

def won?(board)
    WIN_COMBINATIONS.each do |i|
      win_index_1 = i[0]
      win_index_2 = i[1]
      win_index_3 = i[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return WIN_COMBINATIONS
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return WIN_COMBINATIONS
      else
        false
   end
end
  
def full?(board)
    if (board.select{|i| i == "X" || i == "O"}).length < 9
      return false
    else
      return true
    end
end
  
def draw?(board)
   if full?(board) == true && won?(board) == false
      return true
    else
      return false
    end
end
  
def over?(board)
    if full?(board) == true
      return true
    elsif won?(board)
      return true
    else
     return false
    end
end
  
def winner(board)
    winner = won?(board)
    if winner != false
      if board[winner[0]] == "O"
        return "O"
      elsif board[winner[0]] == "X"
        return "X"
      end
    end
end