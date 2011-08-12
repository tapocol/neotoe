class BoardStatus
  include Neo4j::NodeMixin
  has_n(:moved_from).from(:board_status).relationship(Move)
  has_n(:moved_to).to(:board_status).relationship(Move)
  has_one(:feeling).from(:feeling)
  property :status_int, :type => Board
end

