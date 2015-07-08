require 'sqlite3'
require 'rhino/util'
require 'pry'

DB = SQLite3::Database.new 'test.db'

module Rhino
  module Model
    class SQLite

      def initialize(data = nil)
        @hash = data
      end

      def self.to_sql(val)
        case val
        when Numeric
          val.to_s
        when String
          "'#{val}'"
        else
          raise "Can't change #{val.class} to SQL"
        end
      end

      def self.create(values)
        values.delete "id"
        keys = schema.keys - ['id']
        vals =  keys.map do |key|
          values[keys] ? to_sql(values[keys]) : "NULL"
        end

        DB.execute  <<SQL
          "INSERT INTO #{table} (#{keys.join ","}) VALUES"
        SQL

        data = Hash[keys.zip vals]
        sql = " SELECT last_insert_rowid();"
        data["id"] = DB.execute(sql)[0][0]
        self.new data
      end

      def self.count
        DB.execute (<<SQL)[0][0]
          SELECT COUNT(*) FROM #{table}
        SQL
      end

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
