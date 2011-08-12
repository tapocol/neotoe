require "spec_helper"

describe Board do
  before(:each) do
    @board = Board.new
  end

  it "should initialize empty cells" do
    @board.cells.should == [0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it "should add move to cell list" do
    @board.move(1, 0)
    @board.cells.should == [1, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it "to_status_int should return a unique int" do
    @board.move(1, 0)
    @board.move(2, 4)
    @board.move(1, 6)
    @board.to_status_int.should == 892
  end

  it "from_status_int should set-up a board correctly" do
    board = Board.from_status_int 13167
    board.cells.should == [0, 0, 2, 1, 0, 0, 0, 0, 2]
  end
end

