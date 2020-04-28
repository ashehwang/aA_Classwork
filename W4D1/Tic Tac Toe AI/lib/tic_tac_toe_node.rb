require_relative 'tic_tac_toe'

class TicTacToeNode
    attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator) #evaluator is a mark; called on a node

    return false if board.tied?
    return true if board.over? && board.winner != evaluator
    return false if board.over? && board.winner == evaluator

    turn_mark = board.rows.flatten.count(nil).even? ? :o : :x

    if turn_mark == self.next_mover_mark #this is not your turn
      return self.children.any?{|child| child.losing_node?(evaluator)}
    else 
      return self.children.all?{|child| child.losing_node?(evaluator)}
    end

  end

  def winning_node?(evaluator)

    return false if board.tied?
    return true if board.over? && board.winner == evaluator
    return false if board.over? && board.winner != evaluator

    turn_mark = board.rows.flatten.count(nil).even? ? :o : :x

    if turn_mark == self.next_mover_mark #this is not your turn
      return self.children.any?{|child| child.winning_node?(evaluator)}
    else 
      return self.children.all?{|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_nodes = []
    empty_positions = [] #all the positions available

    (0..2).each do |i|
      (0..2).each do |j|
        pos = [ i, j ]
        empty_positions << [ i, j ] if @board.empty?(pos)
      end
    end

    empty_positions.each do |empty_position|
      copy_board = @board.dup
      copy_board[empty_position] = self.next_mover_mark
      child_mark = self.next_mover_mark == :o ? :x : :o
      child_nodes << TicTacToeNode.new(copy_board, child_mark, empty_position)
    end

    child_nodes
  end

  # [ O O X]
  # [X _ X]
  # [_ _ O] #create a father node with this board as value (was turn X)

  # #each child will be the next move
  # [ O O X]
  # [X O X]
  # [_ _ O]

  #   [ O O X]
  # [X _ X]
  # [_ O O]

  #   [ O O X]
  # [X _ X]
  # [O _ O]
end
