lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include? lib

Gem::Specification.new do |s|
  s.name = "Neo4j Tic-Tac-Toe"
  s.version = "0.1"
  s.platform = "java"
  s.authors = "Craig Jackson"
  s.email = "tapocol@gmail.com"
  s.homepage = "http://github.com/craigjackson/neotoe"
  s.summary = "Self-learning A.I. for Tic-Tac-Toe using Neo4j."
  s.require_path = "lib"

  s.add_dependency("neo4j", ["~> 1.1.4"])
  s.add_development_dependency("rspec", ["~> 2.6"])
end

