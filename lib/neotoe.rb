require "neo4j"
require "neotoe/board"
require "neotoe/relationships"
require "neotoe/nodes"

module Neo4j
  #: Monkey patching Neo4j::HasN to add my own checks for has_n? and has_one? for specs.
  module HasN
    module ClassMethods
      def has_n?(rel_type, options = {})
        has_one_or_n?(rel_type, options) && _decl_rels[rel_type].has_n?
      end

      def has_one?(rel_type, options = {})
        has_one_or_n?(rel_type, options) && _decl_rels[rel_type].has_one?
      end

      def has_one_or_n?(rel_type, options = {})
        options ||= {}
        key = rel_type
        target_class = self
        dir = :outgoing
        relationship_class = options[:relationship] || nil
        if options.has_key?(:from)
          dir = :incoming
          if options[:from].size > 1
            rel_type = "#{options[:from][0]}##{options[:from][1]}"
            target_class = options[:from][0]
            relationship_class = options[:from][0]._decl_rels[options[:from][1]]
          else
            rel_type = options[:from][0]
          end
        else
          rel_type = rel_type.to_sym
          if options.has_key?(:to)
            if options[:to].instance_of?(Class)
              target_class = options[:to]
              rel_type = "#{options[:to]}##{rel_type}"
            elsif options[:to].instance_of?(Symbol)
              rel_type = options[:to].to_s
            else
              raise "Expected a class or a symbol for, got #{options[:to]}/#{options[:to].class}"
            end
          end
        end
        _decl_rels.has_key?(key) &&\
          _decl_rels[key].is_a?(DeclRelationshipDsl) &&\
          _decl_rels[key].rel_type == rel_type &&\
          _decl_rels[key].target_class == target_class &&\
          _decl_rels[key].dir == dir &&\
          _decl_rels[key].relationship_class == relationship_class
      end
    end
  end

  #: Board TypeConverter
  module TypeConverters
    class BoardConverter
      class << self
        def convert?(type)
          type == Board
        end

        def to_java(val)
          val.to_status_int
        end

        def to_ruby(val)
          Board.from_status_int val
        end
      end
    end
  end
end

