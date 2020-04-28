require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_node = TicTacToeNode.new(game.board, mark, nil)
    possible_next_moves = current_node.children

    win_move = possible_next_moves.select {|child| child.winning_node?(mark) }
    return win_move.first.prev_move_pos unless win_move.first.nil?

    other_mark = mark == :o ? :x : :o
    draw_move = possible_next_moves.select {|child| child.winning_node?(other_mark) }
    return draw_move.first.prev_move_pos unless draw_move.first.nil?
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
