# Helper Method
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

# Define your WIN_COMBINATIONS constant
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

# Define won?, full?, draw?, over?, and winner below
# def won?(board)
#   WIN_COMBINATIONS.detect { |set| board[set[0]] == board[set[1]]&& board[set[0]] == board[set[2]] && position_taken?(board, set[0]) }
# end

# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     combo.map { |i| board[i] }.count("X") == 3 || combo.map { |i| board[i] }.count("O") == 3
#   end
# end

def won?(board)

  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end

  end
  false
end

def full?(board)
  # board.none?{|token| token == " " }
    board.count(" ") == 0
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end
