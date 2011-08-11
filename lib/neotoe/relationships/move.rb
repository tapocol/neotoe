class Move
  include Neo4j::RelationshipMixin
  property :player
  property :position
end

