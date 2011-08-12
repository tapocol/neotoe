class Board
  def initialize
    @cells = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  def cells
    @cells
  end

  def move(player, index)
    @cells[index] = player
  end

  def to_status_int
    status_int = 0
    (0..8).each do |i|
      status_int += @cells[i] * (3 ** i)
    end
    status_int
  end

  def self.from_status_int(status_int)
    board = Board.new
    (0..8).reverse_each do |i|
      player = status_int / (3 ** i)
      if player > 0
        board.move(player, i)
        status_int -= player * (3 ** i)
      end
    end
    board
  end
end

