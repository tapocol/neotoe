class Feeling
  include Neo4j::NodeMixin
  has_n(:board_statuses).to(:board_status)
  property :name
  index :name
end

