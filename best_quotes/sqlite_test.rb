require 'sqlite3'
require 'rhino/sqlite_model'

class Quotes < Rhino::Model::SQLite; end
STDERR.puts Quotes.schema.inspect