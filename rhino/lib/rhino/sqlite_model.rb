require 'sqlite3'
require 'rhino/util'
require 'pry'

DB = SQLite3::Database.new 'test.db'

module Rhino
  module Model
    class SQLite
      def self.table
        Rhino.to_underscore name
      end

      def self.schema
        return @schema if @schema
        @schema = {}
        DB.table_info(table) do |row|
          @schema[row["name"]] = row["type"]
        end
        @schema
      end
    end
  end
end
