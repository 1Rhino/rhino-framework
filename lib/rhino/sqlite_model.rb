require 'sqlite3'
require 'rhino/util'

# initialize database. Only for sqlite 3
config_database = YAML.load_file('config/database.yml')
DB = SQLite3::Database.new("db/" + config_database['database']['name'])

module Rhino
  module Model
    class SQLite

      def initialize(data = {})
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

      def self.find(id)
        row = DB.execute("
          SELECT #{schema.keys.join(',')} from #{table} where id = #{id};
        ")
        mapping_data row[0]
      end

      def self.all
        rows = DB.execute("SELECT #{schema.keys.join(',')} from #{table};")
        rows.map {|row| mapping_data row }
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.mapping_data(row_data)
        self.new Hash[schema.keys.zip row_data]
      end

      def self.create(values)
        values.delete "id"
        keys = schema.keys - ['id']
        vals =  keys.map do |key|
          values[key] ? to_sql(values[key]) : "NULL"
        end
        DB.execute "INSERT INTO #{table} (#{keys.join ","}) VALUES (#{vals.join ","});"

        data = Hash[keys.zip vals]
        sql = "SELECT last_insert_rowid();"
        data["id"] = DB.execute(sql)[0][0]
        self.new data
      end

      def save!
        unless @hash["id"]
          self.class.create @hash
          return true
        end
        fields = @hash.map do |k,v|
          "#{k}=#{self.class.to_sql(v)}"
        end.join(",")

        DB.execute ("
          UPDATE #{self.class.table}
          SET #{fields}
          WHERE id = #{@hash['id']}
        ")
        true
      end

      def save
        self.save!  rescue false
      end

      def self.delete(id)
        DB.execute("DELETE FROM #{table} WHERE id = #{id.to_i}")
        true
      end

      def self.count
        DB.execute("SELECT COUNT(*) FROM #{table}")[0][0]
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
