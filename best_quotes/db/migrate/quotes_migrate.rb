require 'sqlite3'

conn = SQLite3::Database.new 'db/database.db'
conn.execute  <<SQL
  create table quotes(
    id INTEGER PRIMARY KEY,
    submitter VARCHAR(100),
    attribution VARCHAR(100),
    quote VARCHAR(10000)
  )
SQL